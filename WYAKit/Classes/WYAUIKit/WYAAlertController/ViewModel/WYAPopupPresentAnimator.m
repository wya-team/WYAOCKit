//
//  ASPopupPresentAnimator.m
//  ASPopupControllerDemo
//
//  Created by wya on 16/11/3.
//  Copyright © 2016年 code. All rights reserved.
//

#import "WYAPopupPresentAnimator.h"
#import "WYAAlertController.h"

@implementation WYAPopupPresentAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    switch (self.presentStyle) {
        case WYAPopupPresentStyleSystem:
            return 0.3;
        case WYAPopupPresentStyleFadeIn:
            return 0.2;
        case WYAPopupPresentStyleBounce:
            return 0.3;
        case WYAPopupPresentStyleExpandHorizontal:
            return 0.3;
        case WYAPopupPresentStyleExpandVertical:
            return 0.3;
        case WYAPopupPresentStyleSlideDown:
            return 0.5;
        case WYAPopupPresentStyleSlideUp:
            return 0.3;
        case WYAPopupPresentStyleSlideLeft:
            return 0.4;
        case WYAPopupPresentStyleSlideRight:
            return 0.4;
    }
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    [self animateWithStyle:self.presentStyle context:transitionContext];
}

- (void)animateWithStyle:(WYAPopupPresentStyle)style context:(id<UIViewControllerContextTransitioning>)transitionContext
{
    switch (style) {
        case WYAPopupPresentStyleSystem:
            [self systemAnimationWithContext:transitionContext];
            break;
        case WYAPopupPresentStyleFadeIn:
            [self fadeInAnimationWithContext:transitionContext];
            break;
        case WYAPopupPresentStyleBounce:
            [self bounceAnimationWithContext:transitionContext];
            break;
        case WYAPopupPresentStyleExpandHorizontal:
            [self expandHorizontalAnimationWithContext:transitionContext];
            break;
        case WYAPopupPresentStyleExpandVertical:
            [self expandVerticalAnimationWithContext:transitionContext];
            break;
        case WYAPopupPresentStyleSlideDown:
            [self slideDownAnimationWithContext:transitionContext];
            break;
        case WYAPopupPresentStyleSlideUp:
            [self slideUpAnimationWithContext:transitionContext];
            break;
        case WYAPopupPresentStyleSlideLeft:
            [self slideLeftAnimationWithContext:transitionContext];
            break;
        case WYAPopupPresentStyleSlideRight:
            [self slideRightAnimationWithContext:transitionContext];
            break;
    }
}

- (void)systemAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    WYAAlertController * toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundButton.alpha = 0;
    toVC.alertView.alpha        = 0;
    //    toVC.alertView.transform = CGAffineTransformMakeScale(1.3, 1.3);

    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                        animations:^{
                            toVC.backgroundButton.alpha = as_backgroundAlpha;
                            toVC.alertView.alpha        = 1;
                            //                         toVC.alertView.transform = CGAffineTransformIdentity;
                        }
                        completion:^(BOOL finished) {
                            [transitionContext completeTransition:YES];
                        }];
}

- (void)fadeInAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.alpha         = 0;

    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                        animations:^{
                            toVC.view.alpha = 1;
                        }
                        completion:^(BOOL finished) {
                            [transitionContext completeTransition:YES];
                        }];
}

- (void)bounceAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    WYAAlertController * toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundButton.alpha = 0;
    toVC.alertView.alpha        = 1;
    toVC.alertView.transform    = CGAffineTransformMakeScale(0.3, 0.3);

    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:1 initialSpringVelocity:50 options:UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionCurveEaseIn animations:^{
        toVC.backgroundButton.alpha = as_backgroundAlpha;
        toVC.alertView.alpha        = 1;
        toVC.alertView.transform    = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {

        [transitionContext completeTransition:YES];
    }];
}

