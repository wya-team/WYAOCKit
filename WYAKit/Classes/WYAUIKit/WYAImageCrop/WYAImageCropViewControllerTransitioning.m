//
//  WYAImageCropViewControllerTransitioning.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/3.
//

#import "WYAImageCropViewControllerTransitioning.h"

@implementation WYAImageCropViewControllerTransitioning
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.45f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView * containerView = [transitionContext containerView];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController * cropViewController = (self.dismiss == NO) ? toViewController : fromViewController;
    UIViewController * presentViewController = (self.dismiss == NO) ? fromViewController : toViewController;
    
    cropViewController.view.frame = containerView.bounds;
    if (self.dismiss) {
        presentViewController.view.frame = containerView.bounds;
    }
    
    if (self.dismiss == NO) {
        [containerView addSubview:cropViewController.view];
        [cropViewController viewDidLayoutSubviews];
    }else{
        [containerView insertSubview:presentViewController.view belowSubview:cropViewController.view];
    }
    
    if (self.dismiss == NO && self.fromView) {
        // present
        self.fromFrame = [self.fromView.superview convertRect:self.fromView.frame toView:containerView];
    }else if (self.dismiss == YES && self.toView) {
        self.toFrame = [self.toView.superview convertRect:self.toView.frame toView:containerView];
    }
    
    UIImageView *imageView = nil;
    if ((self.dismiss && !CGRectIsEmpty(self.toFrame)) || (!self.dismiss && !CGRectIsEmpty(self.fromFrame))) {
        imageView = [[UIImageView alloc] initWithImage:self.image];
        imageView.frame = self.fromFrame;
        [containerView addSubview:imageView];
        
        if (@available(iOS 11.0, *)) {
            imageView.accessibilityIgnoresInvertColors = YES;
        }
    }
    
    cropViewController.view.alpha = (self.dismiss ? 1.0f : 0.0f);
    if (imageView) {
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:1.0f initialSpringVelocity:0.7f options:0 animations:^{
            imageView.frame = self.toFrame;
        } completion:^(BOOL complete) {
            [UIView animateWithDuration:0.25f animations:^{
                imageView.alpha = 0.0f;
            }completion:^(BOOL complete) {
                [imageView removeFromSuperview];
            }];
        }];
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        cropViewController.view.alpha = (self.dismiss ? 0.0f : 1.0f);
    } completion:^(BOOL complete) {
        [self reset];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (void)reset
{
    self.image = nil;
    self.toView = nil;
    self.fromView = nil;
    self.fromFrame = CGRectZero;
    self.toFrame = CGRectZero;
//    self.prepareForTransitionHandler = nil;
}
@end
