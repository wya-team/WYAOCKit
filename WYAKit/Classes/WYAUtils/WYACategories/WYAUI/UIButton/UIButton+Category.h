//
//  UIButton+Category.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonActionCallBack)(UIButton * button);

@interface UIButton (Category)

- (void)addCallBackAction:(ButtonActionCallBack)action
         forControlEvents:(UIControlEvents)controlEvents;

- (void)addCallBackAction:(ButtonActionCallBack)action;

- (void)wya_gifImageWithSource:(NSArray<NSString *> *)source;

/**
 设置背景色

 @param color 颜色
 @param state state
 */
- (void)wya_setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state;

@end

@interface UIButton (EnlargeTouchArea)

/**
 *  扩大 UIButton 的點擊範圍
 *  控制上下左右的延長範圍
 *
 *  @param top    顶部
 *  @param right  右边
 *  @param bottom 底部
 *  @param left   左边
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top
                        right:(CGFloat)right
                       bottom:(CGFloat)bottom
                         left:(CGFloat)left;

/**
 设置图片在右，需先指定button.frame

 @param space 间距
 */
- (void)wya_setButtonImageLoctionRightWithSpace:(CGFloat)space;

/**
 设置图片在上，需先指定button.frame

 @param space 间距
 */
- (void)wya_setButtonImageLocationTopWithSpace:(CGFloat)space;

/**
 设置图片在下，需先指定button.frame

 @param space 间距
 */
- (void)wya_setButtonImageLocationBottomWithSpace:(CGFloat)space;

@end

/**
 链式语法调用，设置按钮属性
 example:
         UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
         [button.setupTitle(@"哈哈").
         setupTextColor([UIColor redColor], UIControlStateNormal).
         setupImage(@"aaa.jpg", UIControlStateNormal).
         setupSystemFontSize(15).
         setupBackgroundColor([UIColor blueColor]) addCallBackAction:^(UIButton *button) {

         }];
 */
@interface UIButton (Property)
/// 设置标题
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupTitle)(NSString * _Nullable text);
/// 设置按钮文字大小
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupSystemFontSize)(CGFloat fontSize);
/// 设置文字颜色
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupTextColor)(UIColor * _Nullable color, UIControlState state);
/// 设置背景颜色
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupBackgroundColor)(UIColor * _Nullable color);
/// 设置图片
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupImage)(NSString * _Nullable imageName, UIControlState state);
/// 设置背景图片
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupBackgroundImage)(UIImage * _Nullable image, UIControlState state);
/// 设置是否被选中
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupSelected)(BOOL selected);
/// 设置水平方向对齐方式
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupHorizontalAlignment)(UIControlContentHorizontalAlignment alignment);
/// 设置垂直方向对齐方式
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupVerticalAlignment)(UIControlContentVerticalAlignment alignment);
/// 设置文字边距
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupTitleEdgeInsets)(UIEdgeInsets edge);
/// 设置图片边距
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupImageEdgeInsets)(UIEdgeInsets edge);
/// 设置富文本
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupAttributedTitle)(NSAttributedString * _Nullable title);
/// 设置是否关闭用户交互
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupUserInteractionEnabled)(BOOL enable);
@end
