//
//  UIViewController+WYADrawerView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/16.
//

#import "WYALateralSlideAnimator.h"
#import "WYALateralSlideConfiguration.h"
#import <UIKit/UIKit.h>

@interface UIViewController (WYADrawerView)

/**
 显示默认抽屉
 从左侧滑出类似QQ抽屉效果
 @param viewController 需要侧滑显示出来的控制器
 */
- (void)wya_showDefaultDrawerViewController:(UIViewController *)viewController;

/**
 呼出侧滑控制器的方法（主要）

 @param viewController 需要侧滑显示出来的控制器
 @param animationType 侧滑时候的动画类型
 @param configuration 侧滑过程的一些参数配置，如果传nil会创建一个默认的配置参数
 */
- (void)wya_showDrawerViewController:(UIViewController *)viewController
                       animationType:(WYADrawerAnimationType)animationType
                       configuration:(WYALateralSlideConfiguration *)configuration;

/**
 注册手势驱动方法，侧滑呼出的方向自动确定，一般在viewDidLoad调用，调用之后会添加一个支持侧滑的手势到本控制器

 @param openEdgeGesture 是否开启边缘手势,边缘手势的开始范围为距离边缘50以内
 @param transitionDirectionAutoBlock
 手势过程中执行的操作。根据参数direction传整个点击present的事件即可
 */
- (void)wya_registerShowIntractiveWithEdgeGesture:(BOOL)openEdgeGesture
                     transitionDirectionAutoBlock:(void (^)(WYADrawerTransitionDirection direction))
                                                  transitionDirectionAutoBlock;

/**
 自定义的push动画
 在侧滑界面push另一个界面
 @param viewController controller
 */
- (void)wya_pushViewController:(UIViewController *)viewController;

/**
 自定义的push动画,比上面的API多了一个时间参数
 在侧滑界面push另一个界面
 @param vc  controller
 @param duration  push时抽屉隐藏动画的持续时间
 */
- (void)wya_pushViewController:(UIViewController *)vc drewerHiddenDuration:(NSTimeInterval)duration;

/**
 自定义的present动画
 在侧滑界面present另一个界面
 @param viewController controller
 */
- (void)wya_presentViewController:(UIViewController *)viewController;

/**
 自定义的present动画
 在侧滑界面present另一个界面
 @param vc
 @param hidden present时抽屉是否隐藏
 */
- (void)wya_presentViewController:(UIViewController *)vc drewerHidden:(BOOL)hidden;

/**
 自定义的dismiss动画
 必须要是通过wya_presentViewController的控制器才能使用这个方法dismiss
 */
- (void)wya_dismissViewController;

@end
