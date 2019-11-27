//
//  MyVideoItem.m
//  VideoDemo
//
//  Created by 李世航 on 2018/5/28.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAVideoItem.h"

@implementation WYAVideoItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        _videoStyle = WYAVideoStyleSingle;
        _seekTime           = 0;
        _seekToTimeAutoPlay = YES;
        _autoNeedReplay     = NO;
    }
    return self;
}

@end
