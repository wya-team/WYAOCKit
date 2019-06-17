//
//  WYAImageBrowser.m

#import "WYAImageBrowser.h"
#import "WYAZoomingScrollView.h"
#import "WYAImageBrowserAlertView.h"
#define BaseTag 100

@interface WYAImageBrowser () <WYAZoomingScrollViewDelegate, UIScrollViewDelegate, UIGestureRecognizerDelegate>
/// 用户点击的图片视图,用于做图片浏览器弹出的放大动画,不给次属性赋值会通过代理方法photoBrowser: sourceImageViewForIndex:尝试获取,如果还是获取不到则没有弹出放大动画
@property (nonatomic, weak) UIImageView * sourceImageView;
/// 当前显示的图片位置索引 , 默认是0
@property (nonatomic, assign) NSInteger currentImageIndex;
/// 浏览的图片数量,大于0
@property (nonatomic, assign) NSInteger imageCount;
@property (nonatomic, strong) UIWindow * photoBrowserRootView;
/// 展示给用户的背景颜色
@property (nonatomic, strong) UIView * bgView;
/// 是否允许向下拖动
@property (nonatomic, assign) BOOL enablePan;
/// 当前浏览大图的原图位置
@property (nonatomic, assign) CGRect originFrame;
/// 当前浏览大图的拖动初始位置
@property (nonatomic, assign) CGRect startFrame;
/// 初始作用在图片的位置（相对父视图）
@property (nonatomic, assign) CGPoint startPoint;
/// 初始作用在图片的位置（相对当前屏幕）
@property (nonatomic, assign) CGPoint relativeStartPoint;
/// 累计偏移量(拖动过程发生的偏移)
@property (nonatomic, assign) CGPoint offset;
/// 存放所有图片的容器
@property (nonatomic, strong) UIScrollView * scrollView;
/// 保存图片的过程指示菊花
@property (nonatomic, strong) UIActivityIndicatorView * indicatorView;
/// 保存图片的结果指示label
@property (nonatomic, strong) UILabel * savaImageTipLabel;
/// 正在使用的WYAZoomingScrollView对象集
@property (nonatomic, strong) NSMutableSet * visibleZoomingScrollViews;
/// 循环利用池中的WYAZoomingScrollView对象集,用于循环利用
@property (nonatomic, strong) NSMutableSet * reusableZoomingScrollViews;
@property (nonatomic, strong) UIControl * pageControl;
/// index label
@property (nonatomic, strong) UILabel * indexLabel;
/// 保存按钮
@property (nonatomic, strong) UIButton * saveButton;
/// 小圆点大小
@property (nonatomic, assign) CGSize pageControlDotSize;
/// 图片数组
@property (nonatomic, strong) NSArray * images;
@property (nonatomic, strong) NSMutableArray * alertButtons;
@end

@implementation WYAImageBrowser
#pragma mark - LifeCircle
- (void)awakeFromNib {
    [super awakeFromNib];
    [self initial];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initial];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateFrames];
}

- (void)dealloc {
    [self.reusableZoomingScrollViews removeAllObjects];
    [self.visibleZoomingScrollViews removeAllObjects];
}

#pragma mark - Private Method
- (void)initial {
    self.visibleZoomingScrollViews  = [[NSMutableSet alloc] init];
    self.reusableZoomingScrollViews = [[NSMutableSet alloc] init];
    self.alertButtons = [NSMutableArray array];
    [self placeholderImage];

    _pageControlAliment  = WYAImageBrowserPageControlAlimentCenter;
    _pageControlDotSize  = CGSizeMake(10, 10);
    _pageControlStyle    = WYAImageBrowserPageControlStyleClassic;
    _hidesForSinglePage  = YES;
    _currentPageDotColor = [UIColor whiteColor];
    _pageDotColor        = [UIColor lightGrayColor];
    _browserStyle        = WYAImageBrowserStylePageControl;

    self.currentImageIndex = 0;
    self.imageCount        = 0;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
}
#pragma mark ======= UI
- (void)iniaialUI {

    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    self.scrollView                                = [[UIScrollView alloc] init];
    self.scrollView.delegate                       = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator   = NO;
    self.scrollView.pagingEnabled                  = YES;
    self.scrollView.backgroundColor                = [UIColor clearColor];
    [self addSubview:self.scrollView];

    if (self.currentImageIndex == 0) { // 如果刚进入的时候是0,不会调用scrollViewDidScroll:方法,不会展示第一张图片
        NSLog(@"self.currentImageIndex == %zd", self.currentImageIndex);
        [self showPhotos];
    }

    [self setUpPageControl];

    UILabel * indexLabel       = [[UILabel alloc] init];
    indexLabel.textAlignment   = NSTextAlignmentCenter;
    indexLabel.textColor       = [UIColor whiteColor];
    indexLabel.font            = [UIFont systemFontOfSize:18];
    indexLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    indexLabel.clipsToBounds   = YES;
    self.indexLabel            = indexLabel;
    [self addSubview:indexLabel];
    UIButton * saveButton = [[UIButton alloc] init];
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    saveButton.backgroundColor    = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.90f];
    saveButton.layer.cornerRadius = 5;
    saveButton.clipsToBounds      = YES;
    [saveButton addTarget:self action:@selector(saveImage) forControlEvents:UIControlEventTouchUpInside];
    self.saveButton = saveButton;
    [self addSubview:saveButton];

    [self showFirstImage];
    [self updateIndexContent];
    [self updateIndexVisible];
}

