//
//  WYAVideoPlayerView.h
//  VideoDemo
//
//  Created by 李世航 on 2018/5/28.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//
//  推荐宽高比例为9：16

#import "WYAVideoItem.h"
#import <UIKit/UIKit.h>

// 播放器的几种状态
typedef NS_ENUM(NSInteger, PlayerStatus) {
    PlayerStateFailed,    // 播放失败
    PlayerStateBuffering, // 缓冲中
    PlayerStatePlaying,   // 播放中
    PlayerStateStopped,   // 停止播放
    PlayerStatePause      // 暂停播放
};

@protocol WYAVideoPlayerDelegate <NSObject>
@required
/**
 全屏切换的事件

 @param playerView self
 @param fullScreen 是否是全屏状态
 */
- (void)wya_playerView:(UIView *)playerView isfullScreen:(BOOL)fullScreen;

@end

/**
 目前只适用frame布局
 */
@interface WYAVideoPlayerView : UIView

@property (nonatomic, weak) id<WYAVideoPlayerDelegate> playerDelegate;
/// 获取视频当前的状态
@property (nonatomic, assign, readonly) PlayerStatus status;
@property (nonatomic, strong) WYAVideoItem * videoItem;
/**
 是否需要单击手势（用来触发控制栏的）
 */
//@property (nonatomic, assign) BOOL needOneClick;

/**
 重置需要重新配置播放信息（pop时需调用此方法，关闭视频）
 */
- (void)wya_resetPlayer;
@end
