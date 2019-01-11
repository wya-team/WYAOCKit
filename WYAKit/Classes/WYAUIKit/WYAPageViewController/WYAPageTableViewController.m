//
//  WYAPageTableViewController.m
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/11/23.
//

#import "WYAPageTableViewController.h"
NSString * const WYATableControllerDidAddToSuperViewNotification =
    @"WYATableControllerDidAddToSuperViewNotification";
NSString * const WYATableControllerDidFullyDisplayedNotification =
    @"WYATableControllerDidFullyDisplayedNotification";
NSString * const WYATabControllerChildControllerChangeContentOffstNotification =
    @"WYATabControllerChildControllerChangeContentOffstNotification";
static NSInteger const kWMUndefinedIndex           = -1;
static NSInteger const kWMControllerCountUndefined = -1;

@interface WYAPageTableViewController () <UITableViewDelegate, UITableViewDataSource> {
    CGFloat _targetX;
    CGRect _contentViewFrame, _menuViewFrame;
    BOOL _hasInited, _shouldNotScroll;
    NSInteger _initializedIndex, _controllerCount, _markedSelectIndex;
}
@property (nonatomic, strong, readwrite) UIViewController * currentViewController;

/**
 用于记录子控制器view的frame,用于scrollView上的展示的位置
 */
@property (nonatomic, strong) NSMutableArray * childViewFrames;

/**
 当前展示在屏幕上的控制器，方便在滚动的时候读取（避免不必要的计算）
 */
@property (nonatomic, strong) NSMutableDictionary * displayVC;

/**
 用于记录销毁的viewController的位置（如果他是某一种scrollView的controller的话）
 */
@property (nonatomic, strong) NSMutableDictionary * posRecords;

/**
 用于缓存加载过的控制器
 */
@property (nonatomic, strong) NSCache * memCache;
@property (nonatomic, strong) NSMutableDictionary * backgroundCache;

/**
 收到内存警告的次数
 */
@property (nonatomic, assign) int memoryWarningCount;
@property (nonatomic, readonly) NSInteger childControllersCount;
@end

@implementation WYAPageTableViewController
#pragma mark ======= Lazy Loading
- (NSMutableDictionary *)posRecords {
    if (!_posRecords) { _posRecords = [[NSMutableDictionary alloc] init]; }
    return _posRecords;
}
- (NSMutableDictionary *)displayVC {
    if (!_displayVC) { _displayVC = [[NSMutableDictionary alloc] init]; }
    return _displayVC;
}

- (NSMutableDictionary *)backgroundCache {
    if (!_backgroundCache) { _backgroundCache = [[NSMutableDictionary alloc] init]; }
    return _backgroundCache;
}
#pragma mark ======= Public Methods
- (instancetype)initWithViewControllerClasses:(NSArray<Class> *)classes
                                anTheirTitles:(NSArray<NSString *> *)titles {
    if (self = [self initWithNibName:nil bundle:nil]) {
        NSParameterAssert(classes.count == titles.count);
        _ViewControllerClasses = [NSArray arrayWithArray:classes];
        _titles                = [NSArray arrayWithArray:titles];
    }
    return self;
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(growCachePolicyAfterMemoryWarning)
                                               object:nil];
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(growCachePolicyToHigh)
                                               object:nil];
}

