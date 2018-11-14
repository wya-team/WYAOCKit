//
//  ASPopupController.m
//  ASPopupController
//
//  Created by wya on 16/3/26.
//  Copyright © 2016年 code. All rights reserved.
//

#import "WYAPopupController.h"
#import "WYAPopupView.h"

// Present
#import "WYAPopupPresentAnimator.h"

// Dismiss
#import "WYAPopupDismissAnimator.h"


@interface WYAPopupController ()<UIViewControllerTransitioningDelegate>

@end

@implementation WYAPopupController

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

    
    
    if (self.popStyle == WYAPopBottom) {
        // 设置 alertView 在屏幕底部
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                      constant:0.0].active = YES;
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
    
    if (![_alertView isKindOfClass:[WYAPopupView class]]) {
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
    }
    
}

/** 添加 action */
- (void)addAction:(WYAPopupAction * _Nonnull)action {
    if ([_alertView isMemberOfClass:[WYAPopupView class]]) {
        [(WYAPopupView *)_alertView addAction: action];
    }
}

/** 直接添加一个数组的 action */
- (void)addActions:(NSArray<WYAPopupAction *> * _Nonnull)actions {
    for (WYAPopupAction *action in actions) {
        [self addAction:action];
    }
}

/** 设置 alertView 的圆角半径 */
- (void)setAlertViewCornerRadius:(CGFloat)cornerRadius {
    _alertView.layer.cornerRadius = cornerRadius;
}

#pragma mark - 类方法返回实例

/** 标准初始化方法 */
+ (_Nonnull instancetype)alertWithTitle:(NSString * _Nullable)title
                                message:(NSString * _Nullable)message
                           presentStyle:(WYAPopupPresentStyle)presentStyle
                           dismissStyle:(WYAPopupDismissStyle)dismissStyle {
    
    WYAPopupController *alertController = [[WYAPopupController alloc] init];
    alertController.presentStyle = presentStyle;
    alertController.dismissStyle = dismissStyle;
    alertController.alertView = [[WYAPopupView alloc] initWithTitle:title message:message];
    ((WYAPopupView *)(alertController.alertView)).controller = alertController;
    return alertController;
}

/** 默认转场初始化 */
+ (_Nonnull instancetype)alertWithTitle:(NSString * _Nullable)title
                                message:(NSString * _Nullable)message {
    
    WYAPopupController *alertController = [[WYAPopupController alloc] init];
    alertController.presentStyle = WYAPopupPresentStyleSystem;
    alertController.dismissStyle = WYAPopupDismissStyleFadeOut;
    alertController.alertView = [[WYAPopupView alloc] initWithTitle:title message:message];
    ((WYAPopupView *)(alertController.alertView)).controller = alertController;
    return alertController;
}

+ (_Nonnull instancetype)alertWithCustomView:(UIView *)view PopStyle:(WYAPopStyle)style{
    WYAPopupController *alertController = [[WYAPopupController alloc] init];
    alertController.presentStyle = WYAPopupPresentStyleSystem;
    alertController.dismissStyle = WYAPopupDismissStyleFadeOut;
    alertController.popStyle = style;
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



-(void)dismissBackgroundView:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
