//
//  WYAVideoPlayerControlView.h
//  VideoDemo
//
//  Created by 李世航 on 2018/5/28.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYAVideoItem.h"

@class WYAVideoSlider;

@protocol VideoControlDelegate <NSObject>

- (void)videoControl:(UIView *)videoControl backButton:(UIButton *)backButton;

- (void)videoControl:(UIView *)videoControl likeButton:(UIButton *)likeButton;

- (void)videoControl:(UIView *)videoControl downloadButton:(UIButton *)downloadButton;

- (void)videoControl:(UIView *)videoControl PlayButton:(UIButton *)playButton;

- (void)videoControl:(UIView *)videoControl SlideBegin:(WYAVideoSlider *)slide;

- (void)videoControl:(UIView *)videoControl SlideChange:(WYAVideoSlider *)slide;

- (void)videoControl:(UIView *)videoControl SlideEnd:(WYAVideoSlider *)slide;

- (void)videoControl:(UIView *)videoControl zoomButton:(UIButton *)zoomButton;

@end


@interface WYAVideoPlayerControlView : UIView


/**
 放大按钮
 */
@property (nonatomic, strong) UIButton *zoomButton;

@property (nonatomic, weak) id<VideoControlDelegate> videoControlDelegate;

/**
 是否需要单击手势
 */
@property (nonatomic, assign) BOOL oneFingerClick;

- (instancetype)initWithPlayItem:(WYAVideoItem *)item;

/**
 设置当前显示时长

 @param currentTime 当前时长
 @param totalTime 总时长
 @param slideValue 进度值
 */
- (void)getCurrentTime:(NSInteger)currentTime TotalTime:(NSInteger)totalTime SlideValue:(CGFloat)slideValue;

/**
 快进、快退

 @param dragTime 时间点
 @param autoPlay 是否自动播放
 */
- (void)getDragTime:(NSInteger)dragTime AutoPlay:(BOOL)autoPlay;

/**
 设置按钮为结束状态
 */
- (void)playerEnd;

/**
 重置控制栏内容
 */
- (void)resetVideoPlayControl;

/**
 设置当前缓冲进度

 @param progress 进度
 */
- (void)wya_playerSetProgress:(CGFloat)progress;
@end