- (void)setUpPageControl {
    if (_pageControl) {
        [_pageControl removeFromSuperview];
        _pageControl = nil;
        // 重新加载数据时调整
    }
    switch (self.pageControlStyle) {
        case WYAImageBrowserPageControlStyleClassic: {
            UIPageControl * pageControl               = [[UIPageControl alloc] init];
            _pageControl                              = pageControl;
            pageControl.numberOfPages                 = self.imageCount;
            pageControl.currentPageIndicatorTintColor = self.currentPageDotColor;
            pageControl.pageIndicatorTintColor        = self.pageDotColor;
            pageControl.userInteractionEnabled        = NO;
            [self addSubview:pageControl];
            pageControl.currentPage = self.currentImageIndex;
        } break;
        default:
            break;
    }

    // 重设pagecontroldot图片
    self.currentPageDotImage = self.currentPageDotImage;
    self.pageDotImage        = self.pageDotImage;
}

- (void)updateFrames {
    self.frame  = [UIScreen mainScreen].bounds;
    CGRect rect = self.bounds;
    rect.size.width += 10;
    self.scrollView.frame         = rect; // frame修改的时候,也会触发scrollViewDidScroll,不是每次都触发
    self.scrollView.cmam_left     = 0;
    self.scrollView.contentSize   = CGSizeMake((self.scrollView.cmam_width) * self.imageCount, 0);
    self.scrollView.contentOffset = CGPointMake(self.currentImageIndex * (self.scrollView.cmam_width), 0); // 回触发scrollViewDidScroll
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.tag >= BaseTag) {
            obj.frame = CGRectMake((self.scrollView.cmam_width) * (obj.tag - BaseTag), 0, self.cmam_width, self.cmam_height);
        }
    }];

    self.saveButton.frame              = CGRectMake(30, self.cmam_height - 70, 50, 25);
    self.indexLabel.bounds             = CGRectMake(0, 0, 80, 30);
    self.indexLabel.cmam_centerX       = self.cmam_width * 0.5;
    self.indexLabel.cmam_centerY       = WYAStatusBarHeight + 15;
    self.indexLabel.layer.cornerRadius = self.indexLabel.cmam_height * 0.5;

    self.savaImageTipLabel.layer.cornerRadius = 5;
    self.savaImageTipLabel.clipsToBounds      = YES;
    [self.savaImageTipLabel sizeToFit];
    self.savaImageTipLabel.cmam_height = 30;
    self.savaImageTipLabel.cmam_width += 20;
    self.savaImageTipLabel.center = self.center;

    self.indicatorView.center = self.center;

    CGSize size = CGSizeZero;

    size = CGSizeMake(self.imageCount * self.pageControlDotSize.width * 1.2, self.pageControlDotSize.height);

    CGFloat x;
    switch (self.pageControlAliment) {
        case WYAImageBrowserPageControlAlimentCenter: {
            x = (self.cmam_width - size.width) * 0.5;
        } break;
        case WYAImageBrowserPageControlAlimentLeft: {
            x = 10;
        } break;
        case WYAImageBrowserPageControlAlimentRight: {
            x = self.cmam_width - size.width - 10;
        } break;
        default:
            break;
    }
    CGFloat y              = self.cmam_height - size.height - 50;
    self.pageControl.frame = CGRectMake(x, y, size.width, size.height);
}

/**
 移除所有浏览使用到的视图
 */
- (void)removeAllBrowserViews {

    [self removeFromSuperview];
    [self.savaImageTipLabel removeFromSuperview];
    [self.indicatorView removeFromSuperview];
    [self.bgView removeFromSuperview];
    self.photoBrowserRootView.windowLevel = UIWindowLevelNormal - 1;
    self.photoBrowserRootView             = nil;
}

- (void)showPhotos {
    // 只有一张图片
    if (self.imageCount == 1) {
        [self setUpImageForZoomingScrollViewAtIndex:0];
        return;
    }

    CGRect visibleBounds = self.scrollView.bounds;
    NSInteger firstIndex = floor((CGRectGetMinX(visibleBounds)) / CGRectGetWidth(visibleBounds));
    NSInteger lastIndex  = floor((CGRectGetMaxX(visibleBounds) - 1) / CGRectGetWidth(visibleBounds));

    if (firstIndex < 0) {
        firstIndex = 0;
    }
    if (firstIndex >= self.imageCount) {
        firstIndex = self.imageCount - 1;
    }
    if (lastIndex < 0) {
        lastIndex = 0;
    }
    if (lastIndex >= self.imageCount) {
        lastIndex = self.imageCount - 1;
    }

    // 回收不再显示的zoomingScrollView
    NSInteger zoomingScrollViewIndex = 0;
    for (WYAZoomingScrollView * zoomingScrollView in self.visibleZoomingScrollViews) {
        zoomingScrollViewIndex = zoomingScrollView.tag - BaseTag;
        if (zoomingScrollViewIndex < firstIndex || zoomingScrollViewIndex > lastIndex) {
            [self.reusableZoomingScrollViews addObject:zoomingScrollView];
            [zoomingScrollView prepareForReuse];
            [zoomingScrollView removeFromSuperview];
        }
    }

    // _visiblePhotoViews 减去 _reusablePhotoViews中的元素
    [self.visibleZoomingScrollViews minusSet:self.reusableZoomingScrollViews];
    while (self.reusableZoomingScrollViews.count > 2) { // 循环利用池中最多保存两个可以用对象
        [self.reusableZoomingScrollViews removeObject:[self.reusableZoomingScrollViews anyObject]];
    }

    // 展示图片
    for (NSInteger index = firstIndex; index <= lastIndex; index++) {
        if (![self isShowingZoomingScrollViewAtIndex:index]) {
            [self setUpImageForZoomingScrollViewAtIndex:index];
        }
    }
}

