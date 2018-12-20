//
//  UIView+WYAAnimation.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WYAAnimation)

/**
 添加旋转动画

 @param angle 角度
 @param time 动画时间
 @param repeat 重复次数（0为无限次数）
 */
- (void)wya_setRotationAnimation:(CGFloat)angle time:(CGFloat)time repeatCount:(NSUInteger)repeat;

/**
 移除旋转动画
 */
- (void)wya_removeRotationAnimation;
@end

NS_ASSUME_NONNULL_END
