//
//  UITextField+Category.h
//  WYASDProject
//
//  Created by 李俊恒 on 2018/7/20.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Category)

/**
 设置placeholder可以定制颜色字体大小

 @param placeholedr 占位文字
 @param color 颜色
 @param font 字体大小
 */
- (void)wya_setPlaceholedr:(NSString *)placeholedr color:(UIColor *)color font:(CGFloat)font;

/**
 设置左视图文字

 @param text 文字内容
 @param color 颜色
 @param font 字体大小
 */
- (void)wya_setLeftViewWithText:(NSString *)text textColor:(UIColor *)color font:(CGFloat)font;

/**
 设置左视图图片

 @param imageNamed 图片名字
 */
- (void)wya_setLeftViewImageWithImageNamed:(NSString *)imageNamed;
- (void)wya_setLeftViewWithView:(UIView *)view;
/**
 设置右视图图片

 @param imageNamed 图片名字
 */
- (void)wya_setRightViewImageWithImageNamed:(NSString *)imageNamed;

- (void)wya_setRightButtonWithView:(UIButton *)button;
/**
 设置下划线样式的textFiled

 @param color 下划线颜色
 */
- (void)wya_setTextFiledTypeStyleLineWithColor:(UIColor *)color;

/**
 设置用户名输入框

 @param color 输入框的文字颜色
 @param font 字体大小
 @param backGroundColor 背景色
 */
- (void)wya_setUserNameTextFiledTextColor:(UIColor *)color
                                 FontSize:(CGFloat)font
                          backGroundColor:(UIColor *)backGroundColor;

/**
 设置密码输入框

 @param color 字体颜色
 @param font 字体大小
 @param backGroundColor 背景色
 */
- (void)wya_setPasswordTextFiledTextColor:(UIColor *)color
                                 FontSize:(CGFloat)font
                          backGroundColor:(UIColor *)backGroundColor;
@end

/**
 链式语法调用，设置输入框属性
 Example:
         UITextField * textField = [[UITextField alloc]init];
         textField.setupPlaceholder(@"占位文字").
         setupText(@"haha").
         setupTextColor([UIColor redColor]).
         setupDelegate(self)
 */
@interface UITextField (Property)
/// 设置文本
@property (nonatomic, copy) UITextField *(^setupText)(NSString * text);
/// 设置文本颜色
@property (nonatomic, copy) UITextField *(^setupTextColor)(UIColor * textColor);
/// 设置文本字体大小
@property (nonatomic, copy) UITextField *(^setupSystemFontSize)(CGFloat fontSize);
/// 设置文本对齐方式
@property (nonatomic, copy) UITextField *(^setupTextAlignment)(NSTextAlignment alignment);
/// 设置占位文字
@property (nonatomic, copy) UITextField *(^setupPlaceholder)(NSString * text);
/// 设置键盘类型
@property (nonatomic, copy) UITextField *(^setupKeyBoardType)(UIKeyboardType type);
/// 设置边框类型
@property (nonatomic, copy) UITextField *(^setupBorderStyle)(UITextBorderStyle style);
/// 设置是否加密输入
@property (nonatomic, copy) UITextField *(^setupSecureTextEntry)(BOOL isSecure);
/// 设置是否在输入时显示删除按钮
@property (nonatomic, copy) UITextField *(^setupClearsOnBeginEditing)(BOOL clear);
/// 设置代理
@property (nonatomic, copy) UITextField *(^setupDelegate)(id obj);
/// 设置清除按钮模式
@property (nonatomic, copy) UITextField *(^setupClearButtonMode)(UITextFieldViewMode mode);
/// 设置左侧视图
@property (nonatomic, copy) UITextField *(^setupLeftView)(UIView * view);
/// 设置左侧视图显示模式
@property (nonatomic, copy) UITextField *(^setupLeftViewMode)(UITextFieldViewMode mode);
/// 设置右侧视图
@property (nonatomic, copy) UITextField *(^setupRightView)(UIView * view);
/// 设置右侧视图显示模式
@property (nonatomic, copy) UITextField *(^setupRightViewMode)(UITextFieldViewMode mode);
@end

@interface UITextField (Action)
- (void)wya_addTextChangeWithEvent:(UIControlEvents)event
                        textHandle:(void (^)(UITextField * text))textHandle;
@end