/**
 *  判断指定的某个位置图片是否在显示
 */
- (BOOL)isShowingZoomingScrollViewAtIndex:(NSInteger)index {
    for (WYAZoomingScrollView * view in self.visibleZoomingScrollViews) {
        if ((view.tag - BaseTag) == index) {
            return YES;
        }
    }
    return NO;
}

/**
 *  获取指定位置的WYAZoomingScrollView , 三级查找,正在显示的池,回收池,创建新的并赋值
 *
 *  @param index 指定位置索引
 */
- (WYAZoomingScrollView *)zoomingScrollViewAtIndex:(NSInteger)index {
    for (WYAZoomingScrollView * zoomingScrollView in self.visibleZoomingScrollViews) {
        if ((zoomingScrollView.tag - BaseTag) == index) {
            return zoomingScrollView;
        }
    }
    WYAZoomingScrollView * zoomingScrollView = [self dequeueReusableZoomingScrollView];
    [self setUpImageForZoomingScrollViewAtIndex:index];
    return zoomingScrollView;
}

/**
 *   加载指定位置的图片
 */
- (void)setUpImageForZoomingScrollViewAtIndex:(NSInteger)index {
    WYAZoomingScrollView * zoomingScrollView    = [self dequeueReusableZoomingScrollView];
    zoomingScrollView.zoomingScrollViewdelegate = self;
    [zoomingScrollView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)]];
    zoomingScrollView.tag   = BaseTag + index;
    zoomingScrollView.frame = CGRectMake((self.scrollView.cmam_width) * index, 0, self.cmam_width, self.cmam_height);
    self.currentImageIndex  = index;
    if ([self highQualityImageURLForIndex:index]) { // 如果提供了高清大图数据源,就去加载
        [zoomingScrollView setShowHighQualityImageWithURL:[self highQualityImageURLForIndex:index] placeholderImage:[self placeholderImageForIndex:index]];
    } else if ([self assetForIndex:index]) {
        ALAsset * asset     = [self assetForIndex:index];
        CGImageRef imageRef = asset.defaultRepresentation.fullScreenImage;
        CGImageRelease(imageRef);
        [zoomingScrollView setShowImage:[UIImage imageWithCGImage:imageRef]];
    } else {
        [zoomingScrollView setShowImage:[self placeholderImageForIndex:index]];
    }

    // 添加拖动手势
    UIPanGestureRecognizer * pan             = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panEvent:)];
    pan.delegate                             = self;
    pan.maximumNumberOfTouches               = 1;
    zoomingScrollView.userInteractionEnabled = YES;
    [zoomingScrollView addGestureRecognizer:pan];

    [self.visibleZoomingScrollViews addObject:zoomingScrollView];
    [self.scrollView addSubview:zoomingScrollView];
}

- (void)removeZoomingScrollViewDelegate{

    for (WYAZoomingScrollView * scrollView in self.visibleZoomingScrollViews) {
        scrollView.zoomingScrollViewdelegate = nil;
    }

}

- (void)addZoomingScrollViewDelegate{

    for (WYAZoomingScrollView * scrollView in self.visibleZoomingScrollViews) {
        scrollView.zoomingScrollViewdelegate = self;
    }

}

/**
 *  从缓存池中获取一个WYAZoomingScrollView对象
 */
- (WYAZoomingScrollView *)dequeueReusableZoomingScrollView {
    WYAZoomingScrollView * photoView = [self.reusableZoomingScrollViews anyObject];
    if (photoView) {
        [self.reusableZoomingScrollViews removeObject:photoView];
    } else {
        photoView = [[WYAZoomingScrollView alloc] init];
    }
    return photoView;
}

/**
 *  获取指定位置的占位图片,和外界的数据源交互
 */
- (UIImage *)placeholderImageForIndex:(NSInteger)index {
    if (self.datasource && [self.datasource respondsToSelector:@selector(photoBrowser:placeholderImageForIndex:)]) {

        return [self.datasource photoBrowser:self placeholderImageForIndex:index];

    } else if (self.placeHoldImageBlock) {

        return self.placeHoldImageBlock(self, index);

    } else if (self.images.count > index) {
        if ([self.images[index] isKindOfClass:[UIImage class]]) {
            return self.images[index];
        } else {
            return self.placeholderImage;
        }
    }
    return self.placeholderImage;
}

/**
 *  获取指定位置的高清大图URL,和外界的数据源交互
 */