- (void)wya_forceLayoutSubviews {
    if (!self.childControllersCount) { return; }
    // 计算宽高以及子控制器的视图frame
    [self calculateSize];
    [self adjustScrollViewFrame];
    [self adjustMenuViewFrame];
    [self adjustDisplayingViewControllersFrame];
}
- (void)setAcceptNotification:(BOOL)acceptNotification {
    _acceptNotification = acceptNotification;
    if (_acceptNotification) {
        [[NSNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(changeOffset:)
                   name:WYATabControllerChildControllerChangeContentOffstNotification
                 object:nil];
    }
}
- (void)changeOffset:(NSNotification *)info {
    NSDictionary * dict = [info userInfo];
    CGFloat y           = [dict[@"key"] floatValue];
    NSLog(@"***********%f-----------", y);
    CGFloat height = self.tableView.tableHeaderView.frame.size.height;
    if (y <= height) { self.tableView.contentOffset = CGPointMake(0, y); }
    if (y > height) { self.tableView.contentOffset = CGPointMake(0, height); }
}
- (void)setScrollEnable:(BOOL)scrollEnable {
    _scrollEnable = scrollEnable;
    if (!self.scrollView) return;
    self.scrollView.scrollEnabled = scrollEnable;
}
- (void)setProgressViewCornerRadius:(CGFloat)progressViewCornerRadius {
    _progressViewCornerRadius = progressViewCornerRadius;
    if (self.menuView) { self.menuView.progressViewCornerRadius = progressViewCornerRadius; }
}
- (void)setMenuViewLayoutMode:(WYAMenuViewLayoutMode)menuViewLayoutMode {
    _menuViewLayoutMode = menuViewLayoutMode;
    if (self.menuView.superview) { [self resetMenuView]; }
}
- (void)setCachePolicy:(WYAPageTableControllerCachePolicy)cachePolicy {
    _cachePolicy = cachePolicy;
    if (cachePolicy != WYAPageTableControllerCachePolicyDisabled) {
        self.memCache.countLimit = _cachePolicy;
    }
}

- (void)setSelectIndex:(int)selectIndex {
    _selectIndex       = selectIndex;
    _markedSelectIndex = kWMUndefinedIndex;
    if (self.menuView && _hasInited) {
        [self.menuView wya_selectItemAtIndex:selectIndex];
    } else {
        _markedSelectIndex    = selectIndex;
        UIViewController * vc = [self.memCache objectForKey:@(selectIndex)];
        if (!vc) {
            vc = [self initializeViewControllerAtIndex:selectIndex];
            [self.memCache setObject:vc forKey:@(selectIndex)];
        }
        self.currentViewController = vc;
    }
}
- (void)setProgressViewIsNaughty:(BOOL)progressViewIsNaughty {
    _progressViewIsNaughty = progressViewIsNaughty;
    if (self.menuView) { self.menuView.progressViewIsNaughty = progressViewIsNaughty; }
}

- (void)setProgressWidth:(CGFloat)progressWidth {
    _progressWidth          = progressWidth;
    self.progressViewWidths = ({
        NSMutableArray * tmp = [NSMutableArray array];
        for (int i = 0; i < self.childControllersCount; i++) { [tmp addObject:@(progressWidth)]; }
        tmp.copy;
    });
}

- (void)setProgressViewWidths:(NSArray *)progressViewWidths {
    _progressViewWidths = progressViewWidths;
    if (self.menuView) { self.menuView.progressWidths = progressViewWidths; }
}
- (void)setMenuViewContentMargin:(CGFloat)menuViewContentMargin {
    _menuViewContentMargin = menuViewContentMargin;
    if (self.menuView) { self.menuView.contentMargin = menuViewContentMargin; }
}
- (void)wya_reloadData {
    [self clearDatas];
    if (!self.childControllersCount) return;
    [self resetScrollView];
    [self.memCache removeAllObjects];
    [self resetMenuView];
    [self viewDidLayoutSubviews];
    [self didEnterController:self.currentViewController atIndex:self.selectIndex];
}
- (void)wya_updateTitle:(NSString *)title atIndex:(NSInteger)index {
    [self.menuView wya_updateTitle:title atIndex:index anWidth:NO];
}

- (void)wya_updateAttributeTitle:(NSAttributedString *)title atIndex:(NSInteger)index {
    [self.menuView wya_updateAttributeTitle:title atIndex:index andWidth:NO];
}

- (void)wya_updateTitle:(NSString *)title anWidth:(CGFloat)width atIndex:(NSInteger)index {
    if (self.itemsWidths && index < self.itemsWidths.count) {
        NSMutableArray * mutableWidths = [NSMutableArray arrayWithArray:self.itemsWidths];
        mutableWidths[index]           = @(width);
        self.itemsWidths               = [mutableWidths copy];
    } else {
        NSMutableArray * mutableWidths = [NSMutableArray array];
        for (int i = 0; i < self.childControllersCount; i++) {
            CGFloat itemWidth = (i == index) ? width : self.menuItemWidth;
            [mutableWidths addObject:@(itemWidth)];
        }
        self.itemsWidths = [mutableWidths copy];
    }
    [self.menuView wya_updateTitle:title atIndex:index anWidth:NO];
}

#pragma mark ======= Noticication
- (void)wya_willResignActive:(NSNotification *)notification {
    for (int i = 0; i < self.childControllersCount; i++) {
        id obj = [self.memCache objectForKey:@(i)];
        if (obj) { [self.backgroundCache setObject:obj forKey:@(i)]; }
    }
}

- (void)wya_willEnterForeground:(NSNotification *)notification {
    for (NSNumber * key in self.backgroundCache.allKeys) {
        if (![self.memCache objectForKey:key]) {
            [self.memCache setObject:self.backgroundCache[key] forKey:key];
        }
    }
    [self.backgroundCache removeAllObjects];
}
#pragma mark ======= Delegate
- (NSDictionary *)infoWithIndex:(NSInteger)index {
    NSString * title = [self titleAtIndex:index];
    return @{ @"title" : title ?: @"",
              @"index" : @(index) };
}

- (void)willCachedController:(UIViewController *)vc atIndex:(NSInteger)index {
    if (self.childControllersCount &&
        [self.delegate
            respondsToSelector:@selector(wya_pageController:willCachedViewController:withInfo:)]) {
        NSDictionary * info = [self infoWithIndex:index];
        [self.delegate wya_pageController:self willCachedViewController:vc withInfo:info];
    }
}

- (void)willEnterController:(UIViewController *)vc atIndex:(NSInteger)index {
    _selectIndex = (int)index;
    if (self.childControllersCount &&
        [self.delegate
            respondsToSelector:@selector(wya_pageController:willEnterViewController:withInfo:)]) {
        NSDictionary * info = [self infoWithIndex:index];
        [self.delegate wya_pageController:self willEnterViewController:vc withInfo:info];
    }
}

- (void)didEnterController:(UIViewController *)vc atIndex:(NSInteger)index {
    if (!self.childControllersCount) return;
    // Post FullyDisplayedNotification
    [self postFullDisplayNotificationWithCurrentIndex:self.selectIndex];
    NSDictionary * info = [self infoWithIndex:index];
    if ([self.delegate
            respondsToSelector:@selector(wya_pageController:didEnterViewController:withInfo:)]) {
        [self.delegate wya_pageController:self didEnterViewController:vc withInfo:info];
    }
    // 当创建控制器时，调用延迟加载的代理方法
    if (_initializedIndex == index &&
        [self.delegate
            respondsToSelector:@selector(wya_pageController:lazyLoadViewController:withInfo:)]) {
        [self.delegate wya_pageController:self lazyLoadViewController:vc withInfo:info];
        _initializedIndex = kWMUndefinedIndex;
    }

    // 根据控制器 preloadPolicy 预加载控制器
    if (self.preloadPolicy == WYAPageTableControllerPreloadPolicyNear) return;
    int length = (int)self.preloadPolicy;
    int start  = 0;
    int end    = (int)self.childControllersCount - 1;
    if (index > length) { start = (int)index - length; }
    if ((self.childControllersCount - 1) > (length + index)) { end = (int)index + length; }

    for (int i = start; i <= end; i++) {
        // 如果已经存在 不需要预加载
        if (![self.memCache objectForKey:@(i)] && !self.displayVC[@(i)]) {
            [self addViewControllerAtIndex:i];
            [self postAddToSuperViewNotificationWithIndex:i];
        }
    }
    _selectIndex = (int)index;
}
#pragma mark ======= Data Source
- (NSInteger)childControllersCount {
    if (_controllerCount == kWMControllerCountUndefined) {
        if ([self.dataSource
                respondsToSelector:@selector(wya_numbersOfChildControllersInPageController:)]) {
            _controllerCount = [self.dataSource wya_numbersOfChildControllersInPageController:self];
        } else {
            _controllerCount = self.ViewControllerClasses.count;
        }
    }
    return _controllerCount;
}

- (UIViewController * _Nonnull)initializeViewControllerAtIndex:(NSInteger)index {
    if ([self.dataSource respondsToSelector:@selector(wya_pageController:viewControllerAtIndex:)]) {
        return [self.dataSource wya_pageController:self viewControllerAtIndex:index];
    }
    return [[self.ViewControllerClasses[index] alloc] init];
}

- (NSString * _Nonnull)titleAtIndex:(NSInteger)index {
    NSString * title = nil;
    if ([self.dataSource respondsToSelector:@selector(wya_pageController:titleAtIndex:)]) {
        title = [self.dataSource wya_pageController:self titleAtIndex:index];
    } else {
        title = self.titles[index];
    }
    return (title ?: @"");
}
#pragma mark ======= Private Methods
- (void)resetScrollView {
    if (self.scrollView) { [self.scrollView removeFromSuperview]; }
    [self addScrollView];
    [self addViewControllerAtIndex:self.selectIndex];
    self.currentViewController = self.displayVC[@(self.selectIndex)];
}
- (void)clearDatas {
    _controllerCount = kWMControllerCountUndefined;
    _hasInited       = NO;
    NSUInteger maxIndex =
        ((self.childControllersCount - 1) > 0) ? (self.childControllersCount - 1) : 0;
    _selectIndex = self.selectIndex < self.childControllersCount ? self.selectIndex : (int)maxIndex;

    if (self.progressWidth > 0) { self.progressWidth = self.progressWidth; }
    NSArray * displayingViewControllers = self.displayVC.allValues;
    for (UIViewController * vc in displayingViewControllers) {
        [vc.view removeFromSuperview];
        [vc willMoveToParentViewController:nil];
        [vc removeFromParentViewController];
    }
    self.memoryWarningCount = 0;
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(growCachePolicyAfterMemoryWarning)
                                               object:nil];
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(growCachePolicyToHigh)
                                               object:nil];
    self.currentViewController = nil;
    [self.posRecords removeAllObjects];
    [self.displayVC removeAllObjects];
}
- (void)postAddToSuperViewNotificationWithIndex:(int)index {
    if (!self.postNotification) return;
    NSDictionary * info = @{ @"index" : @(index),
                             @"title" : [self titleAtIndex:index] };
    [[NSNotificationCenter defaultCenter]
        postNotificationName:WYATableControllerDidAddToSuperViewNotification
                      object:self
                    userInfo:info];
}
/**
 当子控制器完全展示在用户面前时发送通知

 @param index 当前展示的内容的index
 */
