
#import "WYAAlertAction.h"
#import "WYAAlertStyle.h"
#import <UIKit/UIKit.h>

// 灰色背景透明度
static const CGFloat as_backgroundAlpha = 0.4;

@class WYAPopupView;

@interface WYAAlertController : UIViewController <UIAppearanceContainer>

/// alert 视图（外部不要调用）
@property (nonatomic, strong) UIView * _Nonnull alertView;
/// 外部可以设置背景颜色，透明程度，和是否可以相应事件（默认可以响应，如果不需要响应请关闭button的enabled属性）
@property (nonatomic, strong) UIButton * _Nonnull backgroundButton;
/// present 转场风格
@property (nonatomic, assign) WYAPopupPresentStyle presentStyle UI_APPEARANCE_SELECTOR;
/// dismiss 转场风格
@property (nonatomic, assign) WYAPopupDismissStyle dismissStyle UI_APPEARANCE_SELECTOR;
/// 弹出视图类型
@property (nonatomic, assign) WYAAlertStyle alertStyle;

/**
 默认转场初始化方法

 @param title 标题
 @param message 消息
 @return alert控制器
 */
+ (_Nonnull instancetype)wya_alertWithTitle:(NSString * _Nullable)title
                                    Message:(NSString * _Nullable)message
                           AlertLayoutStyle:(WYAAlertLayoutStyle)layoutStyle;

/**
 alertSheetView初始化方法

 @param title 标题
 @param message 消息
 @return alert控制器
 */
+ (_Nonnull instancetype)wya_alertSheetWithTitle:(NSString * _Nullable)title
                                         Message:(NSString * _Nullable)message
                          AlertSheetCornerRadius:(CGFloat)cornerRadius;

/**
 自定义弹出视图（视图需确定Size大小，事件，按钮需自行添加）

 @param view 自定义视图
 @return alert控制器
 */
+ (_Nonnull instancetype)wya_alertWithCustomView:(UIView * _Nonnull)view
                                      AlertStyle:(WYAAlertStyle)alertStyle;

/**
 添加 action

 @param action action
 */
- (void)wya_addAction:(WYAAlertAction * _Nonnull)action;

/**
 *    直接添加一个数组的 action
 *
 *    @param actions 放有 action 的数组
 */
- (void)wya_addActions:(NSArray<WYAAlertAction *> * _Nonnull)actions;

/**
 添加输入框

 @param textField 输入框
 */
- (void)wya_addTextField:(UITextField * _Nonnull)textField;

@end
