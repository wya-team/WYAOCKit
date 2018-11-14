//
//  WYAVideoPlayerControlView.h
//  VideoDemo
//
//  Created by 李世航 on 2018/5/28.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYAVideoItem.h"

@protocol VideoControlDelegate <NSObject>

- (void)videoControl:(UIView *)videoControl backButton:(UIButton *)backButton;

- (void)videoControl:(UIView *)videoControl likeButton:(UIButton *)likeButton;

- (void)videoControl:(UIView *)videoControl downloadButton:(UIButton *)downloadButton;

- (void)videoControl:(UIView *)videoControl PlayButton:(UIButton *)playButton;

- (void)videoControl:(UIView *)videoControl SlideBegin:(UISlider *)slide;

- (void)videoControl:(UIView *)videoControl SlideChange:(UISlider *)slide;

- (void)videoControl:(UIView *)videoControl SlideEnd:(UISlider *)slide;

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

- (void)getCurrentTime:(NSInteger)currentTime TotalTime:(NSInteger)totalTime SlideValue:(CGFloat)slideValue;

- (void)getDragTime:(NSInteger)dragTime AutoPlay:(BOOL)autoPlay;

- (void)playerEnd;

- (void)resetVideoPlayControl;

@end
