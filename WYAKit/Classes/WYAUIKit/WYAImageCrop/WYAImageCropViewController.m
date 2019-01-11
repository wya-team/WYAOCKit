//
//  WYAImageCropViewController.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/3.
//

#import "WYAImageCropViewController.h"

#import "WYAImageCropViewControllerTransitioning.h"

static const CGFloat kTOCropViewControllerTitleTopPadding = 14.0f;
static const CGFloat kTOCropViewControllerToolbarHeight   = 100.0f;

@interface WYAImageCropViewController () <UIActionSheetDelegate,
                                          UIViewControllerTransitioningDelegate,
                                          WYAImageCropViewDelegate, WYAImageCropToolBarDelegate>

/* The target image */
@property (nonatomic, readwrite) UIImage * image;
@property (nonatomic, assign, readwrite) WYACropViewCroppingStyle croppingStyle;

//视图
@property (nonatomic, strong) WYAImageCropToolBar * toolbar;
@property (nonatomic, strong, readwrite) WYAImageCropView * cropView;
@property (nonatomic, strong) UIView * toolbarSnapshotView;

//页面切换相关
@property (nonatomic, copy) void (^prepareForTransitionHandler)(void);
@property (nonatomic, strong) WYAImageCropViewControllerTransitioning * transitionController;
@property (nonatomic, assign) BOOL inTransition;

@property (nonatomic, assign) BOOL navigationBarHidden;

@property (nonatomic, readonly) BOOL verticalLayout; //用来判断当前是竖屏还是横屏

@property (nonatomic, readonly) BOOL overrideStatusBar; //是否重新设置了状态栏
@property (nonatomic, readonly) BOOL statusBarHidden;
@property (nonatomic, readonly) CGFloat statusBarHeight;

@property (nonatomic, readonly) UIEdgeInsets statusBarSafeInsets; //状态栏安全间距
@property (nonatomic, assign) BOOL firstTime;

@property (nonatomic, assign) CGRect imageCropFrame;
@property (nonatomic, assign) NSInteger angle;
@property (nonatomic, assign) WYACropViewControllerAspectRatioPreset aspectRatioPreset;
@property (nonatomic, assign) CGSize customAspectRatio; //自定义长宽比，example:4:3 like this {4,3}
@property (nonatomic, assign) BOOL aspectRatioLockDimensionSwapEnabled;
@property (nonatomic, assign) BOOL aspectRatioLockEnabled;
@property (nonatomic, assign) BOOL resetAspectRatioEnabled;
@property (nonatomic, assign) BOOL rotateClockwiseButtonHidden;
@property (nonatomic, assign) BOOL hidesNavigationBar;
@end

@implementation WYAImageCropViewController

- (instancetype)initWithCroppingStyle:(WYACropViewCroppingStyle)style image:(UIImage *)image {
    NSParameterAssert(image);

    self = [super init];
    if (self) {
        _image         = image;
        _croppingStyle = style;

        self.modalTransitionStyle                 = UIModalTransitionStyleCrossDissolve;
        self.modalPresentationStyle               = UIModalPresentationFullScreen;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.hidesNavigationBar                   = true;

        _transitionController = [[WYAImageCropViewControllerTransitioning alloc] init];
        _aspectRatioPreset    = WYACropViewControllerAspectRatioPresetOriginal;
    }

    return self;
}

