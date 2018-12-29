//
//  WYADrawerTransition.h
//  ViewControllerTransition
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WYALateralSlideConfiguration.h"

typedef NS_ENUM(NSUInteger,WYADrawerTransitiontype) {
    WYADrawerTransitiontypeShow = 0,      // 显示抽屉
    WYADrawerTransitiontypeHidden,        // 隐藏抽屉
};


typedef NS_ENUM(NSUInteger,WYADrawerAnimationType) {
    WYADrawerAnimationTypeDefault = 0,
    WYADrawerAnimationTypeMask
};

@interface WYADrawerTransition : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithTransitionType:(WYADrawerTransitiontype)transitionType animationType:(WYADrawerAnimationType)animationType configuration:(WYALateralSlideConfiguration *)configuration;

+ (instancetype)transitionWithType:(WYADrawerTransitiontype)transitionType animationType:(WYADrawerAnimationType)animationType configuration:(WYALateralSlideConfiguration *)configuration;

@end


@interface WYAMaskView : UIView<UIGestureRecognizerDelegate>

@property (nonatomic,copy) NSArray *toViewSubViews;

+ (instancetype)shareInstance;

+ (void)releaseInstance;

@end


UIKIT_EXTERN NSString *const WYALateralSlideAnimatorKey;
UIKIT_EXTERN NSString *const WYALateralSlideMaskViewKey;
UIKIT_EXTERN NSString *const WYALateralSlideInterativeKey;

UIKIT_EXTERN NSString *const WYALateralSlidePanNoticationKey;
UIKIT_EXTERN NSString *const WYALateralSlideTapNoticationKey;

UIKIT_EXTERN NSString *const WYALateralSlideDirectionKey;



