# UIViewController+WYADrawerView

实现抽屉功能的控制器，支持左右滑动，切换控制器

## 方法

```objective-c
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
@param transitionDirectionAutoBlock 手势过程中执行的操作。根据参数direction传整个点击present的事件即可（看demo的使用）
*/
- (void)wya_registerShowIntractiveWithEdgeGesture:(BOOL)openEdgeGesture transitionDirectionAutoBlock:(void(^)(WYADrawerTransitionDirection direction))transitionDirectionAutoBlock;

/**
Custom push method 自定义的push动画
push another viewController in the side slip out of the controller 在侧滑界面push另一个界面
@param viewController Need to push of the controller
*/
- (void)wya_pushViewController:(UIViewController *)viewController;

/**
Custom push method 自定义的push动画,比上面的API多了一个时间参数
push another viewController in the side slip out of the controller. 在侧滑界面push另一个界面
@param vc  Need to push of the controller
@param duration  The Drewer Hidden Animation Duration When Push. push时抽屉隐藏动画的持续时间
*/
- (void)wya_pushViewController:(UIViewController *)vc drewerHiddenDuration:(NSTimeInterval)duration;

/**
Custom present method 自定义的present动画
present another viewController in the side slip out of the controller 在侧滑界面present另一个界面
@param viewController Need to present of the controller
*/
- (void)wya_presentViewController:(UIViewController *)viewController;

/**
Custom present method 自定义的present动画
present another viewController in the side slip out of the controller 在侧滑界面present另一个界面
@param vc Need to present of the controller
@param hidden  The Drewer isHidden . present时抽屉是否隐藏
*/
- (void)wya_presentViewController:(UIViewController *)vc drewerHidden:(BOOL)hidden;

/**
Custom present method 自定义的dismiss动画
必须要是通过wya_presentViewController的控制器才能使用这个方法dismiss
*/
- (void)wya_dismissViewController;
```

## 基础用法

- 导入头文件

```objective-c
#import <WYAKit/UIViewController+WYADrawerView.h>
```

- 注册手势驱动

```objective-c
[self wya_registerShowIntractiveWithEdgeGesture:NO transitionDirectionAutoBlock:^(WYADrawerTransitionDirection direction) {
    if (direction == WYADrawerTransitionFromLeft) { // 左侧滑出
        [weakSelf wya_showDefaultDrawerViewController:weakSelf.leftVC];
    } else if (direction == WYADrawerTransitionFromRight) { // 右侧滑出
        WYALateralSlideConfiguration * conf = [WYALateralSlideConfiguration defaultConfiguration];
        conf.direction                      = WYADrawerTransitionFromRight; // 从右边滑出
        conf.finishPercent                  = 0.2f;
        conf.showAnimDuration               = 0.2;
        conf.HiddenAnimDuration             = 0.2;
        conf.maskAlpha                      = 0.1;

        [weakSelf wya_showDrawerViewController:self.rightVC animationType:WYADrawerAnimationTypeDefault configuration:conf];
    }
}];
```

- 事件触发左侧视图滑动

```objective-c
[self wya_showDefaultDrawerViewController:weakSelf.leftVC];
```

- 事件触发右侧视图滑动

```objective-c
WYALateralSlideConfiguration * conf = [WYALateralSlideConfiguration defaultConfiguration];
conf.direction                      = WYADrawerTransitionFromRight; // 从右边滑出
conf.finishPercent                  = 0.2f;
conf.showAnimDuration               = 0.2;
conf.HiddenAnimDuration             = 0.2;
conf.maskAlpha                      = 0.1;

[weakSelf wya_showDrawerViewController:self.rightVC animationType:WYADrawerAnimationTypeDefault configuration:conf];
```

