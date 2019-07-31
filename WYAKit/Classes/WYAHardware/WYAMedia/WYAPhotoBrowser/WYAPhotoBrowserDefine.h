//
//  WYAPhotoBrowserDefine.h
//  WYAKit
//
//  Created by 李世航 on 2019/7/22.
//

#ifndef WYAPhotoBrowserDefine_h
#define WYAPhotoBrowserDefine_h

typedef NS_ENUM(NSUInteger, WYAAssetMediaType) {
    WYAAssetMediaTypeUnknown,
    WYAAssetMediaTypeImage,
    WYAAssetMediaTypeGif,
    WYAAssetMediaTypeLivePhoto,
    WYAAssetMediaTypeVideo,
    WYAAssetMediaTypeAudio,
    WYAAssetMediaTypeNetImage,
    WYAAssetMediaTypeNetVideo,
};

//导出视频类型
typedef NS_ENUM(NSUInteger, WYAExportVideoType) {
    //default
    WYAExportVideoTypeMov,
    WYAExportVideoTypeMp4,
};

//导出视频水印位置
typedef NS_ENUM(NSUInteger, WYAWatermarkLocation) {
    WYAWatermarkLocationTopLeft,
    WYAWatermarkLocationTopRight,
    WYAWatermarkLocationCenter,
    WYAWatermarkLocationBottomLeft,
    WYAWatermarkLocationBottomRight,
};

#define kInfoDict [NSBundle mainBundle].localizedInfoDictionary ?: [NSBundle mainBundle].infoDictionary
#define kAPPName [kInfoDict valueForKey:@"CFBundleDisplayName"] ?: [kInfoDict valueForKey:@"CFBundleName"]

#endif /* WYAPhotoBrowserDefine_h */
