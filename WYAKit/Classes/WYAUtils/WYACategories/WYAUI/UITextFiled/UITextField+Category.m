//
//  UITextField+Category.m
//  WYASDProject
//
//  Created by 李俊恒 on 2018/7/20.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UITextField+Category.h"

@implementation UITextField (Category)
- (void)wya_setPlaceholedr:(NSString *)placeholedr color:(UIColor *)color font:(CGFloat)font {
    self.placeholder = placeholedr;
    [self setValue:[UIColor wya_hex:@"#cccccc"] forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:FONT(font) forKeyPath:@"_placeholderLabel.font"];
}
- (void)wya_setLeftViewWithText:(NSString *)text textColor:(UIColor *)color font:(CGFloat)font {
    CGFloat width       = [UILabel getWidthWithTitle:text font:FONT(font)];
    UILabel * leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, self.cmam_height)];
    leftLabel.text      = text;
    leftLabel.textColor = color;
    leftLabel.font      = FONT(font);
    self.leftView       = leftLabel;
    self.leftViewMode   = UITextFieldViewModeAlways;
}

- (void)wya_setRightButtonWithView:(UIButton *)button {
    self.rightView     = button;
    self.rightViewMode = UITextFieldViewModeAlways;
}
- (void)wya_setLeftViewWithView:(UIView *)view {
    self.leftView     = view;
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (void)wya_setLeftViewImageWithImageNamed:(NSString *)imageNamed {
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
    self.leftView           = imageView;
    self.leftViewMode       = UITextFieldViewModeAlways;
}
- (void)wya_setRightViewImageWithImageNamed:(NSString *)imageNamed {
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
    self.rightView          = imageView;
    self.rightViewMode      = UITextFieldViewModeWhileEditing;
}
- (void)wya_setTextFiledTypeStyleLineWithColor:(UIColor *)color {
    UIView * lineView        = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor wya_hex:@"#e8e8e8"];
    [self addSubview:lineView];
    lineView.cmam_left   = 0;
    lineView.cmam_width  = self.cmam_width;
    lineView.cmam_height = 1;
    lineView.cmam_bottom = self.cmam_height + 10 * SizeAdapter;
}
- (void)wya_setUserNameTextFiledTextColor:(UIColor *)color
                                 FontSize:(CGFloat)font
                          backGroundColor:(UIColor *)backGroundColor {
    self.borderStyle     = UITextBorderStyleNone;
    self.backgroundColor = backGroundColor;
    self.textColor       = color;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.keyboardType    = UIKeyboardTypeDefault;
    self.returnKeyType   = UIReturnKeyNext;
    self.font            = FONT(font);
}
- (void)wya_setPasswordTextFiledTextColor:(UIColor *)color
                                 FontSize:(CGFloat)font
                          backGroundColor:(UIColor *)backGroundColor {
    self.font            = FONT(font);
    self.borderStyle     = UITextBorderStyleNone;
    self.backgroundColor = backGroundColor;
    self.textColor       = color;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.keyboardType    = UIKeyboardTypeDefault;
    self.returnKeyType   = UIReturnKeyGo;
    self.secureTextEntry = YES;
}
@end

@implementation UITextField (Property)
- (UITextField *(^)(NSString *))setupText {
    return ^UITextField *(NSString * text){
        self.text = text;
        return self;
    };
}

- (UITextField *(^)(UIColor *))setupTextColor {
    return ^UITextField *(UIColor * textColor){
        self.textColor = textColor;
        return self;
    };
}

- (UITextField *(^)(CGFloat))setupSystemFontSize {
    return ^UITextField *(CGFloat fontSize){
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (UITextField *(^)(NSTextAlignment))setupTextAlignment {
    return ^UITextField *(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}

- (UITextField *(^)(NSString *))setupPlaceholder {
    return ^UITextField *(NSString *text){
        self.placeholder = text;
        return self;
    };
}

- (UITextField *(^)(UIKeyboardType))setupKeyBoardType {
    return ^UITextField *(UIKeyboardType type){
        self.keyboardType = type;
        return self;
    };
}

- (UITextField *(^)(UITextBorderStyle))setupBorderStyle {
    return ^UITextField *(UITextBorderStyle style){
        self.borderStyle = style;
        return self;
    };
}

- (UITextField *(^)(BOOL))setupSecureTextEntry{
    return ^UITextField *(BOOL isSecure){
        self.secureTextEntry = isSecure;
        return self;
    };
}

- (UITextField *(^)(BOOL))setupClearsOnBeginEditing{
    return ^UITextField *(BOOL clear){
        self.clearsOnBeginEditing = clear;
        return self;
    };
}

- (UITextField *(^)(id))setupDelegate{
    return ^UITextField *(id obj){
        self.delegate = obj;
        return self;
    };
}

- (UITextField *(^)(UITextFieldViewMode))setupClearButtonMode{
    return ^UITextField *(UITextFieldViewMode mode){
        self.clearButtonMode = mode;
        return self;
    };
}

- (UITextField *(^)(UIView *))setupLeftView{
    return ^UITextField *(UIView * view){
        self.leftView = view;
        return self;
    };
}

- (UITextField *(^)(UITextFieldViewMode))setupLeftViewMode{
    return ^UITextField *(UITextFieldViewMode mode){
        self.leftViewMode = mode;
        return self;
    };
}

- (UITextField *(^)(UIView *))setupRightView{
    return ^UITextField *(UIView * view){
        self.rightView = view;
        return self;
    };
}

- (UITextField *(^)(UITextFieldViewMode))setupRightViewMode{
    return ^UITextField *(UITextFieldViewMode mode){
        self.rightViewMode = mode;
        return self;
    };
}

@end

@implementation UITextField (Action)

- (void)wya_addTextChangeWithEvent:(UIControlEvents)event
                        textHandle:(void (^)(UITextField * text))textHandle {
    objc_setAssociatedObject(self, @"WYATextFieldBlock", textHandle,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(textChange:) forControlEvents:event];
}

- (void)textChange:(UITextField *)textField {
    void (^textH)(UITextField * textField) = objc_getAssociatedObject(self, @"WYATextFieldBlock");
    if (textH) { textH(textField); }
}

@end
