
#import "WYAAlertStyle.h"
#import <UIKit/UIKit.h>
@class WYAAlertAction;

@interface WYAAlertView : UIView
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
/// 保存当前的视图控制器，用来dismiss
@property (nonatomic, weak, nullable) UIViewController * controller;
/// 按钮约束方向
@property (nonatomic, assign) WYAAlertLayoutStyle layoutStyle;

/**
 初始化 AlertView

 @param title 标题
 @param message 消息
 @return self
 */
- (_Nonnull instancetype)initWithTitle:(NSString * _Nullable)title
                               message:(NSString * _Nullable)message;

/**
 添加一个 action

 @param action action
 */
- (void)wya_addAction:(WYAAlertAction * _Nonnull)action;

/**
 添加输入框

 @param textField 输入框
 */
- (void)wya_addTextField:(UITextField *)textField;

@end
