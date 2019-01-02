//
//  WYAInteractiveTransition.h
//  ViewControllerTransition
//
//

#import "WYADrawerTransition.h"
#import <UIKit/UIKit.h>

@interface WYAInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, weak) WYALateralSlideConfiguration * configuration;
@property (nonatomic, assign) BOOL interacting;

- (instancetype)initWithTransitiontype:(WYADrawerTransitiontype)type;

+ (instancetype)interactiveWithTransitiontype:(WYADrawerTransitiontype)type;

- (void)addPanGestureForViewController:(UIViewController *)viewController;

@end