- (instancetype)initWithImage:(UIImage *)image {
    return [self initWithCroppingStyle:WYACropViewCroppingStyleDefault image:image];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.transitioningDelegate = self;
    self.view.backgroundColor  = self.cropView.backgroundColor;

    self.cropView.frame = [self frameForCropViewWithVerticalLayout:self.verticalLayout];
    self.toolbar.frame  = [self frameForToolbarWithVerticalLayout:self.verticalLayout];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //如果我们在屏幕上动画，设置一个标志，这样我们可以手动控制状态栏淡出计时
    if (animated) {
        self.inTransition = YES;
        [self setNeedsStatusBarAppearanceUpdate];
    }

    if (self.navigationController) {
        if (self.hidesNavigationBar) {
            self.navigationBarHidden = self.navigationController.navigationBarHidden;
            [self.navigationController setNavigationBarHidden:YES animated:animated];
        }

        self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    } else {
        [self.cropView setBackgroundImageViewHidden:YES animated:NO];
    }
    //设置相框比例
    if (self.aspectRatioPreset != WYACropViewControllerAspectRatioPresetOriginal) {
        [self setAspectRatioPreset:self.aspectRatioPreset animated:NO];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.inTransition = NO;

    self.cropView.simpleRenderMode = NO;

    void (^updateContentBlock)(void) = ^{ [self setNeedsStatusBarAppearanceUpdate]; };

    if (animated) {
        [UIView animateWithDuration:0.3f animations:updateContentBlock];
    } else {
        updateContentBlock();
    }

    if (self.cropView.gridOverlayHidden) {
        [self.cropView setGridOverlayHidden:NO animated:animated];
    }

    if (self.navigationController == nil) {
        [self.cropView setBackgroundImageViewHidden:NO animated:animated];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    self.inTransition = YES;
    [UIView animateWithDuration:0.5f animations:^{ [self setNeedsStatusBarAppearanceUpdate]; }];

    if (self.navigationController && self.hidesNavigationBar) {
        [self.navigationController setNavigationBarHidden:self.navigationBarHidden
                                                 animated:animated];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    self.inTransition = NO;
    [self setNeedsStatusBarAppearanceUpdate];
}

#pragma mark - Status Bar -
- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.navigationController) { return UIStatusBarStyleLightContent; }

    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    if (!self.overrideStatusBar) { return self.statusBarHidden; }

    BOOL hidden = YES;
    hidden      = hidden && !(self.inTransition);
    hidden      = hidden && !(self.view.superview == nil);
    return hidden;
}

- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures {
    return UIRectEdgeAll;
}

- (CGRect)frameForToolbarWithVerticalLayout:(BOOL)verticalLayout {
    UIEdgeInsets insets = self.statusBarSafeInsets;

    CGRect frame = CGRectZero;
    if (!verticalLayout) {
        frame.origin.x    = insets.left;
        frame.origin.y    = 0.0f;
        frame.size.width  = kTOCropViewControllerToolbarHeight;
        frame.size.height = CGRectGetHeight(self.view.frame);
    } else {
        frame.origin.x    = 0.0f;
        frame.size.width  = CGRectGetWidth(self.view.bounds);
        frame.size.height = kTOCropViewControllerToolbarHeight;

        frame.origin.y = CGRectGetHeight(self.view.bounds) - (frame.size.height + insets.bottom);
    }

    return frame;
}

- (CGRect)frameForCropViewWithVerticalLayout:(BOOL)verticalLayout {
    UIView * view = nil;
    if (self.parentViewController == nil) {
        view = self.view;
    } else {
        view = self.parentViewController.view;
    }

    UIEdgeInsets insets = self.statusBarSafeInsets;

    CGRect bounds = view.bounds;
    CGRect frame  = CGRectZero;

    if (!verticalLayout) {
        frame.origin.x    = kTOCropViewControllerToolbarHeight + insets.left;
        frame.size.width  = CGRectGetWidth(bounds) - frame.origin.x;
        frame.size.height = CGRectGetHeight(bounds);
    } else {
        frame.size.height = CGRectGetHeight(bounds);
        frame.size.width  = CGRectGetWidth(bounds);
        frame.size.height -= (insets.bottom + kTOCropViewControllerToolbarHeight);
    }

    return frame;
}

- (CGRect)frameForTitleLabelWithSize:(CGSize)size verticalLayout:(BOOL)verticalLayout {
    CGRect frame      = (CGRect){CGPointZero, size};
    CGFloat viewWidth = self.view.bounds.size.width;
    CGFloat x         = 0.0f;

    if (!verticalLayout) {
        x = kTOCropViewControllerTitleTopPadding;
        if (@available(iOS 11.0, *)) { x += self.view.safeAreaInsets.left; }

        viewWidth -= x;
    }

    frame.origin.x = ceilf((viewWidth - frame.size.width) * 0.5f);
    if (!verticalLayout) { frame.origin.x += x; }

    // Work out vertical position
    if (@available(iOS 11.0, *)) {
        frame.origin.y = self.view.safeAreaInsets.top + kTOCropViewControllerTitleTopPadding;
    } else {
        frame.origin.y = self.statusBarHeight + kTOCropViewControllerTitleTopPadding;
    }

    return frame;
}

- (void)adjustCropViewInsets {
    UIEdgeInsets insets = self.statusBarSafeInsets;

    if (self.verticalLayout) {
        self.cropView.cropRegionInsets = UIEdgeInsetsMake(insets.top, 0.0f, 0.0, 0.0f);
    } else {
        self.cropView.cropRegionInsets = UIEdgeInsetsMake(0.0f, 0.0f, insets.bottom, 0.0f);
    }
}

- (void)adjustToolbarInsets {
    UIEdgeInsets insets = UIEdgeInsetsZero;

    if (@available(iOS 11.0, *)) {
        if (!self.verticalLayout) {
            insets.left = self.view.safeAreaInsets.left;
        } else {
            insets.bottom = self.view.safeAreaInsets.bottom;
        }
    } else {
        if (!self.statusBarHidden) { insets.top = self.statusBarHeight; }
    }

    [self.toolbar setNeedsLayout];
}

- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    [self adjustCropViewInsets];
    [self adjustToolbarInsets];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    self.cropView.frame = [self frameForCropViewWithVerticalLayout:self.verticalLayout];
    [self adjustCropViewInsets];
    [self.cropView moveCroppedContentToCenterAnimated:NO];

    if (self.firstTime == NO) {
        [self.cropView performInitialSetup];
        self.firstTime = YES;
    }

    [UIView performWithoutAnimation:^{
        self.toolbar.frame = [self frameForToolbarWithVerticalLayout:self.verticalLayout];
        [self adjustToolbarInsets];
        [self.toolbar setNeedsLayout];
    }];
}

