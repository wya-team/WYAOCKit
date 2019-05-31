//
//  UIView+WYACircleLoading.h
//  AFNetworking
//
//  Created by 李雪峰 on 2019/5/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WYACircleLoading)
- (void)drawCircleAnimate;
- (void)drawCircleAnimateWithWidth:(CGFloat)width;
- (void)drawCircleAnimateWithWidth:(CGFloat)width isLeft:(BOOL)isLeft;
- (void)drawCircleAnimateWithFrame:(CGRect)frame;

- (void)hideCircle;
@end

NS_ASSUME_NONNULL_END
