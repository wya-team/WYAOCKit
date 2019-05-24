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

@property (nonatomic, weak) PHCachingImageManager * cachingManager;

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
- (void)requestOriginalImageForAsset:(PHAsset *)asset
                     progressHandler:(void (^ _Nullable)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler
                          completion:(void (^)(UIImage *, NSDictionary *))completion;

/**
 * @brief 根据传入size获取图片
 */
- (PHImageRequestID)requestImageForAsset:(PHAsset *)asset
                                    size:(CGSize)size progressHandler:(void (^ _Nullable)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler
                              completion:(void (^)(UIImage *, NSDictionary *))completion;


/**
 * @brief 获取live photo
 */
- (void)requestLivePhotoForAsset:(PHAsset *)asset
                      completion:(void (^)(PHLivePhoto *livePhoto, NSDictionary *info))completion;

/**
 * @brief 获取视频
 */
- (void)requestVideoForAsset:(PHAsset *)asset
                  completion:(void (^)(AVPlayerItem *item, NSDictionary *info))completion;
- (void)requestVideoForAsset:(PHAsset *)asset
             progressHandler:(void (^)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler
                  completion:(void (^)(AVPlayerItem *item, NSDictionary *info))completion;

- (void)startCacheAssetWithArray:(NSMutableArray<PHAsset *> *)array size:(CGSize)size;
- (void)stopCacheAssetWithArray:(NSMutableArray<PHAsset *> *)array size:(CGSize)size;
- (void)stopAllCacheAsset;

#pragma mark - 编辑、导出视频相关

/**
 解析视频，获取每秒对应的一帧图片

 @param size 图片size
 */
- (void)analysisEverySecondsImageForAsset:(PHAsset *)asset interval:(NSTimeInterval)interval size:(CGSize)size complete:(void (^)(AVAsset *avAsset, NSArray<UIImage *> *images))complete;

/**
 导出编辑的片段视频并保存到相册

 @param range 需要到处的视频间隔
 */
- (void)exportEditVideoForAsset:(AVAsset *)asset range:(CMTimeRange)range type:(ZLExportVideoType)type complete:(void (^)(BOOL isSuc, PHAsset *asset))complete;


/**
 导出视频，视频压缩设置默认为 AVAssetExportPresetMediumQuality

 @param asset 需要导出视频的asset
 @param type 视频导出格式
 */
- (void)exportVideoForAsset:(PHAsset *)asset type:(ZLExportVideoType)type complete:(void (^)(NSString *exportFilePath, NSError *error))complete;

/**
 导出视频

 @param asset 需要导出视频的asset
 @param type 视频导出格式
 @param presetName 视频压缩设置
 */
- (void)exportVideoForAsset:(PHAsset *)asset type:(ZLExportVideoType)type presetName:(NSString *)presetName complete:(void (^)(NSString *exportFilePath, NSError *error))complete;


/**
 导出指定尺寸的视频，视频区域为以视频中心为中点（视频质量未压缩）

 @param asset 需要导出视频的asset
 @param type 视频导出格式
 @param renderSize 指定的尺寸大小
 */
- (void)exportVideoForAsset:(PHAsset *)asset type:(ZLExportVideoType)type renderSize:(CGSize)renderSize complete:(void (^)(NSString *exportFilePath, NSError *error))complete;

#pragma mark - 导出视频加水印、粒子效果
/**
 导出指定尺寸视频，并添加水印，视频区域为以视频中心为中点（视频质量未压缩）

 @discussion（由于文字水印在开发过程中遇到对同一个视频导出时候，有的文字显示，有的不显示的文字，所以暂不支持文字水印）

 @param asset 需要导出视频的asset
 @param type 视频导出格式
 @param renderSize 指定的尺寸大小，如要导出全尺寸视频，可将该值设置的大些如:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
 @param watermarkImage 水印图片
 @param location 水印位置
 @param imageSize 水印大小
 */
- (void)exportVideoForAsset:(PHAsset *)asset type:(ZLExportVideoType)type renderSize:(CGSize)renderSize watermarkImage:(UIImage *)watermarkImage watermarkLocation:(ZLWatermarkLocation)location imageSize:(CGSize)imageSize complete:(void (^)(NSString *exportFilePath, NSError *error))complete;


/**
 导出全尺寸视频，并添加水印（支持设置压缩系数）

 @param asset 需要导出视频的asset
 @param type 视频导出格式
 @param presetName 视频压缩设置
 @param watermarkImage 水印图片
 @param location 水印位置
 @param imageSize 水印大小
 */
- (void)exportVideoForAsset:(PHAsset *)asset type:(ZLExportVideoType)type presetName:(NSString *)presetName watermarkImage:(UIImage *)watermarkImage watermarkLocation:(ZLWatermarkLocation)location imageSize:(CGSize)imageSize complete:(void (^)(NSString *exportFilePath, NSError *error))complete;


/**
 给视频加粒子特效，目前仅支持粒子从屏幕上方向下发射，e.g.:下雪特效，需传入一张雪花图片。

 @param asset 需要导出视频的asset
 @param type 视频导出格式
 @param presetName 视频压缩设置
 @param effectImage 粒子图片（建议一倍图尺寸不超过200*200）
 @param birthRate 粒子每秒创建数量（建议30~50）
 @param velocity 粒子扩散速度
 */
- (void)exportVideoForAsset:(PHAsset *)asset type:(ZLExportVideoType)type presetName:(NSString *)presetName effectImage:(UIImage *)effectImage birthRate:(NSInteger)birthRate velocity:(CGFloat)velocity complete:(void (^)(NSString *exportFilePath, NSError *error))complete;


/**
 获取保存视频的路径
 */
- (NSString *)getVideoExportFilePath:(ZLExportVideoType)type;
@end