#pragma mark - Rotation Handling -
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration {
    self.toolbarSnapshotView       = [self.toolbar snapshotViewAfterScreenUpdates:NO];
    self.toolbarSnapshotView.frame = self.toolbar.frame;

    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        self.toolbarSnapshotView.autoresizingMask =
            UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    } else {
        self.toolbarSnapshotView.autoresizingMask =
            UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin;
    }
    [self.view addSubview:self.toolbarSnapshotView];

    CGRect frame = [self
        frameForToolbarWithVerticalLayout:UIInterfaceOrientationIsPortrait(toInterfaceOrientation)];
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        frame.origin.x = -frame.size.width;
    } else {
        frame.origin.y = self.view.bounds.size.height;
    }
    self.toolbar.frame = frame;

    [self.toolbar layoutIfNeeded];
    self.toolbar.alpha = 0.0f;

    [self.cropView prepareforRotation];
    self.cropView.frame =
        [self frameForCropViewWithVerticalLayout:!UIInterfaceOrientationIsPortrait(
                                                     toInterfaceOrientation)];
    self.cropView.simpleRenderMode       = YES;
    self.cropView.internalLayoutDisabled = YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration {
    self.toolbar.frame = [self frameForToolbarWithVerticalLayout:!UIInterfaceOrientationIsLandscape(
                                                                     toInterfaceOrientation)];
    [self.toolbar.layer removeAllAnimations];
    for (CALayer * sublayer in self.toolbar.layer.sublayers) { [sublayer removeAllAnimations]; }

    //在ios11上，由于这些布局调用会多次执行，如果我们不从当前状态聚合，动画就会中断
    [UIView animateWithDuration:duration
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.cropView.frame = [self
                             frameForCropViewWithVerticalLayout:!UIInterfaceOrientationIsLandscape(
                                                                    toInterfaceOrientation)];
                         self.toolbar.frame = [self
                             frameForToolbarWithVerticalLayout:UIInterfaceOrientationIsPortrait(
                                                                   toInterfaceOrientation)];
                         [self.cropView performRelayoutForRotation];
                     }
                     completion:nil];

    self.toolbarSnapshotView.alpha = 0.0f;
    self.toolbar.alpha             = 1.0f;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self.toolbarSnapshotView removeFromSuperview];
    self.toolbarSnapshotView = nil;

    [self.cropView setSimpleRenderMode:NO animated:YES];
    self.cropView.internalLayoutDisabled = NO;
}

- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];

    if (CGSizeEqualToSize(size, self.view.bounds.size)) { return; }

    UIInterfaceOrientation orientation = UIInterfaceOrientationPortrait;
    CGSize currentSize                 = self.view.bounds.size;
    if (currentSize.width < size.width) { orientation = UIInterfaceOrientationLandscapeLeft; }

    [self willRotateToInterfaceOrientation:orientation duration:coordinator.transitionDuration];
    [coordinator animateAlongsideTransition:^(
                     id<UIViewControllerTransitionCoordinatorContext> context) {
        [self willAnimateRotationToInterfaceOrientation:orientation
                                               duration:coordinator.transitionDuration];
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self didRotateFromInterfaceOrientation:orientation];
    }];
}

#pragma mark - Aspect Ratio Handling -
- (void)showAspectRatioDialog {
    if (self.cropView.aspectRatioLockEnabled) {
        self.cropView.aspectRatioLockEnabled = NO;
        return;
    }

    BOOL verticalCropBox = self.cropView.cropBoxAspectRatioIsPortrait;

    NSMutableArray * items = [NSMutableArray array];
    [items addObject:@"Square"];
    [items addObject:@"Original"];
    if (verticalCropBox) {
        [items addObjectsFromArray:@[ @"2:3", @"3:5", @"3:4", @"4:5", @"5:7", @"9:16" ]];
    } else {
        [items addObjectsFromArray:@[ @"3:2", @"5:3", @"4:3", @"5:4", @"7:5", @"16:9" ]];
    }

    UIAlertController * alertController =
        [UIAlertController alertControllerWithTitle:nil
                                            message:nil
                                     preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消"
                                                        style:UIAlertActionStyleCancel
                                                      handler:nil]];

    // Add each item to the alert controller
    NSInteger i = 0;
    for (NSString * item in items) {
        UIAlertAction * action = [UIAlertAction
            actionWithTitle:item
                      style:UIAlertActionStyleDefault
                    handler:^(UIAlertAction * _Nonnull action) {
                        [self setAspectRatioPreset:(WYACropViewControllerAspectRatioPreset)i
                                          animated:YES];
                        self.aspectRatioLockEnabled = YES;
                    }];
        [alertController addAction:action];

        i++;
    }

    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)setAspectRatioPreset:(WYACropViewControllerAspectRatioPreset)aspectRatioPreset
                    animated:(BOOL)animated {
    CGSize aspectRatio = CGSizeZero;

    _aspectRatioPreset = aspectRatioPreset;

    switch (aspectRatioPreset) {
        case WYACropViewControllerAspectRatioPresetOriginal:
            aspectRatio = CGSizeZero;
            break;
        case WYACropViewControllerAspectRatioPresettSquare:
            aspectRatio = CGSizeMake(1.0f, 1.0f);
            break;
        case WYACropViewControllerAspectRatioPreset3x2:
            aspectRatio = CGSizeMake(3.0f, 2.0f);
            break;
        case WYACropViewControllerAspectRatioPreset5x3:
            aspectRatio = CGSizeMake(5.0f, 3.0f);
            break;
        case WYACropViewControllerAspectRatioPreset4x3:
            aspectRatio = CGSizeMake(4.0f, 3.0f);
            break;
        case WYACropViewControllerAspectRatioPreset5x4:
            aspectRatio = CGSizeMake(5.0f, 4.0f);
            break;
        case WYACropViewControllerAspectRatioPreset7x5:
            aspectRatio = CGSizeMake(7.0f, 5.0f);
            break;
        case WYACropViewControllerAspectRatioPreset16x9:
            aspectRatio = CGSizeMake(16.0f, 9.0f);
            break;
        case WYACropViewControllerAspectRatioPresetCustom:
            aspectRatio = self.customAspectRatio;
            break;
    }

    BOOL aspectRatioCanSwapDimensions =
        !self.aspectRatioLockEnabled ||
        (self.aspectRatioLockEnabled && self.aspectRatioLockDimensionSwapEnabled);

    if (self.cropView.cropBoxAspectRatioIsPortrait && aspectRatioCanSwapDimensions) {
        CGFloat width      = aspectRatio.width;
        aspectRatio.width  = aspectRatio.height;
        aspectRatio.height = width;
    }

    [self.cropView setAspectRatio:aspectRatio animated:animated];
}

