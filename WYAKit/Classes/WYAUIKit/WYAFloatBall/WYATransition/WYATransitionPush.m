//
//  WYATransitionPush.m
//  AFNetworking
//
//  Created by 李俊恒 on 2019/2/28.
//

#import "WYATransitionPush.h"
#import "WYAFloatBallManager.h"
#define KAuration 0.5

@interface WYATransitionPush () <CAAnimationDelegate>
@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;
@property (nonatomic, strong) UIView * coverView;
@end

@implementation WYATransitionPush

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return KAuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.transitionContext = transitionContext;

    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIView * contView = [transitionContext containerView];
    [contView addSubview:fromVC.view];
    [contView addSubview:toVC.view];

    CGRect floatBallRect = [WYAFloatBallManager shared].floatBall.frame;
    [fromVC.view addSubview:self.coverView];
    UIBezierPath * maskStartBP = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(floatBallRect.origin.x, floatBallRect.origin.y, floatBallRect.size.width, floatBallRect.size.height) cornerRadius:floatBallRect.size.height / 2];
    UIBezierPath * maskFinalBP = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, ScreenWidth, ScreenHeight) cornerRadius:floatBallRect.size.width / 2];
    CAShapeLayer * maskLayer   = [CAShapeLayer layer];
    maskLayer.path             = maskFinalBP.CGPath;
    toVC.view.layer.mask       = maskLayer;

    CABasicAnimation * maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue          = (__bridge id)(maskStartBP.CGPath);
    maskLayerAnimation.toValue            = (__bridge id)((maskFinalBP.CGPath));
    maskLayerAnimation.duration           = KAuration;
    maskLayerAnimation.timingFunction     = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    maskLayerAnimation.delegate           = self;
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];

    [UIView animateWithDuration:KAuration
                     animations:^{
                         [WYAFloatBallManager shared].floatBall.alpha = 0;
                     }];
}
#pragma mark - CABasicAnimation的Delegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self.transitionContext completeTransition:YES];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask   = nil;
    [self.coverView removeFromSuperview];
}

- (UIView *)coverView
{
    if (!_coverView) {
        _coverView                 = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha           = 0.5;
    };
    return _coverView;
}
@end
