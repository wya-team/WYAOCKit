//
//  WYAProgress.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAProgressView : UIView

/**
 背景图片
 */
@property (nonatomic, strong) UIImage * backGroundImage;

/**
 背景线的颜色
 */
@property (nonatomic, strong) UIColor * trackTintColor;

/**
 填充线的颜色
 */
@property (nonatomic, strong) UIColor * progressTintColor;

/**
 线宽
 */
@property (nonatomic, assign) CGFloat borderWidth;

/**
 进度（0~1）
 */
@property (nonatomic, assign) CGFloat progress;

/**
 设置进度
 
 @param progress 进度
 @param animation 是否动画
 */
- (void)wya_setProgress:(CGFloat)progress Animation:(BOOL)animation;

@end

NS_ASSUME_NONNULL_END