- (void)postFullDisplayNotificationWithCurrentIndex:(int)index {
    if (!self.postNotification) return;
    NSDictionary * info = @{ @"index" : @(index),
                             @"title" : [self titleAtIndex:index] };
    [[NSNotificationCenter defaultCenter]
        postNotificationName:WYATableControllerDidFullyDisplayedNotification
                      object:self
                    userInfo:info];
}

/**
 初始化一些参数，在init中调用
 */
- (void)setup {
    _titleSizeSelected = 18.0f;
    _titleSizeNormal   = 15.0f;
    _titleColorSelected =
        [UIColor colorWithRed:168.0 / 255.0
                        green:20.0 / 255.0
                         blue:4 / 255.0
                        alpha:1];
    _titleColorNormal = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _menuItemWidth    = 65.0f;

    _memCache                 = [[NSCache alloc] init];
    _initializedIndex         = kWMUndefinedIndex;
    _markedSelectIndex        = kWMUndefinedIndex;
    _controllerCount          = kWMControllerCountUndefined;
    _scrollEnable             = YES;
    _progressViewCornerRadius = WYAUNDEFINED_VALUE;
    _progressHeight           = WYAUNDEFINED_VALUE;

    self.automaticallyCalculatesItemWidths    = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.preloadPolicy                        = WYAPageTableControllerPreloadPolicyNever;
    self.cachePolicy                          = WYAPageTableControllerCachePolicyNoLimit;

    self.delegate                = self;
    self.dataSource              = self;
    self.tableView.scrollEnabled = NO;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(wya_willResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(wya_willEnterForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
}

/**
 包括宽高 子控制器视图 frame
 */
- (void)calculateSize {
    _menuViewFrame =
        [self.dataSource wya_pageController:self
                  preferredFrameForMenuView:self.menuView];
    _contentViewFrame =
        [self.dataSource wya_pageController:self
                  preferredFrameContentView:self.scrollView];
    _childViewFrames = [NSMutableArray array];
    for (int i = 0; i < self.childControllersCount; i++) {
        CGRect frame = CGRectMake(i * _contentViewFrame.size.width, 0, _contentViewFrame.size.width,
                                  _contentViewFrame.size.height);
        [_childViewFrames addObject:[NSValue valueWithCGRect:frame]];
    }
}

- (void)addScrollView {
    WYAPageScrollView * scrollView            = [[WYAPageScrollView alloc] init];
    scrollView.scrollsToTop                   = NO;
    scrollView.pagingEnabled                  = YES;
    scrollView.backgroundColor                = [UIColor whiteColor];
    scrollView.delegate                       = self;
    scrollView.showsVerticalScrollIndicator   = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces                        = self.bounces;
    scrollView.scrollEnabled                  = self.scrollEnable;
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.scrollView = scrollView;

    if (!self.navigationController) { return; }
    for (UIGestureRecognizer * gestureRecognizer in scrollView.gestureRecognizers) {
        [gestureRecognizer requireGestureRecognizerToFail:self.navigationController
                                                              .interactivePopGestureRecognizer];
    }
}
- (void)addMenuView {
    WYAMenuView * menuView            = [[WYAMenuView alloc] initWithFrame:CGRectZero];
    menuView.delegate                 = self;
    menuView.dataSource               = self;
    menuView.style                    = self.menuViewStyle;
    menuView.layoutMode               = self.menuViewLayoutMode;
    menuView.progressHeight           = self.progressHeight;
    menuView.contentMargin            = self.menuViewContentMargin;
    menuView.progressViewBottomSpace  = self.progressViewBottomSpace;
    menuView.progressWidths           = self.progressViewWidths;
    menuView.progressViewIsNaughty    = self.progressViewIsNaughty;
    menuView.progressViewCornerRadius = self.progressViewCornerRadius;
    if (self.titleFontName) { menuView.fontName = self.titleFontName; }
    if (self.progressColor) { menuView.lineColor = self.progressColor; }
    self.menuView = menuView;
}

- (void)layoutChildViewControllers {
    int currentPage = (int)(self.scrollView.contentOffset.x / _contentViewFrame.size.width);
    int length      = (int)self.preloadPolicy;
    int left        = currentPage - length + 1;
    int right       = currentPage + length + 1;
    for (int i = 0; i < self.childControllersCount; i++) {
        UIViewController * vc = [self.displayVC objectForKey:@(i)];
        CGRect frame          = [self.childViewFrames[i] CGRectValue];
        if (!vc) {
            if ([self isInScreen:frame]) { [self initializedControllerWithIndexIfNeeded:i]; }
        } else if (i <= left || i >= right) {
            if (![self isInScreen:frame]) { [self removeViewController:vc atIndex:i]; }
        }
    }
}

/**
 创建或者从缓存中获取控制器并添加到视图上

 @param index index
 */
- (void)initializedControllerWithIndexIfNeeded:(NSInteger)index {
    // 先从cache中取
    UIViewController * vc = [self.memCache objectForKey:@(index)];
    if (vc) {
        // 存在 添加到scrollView上并放入display
        [self addCachedViewController:vc atIndex:index];
    } else {
        // 不存在重新创建
        [self addViewControllerAtIndex:(int)index];
    }
    [self postAddToSuperViewNotificationWithIndex:(int)index];
}
- (void)addCachedViewController:(UIViewController *)viewController atIndex:(NSInteger)index {
    [self addChildViewController:viewController];
    viewController.view.frame = [self.childViewFrames[index] CGRectValue];
    [viewController didMoveToParentViewController:self];
    [self.scrollView addSubview:viewController.view];
    [self willEnterController:viewController atIndex:index];
    [self.displayVC setObject:viewController forKey:@(index)];
}

/**
 创建并添加子控制器

 @param index index
 */
- (void)addViewControllerAtIndex:(int)index {
    _initializedIndex                 = index;
    UIViewController * viewController = [self initializeViewControllerAtIndex:index];
    if (self.values.count == self.childControllersCount &&
        self.keys.count == self.childControllersCount) {
        [viewController setValue:self.values[index] forKey:self.keys[index]];
    }
    [self addChildViewController:viewController];
    CGRect frame =
        self.childViewFrames.count ? [self.childViewFrames[index] CGRectValue] : self.view.frame;
    viewController.view.frame = frame;
    [viewController didMoveToParentViewController:self];
    [self.scrollView addSubview:viewController.view];
    [self willEnterController:viewController atIndex:index];
    [self.displayVC setObject:viewController forKey:@(index)];
}

/**
 移除控制器，且从display中移除

 @param viewController viewController
 @param index index
 */
- (void)removeViewController:(UIViewController *)viewController atIndex:(NSInteger)index {
    [self rememberPositionIfNeeded:viewController atIndex:index];
    [viewController.view removeFromSuperview];
    [viewController willMoveToParentViewController:nil];
    [viewController removeFromParentViewController];
    [self.displayVC removeObjectForKey:@(index)];

    // 放入缓存
    if (self.cachePolicy == WYAPageTableControllerCachePolicyDisabled) { return; }

    if (![self.memCache objectForKey:@(index)]) {
        [self willCachedController:viewController atIndex:index];
        [self.memCache setObject:viewController forKey:@(index)];
    }
}

- (void)backToPositionIfNeeded:(UIViewController *)controller atIndex:(NSInteger)index {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if (!self.rememberLocation) return;
#pragma clang diagnostic pop
    if ([self.memCache objectForKey:@(index)]) return;
    UIScrollView * scrollView = [self isKindOfScrollViewController:controller];
    if (scrollView) {
        NSValue * pointValue = self.posRecords[@(index)];
        if (pointValue) {
            CGPoint pos = [pointValue CGPointValue];
            [scrollView setContentOffset:pos];
        }
    }
}

- (void)rememberPositionIfNeeded:(UIViewController *)controller atIndex:(NSInteger)index {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if (!self.rememberLocation) return;
#pragma clang diagnostic pop
    UIScrollView * scrollView = [self isKindOfScrollViewController:controller];
    if (scrollView) {
        CGPoint pos               = scrollView.contentOffset;
        self.posRecords[@(index)] = [NSValue valueWithCGPoint:pos];
    }
}

- (UIScrollView *)isKindOfScrollViewController:(UIViewController *)controller {
    UIScrollView * scrollView = nil;
    if ([controller.view isKindOfClass:[UIScrollView class]]) {
        // Controller的view是scrollView的子类(UITableViewController/UIViewController替换view为scrollView)
        scrollView = (UIScrollView *)controller.view;
    } else if (controller.view.subviews.count >= 1) {
        // Controller的view的subViews[0]存在且是scrollView的子类，并且frame等与view得frame(UICollectionViewController/UIViewController添加UIScrollView)
        UIView * view = controller.view.subviews[0];
        if ([view isKindOfClass:[UIScrollView class]]) { scrollView = (UIScrollView *)view; }
    }
    return scrollView;
}

- (BOOL)isInScreen:(CGRect)frame {
    CGFloat x           = frame.origin.x;
    CGFloat screenWidth = self.scrollView.frame.size.width;

    CGFloat contentOffsetX = self.scrollView.contentOffset.x;
    if (CGRectGetMaxX(frame) > contentOffsetX && x - contentOffsetX < screenWidth) {
        return YES;
    } else {
        return NO;
    }
}

- (void)resetMenuView {
    if (!self.menuView) {
        [self addMenuView];
    } else {
        [self.menuView wya_reload];
        if (self.menuView.userInteractionEnabled == NO) {
            self.menuView.userInteractionEnabled = YES;
        }
        if (self.selectIndex != 0) { [self.menuView wya_selectItemAtIndex:self.selectIndex]; }
    }
}
- (void)growCachePolicyAfterMemoryWarning {
    self.cachePolicy = WYAPageTableControllerCachePolicyBalanced;
    [self performSelector:@selector(growCachePolicyToHigh)
               withObject:nil
               afterDelay:2.0
                  inModes:@[ NSRunLoopCommonModes ]];
}

- (void)growCachePolicyToHigh {
    self.cachePolicy = WYAPageTableControllerCachePolicyHigh;
}
#pragma mark ======= Adjust Frame
- (void)adjustScrollViewFrame {
    // While rotate at last page, set scroll frame will call `-scrollViewDidScroll:` delegate
    // It's not my expectation, so I use `_shouldNotScroll` to lock it.
    // Wait for a better solution.
    _shouldNotScroll          = YES;
    CGFloat oldContentOffsetX = self.scrollView.contentOffset.x;
    CGFloat contentWidth      = self.scrollView.contentSize.width;
    self.scrollView.frame     = _contentViewFrame;
    self.scrollView.contentSize =
        CGSizeMake(self.childControllersCount * _contentViewFrame.size.width, 0);
    CGFloat xContentOffset = contentWidth == 0
                                 ? self.selectIndex * _contentViewFrame.size.width
                                 : oldContentOffsetX / contentWidth * self.childControllersCount *
                                       _contentViewFrame.size.width;
    [self.scrollView setContentOffset:CGPointMake(xContentOffset, 0)];
    _shouldNotScroll = NO;
}

- (void)adjustDisplayingViewControllersFrame {
    [self.displayVC
        enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, UIViewController * _Nonnull vc,
                                            BOOL * _Nonnull stop) {
            NSInteger index = key.integerValue;
            CGRect frame    = [self.childViewFrames[index] CGRectValue];
            vc.view.frame   = frame;
        }];
}

- (void)adjustMenuViewFrame {
    CGFloat oriWidth    = self.menuView.frame.size.width;
    self.menuView.frame = _menuViewFrame;
    [self.menuView wya_resetFrames];
    if (oriWidth != self.menuView.frame.size.width) { [self.menuView wya_refreshContentOffset]; }
}

- (CGFloat)calculateItemWithAtIndex:(NSInteger)index {
    NSString * title   = [self titleAtIndex:index];
    UIFont * titleFont = self.titleFontName
                             ? [UIFont fontWithName:self.titleFontName size:self.titleSizeSelected]
                             : [UIFont systemFontOfSize:self.titleSizeSelected];
    NSDictionary * attrs = @{NSFontAttributeName : titleFont};

    CGRect rect = [title
        boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                  attributes:attrs
                     context:nil];
    CGFloat itemWidth = rect.size.width;
    return ceil(itemWidth);
}

- (void)delaySelectIndexIfNeeded {
    if (_markedSelectIndex != kWMUndefinedIndex) { self.selectIndex = (int)_markedSelectIndex; }
}
#pragma mark ======= Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    self.tableView = [[UITableView alloc]
        initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight)
                style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    if (!self.childControllersCount) return;
    [self calculateSize];
    [self addScrollView];
    [self initializedControllerWithIndexIfNeeded:self.selectIndex];
    self.currentViewController = self.displayVC[@(self.selectIndex)];
    [self addMenuView];
    [self didEnterController:self.currentViewController atIndex:self.selectIndex];
    self.navigationController.navigationBar.translucent = NO;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.translucent = YES;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    if (!self.childControllersCount) return;
    [self wya_forceLayoutSubviews];
    _hasInited = YES;
    [self delaySelectIndexIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.memoryWarningCount++;
    self.cachePolicy = WYAPageTableControllerCachePolicyLowMemory;
    // 取消正在增长的 cache 操作
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(growCachePolicyAfterMemoryWarning)
                                               object:nil];
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(growCachePolicyToHigh)
                                               object:nil];

    [self.memCache removeAllObjects];
    [self.posRecords removeAllObjects];
    self.posRecords = nil;

    // 如果收到内存警告次数小于 3，一段时间后切换到模式 Balanced
    if (self.memoryWarningCount < 3) {
        [self performSelector:@selector(growCachePolicyAfterMemoryWarning)
                   withObject:nil
                   afterDelay:3.0
                      inModes:@[ NSRunLoopCommonModes ]];
    }
}
- (void)setHeaderView:(UIView *)headerView {
    if (headerView) { self.tableView.tableHeaderView = headerView; }
}
#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell =
        [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                               reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.contentView addSubview:self.scrollView];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ScreenHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    self.menuView.backgroundColor =
        self.menuViewBackroundColor ? self.menuViewBackroundColor : [UIColor whiteColor];
    return self.menuView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}
