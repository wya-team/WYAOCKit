//
//  ASPopupDismissAnimator.m
//  ASPopupControllerDemo
//
//  Created by wya on 16/11/3.
//  Copyright © 2016年 code. All rights reserved.
//

#import "WYAPopupDismissAnimator.h"
#import "WYAAlertController.h"

@implementation WYAPopupDismissAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.dismissStyle) {
        case WYAPopupDismissStyleFadeOut:
            return 0.15;
        case WYAPopupDismissStyleShrink:
            return 0.3;
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
        case WYAPopupDismissStyleShrink:
            [self shrinkAnimationWithContext:transitionContext];
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

- (void)shrinkAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    WYAAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    fromVC.backgroundButton.alpha = as_backgroundAlpha;
    fromVC.alertView.alpha = 1;
    fromVC.alertView.transform = CGAffineTransformMakeScale(1, 1);
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.95 initialSpringVelocity:50 options:UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionCurveEaseOut animations:^{
        fromVC.backgroundButton.alpha = 0;
        fromVC.alertView.alpha = 0;
//        fromVC.alertView.transform = CGAffineTransformMakeRotation(M_PI);
        fromVC.alertView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)contractHorizontalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    WYAAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
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
    WYAAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
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
    WYAAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
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
    WYAAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    if (fromVC.alertStyle == WYAAlertStyleDefalut) {
        NSTimeInterval duration = [self transitionDuration:transitionContext];
        [UIView animateWithDuration:duration
                         animations:^{
                             fromVC.backgroundButton.alpha = 0;
                             fromVC.alertView.center = CGPointMake(fromVC.view.center.x, -fromVC.alertView.frame.size.height/2.0);
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
        
    }else if (fromVC.alertStyle == WYAAlertStyleSheet || fromVC.alertStyle == WYAAlertStyleCustomSheet) {
        NSTimeInterval duration = [self transitionDuration:transitionContext];
        [UIView animateWithDuration:duration
                         animations:^{
                             fromVC.backgroundButton.alpha = as_backgroundAlpha;
                             fromVC.alertView.frame = CGRectMake((fromVC.view.cmam_width-fromVC.alertView.cmam_width)/2, ScreenHeight, fromVC.alertView.cmam_width, fromVC.alertView.cmam_height);
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    }
}

- (void)slideLeftAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    WYAAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
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
    WYAAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
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