#pragma mark - Crop View Delegates -
- (void)cropViewDidBecomeResettable:(WYAImageCropView *)cropView {
    //    self.toolbar.resetButtonEnabled = YES;
}

- (void)cropViewDidBecomeNonResettable:(WYAImageCropView *)cropView {
    //    self.toolbar.resetButtonEnabled = NO;
}

#pragma mark - WYAImageCropToolBarDelegate -
- (void)rotatingAction {
    [self.cropView rotateImageNinetyDegreesAnimated:YES clockwise:NO];
}

- (void)originalAction {
    BOOL animated = (self.cropView.angle == 0);

    if (self.resetAspectRatioEnabled) { self.aspectRatioLockEnabled = NO; }

    [self.cropView resetLayoutToDefaultAnimated:animated];
}

- (void)cancelAction {
    bool isDelegateOrCallbackHandled = NO;

    if ([self.delegate respondsToSelector:@selector(cropViewController:didFinishCancelled:)]) {
        [self.delegate cropViewController:self didFinishCancelled:YES];
        isDelegateOrCallbackHandled = YES;
    }

    if (self.onDidFinishCancelled != nil) {
        self.onDidFinishCancelled(YES);
        isDelegateOrCallbackHandled = YES;
    }

    if (!isDelegateOrCallbackHandled) {
        if (self.navigationController) {
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            //            self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

- (void)doneAction {
    CGRect cropFrame = self.cropView.imageCropFrame;
    NSInteger angle  = self.cropView.angle;

    BOOL isCallbackOrDelegateHandled = NO;

    if ([self.delegate
            respondsToSelector:@selector(cropViewController:didCropImageToRect:angle:)]) {
        [self.delegate cropViewController:self didCropImageToRect:cropFrame angle:angle];
        isCallbackOrDelegateHandled = YES;
    }

    if (self.onDidCropImageToRect != nil) {
        self.onDidCropImageToRect(cropFrame, angle);
        isCallbackOrDelegateHandled = YES;
    }

    BOOL isCircularImageDelegateAvailable = [self.delegate
        respondsToSelector:@selector(cropViewController:didCropToCircularImage:withRect:angle:)];
    BOOL isCircularImageCallbackAvailable = self.onDidCropToCircleImage != nil;

    BOOL isDidCropToImageDelegateAvailable = [self.delegate
        respondsToSelector:@selector(cropViewController:didCropToImage:withRect:angle:)];
    BOOL isDidCropToImageCallbackAvailable = self.onDidCropToRect != nil;

    if (self.croppingStyle == WYACropViewCroppingStyleCircular &&
        (isCircularImageDelegateAvailable || isCircularImageCallbackAvailable)) {
        UIImage * image =
            [self.image wya_croppedImageWithFrame:cropFrame
                                            angle:angle
                                     circularClip:YES];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.03f * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
                           if (isCircularImageDelegateAvailable) {
                               [self.delegate cropViewController:self
                                          didCropToCircularImage:image
                                                        withRect:cropFrame
                                                           angle:angle];
                           }
                           if (isCircularImageCallbackAvailable) {
                               self.onDidCropToCircleImage(image, cropFrame, angle);
                           }
                       });

        isCallbackOrDelegateHandled = YES;
    } else if (isDidCropToImageDelegateAvailable || isDidCropToImageCallbackAvailable) {
        UIImage * image = nil;
        if (angle == 0 && CGRectEqualToRect(cropFrame, (CGRect){CGPointZero, self.image.size})) {
            image = self.image;
        } else {
            image = [self.image wya_croppedImageWithFrame:cropFrame angle:angle circularClip:NO];
        }

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.03f * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
                           if (isDidCropToImageDelegateAvailable) {
                               [self.delegate cropViewController:self
                                                  didCropToImage:image
                                                        withRect:cropFrame
                                                           angle:angle];
                           }

                           if (isDidCropToImageCallbackAvailable) {
                               self.onDidCropToRect(image, cropFrame, angle);
                           }
                       });

        isCallbackOrDelegateHandled = YES;
    }

    if (!isCallbackOrDelegateHandled) {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (id<UIViewControllerAnimatedTransitioning>)
animationControllerForPresentedController:(UIViewController *)presented
                     presentingController:(UIViewController *)presenting
                         sourceController:(UIViewController *)source {
    if (self.navigationController ||
        self.modalTransitionStyle == UIModalTransitionStyleCoverVertical) {
        return nil;
    }

    self.cropView.simpleRenderMode = YES;

    __weak typeof(self) weakSelf                          = self;
    self.transitionController.prepareForTransitionHandler = ^{
        typeof(self) strongSelf                                 = weakSelf;
        WYAImageCropViewControllerTransitioning * transitioning = strongSelf.transitionController;

        transitioning.toFrame = [strongSelf.cropView convertRect:strongSelf.cropView.cropBoxFrame
                                                          toView:strongSelf.view];
        if (!CGRectIsEmpty(transitioning.fromFrame) || transitioning.fromView) {
            strongSelf.cropView.croppingViewsHidden = YES;
        }

        if (strongSelf.prepareForTransitionHandler) { strongSelf.prepareForTransitionHandler(); }

        strongSelf.prepareForTransitionHandler = nil;
    };

    self.transitionController.isDismissing = NO;
    return self.transitionController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:
    (UIViewController *)dismissed {
    if (self.navigationController ||
        self.modalTransitionStyle == UIModalTransitionStyleCoverVertical) {
        return nil;
    }

    __weak typeof(self) weakSelf                          = self;
    self.transitionController.prepareForTransitionHandler = ^{
        typeof(self) strongSelf                                 = weakSelf;
        WYAImageCropViewControllerTransitioning * transitioning = strongSelf.transitionController;

        if (!CGRectIsEmpty(transitioning.toFrame) || transitioning.toView) {
            strongSelf.cropView.croppingViewsHidden = YES;
        } else {
            strongSelf.cropView.simpleRenderMode = YES;
        }

        if (strongSelf.prepareForTransitionHandler) { strongSelf.prepareForTransitionHandler(); }
    };

    self.transitionController.isDismissing = YES;
    return self.transitionController;
}

#pragma mark - Property Methods -

- (WYAImageCropView *)cropView {
    if (!_cropView) {
        _cropView =
            [[WYAImageCropView alloc] initWithCroppingStyle:self.croppingStyle
                                                      image:self.image];
        _cropView.delegate = self;
        _cropView.autoresizingMask =
            UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_cropView];
    }
    return _cropView;
}

- (WYAImageCropToolBar *)toolbar {
    if (!_toolbar) {
        _toolbar          = [[WYAImageCropToolBar alloc] initWithFrame:CGRectZero];
        _toolbar.delegate = self;
        [self.view addSubview:_toolbar];
    }
    return _toolbar;
}

- (void)setAspectRatioLockEnabled:(BOOL)aspectRatioLockEnabled {
    self.cropView.aspectRatioLockEnabled = aspectRatioLockEnabled;
}

- (void)setAspectRatioLockDimensionSwapEnabled:(BOOL)aspectRatioLockDimensionSwapEnabled {
    self.cropView.aspectRatioLockDimensionSwapEnabled = aspectRatioLockDimensionSwapEnabled;
}

- (BOOL)aspectRatioLockEnabled {
    return self.cropView.aspectRatioLockEnabled;
}

- (void)setResetAspectRatioEnabled:(BOOL)resetAspectRatioEnabled {
    self.cropView.resetAspectRatioEnabled = resetAspectRatioEnabled;
}

- (void)setCustomAspectRatio:(CGSize)customAspectRatio {
    _customAspectRatio = customAspectRatio;
    [self setAspectRatioPreset:WYACropViewControllerAspectRatioPresetCustom animated:NO];
}

- (BOOL)resetAspectRatioEnabled {
    return self.cropView.resetAspectRatioEnabled;
}

- (void)setAngle:(NSInteger)angle {
    self.cropView.angle = angle;
}

- (NSInteger)angle {
    return self.cropView.angle;
}

- (void)setImageCropFrame:(CGRect)imageCropFrame {
    self.cropView.imageCropFrame = imageCropFrame;
}

- (CGRect)imageCropFrame {
    return self.cropView.imageCropFrame;
}

- (BOOL)verticalLayout {
    return CGRectGetWidth(self.view.bounds) < CGRectGetHeight(self.view.bounds);
}

- (BOOL)overrideStatusBar {
    if (self.navigationController) { return NO; }

    if (self.presentingViewController.prefersStatusBarHidden) { return NO; }

    return YES;
}

- (BOOL)statusBarHidden {
    if (self.navigationController) { return self.navigationController.prefersStatusBarHidden; }

    if (self.presentingViewController.prefersStatusBarHidden) { return YES; }

    return YES;
}

- (CGFloat)statusBarHeight {
    if (self.statusBarHidden) { return 0.0f; }

    CGFloat statusBarHeight = 0.0f;
    if (@available(iOS 11.0, *)) {
        statusBarHeight = self.view.safeAreaInsets.top;
    } else {
        statusBarHeight = self.topLayoutGuide.length;
    }

    return statusBarHeight;
}

- (UIEdgeInsets)statusBarSafeInsets {
    UIEdgeInsets insets = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *)) {
        insets = self.view.safeAreaInsets;

        if (insets.top <= 40.0f + FLT_EPSILON) { insets.top = self.statusBarHeight; }
    } else {
        insets.top = self.statusBarHeight;
    }

    return insets;
}

