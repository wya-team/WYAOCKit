//
//  UIView+WYALoadingAnimate.h
//  AFNetworking
//
//  Created by 李雪峰 on 2019/5/30.
//

#import <UIKit/UIKit.h>
#import "WYALoadingHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WYALoadingAnimate) <CAAnimationDelegate>

//隐藏loading
- (void)hideWYALoading;

/**
 在view上绘制文字动画，字体和frame自适应，起始和结束颜色为默认
 
 @param text 文字
 */
- (void)drawWordAnimationWithText:(NSString *)text;

/**
 在view上绘制文字动画，字体和frame自适应，起始和结束颜色为默认
 
 @param text 文字
 @param fontSize 字体大小
 */
- (void)drawWordAnimationWithText:(NSString *)text fontSize:(CGFloat)fontSize;

/**
 在view上绘制文字动画，字体和frame自适应，起始和结束颜色为默认
 
 @param size 文字所占区域大小
 @param text 文字
 @param position 相对位置
 */
- (void)drawWordAnimationWithSize:(CGSize)size text:(NSString *)text position:(WYALoadingPosition)position;

/**
 在view上绘制文字动画，使用默认字体，设置字体大小
 @param size 文字所占区域大小
 @param text 文字
 @param fontSize 字体大小
 @param position 相对位置
 */
- (void)drawWordAnimationWithSize:(CGSize)size text:(NSString *)text fontSize:(CGFloat)fontSize position:(WYALoadingPosition)position;

/**
 在view上绘制文字动画，使用默认字体，设置字体大小
 @param size 文字所占区域大小
 @param text 文字
 @param fontSize 字体大小
 @param position 相对位置
 */
- (void)drawWordAnimationWithSize:(CGSize)size text:(NSString *)text fontSize:(CGFloat)fontSize position:(WYALoadingPosition)position startColor:(UIColor *)startColor endColor:(UIColor *)endColor;

/**
 在view上绘制文字动画，起始和结束颜色为默认
 
 @param size 文字所占区域大小
 @param text 文字
 @param font 字体
 */
- (void)drawWordAnimationWithSize:(CGSize)size text:(NSString *)text font:(UIFont *)font position:(WYALoadingPosition)position;

/**
 在view上绘制文字动画
 
 @param size 文字所占区域大小
 @param text 文字
 @param font 字体
 @param startColor 文字路径起始背景色
 @param endColor 文字路径描绘后的颜色
 */
- (void)drawWordAnimationWithSize:(CGSize)size text:(NSString *)text font:(UIFont *)font startColor:(UIColor *)startColor endColor:(UIColor *)endColor;

/**
 在view上绘制文字动画
 
 @param size 文字所占区域大小
 @param text 文字
 @param font 字体
 @param startColor 文字路径起始背景色
 @param endColor 文字路径描绘后的颜色
 */
- (void)drawWordAnimationWithSize:(CGSize)size text:(NSString *)text font:(UIFont *)font startColor:(UIColor *)startColor endColor:(UIColor *)endColor position:(WYALoadingPosition)position;

@end

NS_ASSUME_NONNULL_END
