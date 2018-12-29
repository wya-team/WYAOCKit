//
//  WYALateralSlideAnimator.h
//  ViewControllerTransition
//
//

#import <UIKit/UIKit.h>
#import "WYALateralSlideConfiguration.h"
#import "WYAInteractiveTransition.h"

@interface WYALateralSlideAnimator : NSObject<UIViewControllerTransitioningDelegate>

@property (nonatomic,strong) WYALateralSlideConfiguration *configuration;
@property (nonatomic,assign) WYADrawerAnimationType animationType;

- (instancetype)initWithConfiguration:(WYALateralSlideConfiguration *)configuration;

+ (instancetype)lateralSlideAnimatorWithConfiguration:(WYALateralSlideConfiguration *)configuration;

@end
