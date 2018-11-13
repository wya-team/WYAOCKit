//
//  WYAVideoPlayerView.h
//  VideoDemo
//
//  Created by 李世航 on 2018/5/28.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYAVideoItem.h"

// 播放器的几种状态
typedef NS_ENUM(NSInteger, PlayerStatus) {
    PlayerStateFailed,    // 播放失败
    PlayerStateBuffering, // 缓冲中
    PlayerStatePlaying,   // 播放中
    PlayerStateStopped,   // 停止播放
    PlayerStatePause      // 暂停播放
};

@protocol VideoPlayerDelegate <NSObject>

- (void)playerView:(UIView *)playerView backButton:(UIButton *)backButton;
//视频播放结束
- (void)videoEnd;

@end

/**
 目前只适用frame布局
 */
@interface WYAVideoPlayerView : UIView

@property (nonatomic, weak) id<VideoPlayerDelegate> playerDelegate;

@property (nonatomic, assign, readonly) PlayerStatus status;

/**
 是否需要单击手势（用来触发控制栏的）
 */
@property (nonatomic, assign) BOOL needOneClick;

- (void)registerPlayerItem:(WYAVideoItem *)item;

/**
 重置需要重新配置播放信息
 */
- (void)resetPlayer;

/**
 恢复播放器初始位置(需要在全屏状态下才可以调用)
 */
- (void)RestorePlayerToOriginalFrame;
@end
