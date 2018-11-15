
#import "WYAAlertController.h"
#import "WYAAlertView.h"
#import "WYAAlertSheetView.h"
// Present
#import "WYAPopupPresentAnimator.h"

// Dismiss
#import "WYAPopupDismissAnimator.h"
#import "WYAInteractive.h"


@interface WYAAlertController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) WYAInteractive * interactive;
@end

@implementation WYAAlertController

- (instancetype)init {
    if (self = [super init]) {
        
        self.transitioningDelegate = self;                          // 设置自己为转场代理
        self.modalPresentationStyle = UIModalPresentationCustom;    // 自定义转场模式

        // 灰色半透明背景
        _backgroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backgroundButton.translatesAutoresizingMaskIntoConstraints = NO;
        _backgroundButton.backgroundColor = [UIColor blackColor];
        _backgroundButton.alpha = as_backgroundAlpha;
        [_backgroundButton addTarget:self action:@selector(dismissBackgroundView:) forControlEvents:UIControlEventTouchUpInside];

//        self.interactive = [[WYAInteractive alloc]init];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 背景透明
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_backgroundButton];
    
    [self.view addSubview:_alertView];
    
    // 设置灰色半透明背景的约束
    [NSLayoutConstraint constraintWithItem:_backgroundButton
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_backgroundButton
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:0.0].active = YES;

    [NSLayoutConstraint constraintWithItem:_backgroundButton
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:0.0].active = YES;

    [NSLayoutConstraint constraintWithItem:_backgroundButton
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0.0].active = YES;

    
    
    if (self.alertStyle == WYAAlertStyleSheet || self.alertStyle == WYAAlertStyleCustom) {
        // 设置 alertView 在屏幕底部
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                      constant:-WYABottomHeight].active = YES;
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                      constant:0.0].active = YES;
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:0.0].active = YES;
    }else{
        // 设置 alertView 在屏幕中心
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1.0
                                      constant:0.0].active = YES;
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0
                                      constant:0.0].active = YES;
    }
    
    if (![_alertView isKindOfClass:[WYAAlertView class]] && ![_alertView isKindOfClass:[WYAAlertSheetView class]]) {
        
        //使用Auto Layout约束，禁止将Autoresizing Mask转换为约束
        [_alertView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0 constant:_alertView.bounds.size.width].active = YES;
        
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0 constant:_alertView.bounds.size.height].active = YES;
    }else{
        if ([_alertView isKindOfClass:[WYAAlertSheetView class]]) {
            [_alertView setTranslatesAutoresizingMaskIntoConstraints:NO];
        }
    }
//    [self.interactive wireToViewController:self];
}

/** 添加 action */
- (void)wya_AddAction:(WYAAlertAction * _Nonnull)action {
    if ([_alertView isMemberOfClass:[WYAAlertView class]]) {
        [(WYAAlertView *)_alertView wya_AddAction: action];
    }else if ([_alertView isMemberOfClass:[WYAAlertSheetView class]]) {
        [(WYAAlertSheetView *)_alertView wya_AddAction: action];
    }
}

/** 直接添加一个数组的 action */
- (void)wya_AddActions:(NSArray<WYAAlertAction *> * _Nonnull)actions {
    for (WYAAlertAction *action in actions) {
        [self wya_AddAction:action];
    }
}

#pragma mark - 类方法返回实例

/** 默认转场初始化 */
+ (_Nonnull instancetype)wya_AlertWithTitle:(NSString * _Nullable)title
                                    Message:(NSString * _Nullable)message
                                 AlertStyle:(WYAAlertStyle)alertStyle
{
    WYAAlertController *alertController = [[WYAAlertController alloc] init];
    alertController.presentStyle = WYAPopupPresentStyleSystem;
    alertController.dismissStyle = WYAPopupDismissStyleFadeOut;
    alertController.alertStyle = alertStyle;
    alertController.alertView = [[WYAAlertView alloc] initWithTitle:title message:message];
    ((WYAAlertView *)(alertController.alertView)).controller = alertController;
    return alertController;
}

/** 标准初始化方法 */
+ (_Nonnull instancetype)wya_AlertWithTitle:(NSString * _Nullable)title
                                    Message:(NSString * _Nullable)message
                               PresentStyle:(WYAPopupPresentStyle)presentStyle
                               DismissStyle:(WYAPopupDismissStyle)dismissStyle
                                 AlertStyle:(WYAAlertStyle)alertStyle
{
    
    WYAAlertController *alertController = [[WYAAlertController alloc] init];
    alertController.presentStyle = presentStyle;
    alertController.dismissStyle = dismissStyle;
    alertController.alertStyle = alertStyle;
    alertController.alertView = [[WYAAlertView alloc] initWithTitle:title message:message];
    ((WYAAlertView *)(alertController.alertView)).controller = alertController;
    return alertController;
}

+ (_Nonnull instancetype)wya_AlertSheetWithTitle:(NSString * _Nullable)title
                                         Message:(NSString * _Nullable)message
                                      AlertStyle:(WYAAlertStyle)alertStyle
{
    WYAAlertController *alertController = [[WYAAlertController alloc] init];
    alertController.presentStyle = WYAPopupPresentStyleSlideUp;
    alertController.dismissStyle = WYAPopupDismissStyleSlideDown;
    alertController.alertStyle = alertStyle;
    alertController.alertView = [[WYAAlertSheetView alloc] initWithTitle:title message:message];
    ((WYAAlertSheetView *)(alertController.alertView)).controller = alertController;
    return alertController;
}

+ (_Nonnull instancetype)wya_AlertWithCustomView:(UIView *)view
                                      AlertStyle:(WYAAlertStyle)alertStyle
{
    WYAAlertController *alertController = [[WYAAlertController alloc] init];
    alertController.presentStyle = WYAPopupPresentStyleSlideUp;
    alertController.dismissStyle = WYAPopupDismissStyleSlideDown;
    alertController.alertStyle = alertStyle;
    alertController.alertView = view;
    return alertController;
}

#pragma mark - UIViewControllerTransitioningDelegate

/** 返回Present动画 */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    WYAPopupPresentAnimator *animator = [[WYAPopupPresentAnimator alloc] init];
    animator.presentStyle = self.presentStyle;
    return animator;
}

/** 返回Dismiss动画 */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    WYAPopupDismissAnimator *animator = [[WYAPopupDismissAnimator alloc] init];
    animator.dismissStyle = self.dismissStyle;
    return animator;
}

//返回一个管理pop动画过渡的对象
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    return self.interactive.interacting ? self.interactive : nil;
}

-(void)dismissBackgroundView:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