- (void)expandHorizontalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    WYAAlertController * toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundButton.alpha = 0;
    toVC.alertView.alpha        = 0;
    toVC.alertView.transform    = CGAffineTransformMakeScale(0, 1);

    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                        animations:^{
                            toVC.backgroundButton.alpha = as_backgroundAlpha;
                            toVC.alertView.alpha        = 1;
                            toVC.alertView.transform    = CGAffineTransformIdentity;
                        }
                        completion:^(BOOL finished) {
                            [transitionContext completeTransition:YES];
                        }];
}

- (void)expandVerticalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    WYAAlertController * toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundButton.alpha = 0;
    toVC.alertView.alpha        = 0;
    toVC.alertView.transform    = CGAffineTransformMakeScale(1, 0);

    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                        animations:^{
                            toVC.backgroundButton.alpha = as_backgroundAlpha;
                            toVC.alertView.alpha        = 1;
                            toVC.alertView.transform    = CGAffineTransformIdentity;
                        }
                        completion:^(BOOL finished) {
                            [transitionContext completeTransition:YES];
                        }];
}

- (void)slideDownAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    WYAAlertController * toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundButton.alpha = 0;
    toVC.alertView.center       = CGPointMake(toVC.view.center.x, -toVC.alertView.frame.size.height / 2.0);

    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                        animations:^{
                            toVC.backgroundButton.alpha = as_backgroundAlpha;
                            toVC.alertView.center       = toVC.view.center;
                        }
                        completion:^(BOOL finished) {
                            [transitionContext completeTransition:YES];
                        }];
}

- (void)slideUpAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    WYAAlertController * toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundButton.alpha = 0;
    if (toVC.alertStyle == WYAAlertStyleDefalut) {
        toVC.alertView.center = CGPointMake(toVC.view.center.x, toVC.view.frame.size.height + toVC.alertView.frame.size.height / 2.0);

        UIView * containerView = [transitionContext containerView];
        [containerView addSubview:toVC.view];

        NSTimeInterval duration = [self transitionDuration:transitionContext];
        [UIView animateWithDuration:duration
                            animations:^{
                                toVC.backgroundButton.alpha = as_backgroundAlpha;
                                toVC.alertView.center       = toVC.view.center;
                            }
                            completion:^(BOOL finished) {
                                [transitionContext completeTransition:YES];
                            }];
    } else if (toVC.alertStyle == WYAAlertStyleSheet || toVC.alertStyle == WYAAlertStyleCustomSheet) {
        toVC.alertView.frame   = CGRectMake((toVC.view.cmam_width - toVC.alertView.cmam_width) / 2, ScreenHeight, toVC.alertView.cmam_width, toVC.alertView.cmam_height);
        UIView * containerView = [transitionContext containerView];
        [containerView addSubview:toVC.view];

        NSTimeInterval duration = [self transitionDuration:transitionContext];
        [UIView animateWithDuration:duration
                            animations:^{
                                toVC.backgroundButton.alpha = as_backgroundAlpha;
                                toVC.alertView.frame        = CGRectMake((toVC.view.cmam_width - toVC.alertView.cmam_width) / 2, ScreenHeight - toVC.alertView.cmam_height, toVC.alertView.cmam_width, toVC.alertView.cmam_height);
                            }
                            completion:^(BOOL finished) {
                                [transitionContext completeTransition:YES];
                            }];
    }
}

- (void)slideLeftAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    WYAAlertController * toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundButton.alpha = 0;
    toVC.alertView.center       = CGPointMake(toVC.view.frame.size.width + toVC.alertView.frame.size.width / 2.0, toVC.view.center.y);

    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                        animations:^{
                            toVC.backgroundButton.alpha = as_backgroundAlpha;
                            toVC.alertView.center       = toVC.view.center;
                        }
                        completion:^(BOOL finished) {
                            [transitionContext completeTransition:YES];
                        }];
}

- (void)slideRightAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    WYAAlertController * toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundButton.alpha = 0;
    toVC.alertView.center       = CGPointMake(-toVC.alertView.frame.size.width / 2.0, toVC.view.center.y);

    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                        animations:^{
                            toVC.backgroundButton.alpha = as_backgroundAlpha;
                            toVC.alertView.center       = toVC.view.center;
                        }
                        completion:^(BOOL finished) {
                            [transitionContext completeTransition:YES];
                        }];
}

@end
