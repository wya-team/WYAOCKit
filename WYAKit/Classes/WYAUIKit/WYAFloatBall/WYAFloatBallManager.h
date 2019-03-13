//
//  WYAFloatBallManager.h
//  AFNetworking
//
//  Created by 李俊恒 on 2019/2/28.
//

#import "WYAFloatBall.h"
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface WYAFloatBallManager : NSObject
@property (nonatomic, strong) WYAFloatBall * floatBall;
@property (nonatomic, strong) UIViewController * floatViewController;

/**
 获取单例实例

 @return 返回一个WYAFloatBallManager实例
 */
+ (instancetype)shared;

/**
 滑动手势返回时调用用来判断是否展示

 @param gestureRecognizer 滑动手势
 */
- (void)beginScreenEdgePanBack:(UIGestureRecognizer *)gestureRecognizer;

/**
 添加需要实现fliatBall的控制器
 注意：在导航控制器实例化之后调用
 @param vcClass 控制器的name
 */
+ (void)wya_addFloatVcS:(NSArray<NSString *> *)vcClass;

/**
 展示浮窗

 @param fromVC 需要返回后缩小为浮窗的VC
 */
- (void)wya_showBallBtnWith:(UIViewController *)fromVC;

/**
 移除浮窗
 */
- (void)wya_removeBallBtn;

@end

NS_ASSUME_NONNULL_END

/*
 在外部BaseViewController中遵守UINavigationControllerDelegate, UIGestureRecognizerDelegate代理
 1、在遵守的控制器中写下代码并遵守协议
 self.navigationController.interactivePopGestureRecognizer.delegate = self;
 self.navigationController.delegate = self;

 2、实现UIGestureRecognizerDelegate代理

 - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {

 if (self.navigationController.viewControllers.count > 1) {

 [[WYAFloatBallManager shared] beginScreenEdgePanBack:gestureRecognizer];

 return YES;

 }

 return NO;

 }

 3、 实现UINavigationControllerDelegate代理

 - (nullable id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
 animationControllerForOperation:(UINavigationControllerOperation)operation
 fromViewController:(UIViewController *)fromVC
 toViewController:(UIViewController *)toVC {

 WYAFloatBallManager * manger =  [WYAFloatBallManager shared];

 UIViewController * vc = manger.floatViewController;

 UIViewController * mainVC = fromVC.navigationController.viewControllers.firstObject;

 if (vc) {

 if (operation == UINavigationControllerOperationPush) {

 if (toVC != vc) {

 return nil;

 }
 if (fromVC == mainVC) {

 toVC.tabBarController.tabBar.hidden = YES;

 }

 WYATransitionPush * transition = [[WYATransitionPush alloc] init];

 return transition;

 } else if (operation == UINavigationControllerOperationPop) {

 if (fromVC != vc) {

 [manger wya_showBallBtnWith:fromVC];

 return nil;

 }
 if (toVC == mainVC) {

 toVC.tabBarController.tabBar.hidden = NO;

 return nil;

 }
 WYATransitionPop * transition = [[WYATransitionPop alloc] init];

 return transition;

 } else {

 return nil;

 }
 } else {

 return nil;

 }

 }

 */