@end
/*
#pragma mark - Presentation Handling -
- (void)presentAnimatedFromParentViewController:(UIViewController *)viewController
fromView:(UIView *)fromView
fromFrame:(CGRect)fromFrame
setup:(void (^)(void))setup
completion:(void (^)(void))completion
{
    [self presentAnimatedFromParentViewController:viewController fromImage:nil fromView:fromView
fromFrame:fromFrame
                                            angle:0 toImageFrame:CGRectZero setup:setup
completion:nil];
}

- (void)presentAnimatedFromParentViewController:(UIViewController *)viewController
fromImage:(UIImage *)image
fromView:(UIView *)fromView
fromFrame:(CGRect)fromFrame
angle:(NSInteger)angle
toImageFrame:(CGRect)toFrame
setup:(void (^)(void))setup
completion:(void (^)(void))completion
{
    self.transitionController.image     = image ? image : self.image;
    self.transitionController.fromFrame = fromFrame;
    self.transitionController.fromView  = fromView;
    self.prepareForTransitionHandler    = setup;

    if (self.angle != 0 || !CGRectIsEmpty(toFrame)) {
        self.angle = angle;
        self.imageCropFrame = toFrame;
    }

    __weak typeof (self) weakSelf = self;
    [viewController presentViewController:self.parentViewController ? self.parentViewController :
self
                                 animated:YES
                               completion:^
     {
         typeof (self) strongSelf = weakSelf;
         if (completion) {
             completion();
         }

         [strongSelf.cropView setCroppingViewsHidden:NO animated:YES];
         if (!CGRectIsEmpty(fromFrame)) {
             [strongSelf.cropView setGridOverlayHidden:NO animated:YES];
         }
     }];
}

- (void)dismissAnimatedFromParentViewController:(UIViewController *)viewController
toView:(UIView *)toView
toFrame:(CGRect)frame
setup:(void (^)(void))setup
completion:(void (^)(void))completion
{
    [self dismissAnimatedFromParentViewController:viewController withCroppedImage:nil toView:toView
toFrame:frame setup:setup completion:completion];
}

- (void)dismissAnimatedFromParentViewController:(UIViewController *)viewController
withCroppedImage:(UIImage *)image
toView:(UIView *)toView
toFrame:(CGRect)frame
setup:(void (^)(void))setup
completion:(void (^)(void))completion
{
    if (image) {
        self.transitionController.image     = image ? image : self.image;
        self.transitionController.fromFrame = [self.cropView convertRect:self.cropView.cropBoxFrame
toView:self.view];
    }
    else {
        self.transitionController.image     = self.image;
        self.transitionController.fromFrame = [self.cropView
convertRect:self.cropView.imageViewFrame toView:self.view];
    }

    self.transitionController.toView    = toView;
    self.transitionController.toFrame   = frame;
    self.prepareForTransitionHandler    = setup;

    [viewController dismissViewControllerAnimated:YES completion:^ {
        if (completion) { completion(); }
    }];
}
*/
