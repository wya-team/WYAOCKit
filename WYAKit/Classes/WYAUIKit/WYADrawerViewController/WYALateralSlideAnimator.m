//
//  WYALateralSlideAnimator.m
//  ViewControllerTransition
//
//

#import "WYALateralSlideAnimator.h"
#import "WYADrawerTransition.h"

@interface WYALateralSlideAnimator ()

@property (nonatomic, strong) WYAInteractiveTransition * interactiveHidden;
@property (nonatomic, strong) WYAInteractiveTransition * interactiveShow;

@end

@implementation WYALateralSlideAnimator

- (instancetype)initWithConfiguration:(WYALateralSlideConfiguration *)configuration {
    if (self = [super init]) { _configuration = configuration; }
    return self;
}

+ (instancetype)lateralSlideAnimatorWithConfiguration:
    (WYALateralSlideConfiguration *)configuration {
    return [[self alloc] initWithConfiguration:configuration];
}

- (void)dealloc {
    //    NSLog(@"%s",__func__);
}

- (void)setConfiguration:(WYALateralSlideConfiguration *)configuration {
    _configuration = configuration;
    [self.interactiveShow setValue:configuration forKey:@"configuration"];
    [self.interactiveHidden setValue:configuration forKey:@"configuration"];
}

#pragma mark -UIViewControllerTransitioningDelegate
- (nullable id<UIViewControllerAnimatedTransitioning>)
animationControllerForPresentedController:(UIViewController *)presented
                     presentingController:(UIViewController *)presenting
                         sourceController:(UIViewController *)source {
    return [WYADrawerTransition transitionWithType:WYADrawerTransitiontypeShow
                                     animationType:_animationType
                                     configuration:_configuration];
}

- (nullable id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:
    (UIViewController *)dismissed {
    return [WYADrawerTransition transitionWithType:WYADrawerTransitiontypeHidden
                                     animationType:_animationType
                                     configuration:_configuration];
}

- (nullable id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:
    (id<UIViewControllerAnimatedTransitioning>)animator {
    return self.interactiveShow.interacting ? self.interactiveShow : nil;
}

- (nullable id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:
    (id<UIViewControllerAnimatedTransitioning>)animator {
    //    NSLog(@"----------------------%@",self.interactiveHidden);
    return self.interactiveHidden.interacting ? self.interactiveHidden : nil;
}

@end
