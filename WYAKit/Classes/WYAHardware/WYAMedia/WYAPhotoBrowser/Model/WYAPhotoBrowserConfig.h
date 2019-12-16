//
//  WYAPhotoBrowserConfig.h
//  WYAKit
//
//  Created by 李世航 on 2019/5/22.
//

#import <Foundation/Foundation.h>
#import "WYAPhotoBrowserDefine.h"
NS_ASSUME_NONNULL_BEGIN

@interface WYAPhotoBrowserConfig : NSObject

/// 最大可以选择多少个
@property (nonatomic, assign) NSInteger maxSelectCount;
/// 是否是升序(NO: 从现在开始往之前的时间排， YES: 从之前往现在的时间排)
@property (nonatomic, assign) BOOL sortAscending;
/// 是否允许选择照片 默认YES
@property (nonatomic, assign) BOOL allowSelectImage;
/// 是否允许选择视频 默认YES
@property (nonatomic, assign) BOOL allowSelectVideo;
/// 是否允许选择Gif，只是控制是否选择，并不控制是否显示，如果为NO，则不显示gif标识 默认YES
@property (nonatomic, assign) BOOL allowSelectGif;
/// 是否允许选择Live Photo，只是控制是否选择，并不控制是否显示，如果为NO，则不显示Live Photo标识 默认NO (ios9 以上系统支持)
@property (nonatomic, assign) BOOL allowSelectLivePhoto;
/// 是否允许选择原图，默认NO,只是判断原图按钮是否显示(当允许选择了原图，又选中了视频，原图功能不会有效)
@property (nonatomic, assign) BOOL allowSelectOriginal;
/// 是否允许编辑图片，默认YES
@property (nonatomic, assign) BOOL allowEditImage;
/// 是否允许编辑视频，默认YES
@property (nonatomic, assign) BOOL allowEditVideo;
/// 是否允许相册中拍照
@property (nonatomic, assign) BOOL canTakePicture;
/// 是否可以同时选择图片或者视频
@property (nonatomic, assign) BOOL allowChoosePhotoAndVideo;

/// 编辑视频时最大裁剪时间，单位：秒，默认10s 且最低10s (当该参数为10s时，所选视频时长必须大于等于10s才允许进行编辑)
@property (nonatomic, assign) NSInteger maxEditVideoTime;
/// 允许选择视频的最大时长，单位：秒， 默认 10s
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
