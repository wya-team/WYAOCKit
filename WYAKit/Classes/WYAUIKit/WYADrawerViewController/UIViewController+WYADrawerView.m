//
//  UIViewController+WYADrawerView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/16.
//

#import "UIViewController+WYADrawerView.h"
#import "WYAInteractiveTransition.h"
#import "WYADrawerTransition.h"
#import <objc/runtime.h>


@implementation UIViewController (WYADrawerView)

// 显示默认抽屉
- (void)wya_showDefaultDrawerViewController:(UIViewController *)viewController {
    [self wya_showDrawerViewController:viewController animationType:WYADrawerAnimationTypeDefault configuration:nil];
}

// 显示抽屉
- (void)wya_showDrawerViewController:(UIViewController *)viewController animationType:(WYADrawerAnimationType)animationType configuration:(WYALateralSlideConfiguration *)configuration {
    
    if (viewController == nil) return;
    if (configuration == nil)
        configuration = [WYALateralSlideConfiguration defaultConfiguration];
    
    WYALateralSlideAnimator *animator = objc_getAssociatedObject(self, &WYALateralSlideAnimatorKey);
    
    if (animator == nil) {
        animator = [WYALateralSlideAnimator lateralSlideAnimatorWithConfiguration:configuration];
        objc_setAssociatedObject(viewController, &WYALateralSlideAnimatorKey, animator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    viewController.transitioningDelegate = animator;
    objc_setAssociatedObject(viewController, &WYALateralSlideDirectionKey, @(configuration.direction), OBJC_ASSOCIATION_ASSIGN);

    WYAInteractiveTransition *interactiveHidden = [WYAInteractiveTransition interactiveWithTransitiontype:WYADrawerTransitiontypeHidden];
    [interactiveHidden setValue:viewController forKey:@"weakVC"];
    [interactiveHidden setValue:@(configuration.direction) forKey:@"direction"];
    
    [animator setValue:interactiveHidden forKey:@"interactiveHidden"];
    animator.configuration = configuration;
    animator.animationType = animationType;

    [self presentViewController:viewController animated:YES completion:nil];
    
}

// 注册抽屉手势
- (void)wya_registerShowIntractiveWithEdgeGesture:(BOOL)openEdgeGesture transitionDirectionAutoBlock:(void(^)(WYADrawerTransitionDirection direction))transitionDirectionAutoBlock {
    
    WYALateralSlideAnimator *animator = [WYALateralSlideAnimator lateralSlideAnimatorWithConfiguration:nil];
    self.transitioningDelegate = animator;
    
    objc_setAssociatedObject(self, &WYALateralSlideAnimatorKey, animator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    WYAInteractiveTransition *interactiveShow = [WYAInteractiveTransition interactiveWithTransitiontype:WYADrawerTransitiontypeShow];
    [interactiveShow addPanGestureForViewController:self];
    [interactiveShow setValue:@(openEdgeGesture) forKey:@"openEdgeGesture"];
    [interactiveShow setValue:transitionDirectionAutoBlock forKey:@"transitionDirectionAutoBlock"];
    [interactiveShow setValue:@(WYADrawerTransitionFromLeft) forKey:@"direction"];
    
    [animator setValue:interactiveShow forKey:@"interactiveShow"];
}

// 抽屉内push界面
- (void)wya_pushViewController:(UIViewController *)viewController{
    [self wya_pushViewController:viewController drewerHiddenDuration:0];
}

- (void)wya_pushViewController:(UIViewController *)vc drewerHiddenDuration:(NSTimeInterval)duration {
    
    WYALateralSlideAnimator *animator = (WYALateralSlideAnimator *)self.transitioningDelegate;
    animator.configuration.HiddenAnimDuration = duration > 0 ? duration : animator.configuration.HiddenAnimDuration;
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UINavigationController *nav;
    NSString *TransitionType = kCATransitionPush;
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabbar = (UITabBarController *)rootVC;
        NSInteger index = tabbar.selectedIndex;
        nav = tabbar.childViewControllers[index];
    }else if ([rootVC isKindOfClass:[UINavigationController class]]) {
        if (animator.animationType == WYADrawerAnimationTypeDefault) TransitionType = kCATransitionFade;
        nav = (UINavigationController *)rootVC;
    }else  {
        NSLog(@"This no UINavigationController...");
        return;
    }
    
    NSNumber *direction = objc_getAssociatedObject(self, &WYALateralSlideDirectionKey);
    NSString *subType = direction.integerValue ? kCATransitionFromLeft : kCATransitionFromRight;
    CATransition *transition = [CATransition animation];
    transition.duration = 0.20f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    transition.type = TransitionType;
    transition.subtype = subType;
    [nav.view.layer addAnimation:transition forKey:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [nav pushViewController:vc animated:NO];
}


// 抽屉内present页面
- (void)wya_presentViewController:(UIViewController *)viewController {
    [self wya_presentViewController:viewController drewerHidden:NO];
}

- (void)wya_presentViewController:(UIViewController *)vc drewerHidden:(BOOL)hidden {
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    vc.view.frame = CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight);
    vc.view.tag = 5201314;
    [keyWindow addSubview:vc.view];
    [UIView animateWithDuration:0.25 animations:^{
        vc.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    } completion:^(BOOL finished) {
        // 强引用，不然会被释放
        [rootVC addChildViewController:vc];
        if (hidden) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}

- (void)wya_dismissViewController {
    if (self.view.tag != 5201314 && self.parentViewController.view.tag != 5201314) {
        NSLog(@"只有通过wya_presentViewController显示的控制器才能调用此方法...");
        return;
    }
    
    UIViewController *weakSelf = self;
    if (self.parentViewController.view.tag == 5201314) {
        weakSelf = self.parentViewController;
    }
    weakSelf.edgesForExtendedLayout = UIRectEdgeNone;
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.view.frame = CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight);
    } completion:^(BOOL finished) {
        [weakSelf.view removeFromSuperview];
        [weakSelf removeFromParentViewController];
    }];
    
}


@end
