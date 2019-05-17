//
//  ImagePicker.h
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/25.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
#import "WYAPhotoBrowserModel.h"

@interface WYAPhotoBrowserManager : NSObject

@property (nonatomic, strong) PHCachingImageManager * cachingManager;

+(instancetype)sharedPhotoBrowserManager;

/**
 设置是否升序排列

 @param ascending 升序
 */
- (void)setSortAscending:(BOOL)ascending;

/**
 在全部照片中获取指定个数、排序方式的部分照片，获取所有的图片以及视频

 @param ascending 升序
 @param limit 想要取得照片或视频的个数
 @param allowSelectVideo 是否可以选择视频
 @param allowSelectImage 是否可以选择图片
 @param allowSelectGif 是否可以选择GIF
 @param allowSelectLivePhoto 是否可以选择LivePhoto
 @return array
 */
- (NSArray<WYAPhotoBrowserModel *> *)getAllAssetInPhotoAlbumWithAscending:(BOOL)ascending
                                                               limitCount:(NSInteger)limit
                                                         allowSelectVideo:(BOOL)allowSelectVideo
                                                         allowSelectImage:(BOOL)allowSelectImage
                                                           allowSelectGif:(BOOL)allowSelectGif
                                                     allowSelectLivePhoto:(BOOL)allowSelectLivePhoto;



/**
 获取相机胶卷相册列表对象

 @param allowSelectVideo 是否可以选择视频
 @param allowSelectImage 是否可以选择图片
 @return WYAPhotoBrowserAlbumModel
 */
- (WYAPhotoBrowserAlbumModel *)getCameraRollAlbumList:(BOOL)allowSelectVideo
                                     allowSelectImage:(BOOL)allowSelectImage;



/**
 block 获取相机胶卷相册列表对象

 @param allowSelectVideo 是否可以选择视频
 @param allowSelectImage 是否可以选择图片
 @param complete 完成回调
 */
- (void)getCameraRollAlbumList:(BOOL)allowSelectVideo
              allowSelectImage:(BOOL)allowSelectImage
                      complete:(void (^)(WYAPhotoBrowserAlbumModel *album))complete;


/**
 获取用户所有相册列表

 @param allowSelectVideo 是否可以选择视频
 @param allowSelectImage 是否可以选择图片
 @param complete 完成回调
 */
- (void)getPhotoAblumList:(BOOL)allowSelectVideo
         allowSelectImage:(BOOL)allowSelectImage
                 complete:(void (^)(NSArray<WYAPhotoBrowserAlbumModel *> *))complete;


/**
 将result中对象转换成WYAPhotoBrowserModel

 @param result 查询图片或视频的集合
 @param allowSelectVideo 是否可以选择视频
 @param allowSelectImage 是否可以选择图片
 @param allowSelectGif 是否可以选择GIF
 @param allowSelectLivePhoto 是否可以选择LivePhoto
 @return array
 */
- (NSArray<WYAPhotoBrowserModel *> *)getPhotoInResult:(PHFetchResult<PHAsset *> *)result
                                     allowSelectVideo:(BOOL)allowSelectVideo
                                     allowSelectImage:(BOOL)allowSelectImage
                                       allowSelectGif:(BOOL)allowSelectGif
                                 allowSelectLivePhoto:(BOOL)allowSelectLivePhoto;


/**
 获取选中的图片

 @param model model
 @param isOriginal 是否原图
 @param allowSelectGif 是否可以选择GIF
 @param completion 完成回调
 */
- (void)requestSelectedImageForAsset:(WYAPhotoBrowserModel *)model
                          isOriginal:(BOOL)isOriginal
                      allowSelectGif:(BOOL)allowSelectGif
                          completion:(void (^)(UIImage *, NSDictionary *))completion;


/**
 获取原图data，转换gif图

 @param asset 资源
 @param progressHandler 进度回调
 @param completion 完成回调
 */
- (void)requestOriginalImageDataForAsset:(PHAsset *)asset
                         progressHandler:(void (^ _Nullable)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler
                              completion:(void (^)(NSData *, NSDictionary *))completion;

/**
 * @brief 获取原图
 */
- (void)requestOriginalImageForAsset:(PHAsset *)asset progressHandler:(void (^ _Nullable)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler completion:(void (^)(UIImage *, NSDictionary *))completion;

/**
 * @brief 根据传入size获取图片
 */
- (PHImageRequestID)requestImageForAsset:(PHAsset *)asset size:(CGSize)size progressHandler:(void (^ _Nullable)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler completion:(void (^)(UIImage *, NSDictionary *))completion;


/**
 * @brief 获取live photo
 */
- (void)requestLivePhotoForAsset:(PHAsset *)asset completion:(void (^)(PHLivePhoto *livePhoto, NSDictionary *info))completion;

/**
 * @brief 获取视频
 */
- (void)requestVideoForAsset:(PHAsset *)asset completion:(void (^)(AVPlayerItem *item, NSDictionary *info))completion;
- (void)requestVideoForAsset:(PHAsset *)asset progressHandler:(void (^)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler completion:(void (^)(AVPlayerItem *item, NSDictionary *info))completion;

- (void)startCacheAssetWithArray:(NSMutableArray<PHAsset *> *)array size:(CGSize)size;
- (void)stopCacheAssetWithArray:(NSMutableArray<PHAsset *> *)array size:(CGSize)size;
- (void)stopAllCacheAsset;
@end
