//
//  WYAVideoItem.h
//
//  Created by 李世航 on 2018/5/28.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WYAVideoStyle) {
    WYAVideoStyleSingle, // 在控制器中只有一个视频的
    WYAVideoStyleCell, // 在tableView和collectionView中使用
};

@interface WYAVideoItem : NSObject
@property (nonatomic, assign) WYAVideoStyle videoStyle;
/// 视频url（必传属性）
@property (nonatomic, strong) NSURL * videoUrl;
/// 父视图（必传属性）
@property (nonatomic, strong) UIView * superView;
/// 位置（必传属性）
@property (nonatomic, assign) CGRect rect;
/// 从哪个时间点开始（单位：s）
@property (nonatomic, assign) NSInteger seekTime;
/// 是否需要自动播放
@property (nonatomic, assign) BOOL seekToTimeAutoPlay;
/// 是否需要自动重播
@property (nonatomic, assign) BOOL autoNeedReplay;
@end
