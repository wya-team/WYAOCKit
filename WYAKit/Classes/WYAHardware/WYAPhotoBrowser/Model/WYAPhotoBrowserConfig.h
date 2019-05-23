//
//  WYAPhotoBrowserConfig.h
//  WYAKit
//
//  Created by 李世航 on 2019/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//导出视频类型
typedef NS_ENUM(NSUInteger, WYAExportVideoType) {
    //default
    WYAExportVideoTypeMov,
    WYAExportVideoTypeMp4,
};

@interface WYAPhotoBrowserConfig : NSObject

/// 最大可以选择多少个
@property (nonatomic, assign) NSInteger maxSelectCount;
/// 是否允许选择照片 默认YES
@property (nonatomic, assign) BOOL allowSelectImage;
/// 是否允许选择视频 默认YES
@property (nonatomic, assign) BOOL allowSelectVideo;
/// 是否允许选择Gif，只是控制是否选择，并不控制是否显示，如果为NO，则不显示gif标识 默认YES
@property (nonatomic, assign) BOOL allowSelectGif;
/// 是否允许选择Live Photo，只是控制是否选择，并不控制是否显示，如果为NO，则不显示Live Photo标识 默认NO (ios9 以上系统支持)
@property (nonatomic, assign) BOOL allowSelectLivePhoto;
/// 是否允许选择原图，默认NO
@property (nonatomic, assign) BOOL allowSelectOriginal;
/// 编辑视频时最大裁剪时间，单位：秒，默认10s 且最低10s (当该参数为10s时，所选视频时长必须大于等于10s才允许进行编辑)
@property (nonatomic, assign) NSInteger maxEditVideoTime;
/// 允许选择视频的最大时长，单位：秒， 默认 120s
@property (nonatomic, assign) NSInteger maxVideoDuration;
/// 录制视频及编辑视频时候的视频导出格式，默认WYAExportVideoTypeMov
@property (nonatomic, assign) WYAExportVideoType exportVideoType;
/**
 默认配置

 @return self
 */
+ (instancetype)defaultPhotoBrowserConfig;
@end

NS_ASSUME_NONNULL_END
