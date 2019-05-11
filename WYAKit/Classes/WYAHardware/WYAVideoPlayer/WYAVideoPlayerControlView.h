//
//  WYAVideoPlayerControlView.h
//  VideoDemo
//
//  Created by 李世航 on 2018/5/28.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAVideoItem.h"
#import <UIKit/UIKit.h>

@class WYAVideoSlider;

@protocol VideoControlDelegate <NSObject>

/**
 返回事件

 @param videoControl self
 @param backButton 返回按钮
 */
- (void)videoControl:(UIView *)videoControl backButton:(UIButton *)backButton;

- (void)videoControl:(UIView *)videoControl likeButton:(UIButton *)likeButton;

- (void)videoControl:(UIView *)videoControl downloadButton:(UIButton *)downloadButton;

/**
 播放事件

 @param videoControl self
 @param playButton 播放按钮
 */
- (void)videoControl:(UIView *)videoControl PlayButton:(UIButton *)playButton;

/**
 滑动条开始触摸事件

 @param videoControl self
 @param slide WYAVideoSlider
 */
- (void)videoControl:(UIView *)videoControl SlideBegin:(WYAVideoSlider *)slide;

/**
 滑动条数值改变事件

 @param videoControl self
 @param slide WYAVideoSlider
 */
- (void)videoControl:(UIView *)videoControl SlideChange:(WYAVideoSlider *)slide;

/**
 滑动条结束滑动事件

 @param videoControl self
 @param slide WYAVideoSlider
 */
- (void)videoControl:(UIView *)videoControl SlideEnd:(WYAVideoSlider *)slide;

/**
 放大缩小按钮事件（这里指全屏）

 @param videoControl self
 @param zoomButton 放大缩小按钮
 */
- (void)videoControl:(UIView *)videoControl zoomButton:(UIButton *)zoomButton;

/**
 网络重试按钮点击事件

 @param videoControl self
 */
- (void)videoControlRetry:(UIView *)videoControl;

/**
 继续播放按钮点击事件（网络切换时出现的按钮）

 @param videoControl self
 */
- (void)videoControlGoOn:(UIView *)videoControl;
@end

@interface WYAVideoPlayerControlView : UIView
/// 放大按钮
@property (nonatomic, strong) UIButton * zoomButton;
/// 返回按钮
@property (nonatomic, strong) UIButton * backButton;
@property (nonatomic, weak) id<VideoControlDelegate> videoControlDelegate;
/// 是否需要单击手势
@property (nonatomic, assign) BOOL oneFingerClick;

/**
 初始化

 @param item 模型
 @return self
 */
- (instancetype)initWithPlayItem:(WYAVideoItem *)item;

/**
 设置当前显示时长

 @param currentTime 当前时长
 @param totalTime 总时长
 @param slideValue 进度值
 */
- (void)getCurrentTime:(NSInteger)currentTime
             TotalTime:(NSInteger)totalTime
            SlideValue:(CGFloat)slideValue;

/**
 快进、快退

 @param dragTime 时间点
 @param autoPlay 是否自动播放
 @param fastForward YES为快进，NO为快退
 @param hiddenFastView 是否隐藏快进快退图
 */
- (void)getDragTime:(NSInteger)dragTime
           AutoPlay:(BOOL)autoPlay
        FastForward:(BOOL)fastForward
     HiddenFastView:(BOOL)hiddenFastView;

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

- (void)playFail;
@end