- (NSURL *)highQualityImageURLForIndex:(NSInteger)index {
    if (self.datasource && [self.datasource respondsToSelector:@selector(photoBrowser:highQualityImageURLForIndex:)]) {
        NSURL * url = [self.datasource photoBrowser:self highQualityImageURLForIndex:index];
        if (!url) {
            NSLog(@"高清大图URL数据 为空,请检查代码 , 图片索引:%zd", index);
            return nil;
        }
        if ([url isKindOfClass:[NSString class]]) {
            url = [NSURL URLWithString:(NSString *)url];
        }
        if (![url isKindOfClass:[NSURL class]]) {
            //        NSAssert([url isKindOfClass:[NSURL class]], @"高清大图URL数据有问题,不是NSString也不是NSURL");
            NSLog(@"高清大图URL数据有问题,不是NSString也不是NSURL , 错误数据:%@ , 图片索引:%zd", url, index);
            return nil;
        }
        return url;
    } else if (self.highQualityImageURLBlock) {
        NSURL * url = self.highQualityImageURLBlock(self, index);
        if (!url) {
            NSLog(@"高清大图URL数据 为空,请检查代码 , 图片索引:%zd", index);
            return nil;
        }
        if ([url isKindOfClass:[NSString class]]) {
            url = [NSURL URLWithString:(NSString *)url];
        }
        if (![url isKindOfClass:[NSURL class]]) {
            //        NSAssert([url isKindOfClass:[NSURL class]], @"高清大图URL数据有问题,不是NSString也不是NSURL");
            NSLog(@"高清大图URL数据有问题,不是NSString也不是NSURL , 错误数据:%@ , 图片索引:%zd", url, index);
            return nil;
        }
        return url;
    } else if (self.images.count > index) {
        if ([self.images[index] isKindOfClass:[NSURL class]]) {
            return self.images[index];
        } else if ([self.images[index] isKindOfClass:[NSString class]]) {
            NSURL * url = [NSURL URLWithString:self.images[index]];
            return url;
        } else {
            return nil;
        }
    }
    return nil;
}

/**
 *  获取指定位置的 ALAsset,获取图片
 */
- (ALAsset *)assetForIndex:(NSInteger)index {
    if (self.datasource && [self.datasource respondsToSelector:@selector(photoBrowser:assetForIndex:)]) {
        return [self.datasource photoBrowser:self assetForIndex:index];
    } else if (self.assetBlock) {
        return self.assetBlock(self, index);
    } else if (self.images.count > index) {
        if ([self.images[index] isKindOfClass:[ALAsset class]]) {
            return self.images[index];
        } else {
            return nil;
        }
    }
    return nil;
}

/**
 *  获取多图浏览,指定位置图片的UIImageView视图,用于做弹出放大动画和回缩动画
 */
- (UIView *)sourceImageViewForIndex:(NSInteger)index {
    if (self.datasource && [self.datasource respondsToSelector:@selector(photoBrowser:sourceImageViewForIndex:)]) {
        return [self.datasource photoBrowser:self sourceImageViewForIndex:index];
    } else if (self.sourceImageViewBlock) {
        return self.sourceImageViewBlock(self, index);
    }
    return nil;
}

/**
 *  第一个展示的图片 , 点击图片,放大的动画就是从这里来的
 */
- (void)showFirstImage {
    // 获取到用户点击的那个UIImageView对象,进行坐标转化
    CGRect startRect;
    if (!self.sourceImageView) {
        if (self.datasource && [self.datasource respondsToSelector:@selector(photoBrowser:sourceImageViewForIndex:)]) {
            self.sourceImageView = [self.datasource photoBrowser:self sourceImageViewForIndex:self.currentImageIndex];
        } else if (self.sourceImageViewBlock) {
            self.sourceImageView = self.sourceImageViewBlock(self, self.currentImageIndex);
        } else {
            self.bgView.alpha = 1.0;
            NSLog(@"需要提供源视图才能做弹出/退出图片浏览器的缩放动画");
            return;
        }
    }
    startRect = [self.sourceImageView.superview convertRect:self.sourceImageView.frame toView:self];

    UIImageView * tempView = [[UIImageView alloc] init];
    tempView.image         = [self placeholderImageForIndex:self.currentImageIndex];
    tempView.frame         = startRect;
    [self addSubview:tempView];

    CGRect targetRect; // 目标frame

    UIImage * image;
    if ([self.sourceImageView isKindOfClass:[UIButton class]]) {
        UIButton * button = (UIButton *)self.sourceImageView;
        if (button.currentBackgroundImage) {
            image = button.currentBackgroundImage;
        } else if (button.currentImage) {
            image = button.currentImage;
        }
    } else if ([self.sourceImageView isKindOfClass:[UIImageView class]]) {
        image = self.sourceImageView.image;
    }

    //TODO 完善image为空的闪退
    if (image == nil) {
        ///objc[1903]: Class PLBuildVersion is implemented in both /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/PrivateFrameworks/AssetsLibraryServices.framework/AssetsLibraryServices (0x1110ec998) and /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/PrivateFrameworks/PhotoLibraryServices.framework/PhotoLibraryServices (0x110e6b880). One of the two will be used. Which one is undefined.
        //(lldb)  po tempView.frame
        //        (origin = (x = 15, y = 100), size = (width = 100, height = 100))
        //
        //        (lldb) po targetRect
        //        (origin = (x = 0, y = NaN), size = (width = 414, height = NaN))

        NSLog(@"需要提供源视图才能做弹出/退出图片浏览器的缩放动画");
        return;
    }
    CGFloat imageWidthHeightRatio = image.size.width / image.size.height;
    CGFloat screenRatio           = ScreenWidth / ScreenHeight;
    CGFloat width                 = ScreenWidth;
    CGFloat height                = ScreenWidth / imageWidthHeightRatio;
    CGFloat x                     = 0;
    CGFloat y;
    y = (ScreenHeight - height) * 0.5;

    // 图片高宽比大于当前屏幕高宽比
    if (screenRatio > imageWidthHeightRatio) {
        height = ScreenHeight;
        width  = ScreenHeight * imageWidthHeightRatio;
        y      = 0;
        x      = (ScreenWidth - width) * 0.5;
    }

    targetRect             = CGRectMake(x, y, width, height);
    self.scrollView.hidden = YES;
    self.bgView.alpha      = 1.0;

    // 动画修改图片视图的frame , 居中同时放大
    [UIView animateWithDuration:0.25
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         tempView.frame = targetRect;
                     }
                     completion:^(BOOL finished) {
                         [tempView removeFromSuperview];
                         self.scrollView.hidden = NO;
                     }];
}

