//
//  WYAPhotoBrowserModel.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/15.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

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

@interface WYAPhotoBrowserModel : NSObject
/// 资源
@property (nonatomic, strong) PHAsset * asset;
/// asset类型
@property (nonatomic, assign) WYAAssetMediaType type;
/// 视频时长
@property (nonatomic, copy) NSString *duration;
/// 是否被选择
@property (nonatomic, assign) BOOL selected;
/// 网络/本地 图片url
@property (nonatomic, strong) NSURL *url ;
/// 图片
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, assign) BOOL needCover;

/**初始化model对象*/
+ (instancetype)modelWithAsset:(PHAsset *)asset type:(WYAAssetMediaType)type duration:(NSString *)duration;
//@property (nonatomic, strong) UIImage * cacheImage; //缓存图片
//@property (nonatomic, strong) UIImage * cropImage;  //裁剪过的图片
//@property (nonatomic, assign) BOOL selected;        //是否被选中
//@property (nonatomic, assign) BOOL isMaxCount;      //是否到最大个数
//@property (nonatomic, strong) NSURL * videoUrl;     //视频url

@end

@interface WYAPhotoBrowserAlbumModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) BOOL isCameraRoll;
@property (nonatomic, strong) PHFetchResult *result;
//相册第一张图asset对象
@property (nonatomic, strong) PHAsset *headImageAsset;

@property (nonatomic, strong) NSArray<WYAPhotoBrowserModel *> *models;
@property (nonatomic, strong) NSArray *selectedModels;
//待用
@property (nonatomic, assign) NSUInteger selectedCount;

@end

NS_ASSUME_NONNULL_END
