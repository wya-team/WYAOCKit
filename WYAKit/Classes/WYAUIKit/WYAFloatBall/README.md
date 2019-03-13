#  WYAFloatBallManager

## 功能
实现类似微信的WebView的悬浮效果，微信的大佬一定用了了不起的技术,我这里只是实现基本的效果。动画效果之类的也不是很好。

## 属性
属性 | 说明 | 类型 | 默认值
 --- | --- | --- | ---
floatBall | 悬浮球View | UIView | -
floatViewController | 需要在返回时缩为到悬浮球的控 制器去 | UIViewController | - 

## 方法

```Objective-C
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
```

## 注意事项

1. <font color="red">必须在项目的BaseViewController中遵守`UINavigationControllerDelegate, UIGestureRecognizerDelegate`两个代理协议</font>
2. 在BaseViewController中实现`UINavigationControllerDelegate, UIGestureRecognizerDelegate`两个代理的方法

```Objective-C
// 导入头文件
#import <WYAKit/WYAFloatBallManager.h>
#import <WYAKit/WYATransitionPop.h>
#import <WYAKit/WYATransitionPush.h>

- (void)viewDidLoad {
[super viewDidAppear:animated];
// 设置代理
self.navigationController.interactivePopGestureRecognizer.delegate = self;
 self.navigationController.delegate = self;
 }
 // 实现UIGestureRecognizerDelegate代理
 
 - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {

 if (self.navigationController.viewControllers.count > 1) {
 
 [[WYAFloatBallManager shared] beginScreenEdgePanBack:gestureRecognizer];
 
 return YES;
 
 }
 
 return NO;
 
 }
 
// 实现UINavigationControllerDelegate代理

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
```

## 基本用法

- 首先在`AppDelegate`
中先导入头文件、或者在PCH文件中导入：

```Objective-C
#import <WYAKit/WYAFloatBallManager.h>
#import <WYAKit/WYATransitionPop.h>
#import <WYAKit/WYATransitionPush.h>
```
在`AppDelegate`添加需要返回时缩小到悬浮球的控制器例如：
```Objetcive-C
 [WYAFloatBallManager wya_addFloatVcS:@[ @"WYAReadMeViewController", @"WYAPopVerReadMeViewController"]];
```

- 在`BaseViewController`中遵守`UIGestureRecognizerDelegate,UINavigationControllerDelegate`代理

```
- (void)viewDidLoad {
    [super viewDidLoad];    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.delegate = self;
}

// 实现UIGestureRecognizerDelegate代理

 - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {

 if (self.navigationController.viewControllers.count > 1) {

 [[WYAFloatBallManager shared] beginScreenEdgePanBack:gestureRecognizer];

 return YES;

 }

 return NO;

 }

 // 实现UINavigationControllerDelegate代理

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
 
 /**
 导航push方法：此方法是为了在使用悬浮球时更好的捕获到导航控制器

 @param viewController 需要推出的控制器
 @param animated 是否需要动画
 */
- (void)wya_pushViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated{
    [self.navigationController pushViewController:viewController animated:animated];
}

```
- 在需要push的控制器中使用：

```Objective-C
    [self wya_pushViewController:vc animated:YES];
```

- 在需要缩小的控制器中重写goBack带哦用下边代码

```Objective-C

WYAFloatBallManager * manager = [WYAFloatBallManager shared];
 
[manager wya_showBallBtnWith:self];
```