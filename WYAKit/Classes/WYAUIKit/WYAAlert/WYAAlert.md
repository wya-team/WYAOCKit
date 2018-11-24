# WYAAlert  弹出框组件
##功能
-实现弹出框效果，默认提供两种弹出框效果alert和alertSheet，弹出视图也可以自定义，弹出方式有屏幕居中和屏幕下方位置

##属性
属性 | 说明 | 类型 | 默认值
---|---|---|---
backgroundButton|外部可以设置背景颜色，透明程度，和是否可以相应事件（默认可以响应，如果不需要响应请关闭button的enabled属性）| UIButton|-
alertStyle|弹出视图类型|WYAAlertStyle|WYAAlertStyleDefalut
presentStyle|present 转场风格|WYAPopupPresentStyle|WYAPopupPresentStyleSystem
dismissStyle|dismiss 转场风格|WYAPopupDismissStyle|WYAPopupDismissStyleFadeOut

### WYAAlertStyle 定义弹出框样式
枚举值 | 说明
---|---
WYAAlertStyleDefalut| 默认样式（默认居中）
WYAAlertStyleSheet | 底部弹出（默认居下)
WYAAlertStyleCustomAlert | 自定义视图（默认居中）
WYAAlertStyleCustomSheet | 自定义视图（默认居下）


### WYAAlertLayoutStyle（该样式只有在WYAAlertStyleDefalut模式下有效，用来管理按钮的排列方向）
枚举值 | 说明
---|---
WYAAlertLayoutStyleHorizontal | 水平方向
WYAAlertLayoutStyleVertical | 垂直方向


### WYAPopupPresentStyle （调整控制器进场状态）
枚举值 | 说明
---|---
WYAPopupPresentStyleSystem | 系统样式
WYAPopupPresentStyleFadeIn | 渐入
WYAPopupPresentStyleBounce | 弹出
WYAPopupPresentStyleExpandHorizontal | 水平展开
WYAPopupPresentStyleExpandVertical | 垂直展开
WYAPopupPresentStyleSlideDown | 从上往下划入
WYAPopupPresentStyleSlideUp | 从下往上划入
WYAPopupPresentStyleSlideLeft | 从右往左划入
WYAPopupPresentStyleSlideRight | 从左往右划入

### WYAPopupDismissStyle （调整控制器出场状态）
枚举值 | 说明
---|---
WYAPopupDismissStyleFadeOut | 渐出
WYAPopupDismissStyleContractHorizontal | 水平收起
WYAPopupDismissStyleContractVertical | 垂直收起
WYAPopupDismissStyleSlideDown | 向下划出
WYAPopupDismissStyleSlideUp | 向上划出
WYAPopupDismissStyleSlideLeft | 向左划出
WYAPopupDismissStyleSlideRight | 向右划出

## 如何使用
###创建Alert弹窗

```Object-C
/**
 默认转场初始化方法

 @param title 标题
 @param message 消息
 @return alert控制器
 */
+ (_Nonnull instancetype)wya_AlertWithTitle:(NSString * _Nullable)title
                                    Message:(NSString * _Nullable)message
                           AlertLayoutStyle:(WYAAlertLayoutStyle)layoutStyle;
```

### 创建AlertSheet弹窗

```Object-C
/**
 alertSheetView初始化方法

 @param title 标题
 @param message 消息
 @return alert控制器
 */
+ (_Nonnull instancetype)wya_AlertSheetWithTitle:(NSString * _Nullable)title
                                         Message:(NSString * _Nullable)message;
```
### 创建自定义视图弹窗

```Object-C
/**
 自定义弹出视图（视图需确定Size大小，事件，按钮需自行添加）

 @param view 自定义视图
 @return alert控制器
 */
+ (_Nonnull instancetype)wya_AlertWithCustomView:(UIView *)view
                                      AlertStyle:(WYAAlertStyle)alertStyle;
```
#### 为弹窗添加按钮点击事件

```Object-C
/**
 添加 action
 
 @param action action
 */
- (void)wya_AddAction:(WYAAlertAction * _Nonnull)action;

/**
 *    直接添加一个数组的 action
 *
 *    @param actions 放有 action 的数组
 */
- (void)wya_AddActions:(NSArray<WYAAlertAction *> * _Nonnull)actions;
```
#### 为弹窗添加输入框只有在WYAAlertStyleDefalut下有效

```Object-C
/**
 添加输入框

 @param textField 输入框
 */
- (void)wya_AddTextField:(UITextField *)textField;
```

## 基础用法
* 导入头文件

```
#import <WYAKit/WYAAlertController.h>
```

* 初始化弹窗控制器
    
```Object-C
WYAAlertController *alert = [WYAAlertController wya_AlertWithTitle:@"Welcome"
                                                                       Message:@"欢迎使用 Ant Design ！！"
                                                              AlertLayoutStyle:WYAAlertLayoutStyleVertical];
alert.backgroundButton.enabled = NO;
            // 创建 action
WYAAlertAction *defaultAction = [WYAAlertAction wya_ActionWithTitle:@"知道了" style:WYAAlertActionStyleDefault handler:^{ NSLog(@"Default"); }];
[alert wya_AddAction:defaultAction];
[self presentViewController:alert animated:YES completion:nil];
```
```Object-C
WYAAlertController * alert = [WYAAlertController wya_AlertSheetWithTitle:@"" Message:@""];
WYAAlertAction *defaultAction = [WYAAlertAction wya_ActionWithTitle:@"选项一(警示项)" style:WYAAlertActionStyleDestructive handler:^{ NSLog(@"Default"); }];
WYAAlertAction *cancelAction = [WYAAlertAction wya_ActionWithTitle:@"选项二" style:WYAAlertActionStyleDefault handler:^{ NSLog(@"Cancel"); }];
WYAAlertAction *defaultAction1 = [WYAAlertAction wya_ActionWithTitle:@"选项三" style:WYAAlertActionStyleDefault handler:^{ NSLog(@"Default"); }];
[alert wya_AddAction:defaultAction];
[alert wya_AddAction:cancelAction];
[alert wya_AddAction:defaultAction1];
[self presentViewController:alert animated:YES completion:nil];
```
```Object-C
UIView * view = [[UIView alloc] init];
        view.backgroundColor = [UIColor redColor];
        view.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
        WYAAlertController * alert = [WYAAlertController wya_AlertWithCustomView:view AlertStyle:WYAAlertStyleCustomAlert];
        [self presentViewController:alert animated:YES completion:nil];
```

