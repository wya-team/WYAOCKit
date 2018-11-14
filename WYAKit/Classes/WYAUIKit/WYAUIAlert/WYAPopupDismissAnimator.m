//
//  ASPopupDismissAnimator.m
//  ASPopupControllerDemo
//
//  Created by wya on 16/11/3.
//  Copyright © 2016年 code. All rights reserved.
//

#import "WYAPopupDismissAnimator.h"
#import "WYAPopupController.h"

@implementation WYAPopupDismissAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.dismissStyle) {
        case WYAPopupDismissStyleFadeOut:
            return 0.15;
        case WYAPopupDismissStyleContractHorizontal:
            return 0.2;
        case WYAPopupDismissStyleContractVertical:
            return 0.2;
        case WYAPopupDismissStyleSlideDown:
            return 0.25;
        case WYAPopupDismissStyleSlideUp:
            return 0.25;
        case WYAPopupDismissStyleSlideLeft:
            return 0.2;
        case WYAPopupDismissStyleSlideRight:
            return 0.2;
    }
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self animateWithStyle:self.dismissStyle context:transitionContext];
}

- (void)animateWithStyle:(WYAPopupDismissStyle)style context:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.dismissStyle) {
        case WYAPopupDismissStyleFadeOut:
            [self fadeOutAnimationWithContext:transitionContext];
            break;
        case WYAPopupDismissStyleContractHorizontal:
            [self contractHorizontalAnimationWithContext:transitionContext];
            break;
        case WYAPopupDismissStyleContractVertical:
            [self contractVerticalAnimationWithContext:transitionContext];
            break;
        case WYAPopupDismissStyleSlideDown:
            [self slideDownAnimationWithContext:transitionContext];
            break;
        case WYAPopupDismissStyleSlideUp:
            [self slideUpAnimationWithContext:transitionContext];
            break;
        case WYAPopupDismissStyleSlideLeft:
            [self slideLeftAnimationWithContext:transitionContext];
            break;
        case WYAPopupDismissStyleSlideRight:
            [self slideRightAnimationWithContext:transitionContext];
            break;
    }
}

- (void)fadeOutAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)contractHorizontalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    WYAPopupController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundButton.alpha = 0;
                         fromVC.alertView.transform = CGAffineTransformMakeScale(0.001, 1);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)contractVerticalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    WYAPopupController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundButton.alpha = 0;
                         fromVC.alertView.transform = CGAffineTransformMakeScale(1, 0.01);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideDownAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    WYAPopupController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundButton.alpha = 0;
                         fromVC.alertView.center = CGPointMake(fromVC.view.center.x, fromVC.view.frame.size.height + fromVC.alertView.frame.size.height/2.0);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideUpAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    WYAPopupController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundButton.alpha = 0;
                         fromVC.alertView.center = CGPointMake(fromVC.view.center.x, -fromVC.alertView.frame.size.height/2.0);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideLeftAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    WYAPopupController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundButton.alpha = 0;
                         fromVC.alertView.center = CGPointMake(-fromVC.alertView.frame.size.width/2.0, fromVC.view.center.y);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideRightAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    WYAPopupController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundButton.alpha = 0;
                         fromVC.alertView.center = CGPointMake(fromVC.view.frame.size.width + fromVC.alertView.frame.size.width/2.0, fromVC.view.center.y);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

@end