#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (![scrollView isKindOfClass:WYAPageScrollView.class]) return;

    if (_shouldNotScroll || !_hasInited) return;

    [self layoutChildViewControllers];
    if (_startDragging) {
        CGFloat contentOffsetX = scrollView.contentOffset.x;
        if (contentOffsetX < 0) { contentOffsetX = 0; }
        if (contentOffsetX > scrollView.contentSize.width - _contentViewFrame.size.width) {
            contentOffsetX = scrollView.contentSize.width - _contentViewFrame.size.width;
        }
        CGFloat rate = contentOffsetX / _contentViewFrame.size.width;
        [self.menuView wya_slidMenuAtProgress:rate];
    }

    // Fix scrollView.contentOffset.y -> (-20) unexpectedly.
    if (scrollView.contentOffset.y == 0) return;
    CGPoint contentOffset    = scrollView.contentOffset;
    contentOffset.y          = 0.0;
    scrollView.contentOffset = contentOffset;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (![scrollView isKindOfClass:WYAPageScrollView.class]) return;

    _startDragging                       = YES;
    self.menuView.userInteractionEnabled = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (![scrollView isKindOfClass:WYAPageScrollView.class]) return;

    self.menuView.userInteractionEnabled = YES;
    _selectIndex                         = (int)(scrollView.contentOffset.x / _contentViewFrame.size.width);
    self.currentViewController           = self.displayVC[@(self.selectIndex)];
    [self didEnterController:self.currentViewController atIndex:self.selectIndex];
    [self.menuView wya_deselectedItemsIfNeeded];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (![scrollView isKindOfClass:WYAPageScrollView.class]) return;

    self.currentViewController = self.displayVC[@(self.selectIndex)];
    [self didEnterController:self.currentViewController atIndex:self.selectIndex];
    [self.menuView wya_deselectedItemsIfNeeded];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (![scrollView isKindOfClass:WYAPageScrollView.class]) return;

    if (!decelerate) {
        self.menuView.userInteractionEnabled = YES;
        CGFloat rate                         = _targetX / _contentViewFrame.size.width;
        [self.menuView wya_slidMenuAtProgress:rate];
        [self.menuView wya_deselectedItemsIfNeeded];
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (![scrollView isKindOfClass:WYAPageScrollView.class]) return;

    _targetX = targetContentOffset->x;
}
#pragma mark ======= WYAMenuView Delegate
- (void)wya_menuView:(WYAMenuView *)menu
    didSelectedIndex:(NSInteger)index
        currentINdex:(NSInteger)currentIndex {
    if (!_hasInited) return;
    _selectIndex    = (int)index;
    _startDragging  = NO;
    CGPoint targetP = CGPointMake(_contentViewFrame.size.width * index, 0);
    [self.scrollView setContentOffset:targetP animated:self.pageAnimatable];
    if (self.pageAnimatable) return;
    // 由于不触发 -scrollViewDidScroll: 手动处理控制器
    UIViewController * currentViewController = self.displayVC[@(currentIndex)];
    if (currentViewController) {
        [self removeViewController:currentViewController atIndex:currentIndex];
    }
    [self layoutChildViewControllers];
    self.currentViewController = self.displayVC[@(self.selectIndex)];

    [self didEnterController:self.currentViewController atIndex:index];
}

