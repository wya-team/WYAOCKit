
#import "WYAStyle.h"
#import <UIKit/UIKit.h>
@class WYAAlertAction;

@interface WYAAlertView : UIView
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
/** 保存当前的视图控制器，用来dismiss */
@property (nonatomic, weak, nullable) UIViewController * controller;

@property (nonatomic, assign) WYAAlertLayoutStyle layoutStyle;
/**
 *    初始化 AlertView
 *
 *    @param title   标题
 *    @param message 消息
 */
- (_Nonnull instancetype)initWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message;

/**
 *    添加一个 action
 *
 *    @param action action
 */
- (void)wya_AddAction:(WYAAlertAction * _Nonnull)action;

- (void)wya_AddTextField:(UITextField *)textField;

@end