/**
 更新索引指示控件的显隐逻辑
 */
- (void)updateIndexVisible {
    switch (self.browserStyle) {
        case WYAImageBrowserStylePageControl: {
            self.pageControl.hidden = NO;
            self.indexLabel.hidden  = YES;
            self.saveButton.hidden  = YES;
        } break;
        case WYAImageBrowserStyleIndexLabel: {
            self.indexLabel.hidden  = NO;
            self.pageControl.hidden = YES;
            self.saveButton.hidden  = YES;
        } break;
        case WYAImageBrowserStyleSimple: {
            self.indexLabel.hidden  = NO;
            self.saveButton.hidden  = NO;
            self.pageControl.hidden = YES;
        } break;
        default:
            break;
    }

    if (self.imageCount == 1 && self.hidesForSinglePage == YES) {
        self.indexLabel.hidden  = YES;
        self.pageControl.hidden = YES;
    }
}

/**
 *  修改图片指示索引内容
 */
- (void)updateIndexContent {
    UIPageControl * pageControl = (UIPageControl *)self.pageControl;
    pageControl.currentPage     = self.currentImageIndex;
    NSString * title            = [NSString stringWithFormat:@"%zd / %zd", self.currentImageIndex + 1, self.imageCount];
    self.indexLabel.text        = title;
}

#pragma mark ======= saveImage
- (void)saveImage {
    WYAZoomingScrollView * zoomingScrollView = [self zoomingScrollViewAtIndex:self.currentImageIndex];
    if (zoomingScrollView.progress < 1.0) {
        self.savaImageTipLabel.text = @" >_< 图片加载中,请稍后 ";
        [self addSubview:self.savaImageTipLabel];
        [self.savaImageTipLabel performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:1.0];
        return;
    }
    UIImageWriteToSavedPhotosAlbum(zoomingScrollView.currentImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    [self addSubview:self.indicatorView];
    [self.indicatorView startAnimating];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
{
    [self.indicatorView removeFromSuperview];
    [self addSubview:self.savaImageTipLabel];
    if (error) {
        self.savaImageTipLabel.text = @" >_< 保存失败 ";
    } else {
        self.savaImageTipLabel.text = @" ^_^ 保存成功 ";
    }
    [self.savaImageTipLabel performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:1.0];
}

#pragma mark - Notifation
- (void)orientationDidChange {
    self.scrollView.delegate    = nil; // 旋转期间,禁止调用scrollView的代理事件等
    WYAZoomingScrollView * temp = [self zoomingScrollViewAtIndex:self.currentImageIndex];
    [temp.scrollview setZoomScale:1.0 animated:YES];
    [self updateFrames];
    self.scrollView.delegate = self;
}

#pragma mark - GestureRecognizer
- (void)panEvent:(UIPanGestureRecognizer *)pan {

    WYAZoomingScrollView * panView = (WYAZoomingScrollView *)pan.view;
    // 相对于初始或者上次复位位置的偏移量
    CGPoint point    = [pan translationInView:panView];
    CGPoint velocity = [pan velocityInView:panView];

    // 计算手势向下的高宽比,大于0.965则允许移动，角度约小于等于46°
    CGFloat ratio = velocity.y / velocity.x;
    // 向下移动
    if (velocity.y > 0 && fabs(ratio) >= 0.965 && pan.state == UIGestureRecognizerStateBegan) {
        self.enablePan         = YES;
        NSInteger currentIndex = panView.tag - BaseTag;
        UIView * sourceView    = [self sourceImageViewForIndex:currentIndex];
        CGRect rect            = [sourceView convertRect:sourceView.bounds toView:[UIApplication sharedApplication].keyWindow];
        self.originFrame       = rect;
        self.startFrame        = panView.frame;
        // 触点相对当前界面的位置
        self.relativeStartPoint = [pan locationInView:panView];
        // 手势视图，在父视图中的位置
        self.startPoint = CGPointMake(self.relativeStartPoint.x + self.startFrame.origin.x, self.relativeStartPoint.y + self.startFrame.origin.y);
        self.offset     = CGPointMake(0, 0);
    }

    if (!self.enablePan) return;
    self.saveButton.hidden = YES;
    self.indexLabel.hidden = YES;
    if (pan.state == UIGestureRecognizerStateChanged) {
        pan.view.transform = CGAffineTransformTranslate(pan.view.transform, point.x, point.y);
        self.offset        = CGPointMake(self.offset.x + point.x, self.offset.y + point.y);
        // 复位，使上次拖动位置为初始位置
        [pan setTranslation:CGPointZero inView:panView];
        if (self.offset.y < 0) return;

        /// 计算背景色
        // 透明度
        CGFloat alpha = self.offset.y > 0 ? (1 - self.offset.y / (ScreenHeight * 3 / 5)) : 1.0;
        // 放缩比例
        CGFloat scale = 1 - self.offset.y / self.bgView.frame.size.height;
        // 设置最小尺寸
        if (scale < 1 / 3) scale = 1 / 3;

        CGFloat a = self.startPoint.x;
        CGFloat b = self.startPoint.y;
        CGFloat c = self.offset.x;
        CGFloat d = self.offset.y;
        CGFloat w = self.bgView.frame.size.width;
        CGFloat h = self.bgView.frame.size.height;

        CGFloat endX = a + c - self.relativeStartPoint.x * scale;
        CGFloat endY = b + d - self.relativeStartPoint.y * scale;

        panView.frame = CGRectMake(endX, endY, w * scale, h * scale);

        self.bgView.alpha = alpha;
    }
    if (pan.state == UIGestureRecognizerStateEnded) {
        NSLog(@"手势已结束");
        [self removeZoomingScrollViewDelegate];
        [panView removeGestureRecognizer:pan];
        // 如果发生的垂直位移大于1/4屏宽，则退出浏览模式
        if (self.offset.y > ScreenWidth / 4.0) {

            UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
            CGRect rect       = [panView.imageView convertRect:panView.imageView.bounds toView:window];
            [window addSubview:panView.imageView];
            NSLog(@"rect = %@",NSStringFromCGRect(rect));
            [panView.imageView setFrame:rect];
            panView.imageView.clipsToBounds = YES;
            panView.imageView.contentMode   = self.sourceImageView.contentMode;

            panView.isMoveOrigin = YES;
            [UIView animateWithDuration:0.25
                             animations:^{
                                 NSLog(@"window.frame = %@",NSStringFromCGRect(window.frame));
                                 self.enablePan = NO;
                                 [panView.imageView setFrame:self.originFrame];
                                 self.bgView.alpha       = 0.0;
                                 self.pageControl.hidden = YES; // 立即隐藏pangeControl
                             }
                             completion:^(BOOL finished) {
                                 if (finished) {
                                     [self addZoomingScrollViewDelegate];
                                     [panView.imageView removeFromSuperview];
                                     [self removeAllBrowserViews];
                                 }
                             }];

        } else {
            [self removeZoomingScrollViewDelegate];
            [UIView animateWithDuration:0.25
                             animations:^{
                                 self.enablePan = NO;
                                 panView.isMoveBack = YES;
                                 [panView setFrame:self.startFrame];
                                 self.bgView.alpha = 1.0;
                             }
                             completion:^(BOOL finished) {
                                 if (finished) {
                                     [self addZoomingScrollViewDelegate];
                                     [panView addGestureRecognizer:pan];
                                 }
                                 self.indexLabel.hidden = NO;
                                 if (self.browserStyle == WYAImageBrowserStyleIndexLabel) {
                                     self.saveButton.hidden = NO;
                                 }
                             }];
        }
    }
}

- (void)longPress:(UILongPressGestureRecognizer *)longPress {
    WYAZoomingScrollView * currentZoomingScrollView = [self zoomingScrollViewAtIndex:self.currentImageIndex];
    if (longPress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"UIGestureRecognizerStateBegan , currentZoomingScrollView.progress %f", currentZoomingScrollView.progress);
        if (currentZoomingScrollView.progress < 1.0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self longPress:longPress];
            });
            return;
        }

        if (self.alertButtons.count > 0) {
            WYAImageBrowserAlertView * alert = [[WYAImageBrowserAlertView alloc]initWithFrame:self.frame];
            for (WYAAlertButton * button in self.alertButtons) {
                [alert addAlertButton:button];
            }

            [self addSubview:alert];
            [alert show];
        }
    }
}

