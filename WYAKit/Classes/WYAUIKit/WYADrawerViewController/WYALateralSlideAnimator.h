//
//  WYALateralSlideAnimator.h
//  ViewControllerTransition
//
//

#import "WYAInteractiveTransition.h"
#import "WYALateralSlideConfiguration.h"
#import <UIKit/UIKit.h>

@interface WYALateralSlideAnimator : NSObject <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) WYALateralSlideConfiguration * configuration;
@property (nonatomic, assign) WYADrawerAnimationType animationType;

- (instancetype)initWithConfiguration:(WYALateralSlideConfiguration *)configuration;

+ (instancetype)lateralSlideAnimatorWithConfiguration:(WYALateralSlideConfiguration *)configuration;

@end