- (CGFloat)wya_menuView:(WYAMenuView *)menu widthForItemAtIndex:(NSInteger)index {
    if (self.automaticallyCalculatesItemWidths) { return [self calculateItemWithAtIndex:index]; }

    if (self.itemsWidths.count == self.childControllersCount) {
        return [self.itemsWidths[index] floatValue];
    }
    return self.menuItemWidth;
}

- (CGFloat)wya_menuView:(WYAMenuView *)menu itemMarginAtIndex:(NSInteger)index {
    if (self.itemsMargins.count == self.childControllersCount + 1) {
        return [self.itemsMargins[index] floatValue];
    }
    return self.itemMargin;
}

- (CGFloat)wya_menuView:(WYAMenuView *)menu
      titleSizeForState:(WYAMenuItemState)state
                atIndex:(NSInteger)index {
    switch (state) {
        case WYAMenuItemStateSelected:
            return self.titleSizeSelected;
        case WYAMenuItemStateNormal:
            return self.titleSizeNormal;
    }
}
- (UIColor *)wya_menuView:(WYAMenuView *)menu
       titleColorForState:(WYAMenuItemState)state
                  atIndex:(NSInteger)index {
    switch (state) {
        case WYAMenuItemStateSelected:
            return self.titleColorSelected;
        case WYAMenuItemStateNormal:
            return self.titleColorNormal;
    }
}
#pragma mark - WYAMenuViewDataSource
- (NSInteger)wya_numbersOfTitlesInMenuView:(WYAMenuView *)menu {
    return self.childControllersCount;
}

- (NSString *)wya_menuView:(WYAMenuView *)menu titleAtIndex:(NSInteger)index {
    return [self titleAtIndex:index];
}
#pragma mark - WYAPageControllerDataSource
- (CGRect)wya_pageController:(WYAPageTableViewController *)pageController
   preferredFrameForMenuView:(WYAMenuView *)menuView {
    NSAssert(0,
             @"[%@] MUST IMPLEMENT DATASOURCE METHOD `-pageController:preferredFrameForMenuView:`",
             [self.dataSource class]);
    return CGRectZero;
}

- (CGRect)wya_pageController:(WYAPageTableViewController *)pageController
preferredFrameForContentView:(WYAPageScrollView *)contentView {
    NSAssert(
        0, @"[%@] MUST IMPLEMENT DATASOURCE METHOD `-pageController:preferredFrameForContentView:`",
        [self.dataSource class]);
    return CGRectZero;
}

@end