#pragma mark - Public Method
+ (instancetype)showImageBrowserWithCurrentImageIndex:(NSInteger)currentImageIndex
                                           imageCount:(NSUInteger)imageCount
                                           datasource:(id<WYAImageBrowserDatasource>)datasource
                                  placeHoldImageBlock:(PlaceHoldImageBlock)placeHoldimageBlock
                             HighQualityImageURLBlock:(HighQualityImageURLBlock)highQualityImageBlock
                                           AssetBlock:(AssetBlock)assetBlock
                                 SourceImageViewBlock:(SourceImageViewBlock)sourceImageViewBlock {
    WYAImageBrowser * browser        = [[WYAImageBrowser alloc] init];
    browser.imageCount               = imageCount;
    browser.currentImageIndex        = currentImageIndex;
    browser.datasource               = datasource;
    browser.placeHoldImageBlock      = placeHoldimageBlock;
    browser.highQualityImageURLBlock = highQualityImageBlock;
    browser.assetBlock               = assetBlock;
    browser.sourceImageViewBlock     = sourceImageViewBlock;
    [browser show];
    return browser;
}

+ (instancetype)showImageBrowserWithImages:(NSArray *)images currentImageIndex:(NSInteger)currentImageIndex {
    if (images.count <= 0 || images == nil) {
        NSLog(@"一行代码展示图片浏览的方法,传入的数据源为空,请检查传入数据源");
        return nil;
    }

    //检查数据源对象是否非法
    for (id image in images) {
        if (![image isKindOfClass:[UIImage class]] && ![image isKindOfClass:[NSString class]] && ![image isKindOfClass:[NSURL class]] && ![image isKindOfClass:[ALAsset class]]) {
            NSLog(@"识别到非法数据格式,请检查传入数据是否为 NSString/NSURL/ALAsset 中一种");
            return nil;
        }
    }

    WYAImageBrowser * browser = [[WYAImageBrowser alloc] init];
    browser.imageCount        = images.count;
    browser.currentImageIndex = currentImageIndex;
    browser.images            = images;
    [browser show];
    return browser;
}

