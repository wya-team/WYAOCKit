//
//  WYAPhotoBrowserConfig.m
//  WYAKit
//
//  Created by 李世航 on 2019/5/22.
//

#import "WYAPhotoBrowserConfig.h"

@implementation WYAPhotoBrowserConfig

+ (instancetype)defaultPhotoBrowserConfig {
    WYAPhotoBrowserConfig * config = [WYAPhotoBrowserConfig new];
    config.maxSelectCount = 9;
    config.allowSelectImage = YES;
    config.allowSelectVideo = YES;
    config.allowSelectGif = YES;
    config.allowSelectLivePhoto = YES;
    config.allowSelectOriginal = NO;
    config.maxEditVideoTime = 10;
    config.maxVideoDuration = 120;
    config.exportVideoType = WYAExportVideoTypeMov;
    return config;
}

@end
