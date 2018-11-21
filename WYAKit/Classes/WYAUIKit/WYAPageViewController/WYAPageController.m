//
//  WYAPageController.m
//  FMDB
//
//  Created by 李俊恒 on 2018/11/14.
//

#import "WYAPageController.h"
NSString * const WYAControllerDidAddToSuperViewNotification = @"WYAControllerDidAddToSuperViewNotification";
NSString * const WYAControllerDidFullyDisplayedNotification = @"WYAControllerDidFullyDisplayedNotification";

static NSInteger const kWMUndefinedIndex = -1;
static NSInteger const kWMControllerCountUndefined = -1;

@interface WYAPageController (){
    CGFloat _targetX;
    CGRect _contentViewFrame,_menuViewFrame;
    BOOL _hasInited,_shouldNotScroll;
    NSInteger _initializedIndex,_controllerCount,_markedSelectIndex;
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
@property (nonatomic, assign) int  memoryWaringCount;
@property (nonatomic, readonly) NSInteger  childControllersCount;
@end

@implementation WYAPageController
#pragma mark ======= Lazy Loading
- (NSMutableDictionary *)posRecords{
    if (!_posRecords) {
        _posRecords = [[NSMutableDictionary alloc]init];
    }
    return _posRecords;
}
- (NSMutableDictionary *)displayVC {
    if (!_displayVC) {
        _displayVC = [[NSMutableDictionary alloc] init];
    }
    return _displayVC;
}

- (NSMutableDictionary *)backgroundCache {
    if (!_backgroundCache) {
        _backgroundCache = [[NSMutableDictionary alloc] init];
    }
    return _backgroundCache;
}
#pragma mark ======= Public Methods
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
//        [self setup];
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//        [self setup];
    }
    return self;
}

- (instancetype)initWithViewControllerClasses:(NSArray<Class> *)classes anTheirTitles:(NSArray<NSString *> *)titles{
    if (self = [self initWithNibName:nil bundle:nil]) {
        NSParameterAssert(classes.count == titles.count);
        _ViewControllerClasses = [NSArray arrayWithArray:classes];
        _titles = [NSArray arrayWithArray:titles];
    }
    return self;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(wya_growCachePolocyAfterMemoryWaring) object:nil];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(wya_growCachePolicyToHight) object:nil];
}

- (void)wya_forceLayoutSubviews{
    if (!self.childControllersCount) {return;}
    // 计算宽高以及子控制器的视图frame
//    [self calculateSize];
//    [self adjustScrollViewFrame];
//    [self adjustMenuViewFrame];
//    [self adjustDisplayingViewControllersFrame];
}

- (void)setScrollEnable:(BOOL)scrollEnable{
    _scrollEnable = scrollEnable;
    if (!self.scrollView)return;
    self.scrollView.scrollEnabled = scrollEnable;
}
- (void)setProgressViewCornerRadius:(CGFloat)progressViewCornerRadius{
    _progressViewCornerRadius = progressViewCornerRadius;
    if (self.menuView) {
        self.menuView.progressViewCornerRadius = progressViewCornerRadius;
    }
}
- (void)setMenuViewLayoutMode:(WYAMenuViewLayoutMode)menuViewLayoutMode{
    _menuViewLayoutMode = menuViewLayoutMode;
    if (self.menuView.superview) {
//        [self resetMenuView];
    }
}
- (void)setCachePolicy:(WYAPageControllerCachePolicy)cachePolicy{
    _cachePolicy = cachePolicy;
    if (cachePolicy != WYAPageControllerCachePolicyDisabled) {
        self.memCache.countLimit = _cachePolicy;
    }
}

- (void)setSelectIndex:(int)selectIndex{
    _selectIndex = selectIndex;
    _markedSelectIndex = kWMUndefinedIndex;
    if (self.menuView && _hasInited) {
        [self.menuView wya_selectItemAtIndex:selectIndex];
    }else{
        _markedSelectIndex = selectIndex;
        UIViewController * vc = [self.memCache objectForKey:@(selectIndex)];
        if (!vc) {
//            vc = [self initializeViewControllerAtIndex:selectIndex];
            [self.memCache setObject:vc forKey:@(selectIndex)];
        }
        self.currentViewController = vc;
    }
}
- (void)setProgressViewIsNaughty:(BOOL)progressViewIsNaughty{
    _progressViewIsNaughty = progressViewIsNaughty;
    if (self.menuView) {
        self.menuView.progressViewIsNaughty = progressViewIsNaughty;
    }
}

- (void)setProgressWidth:(CGFloat)progressWidth{
    _progressWidth = progressWidth;
    self.progressViewWidths = ({
        NSMutableArray * tmp = [NSMutableArray array];
        for (int i = 0; i < self.childControllersCount; i++) {
            [tmp addObject:@(progressWidth)];
        }
        tmp.copy;
    });
}

- (void)setProgressViewWidths:(NSArray *)progressViewWidths{
    _progressViewWidths = progressViewWidths;
    if (self.menuView) {
        self.menuView.progressWidths = progressViewWidths;
    }
}
- (void)setMenuViewContentMargin:(CGFloat)menuViewContentMargin{
    _menuViewContentMargin = menuViewContentMargin;
    if (self.menuView) {
        self.menuView.contentMargin = menuViewContentMargin;
    }
}
- (void)wya_reloadData{
//    [self clearDatas];
    if (!self.childControllersCount)return;
//    [self restScrollView];
    [self.memCache removeAllObjects];
//    [self restMenuView];
    [self viewDidLayoutSubviews];
//    [self didEnterController:self.currentViewController atIndex:self.selectIndex];
}
- (void)wya_updateTitle:(NSString *)title atIndex:(NSInteger)index{
    [self.menuView wya_updateTitle:title atIndex:index anWidth:NO];
}

- (void)wya_updateAttributeTitle:(NSAttributedString *)title atIndex:(NSInteger)index{
    [self.menuView wya_updateTitle:title atIndex:index anWidth:NO];
}

- (void)wya_updateTitle:(NSString *)title anWidth:(CGFloat)width atIndex:(NSInteger)index{
    if (self.itemsWidths && index < self.itemsWidths.count) {
        NSMutableArray * mutableWidths = [NSMutableArray arrayWithArray:self.itemsWidths];
        mutableWidths[index] = @(width);
        self.itemsWidths = [mutableWidths copy];
    }else{
        NSMutableArray * mutableWidths = [NSMutableArray array];
        for (int i = 0; i < self.childControllersCount ; i++) {
            CGFloat itemWidth = (i == index) ? width : self.menuItemWidth;
            [mutableWidths addObject:@(itemWidth)];
        }
        self.itemsWidths = [mutableWidths copy];
    }
    [self.menuView wya_updateTitle:title atIndex:index anWidth:NO];
}

@end