///**
// *  进入图片浏览器
// *
// *  @param index      从哪一张开始浏览,默认第一章
// *  @param imageCount 要浏览图片的总个数
// */
//- (void)showWithImageIndex:(NSInteger)index imageCount:(NSInteger)imageCount datasource:(id<XLPhotoBrowserDatasource>)datasource
//{
//    self.currentImageIndex = index;
//    self.imageCount = imageCount;
//    self.datasource = datasource;
//    [self show];
//}

- (void)show {
    if (self.imageCount <= 0) {
        return;
    }
    if (self.currentImageIndex >= self.imageCount) {
        self.currentImageIndex = self.imageCount - 1;
    }
    if (self.currentImageIndex < 0) {
        self.currentImageIndex = 0;
    }

    self.frame  = self.photoBrowserRootView.bounds;
    self.bgView = [[UIView alloc] initWithFrame:self.photoBrowserRootView.bounds];
    [self.bgView setBackgroundColor:[UIColor blackColor]];
    [self.photoBrowserRootView addSubview:self.bgView];
    [self.photoBrowserRootView addSubview:self];
    [self iniaialUI];
}

/**
 *  退出
 */
- (void)dismiss {
    [UIView animateWithDuration:0.25
        delay:0
        options:UIViewAnimationOptionCurveEaseIn
        animations:^{
            self.bgView.alpha = 0.0;
        }
        completion:^(BOOL finished) {
            if (finished) {
                [self removeAllBrowserViews];
            }
        }];
}

/**
 *  保存当前展示的图片
 */
- (void)saveCurrentShowImage {
    [self saveImage];
}

- (void)addAlertSheetButton:(WYAAlertButton *)button{
    [self.alertButtons addObject:button];
}
/**
 具体的删除逻辑,请根据自己项目的实际情况,自行处理
 */
//- (void)delete
//{
//    if (self.currentImageIndex == 0) {
//        XLZoomingScrollView *currentZoomingScrollView = [self zoomingScrollViewAtIndex:self.currentImageIndex];
//        [self.reusableZoomingScrollViews addObject:currentZoomingScrollView];
//        [currentZoomingScrollView prepareForReuse];
//        [currentZoomingScrollView removeFromSuperview];
//        [self.visibleZoomingScrollViews minusSet:self.reusableZoomingScrollViews];
//    }
//    self.currentImageIndex --;
//    self.imageCount --;
//    if (self.currentImageIndex == -1 && self.imageCount == 0) {
//        [self dismiss];
//    } else {
//        self.currentImageIndex = (self.currentImageIndex == (-1) ? 0 : self.currentImageIndex);
//        if (self.currentImageIndex == 0) {
//            [self setUpImageForZoomingScrollViewAtIndex:0];
//            [self updatePageControlIndex];
//            [self showPhotos];
//        }
//
//        self.scrollView.contentSize = CGSizeMake((self.scrollView.frame.size.width) * self.imageCount, 0);
//        self.scrollView.contentOffset = CGPointMake(self.currentImageIndex * (self.scrollView.frame.size.width), 0);
//    }
//    UIPageControl *pageControl = (UIPageControl *)self.pageControl;
//    pageControl.numberOfPages = self.imageCount;
//    [self updatePageControlIndex];
//}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {

    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer * pan   = (UIPanGestureRecognizer *)gestureRecognizer;
        WYAZoomingScrollView * panView = (WYAZoomingScrollView *)pan.view;
        if (panView.imageView.frame.size.width > panView.imageView.bounds.size.width && panView.imageView.frame.size.height > panView.imageView.bounds.size.height) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {

    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {

        UIPanGestureRecognizer * pan   = (UIPanGestureRecognizer *)gestureRecognizer;
        WYAZoomingScrollView * panView = (WYAZoomingScrollView *)pan.view;
        CGPoint velocity               = [pan velocityInView:panView];
        CGFloat ratio                  = velocity.y / velocity.x;
        if (velocity.y > 0 && fabs(ratio) >= 0.965) {
            panView.scrollview.scrollEnabled = NO;
            return YES;
        } else {
            panView.scrollview.scrollEnabled = YES;
            return NO;
        }
    }
    return NO;
}

#pragma mark - WYAZoomingScrollViewDelegate

/**
 *  单击图片,退出浏览
 */
- (void)zoomingScrollView:(WYAZoomingScrollView *)zoomingScrollView singleTapDetected:(UITapGestureRecognizer *)singleTap {
    NSInteger currentIndex = zoomingScrollView.tag - BaseTag;
    UIView * sourceView    = [self sourceImageViewForIndex:currentIndex];
    if (sourceView == nil) {
        [self dismiss];
        return;
    }
    self.scrollView.hidden  = YES;
    self.pageControl.hidden = YES;
    self.indexLabel.hidden  = YES;
    self.saveButton.hidden  = YES;

    CGRect targetTemp = [sourceView.superview convertRect:sourceView.frame toView:self];
    NSLog(@"rect==%@", NSStringFromCGRect(targetTemp));
    UIImageView * tempView = [[UIImageView alloc] init];
    tempView.contentMode   = sourceView.contentMode;
    tempView.clipsToBounds = YES;
    tempView.image         = zoomingScrollView.currentImage;
    tempView.frame         = CGRectMake(-zoomingScrollView.scrollview.contentOffset.x + zoomingScrollView.imageView.cmam_left, -zoomingScrollView.scrollview.contentOffset.y + zoomingScrollView.imageView.cmam_top, zoomingScrollView.imageView.cmam_width, zoomingScrollView.imageView.cmam_height);
    [self addSubview:tempView];

    [UIView animateWithDuration:0.25
        animations:^{
            tempView.frame               = targetTemp;
            self.savaImageTipLabel.alpha = 0.0;
            self.indicatorView.alpha     = 0.0;
            self.bgView.alpha            = 0.0;
        }
        completion:^(BOOL finished) {
            if (finished) {
                [self removeAllBrowserViews];
            }
        }];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self showPhotos];
    NSInteger pageNum      = floor((scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5) / scrollView.bounds.size.width);
    self.currentImageIndex = pageNum == self.imageCount ? pageNum - 1 : pageNum;
    [self updateIndexContent];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger pageNum      = floor((scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5) / scrollView.bounds.size.width);
    self.currentImageIndex = pageNum == self.imageCount ? pageNum - 1 : pageNum;
    [self updateIndexContent];
}

