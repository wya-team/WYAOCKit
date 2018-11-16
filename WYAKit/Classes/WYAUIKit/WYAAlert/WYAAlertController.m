
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
@property (nonatomic, strong) UIView * bottomView;
@end

@implementation WYAAlertController

- (instancetype)init {
    if (self = [super init]) {
        
        self.transitioningDelegate = self;                          // 设置自己为转场代理
        self.modalPresentationStyle = UIModalPresentationCustom;    // 自定义转场模式

        // 灰色半透明背景
        self.backgroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.backgroundButton.backgroundColor = [UIColor blackColor];
        self.backgroundButton.alpha = as_backgroundAlpha;
        [self.backgroundButton addTarget:self action:@selector(dismissBackgroundView:) forControlEvents:UIControlEventTouchUpInside];

//        self.interactive = [[WYAInteractive alloc]init];
        
        self.bottomView = [[UIView alloc]init];
        self.bottomView.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

#pragma mark - 类方法返回实例
/** 默认转场初始化 */
+ (_Nonnull instancetype)wya_AlertWithTitle:(NSString * _Nullable)title
                                    Message:(NSString * _Nullable)message
                           AlertLayoutStyle:(WYAAlertLayoutStyle)layoutStyle
{
    WYAAlertController *alertController = [[WYAAlertController alloc] init];
    alertController.alertStyle = WYAAlertStyleDefalut;
    alertController.alertView = [[WYAAlertView alloc] initWithTitle:title message:message];
    ((WYAAlertView *)(alertController.alertView)).controller = alertController;
    ((WYAAlertView *)(alertController.alertView)).layoutStyle = layoutStyle;
    alertController.presentStyle = WYAPopupPresentStyleSystem;
    alertController.dismissStyle = WYAPopupDismissStyleFadeOut;
    return alertController;
}

///** 标准初始化方法 */
//+ (_Nonnull instancetype)wya_AlertWithTitle:(NSString * _Nullable)title
//                                    Message:(NSString * _Nullable)message
//                               PresentStyle:(WYAPopupPresentStyle)presentStyle
//                               DismissStyle:(WYAPopupDismissStyle)dismissStyle
//                                 AlertStyle:(WYAAlertStyle)alertStyle
//{
//
//    WYAAlertController *alertController = [[WYAAlertController alloc] init];
//    alertController.presentStyle = presentStyle;
//    alertController.dismissStyle = dismissStyle;
//    alertController.alertStyle = alertStyle;
//    alertController.alertView = [[WYAAlertView alloc] initWithTitle:title message:message];
//    ((WYAAlertView *)(alertController.alertView)).controller = alertController;
//    return alertController;
//}

+ (_Nonnull instancetype)wya_AlertSheetWithTitle:(NSString * _Nullable)title
                                         Message:(NSString * _Nullable)message
{
    WYAAlertController *alertController = [[WYAAlertController alloc] init];
    alertController.alertStyle = WYAAlertStyleSheet;
    alertController.alertView = [[WYAAlertSheetView alloc] initWithTitle:title message:message];
    ((WYAAlertSheetView *)(alertController.alertView)).controller = alertController;
    alertController.presentStyle = WYAPopupPresentStyleSlideUp;
    alertController.dismissStyle = WYAPopupDismissStyleSlideDown;
    return alertController;
}

+ (_Nonnull instancetype)wya_AlertWithCustomView:(UIView *)view
                                      AlertStyle:(WYAAlertStyle)alertStyle
{
    WYAAlertController *alertController = [[WYAAlertController alloc] init];
    alertController.alertStyle = alertStyle;
    alertController.alertView = view;
    
    if (alertStyle == WYAAlertStyleCustomAlert) {
        alertController.presentStyle = WYAPopupPresentStyleSystem;
        alertController.dismissStyle = WYAPopupDismissStyleFadeOut;
    }else if (alertStyle == WYAAlertStyleCustomSheet) {
        alertController.presentStyle = WYAPopupPresentStyleSlideUp;
        alertController.dismissStyle = WYAPopupDismissStyleSlideDown;
    }
    return alertController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 背景透明
    
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.backgroundButton];
    [self.backgroundButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(WYABottomHeight);
    }];
    
    [self.view addSubview:self.alertView];
    
    
    if (self.alertStyle == WYAAlertStyleSheet || self.alertStyle == WYAAlertStyleCustomSheet) {
        // 设置 alertView 在屏幕底部
        [self.alertView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(-WYABottomHeight);
            if ([self.alertView isMemberOfClass:[WYAAlertSheetView class]]) {
                make.height.mas_equalTo(((WYAAlertSheetView *)self.alertView).height);
            }else{
                make.height.mas_equalTo(self.alertView.wya_height);
            }
            
        }];
    }else{
        [self.alertView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view.mas_centerX);
            make.centerY.mas_equalTo(self.view.mas_centerY);
            if ([self.alertView isMemberOfClass:[WYAAlertView class]]) {
                make.size.mas_equalTo(CGSizeMake(((WYAAlertView *)self.alertView).width, ((WYAAlertView *)self.alertView).height));
            }else{
                make.size.mas_equalTo(CGSizeMake(self.alertView.wya_width, self.alertView.wya_height));
            }
            
        }];
    }
    
//    [self.interactive wireToViewController:self];
}

#pragma mark --- Method
/** 添加 action */
- (void)wya_AddAction:(WYAAlertAction * _Nonnull)action {
    if ([self.alertView isMemberOfClass:[WYAAlertView class]]) {
        [(WYAAlertView *)self.alertView wya_AddAction: action];
    }else if ([self.alertView isMemberOfClass:[WYAAlertSheetView class]]) {
        [(WYAAlertSheetView *)self.alertView wya_AddAction: action];
    }
}

/** 直接添加一个数组的 action */
- (void)wya_AddActions:(NSArray<WYAAlertAction *> * _Nonnull)actions {
    for (WYAAlertAction *action in actions) {
        [self wya_AddAction:action];
    }
}

-(void)wya_AddTextField:(UITextField *)textField{
    if ([self.alertView isMemberOfClass:[WYAAlertView class]]) {
        [(WYAAlertView *)self.alertView wya_AddTextField:textField];
    }
}

-(void)dismissBackgroundView:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
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


#pragma mark --- Setter
-(void)setPresentStyle:(WYAPopupPresentStyle)presentStyle{
    _presentStyle = presentStyle;
}

- (void)setDismissStyle:(WYAPopupDismissStyle)dismissStyle{
    _dismissStyle = dismissStyle;
}

@end
