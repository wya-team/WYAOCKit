//
//  UITextField+Category.m
//  WYASDProject
//
//  Created by 李俊恒 on 2018/7/20.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UITextField+Category.h"

@implementation UITextField (Category)
- (void)wya_setPlaceholedr:(NSString *)placeholedr color:(UIColor *)color font:(CGFloat)font
{
    self.placeholder = placeholedr;
    [self setValue:[UIColor wya_hex:@"#cccccc"] forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:FONT (font) forKeyPath:@"_placeholderLabel.font"];
}
- (void)wya_setLeftViewWithText:(NSString *)text textColor:(UIColor *)color font:(CGFloat)font
{
    CGFloat width = [text wya_widthWithFontSize:font height:self.cmam_height];
    UILabel * leftLabel = [[UILabel alloc] initWithFrame:CGRectMake (0, 0, width, self.cmam_height)];
    leftLabel.text = text;
    leftLabel.textColor = color;
    leftLabel.font = FONT (font);
    self.leftView = leftLabel;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)wya_setRightButtonWithView:(UIButton *)button
{
    self.rightView = button;
    self.rightViewMode = UITextFieldViewModeAlways;
}

- (void)wya_setLeftViewImageWithImageNamed:(NSString *)imageNamed
{
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
    self.leftView = imageView;
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (void)wya_setRightViewImageWithImageNamed:(NSString *)imageNamed
{
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
    self.rightView = imageView;
    self.rightViewMode = UITextFieldViewModeWhileEditing;
}
- (void)wya_setTextFiledTypeStyleLineWithColor:(UIColor *)color
{
    UIView * lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor wya_hex:@"#e8e8e8"];
    [self addSubview:lineView];
    lineView.cmam_left = 0;
    lineView.cmam_width = self.cmam_width;
    lineView.cmam_height = 1;
    lineView.cmam_bottom = self.cmam_height + 10 * SizeAdapter;
}
- (void)wya_setUserNameTextFiledTextColor:(UIColor *)color FontSize:(CGFloat)font backGroundColor:(UIColor *)backGroundColor
{
    self.borderStyle = UITextBorderStyleNone;
    self.backgroundColor = backGroundColor;
    self.textColor = color;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.keyboardType = UIKeyboardTypeDefault;
    self.returnKeyType = UIReturnKeyNext;
    self.font = FONT (font);
}
- (void)wya_setPasswordTextFiledTextColor:(UIColor *)color FontSize:(CGFloat)font backGroundColor:(UIColor *)backGroundColor
{
    self.font = FONT (font);
    self.borderStyle = UITextBorderStyleNone;
    self.backgroundColor = backGroundColor;
    self.textColor = color;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.keyboardType = UIKeyboardTypeDefault;
    self.returnKeyType = UIReturnKeyGo;
    self.secureTextEntry = YES;
}
@end