#pragma mark - Setter
//- (void)setPlaceHoldImageBlock:(PlaceHoldImageBlock)placeHoldImageBlock{
//    _placeHoldImageBlock = placeHoldImageBlock;
//}
//
//- (void)setHighQualityImageURLBlock:(HighQualityImageURLBlock)highQualityImageURLBlock{
//    _highQualityImageURLBlock = highQualityImageURLBlock;
//}
//
//- (void)setAssetBlock:(AssetBlock)assetBlock{
//    _assetBlock = assetBlock;
//}
//
//- (void)setSourceImageViewBlock:(SourceImageViewBlock)sourceImageViewBlock{
//    _sourceImageViewBlock = sourceImageViewBlock;
//}

- (void)setCurrentPageDotColor:(UIColor *)currentPageDotColor {
    _currentPageDotColor                      = currentPageDotColor;
    UIPageControl * pageControl               = (UIPageControl *)_pageControl;
    pageControl.currentPageIndicatorTintColor = currentPageDotColor;
}

- (void)setPageDotColor:(UIColor *)pageDotColor {
    _pageDotColor = pageDotColor;
    if ([self.pageDotColor isKindOfClass:[UIPageControl class]]) {
        UIPageControl * pageControl        = (UIPageControl *)_pageControl;
        pageControl.pageIndicatorTintColor = pageDotColor;
    }
}

- (void)setCurrentPageDotImage:(UIImage *)currentPageDotImage {
    _currentPageDotImage = currentPageDotImage;
    [self setCustomPageControlDotImage:currentPageDotImage isCurrentPageDot:YES];
}

- (void)setPageDotImage:(UIImage *)pageDotImage {
    _pageDotImage = pageDotImage;
    [self setCustomPageControlDotImage:pageDotImage isCurrentPageDot:NO];
}

- (void)setCustomPageControlDotImage:(UIImage *)image isCurrentPageDot:(BOOL)isCurrentPageDot {
    if (!image || !self.pageControl) return;
    UIPageControl * pageControl = (UIPageControl *)_pageControl;
    if (isCurrentPageDot) {
        [pageControl setValue:image forKey:@"_currentPageImage"];
    } else {
        [pageControl setValue:image forKey:@"_pageImage"];
    }
}

- (void)setPageControlStyle:(WYAImageBrowserPageControlStyle)pageControlStyle {
    _pageControlStyle = pageControlStyle;
    [self setUpPageControl];
    [self updateIndexVisible];
}

- (void)setHidesForSinglePage:(BOOL)hidesForSinglePage {
    _hidesForSinglePage = hidesForSinglePage;
    [self updateIndexVisible];
}

- (void)setBrowserStyle:(WYAImageBrowserStyle)browserStyle {
    _browserStyle = browserStyle;
    [self updateIndexVisible];
}

- (void)setPageControlAliment:(WYAImageBrowserPageControlAliment)pageControlAliment {
    _pageControlAliment = pageControlAliment;
    switch (self.pageControlAliment) {
        case WYAImageBrowserPageControlAlimentLeft: {
            self.pageControl.cmam_left = 10;
        } break;
        case WYAImageBrowserPageControlAlimentRight: {
            self.pageControl.cmam_left = (self.cmam_width - self.pageControl.cmam_width) - 10;
        } break;
        case WYAImageBrowserPageControlAlimentCenter:
        default: {
            self.pageControl.cmam_left = (self.cmam_width - self.pageControl.cmam_width) * 0.5;
        } break;
    }
}

#pragma mark - Getter
- (UILabel *)savaImageTipLabel {
    if (_savaImageTipLabel == nil) {
        _savaImageTipLabel                 = [[UILabel alloc] init];
        _savaImageTipLabel.textColor       = [UIColor whiteColor];
        _savaImageTipLabel.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.90f];
        _savaImageTipLabel.textAlignment   = NSTextAlignmentCenter;
        _savaImageTipLabel.font            = [UIFont boldSystemFontOfSize:17];
    }
    return _savaImageTipLabel;
}

- (UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView                            = [[UIActivityIndicatorView alloc] init];
        _indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    }
    return _indicatorView;
}

- (UIImage *)placeholderImage {
    if (!_placeholderImage) {
        _placeholderImage = [UIImage wya_createImageWithColor:[UIColor grayColor]];
    }
    return _placeholderImage;
}

- (UIView *)photoBrowserRootView {
    if (!_photoBrowserRootView) {
        _photoBrowserRootView             = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _photoBrowserRootView.windowLevel = UIWindowLevelStatusBar + 100;
        [_photoBrowserRootView makeKeyAndVisible];
    }
    return _photoBrowserRootView;
}

@end
