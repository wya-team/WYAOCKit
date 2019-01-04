# WYAVideoPlayer

## 功能

视频播放(需要在初始化前传递frame)

## 属性

- WYAVideoPlayerView

属性 | 说明 | 类型 | 默认值
---|---|---|---
playerDelegate|事件代理|VideoPlayerDelegate|-
status|获取当前视频播放器的状态|PlayerStatus|-

- WYAVideoItem

属性 | 说明 | 类型 | 默认值
---|---|---|---
videoUrl|视频Url（必传）|NSURL|-
superView|父视图（必传）|UIView|-
rect|相对父视图的位置（必传）|CGRect|-
seekTime|从哪个时间点开始（单位：s）|NSInteger|0
seekToTimeAutoPlay|是否需要自动播放|BOOL|YES

## 代理方法

```objective-c
@required
/**
 全屏切换的事件

 @param playerView self
 @param fullScreen 是否是全屏状态
 */
- (void)wya_playerView:(UIView *)playerView isfullScreen:(BOOL)fullScreen;
```

## 方法

```objective-c
/**
 注册播放视频需要的信息

 @param item WYAVideoItem
 */
- (void)wya_registerPlayerItem:(WYAVideoItem *)item;
- 
/**
 重置需要重新配置播放信息（pop时需调用此方法，关闭视频）
 */
- (void)wya_resetPlayer;
```

## 基础用法

- 导入头文件

```objective-c
#import <WYAKit/WYAVideoItem.h>
#import <WYAKit/WYAVideoPlayerView.h>
```
- 设置相关属性
 
```objective-c
float hei               = 9.0 / 16.0 * ScreenWidth;
CGRect frame            = CGRectMake(0, WYATopHeight, ScreenWidth, hei);
WYAVideoItem * item     = [[WYAVideoItem alloc] init];
item.videoUrl           = [NSURL URLWithString:@"http://221.228.226.5/14/z/w/y/y/zwyyobhyqvmwslabxyoaixvyubmekc/sh.yinyuetai.com/4599015ED06F94848EBF877EAAE13886.mp4"];
item.superView             = self.view;
item.rect               = frame;
item.seekTime           = 10;
item.seekToTimeAutoPlay = YES;

self.playView                = [[WYAVideoPlayerView alloc] init];
self.playView.playerDelegate = self;
self.playView.frame          = frame;
[self.view addSubview:self.playView];

[self.playView wya_registerPlayerItem:item];
```

- 需要实现代理方法控制电池栏的变化

```objective-c
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    if (self.isFullScreen) {
        return UIStatusBarStyleLightContent;
    } else {
        return UIStatusBarStyleDefault;
    }
}

- (BOOL)shouldAutorotate
{
    return NO;
}

#pragma mark - VideoPlayerDelegate -
- (void)wya_playerView:(UIView *)playerView isfullScreen:(BOOL)fullScreen
{
    self.isFullScreen = fullScreen;
    [self setNeedsStatusBarAppearanceUpdate];
    if (fullScreen) {
        self.view.backgroundColor = [UIColor blackColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}
```

