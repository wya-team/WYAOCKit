# WYAVideoPlayer
## 功能
视频播放

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
superV|父视图（必传）|UIView|-
rect|相对父视图的位置（必传）|CGRect|-
previewImage|预览图url（网络url）|NSString|-
seekTime|从哪个时间点开始（单位：s）|NSInteger|0
seekToTimeAutoPlay|是否需要自动播放|BOOL|YES

## 方法
```Object-C
/**
 注册播放视频需要的信息

 @param item WYAVideoItem
 */
- (void)wya_RegisterPlayerItem:(WYAVideoItem *)item;
```

## 基础用法
- 导入头文件

```
#import <WYAKit/WYAVideoItem.h>
#import <WYAKit/WYAVideoPlayerView.h>
```
- 设置相关属性
 
```Object-C
float hei = 9.0 / 16.0 * ScreenWidth;
CGRect frame = CGRectMake(0, (ScreenHeight - hei) / 2, ScreenWidth, hei);
WYAVideoItem *item = [[WYAVideoItem alloc] init];
item.videoUrl = [NSURL URLWithString:@"http://221.228.226.5/14/z/w/y/y/zwyyobhyqvmwslabxyoaixvyubmekc/sh.yinyuetai.com/4599015ED06F94848EBF877EAAE13886.mp4"];
item.superV = self.view;
item.rect = frame;
item.seekTime = 10;
item.seekToTimeAutoPlay = NO;

WYAVideoPlayerView * playView = [[WYAVideoPlayerView alloc] init];
playView.playerDelegate = self;
playView.frame = frame;
[self.view addSubview:playView];
[playView wya_RegisterPlayerItem:item];
```


