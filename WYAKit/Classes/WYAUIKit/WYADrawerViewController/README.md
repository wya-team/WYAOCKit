# WYADrawerViewController

实现抽屉功能的控制器，支持左右滑动，切换控制器

## 方法

```
/**
 左侧视图控制器移动
 */
-(void)wya_leftViewControllerMove;

/**
 右侧视图控制器移动
 */
-(void)wya_rightViewControllerMove;
```

## 基础用法
* 导入头文件

```
#import <WYAKit/WYADrawerViewController.h>
```

```
WYADrawerViewController * drawer = [[WYADrawerViewController alloc]initWithCenterViewController:[[WYAHomeViewController alloc]init] LeftViewController:[[WYALeftViewController alloc]init] RightViewController:nil];
```


