//
//  WYAInteractiveTransition.h
//  ViewControllerTransition
//
//

#import <UIKit/UIKit.h>
#import "WYADrawerTransition.h"

@interface WYAInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic,weak) WYALateralSlideConfiguration *configuration;
@property (nonatomic,assign) BOOL interacting;


- (instancetype)initWithTransitiontype:(WYADrawerTransitiontype)type;

+ (instancetype)interactiveWithTransitiontype:(WYADrawerTransitiontype)type;

- (void)addPanGestureForViewController:(UIViewController *)viewController;

@end



