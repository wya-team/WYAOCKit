# WYAAlert  弹出框组件
### WYAAlertStyle 定义弹出框样式
* Defalut 默认样式（默认居中）
* Sheet 底部弹出（默认居下）
* CustomAlert
* CustomSheet

#### WYAAlertLayoutStyle（该样式只有在Defalut模式下有效，用来管理按钮的排列方向）
* Horizontal 水平
* Vertical 垂直

### WYAPopupPresentStyle （调整控制器进场状态）
* WYAPopupPresentStyleSystem
* WYAPopupPresentStyleFadeIn
* WYAPopupPresentStyleBounce
* WYAPopupPresentStyleExpandHorizontal
* WYAPopupPresentStyleExpandVertical
* WYAPopupPresentStyleSlideDown
* WYAPopupPresentStyleSlideUp
* WYAPopupPresentStyleSlideLeft
* WYAPopupPresentStyleSlideRight

### WYAPopupDismissStyle （调整控制器出场状态）
* WYAPopupDismissStyleFadeOut
* WYAPopupDismissStyleContractHorizontal
* WYAPopupDismissStyleContractVertical
* WYAPopupDismissStyleSlideDown
* WYAPopupDismissStyleSlideUp
* WYAPopupDismissStyleSlideLeft
* WYAPopupDismissStyleSlideRight

## 如何使用
###创建Alert弹窗

````
/**
 默认转场初始化方法

 @param title 标题
 @param message 消息
 @return alert控制器
 */
+ (_Nonnull instancetype)wya_AlertWithTitle:(NSString * _Nullable)title
                                    Message:(NSString * _Nullable)message
                           AlertLayoutStyle:(WYAAlertLayoutStyle)layoutStyle;
````

### 创建AlertSheet弹窗

````
/**
 alertSheetView初始化方法

 @param title 标题
 @param message 消息
 @return alert控制器
 */
+ (_Nonnull instancetype)wya_AlertSheetWithTitle:(NSString * _Nullable)title
                                         Message:(NSString * _Nullable)message;
````
### 创建自定义视图弹窗

````
/**
 自定义弹出视图（视图需确定Size大小，事件，按钮需自行添加）

 @param view 自定义视图
 @return alert控制器
 */
+ (_Nonnull instancetype)wya_AlertWithCustomView:(UIView *)view
                                      AlertStyle:(WYAAlertStyle)alertStyle;
````
#### 为弹窗添加按钮点击事件

````
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
````
#### 为弹窗添加输入框只有在WYAAlertStyleDefalut下有效

````
/**
 添加输入框

 @param textField 输入框
 */
- (void)wya_AddTextField:(UITextField *)textField;
````


