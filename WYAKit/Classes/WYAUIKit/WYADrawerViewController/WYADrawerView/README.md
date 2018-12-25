# WYADrawerView

实现抽屉功能的视图，支持左右滑动，切换视图
-

## 属性
属性 | 说明 | 类型 | 默认值
---|---|---|---
leftRatio|左侧视图比例范围0~1|CGFloat|默认0.7
rightRatio|右视图比例范围0~1|CGFloat|默认0.7

## 方法

```objc
/**
 初始化

 @param frame 位置
 @param leftView 左视图
 @param rightView 右视图
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame leftView:(UIView *)leftView rightView:(UIView *)rightView;

/**
 左视图移动
 */
- (void)wya_leftViewMove;

/**
 右视图移动
 */
- (void)wya_rightViewMove;

```

## 基础用法
* 导入头文件

```
#import <WYAKit/WYADrawerView.h>
```

* 二级界面需要手动调用禁止导航侧滑事件

```objc
if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}
```
* 初始化

```objc
WYADrawerView * object = [[WYADrawerView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight-WYATopHeight) leftView:self.leftView rightView:self.rightView];
```


