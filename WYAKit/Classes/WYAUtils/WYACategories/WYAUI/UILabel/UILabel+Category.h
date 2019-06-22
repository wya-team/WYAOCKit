//
//  UILabel+Category.h
//  WYAiOSEnv
//
//  Created by 李世航 on 2018/7/9.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

/**
 label文字顶部对齐
 */
- (void)alignTop;

/**
 label文字底部对齐
 */
- (void)alignBottom;

/**
 改变行间距

 @param space 间距
 @param labelText 文字
 */
- (void)changeLineSpaceForLabelWithSpace:(float)space text:(NSString *)labelText;

/**
 改变字间距

 @param space 间距
 */
- (void)changeWordSpaceForLabelWithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
- (void)changeSpaceForLabelWithLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

/**
 获得UILabel高度

 @param width 宽度
 @param title title
 @param font font
 @return 返回高度
 */
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font;

/**
 获得UILabel宽度

 @param title title
 @param font fon
 @return 返回宽度
 */
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

@end

/**
 链式语法调用，设置文本属性
 Example:
         UILabel * label = [[UILabel alloc]init];
         label.setupText(@"哈哈").
         setupTextColor([UIColor redColor]).
         setupSystemFontSize(15).
         setupNumberOfLines(0)
 */
@interface UILabel (Property)
/// 设置标题
@property (nonatomic, copy) UILabel *(^setupText)(NSString *text);
/// 设置标题颜色
@property (nonatomic, copy) UILabel *(^setupTextColor)(UIColor *color);
/// 设置标题大小
@property (nonatomic, copy) UILabel *(^setupSystemFontSize)(CGFloat fontSize);
/// 设置文本对齐方式
@property (nonatomic, copy) UILabel *(^setupAlignment)(NSTextAlignment alignment);
/// 设置行数
@property (nonatomic, copy) UILabel *(^setupNumberOfLines)(NSInteger lines);
/// 设置行间距
@property (nonatomic, copy) UILabel *(^setupLineSpace)(CGFloat space);
/// 设置用户交互性
@property (nonatomic, copy) UILabel *(^setupUserInteractionEnabled)(BOOL enable);
/// 设置文本纵向对齐方式
@property (nonatomic, copy) UILabel *(^setupBaselineAdjustment)(UIBaselineAdjustment alignment);
@end
