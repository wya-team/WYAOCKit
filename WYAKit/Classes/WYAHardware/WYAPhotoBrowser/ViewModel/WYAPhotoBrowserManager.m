//
//  ImagePicker.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/25.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAPhotoBrowserManager.h"

static BOOL _sortAscending;

@implementation WYAPhotoBrowserManager

+(instancetype)sharedPhotoBrowserManager{
    static WYAPhotoBrowserManager * manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[WYAPhotoBrowserManager alloc]init];
        //        manager.cachingManager = [[PHCachingImageManager alloc]init];
        //        manager.cachingManager.allowsCachingHighQualityImages = NO;
    });
    return manager;
}

- (void)setSortAscending:(BOOL)ascending
{
    _sortAscending = ascending;
}

- (BOOL)sortAscending
{
    return _sortAscending;
}

#pragma mark - 获取资源
- (NSArray<WYAPhotoBrowserModel *> *)getAllAssetInPhotoAlbumWithAscending:(BOOL)ascending limitCount:(NSInteger)limit allowSelectVideo:(BOOL)allowSelectVideo allowSelectImage:(BOOL)allowSelectImage allowSelectGif:(BOOL)allowSelectGif allowSelectLivePhoto:(BOOL)allowSelectLivePhoto
{
    PHFetchOptions *option = [[PHFetchOptions alloc] init];
    //ascending 为YES时，按照照片的创建时间升序排列;为NO时，则降序排列
    if (!ascending) option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:ascending]];
    PHFetchResult *result = [PHAsset fetchAssetsWithOptions:option];

    return [self getPhotoInResult:result allowSelectVideo:allowSelectVideo allowSelectImage:allowSelectImage allowSelectGif:allowSelectGif allowSelectLivePhoto:allowSelectLivePhoto limitCount:limit];
}

- (WYAPhotoBrowserAlbumModel *)getCameraRollAlbumList:(BOOL)allowSelectVideo allowSelectImage:(BOOL)allowSelectImage
{
    PHFetchOptions *option = [[PHFetchOptions alloc] init];
    if (!allowSelectVideo) option.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeImage];
    if (!allowSelectImage) option.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld",PHAssetMediaTypeVideo];
    if (!self.sortAscending) option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:self.sortAscending]];

    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];

    __block WYAPhotoBrowserAlbumModel *m;
    [smartAlbums enumerateObjectsUsingBlock:^(PHAssetCollection *  _Nonnull collection, NSUInteger idx, BOOL * _Nonnull stop) {
        //获取相册内asset result
        if (collection.assetCollectionSubtype == 209) {
            PHFetchResult<PHAsset *> *result = [PHAsset fetchAssetsInAssetCollection:collection options:option];
            m = [self getAlbumModeWithTitle:[self getCollectionTitle:collection] result:result allowSelectVideo:allowSelectVideo allowSelectImage:allowSelectImage];
            m.isCameraRoll = YES;
        }
    }];
    return m;
}

- (void)getCameraRollAlbumList:(BOOL)allowSelectVideo allowSelectImage:(BOOL)allowSelectImage complete:(void (^)(WYAPhotoBrowserAlbumModel *))complete
{
    if (complete) {
        complete([self getCameraRollAlbumList:allowSelectVideo allowSelectImage:allowSelectImage]);
    }
}

- (void)getPhotoAblumList:(BOOL)allowSelectVideo allowSelectImage:(BOOL)allowSelectImage complete:(void (^)(NSArray<WYAPhotoBrowserAlbumModel *> *))complete
{
    if (!allowSelectImage && !allowSelectVideo) {
        if (complete) complete(nil);
        return;
    }
    PHFetchOptions *option = [[PHFetchOptions alloc] init];
    if (!allowSelectVideo) option.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeImage];
    if (!allowSelectImage) option.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld",PHAssetMediaTypeVideo];
    if (!self.sortAscending) option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:self.sortAscending]];

    //获取所有智能相册
    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    PHFetchResult *streamAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumMyPhotoStream options:nil];
    PHFetchResult *userAlbums = [PHCollectionList fetchTopLevelUserCollectionsWithOptions:nil];
    PHFetchResult *syncedAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumSyncedAlbum options:nil];
    PHFetchResult *sharedAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumCloudShared options:nil];
    NSArray *arrAllAlbums = @[smartAlbums, streamAlbums, userAlbums, syncedAlbums, sharedAlbums];
    /**
     PHAssetCollectionSubtypeAlbumRegular         = 2,///
     PHAssetCollectionSubtypeAlbumSyncedEvent     = 3,////
     PHAssetCollectionSubtypeAlbumSyncedFaces     = 4,////面孔
     PHAssetCollectionSubtypeAlbumSyncedAlbum     = 5,////
     PHAssetCollectionSubtypeAlbumImported        = 6,////

     // PHAssetCollectionTypeAlbum shared subtypes
     PHAssetCollectionSubtypeAlbumMyPhotoStream   = 100,///
     PHAssetCollectionSubtypeAlbumCloudShared     = 101,///

     // PHAssetCollectionTypeSmartAlbum subtypes        //// collection.localizedTitle
     PHAssetCollectionSubtypeSmartAlbumGeneric    = 200,///
     PHAssetCollectionSubtypeSmartAlbumPanoramas  = 201,///全景照片
     PHAssetCollectionSubtypeSmartAlbumVideos     = 202,///视频
     PHAssetCollectionSubtypeSmartAlbumFavorites  = 203,///个人收藏
     PHAssetCollectionSubtypeSmartAlbumTimelapses = 204,///延时摄影
     PHAssetCollectionSubtypeSmartAlbumAllHidden  = 205,/// 已隐藏
     PHAssetCollectionSubtypeSmartAlbumRecentlyAdded = 206,///最近添加
     PHAssetCollectionSubtypeSmartAlbumBursts     = 207,///连拍快照
     PHAssetCollectionSubtypeSmartAlbumSlomoVideos = 208,///慢动作
     PHAssetCollectionSubtypeSmartAlbumUserLibrary = 209,///所有照片
     PHAssetCollectionSubtypeSmartAlbumSelfPortraits NS_AVAILABLE_IOS(9_0) = 210,///自拍
     PHAssetCollectionSubtypeSmartAlbumScreenshots NS_AVAILABLE_IOS(9_0) = 211,///屏幕快照
     PHAssetCollectionSubtypeSmartAlbumDepthEffect PHOTOS_AVAILABLE_IOS_TVOS(10_2, 10_1) = 212,///人像
     PHAssetCollectionSubtypeSmartAlbumLivePhotos PHOTOS_AVAILABLE_IOS_TVOS(10_3, 10_2) = 213,//livephotos
     PHAssetCollectionSubtypeSmartAlbumAnimated = 214,///动图
     = 1000000201///最近删除知道值为（1000000201）但没找到对应的TypedefName
     // Used for fetching, if you don't care about the exact subtype
     PHAssetCollectionSubtypeAny = NSIntegerMax /////所有类型
     */
    NSMutableArray<WYAPhotoBrowserAlbumModel *> *arrAlbum = [NSMutableArray array];
    for (PHFetchResult<PHAssetCollection *> *album in arrAllAlbums) {
        [album enumerateObjectsUsingBlock:^(PHAssetCollection * _Nonnull collection, NSUInteger idx, BOOL *stop) {
            //过滤PHCollectionList对象
            if (![collection isKindOfClass:PHAssetCollection.class]) return;
            //过滤最近删除和已隐藏
            if (collection.assetCollectionSubtype > 215 ||
                collection.assetCollectionSubtype == PHAssetCollectionSubtypeSmartAlbumAllHidden) return;
            //获取相册内asset result
            PHFetchResult<PHAsset *> *result = [PHAsset fetchAssetsInAssetCollection:collection options:option];
            if (!result.count) return;

            NSString *title = [self getCollectionTitle:collection];

            if (collection.assetCollectionSubtype == PHAssetCollectionSubtypeSmartAlbumUserLibrary) {
                //所有照片
                WYAPhotoBrowserAlbumModel *m = [self getAlbumModeWithTitle:title result:result allowSelectVideo:allowSelectVideo allowSelectImage:allowSelectImage];
                m.isCameraRoll = YES;
                [arrAlbum insertObject:m atIndex:0];
            } else {
                [arrAlbum addObject:[self getAlbumModeWithTitle:title result:result allowSelectVideo:allowSelectVideo allowSelectImage:allowSelectImage]];
            }
        }];
    }

    if (complete) complete(arrAlbum);
}

- (NSString *)getCollectionTitle:(PHAssetCollection *)collection
{
    if (collection.assetCollectionType == PHAssetCollectionTypeAlbum) {
        //用户相册
        return collection.localizedTitle;
    }

    NSString *title = nil;

    switch (collection.assetCollectionSubtype) {
        case PHAssetCollectionSubtypeSmartAlbumUserLibrary:
            title = @"所有照片";
            break;
        case PHAssetCollectionSubtypeSmartAlbumPanoramas:
            title = @"全景照片";
            break;
        case PHAssetCollectionSubtypeSmartAlbumVideos:
            title = @"视频";
            break;
        case PHAssetCollectionSubtypeSmartAlbumFavorites:
            title = @"个人收藏";
            break;
        case PHAssetCollectionSubtypeSmartAlbumTimelapses:
            title = @"延时摄影";
            break;
        case PHAssetCollectionSubtypeSmartAlbumRecentlyAdded:
            title = @"最近添加";
            break;
        case PHAssetCollectionSubtypeSmartAlbumBursts:
            title = @"连拍快照";
            break;
        case PHAssetCollectionSubtypeSmartAlbumSlomoVideos:
            title = @"慢动作";
            break;
        case PHAssetCollectionSubtypeSmartAlbumSelfPortraits:
            title = @"自拍";
            break;
        case PHAssetCollectionSubtypeSmartAlbumScreenshots:
            title = @"屏幕快照";
            break;
        case PHAssetCollectionSubtypeSmartAlbumDepthEffect:
            title = @"人像";
            break;
        case PHAssetCollectionSubtypeSmartAlbumLivePhotos:
            title = @"Live Photo";
            break;

        default:
            break;
    }

    if (@available(iOS 11, *)) {
        //            PHAssetCollectionSubtypeSmartAlbumAnimated 为动图，但是貌似苹果返回的结果有bug，动图的subtype值为 215，即PHAssetCollectionSubtypeSmartAlbumLongExposures
        if (collection.assetCollectionSubtype == 215) {
            title = @"动图";
        }
    }

    return title?:collection.localizedTitle;
}

//获取相册列表model
- (WYAPhotoBrowserAlbumModel *)getAlbumModeWithTitle:(NSString *)title result:(PHFetchResult<PHAsset *> *)result allowSelectVideo:(BOOL)allowSelectVideo allowSelectImage:(BOOL)allowSelectImage
{
    WYAPhotoBrowserAlbumModel *model = [[WYAPhotoBrowserAlbumModel alloc] init];
    model.title = title;
    model.count = result.count;
    model.result = result;
    if (self.sortAscending) {
        model.headImageAsset = result.lastObject;
    } else {
        model.headImageAsset = result.firstObject;
    }
    //为了获取所有asset gif设置为yes
    model.models = [ZLPhotoManager getPhotoInResult:result allowSelectVideo:allowSelectVideo allowSelectImage:allowSelectImage allowSelectGif:allowSelectImage allowSelectLivePhoto:allowSelectImage];

    return model;
}

#pragma mark ===== 根据照片数组对象获取对应photomodel数组
- (NSArray<WYAPhotoBrowserModel *> *)getPhotoInResult:(PHFetchResult<PHAsset *> *)result allowSelectVideo:(BOOL)allowSelectVideo allowSelectImage:(BOOL)allowSelectImage allowSelectGif:(BOOL)allowSelectGif allowSelectLivePhoto:(BOOL)allowSelectLivePhoto
{
    return [self getPhotoInResult:result allowSelectVideo:allowSelectVideo allowSelectImage:allowSelectImage allowSelectGif:allowSelectGif allowSelectLivePhoto:allowSelectLivePhoto limitCount:NSIntegerMax];
}

- (NSArray<WYAPhotoBrowserModel *> *)getPhotoInResult:(PHFetchResult<PHAsset *> *)result allowSelectVideo:(BOOL)allowSelectVideo allowSelectImage:(BOOL)allowSelectImage allowSelectGif:(BOOL)allowSelectGif allowSelectLivePhoto:(BOOL)allowSelectLivePhoto limitCount:(NSInteger)limit
{
    NSMutableArray<WYAPhotoBrowserModel *> *arrModel = [NSMutableArray array];
    __block NSInteger count = 1;
    [result enumerateObjectsUsingBlock:^(PHAsset * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        WYAAssetMediaType type = [self transformAssetType:obj];

        if (type == WYAAssetMediaTypeImage && !allowSelectImage) return;
        if (type == WYAAssetMediaTypeGif && !allowSelectImage) return;
        if (type == WYAAssetMediaTypeLivePhoto && !allowSelectImage) return;
        if (type == WYAAssetMediaTypeVideo && !allowSelectVideo) return;

        if (count == limit) {
            *stop = YES;
        }

        NSString *duration = [self getDuration:obj];

        [arrModel addObject:[WYAPhotoBrowserModel modelWithAsset:obj type:type duration:duration]];
        count++;
    }];
    return arrModel;
}

//系统mediatype 转换为 自定义type
- (WYAAssetMediaType)transformAssetType:(PHAsset *)asset
{
    switch (asset.mediaType) {
        case PHAssetMediaTypeAudio:
            return WYAAssetMediaTypeAudio;
        case PHAssetMediaTypeVideo:
            return WYAAssetMediaTypeVideo;
        case PHAssetMediaTypeImage:
            if ([[asset valueForKey:@"filename"] hasSuffix:@"GIF"])return WYAAssetMediaTypeGif;

            if (asset.mediaSubtypes == PHAssetMediaSubtypePhotoLive || asset.mediaSubtypes == 10) return WYAAssetMediaTypeLivePhoto;

            return WYAAssetMediaTypeImage;
        default:
            return WYAAssetMediaTypeUnknown;
    }
}

- (NSString *)getDuration:(PHAsset *)asset
{
    if (asset.mediaType != PHAssetMediaTypeVideo) return nil;

    NSInteger duration = (NSInteger)round(asset.duration);

    if (duration < 60) {
        return [NSString stringWithFormat:@"00:%02ld", duration];
    } else if (duration < 3600) {
        NSInteger m = duration / 60;
        NSInteger s = duration % 60;
        return [NSString stringWithFormat:@"%02ld:%02ld", m, s];
    } else {
        NSInteger h = duration / 3600;
        NSInteger m = (duration % 3600) / 60;
        NSInteger s = duration % 60;
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", h, m, s];
    }
}

- (void)requestOriginalImageDataForAsset:(PHAsset *)asset progressHandler:(void (^ _Nullable)(double, NSError *, BOOL *, NSDictionary *))progressHandler completion:(void (^)(NSData *, NSDictionary *))completion
{
    PHImageRequestOptions *option = [[PHImageRequestOptions alloc]init];
    option.networkAccessAllowed = YES;
    option.resizeMode = PHImageRequestOptionsResizeModeFast;
    option.progressHandler = progressHandler;
    [[PHImageManager defaultManager] requestImageDataForAsset:asset options:option resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
        BOOL downloadFinined = (![[info objectForKey:PHImageCancelledKey] boolValue] && ![info objectForKey:PHImageErrorKey]);
        if (downloadFinined && imageData) {
            if (completion) completion(imageData, info);
        }
    }];
}

- (void)requestSelectedImageForAsset:(WYAPhotoBrowserModel *)model isOriginal:(BOOL)isOriginal allowSelectGif:(BOOL)allowSelectGif completion:(void (^)(UIImage *, NSDictionary *))completion
{
    if (model.type == WYAAssetMediaTypeGif && allowSelectGif) {
        [self requestOriginalImageDataForAsset:model.asset progressHandler:nil completion:^(NSData *data, NSDictionary *info) {
            if (![[info objectForKey:PHImageResultIsDegradedKey] boolValue]) {
                UIImage *image = [ZLPhotoManager transformToGifImageWithData:data];
                if (completion) {
                    completion(image, info);
                }
            }
        }];
    } else {
        if (isOriginal) {
            [self requestOriginalImageForAsset:model.asset progressHandler:nil completion:completion];
        } else {
            CGFloat scale = 2;
            CGFloat width = MIN(kViewWidth, kMaxImageWidth);
            CGSize size = CGSizeMake(width*scale, width*scale*model.asset.pixelHeight/model.asset.pixelWidth);
            [self requestImageForAsset:model.asset size:size progressHandler:nil completion:completion];
        }
    }
}

- (void)requestOriginalImageForAsset:(PHAsset *)asset progressHandler:(void (^ _Nullable)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler completion:(void (^)(UIImage *, NSDictionary *))completion
{
    //    CGFloat scale = 4;
    //    CGFloat width = MIN(kViewWidth, kMaxImageWidth);
    //    CGSize size = CGSizeMake(width*scale, width*scale*asset.pixelHeight/asset.pixelWidth);
    //    [self requestImageForAsset:asset size:size resizeMode:PHImageRequestOptionsResizeModeFast completion:completion];
    [self requestImageForAsset:asset size:CGSizeMake(asset.pixelWidth, asset.pixelHeight) resizeMode:PHImageRequestOptionsResizeModeNone progressHandler:progressHandler completion:completion];
}

- (PHImageRequestID)requestImageForAsset:(PHAsset *)asset size:(CGSize)size progressHandler:(void (^)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler completion:(void (^)(UIImage *image, NSDictionary *info))completion
{
    return [self requestImageForAsset:asset size:size resizeMode:PHImageRequestOptionsResizeModeFast progressHandler:progressHandler completion:completion];
}

- (void)requestLivePhotoForAsset:(PHAsset *)asset completion:(void (^)(PHLivePhoto *livePhoto, NSDictionary *info))completion
{
    PHLivePhotoRequestOptions *option = [[PHLivePhotoRequestOptions alloc] init];
    option.version = PHImageRequestOptionsVersionCurrent;
    option.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
    option.networkAccessAllowed = YES;

    [[PHCachingImageManager defaultManager] requestLivePhotoForAsset:asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeAspectFit options:option resultHandler:^(PHLivePhoto * _Nullable livePhoto, NSDictionary * _Nullable info) {
        if (completion) completion(livePhoto, info);
    }];
}

- (void)requestVideoForAsset:(PHAsset *)asset completion:(void (^)(AVPlayerItem *item, NSDictionary *info))completion
{
    [self requestVideoForAsset:asset progressHandler:nil completion:completion];
}

- (void)requestVideoForAsset:(PHAsset *)asset progressHandler:(void (^)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler completion:(void (^)(AVPlayerItem *item, NSDictionary *info))completion
{
    PHVideoRequestOptions *option = [[PHVideoRequestOptions alloc] init];
    option.networkAccessAllowed = YES;
    option.progressHandler = ^(double progress, NSError *error, BOOL *stop, NSDictionary *info) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (progressHandler) {
                progressHandler(progress, error, stop, info);
            }
        });
    };
    [[PHCachingImageManager defaultManager] requestPlayerItemForVideo:asset options:option resultHandler:^(AVPlayerItem * _Nullable playerItem, NSDictionary * _Nullable info) {
        if (completion) completion(playerItem, info);
    }];
}

#pragma mark ====== 获取asset对应的图片
- (PHImageRequestID)requestImageForAsset:(PHAsset *)asset size:(CGSize)size resizeMode:(PHImageRequestOptionsResizeMode)resizeMode progressHandler:(void (^ _Nullable)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler completion:(void (^)(UIImage *, NSDictionary *))completion
{
    PHImageRequestOptions *option = [[PHImageRequestOptions alloc] init];
    /**
     resizeMode：对请求的图像怎样缩放。有三种选择：None，默认加载方式；Fast，尽快地提供接近或稍微大于要求的尺寸；Exact，精准提供要求的尺寸。
     deliveryMode：图像质量。有三种值：Opportunistic，在速度与质量中均衡；HighQualityFormat，不管花费多长时间，提供高质量图像；FastFormat，以最快速度提供好的质量。
     这个属性只有在 synchronous 为 true 时有效。
     */

    option.resizeMode = resizeMode;//控制照片尺寸
    //    option.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;//控制照片质量
    option.networkAccessAllowed = YES;

    option.progressHandler = progressHandler;

    /*
     info字典提供请求状态信息:
     PHImageResultIsInCloudKey：图像是否必须从iCloud请求
     PHImageResultIsDegradedKey：当前UIImage是否是低质量的，这个可以实现给用户先显示一个预览图
     PHImageResultRequestIDKey和PHImageCancelledKey：请求ID以及请求是否已经被取消
     PHImageErrorKey：如果没有图像，字典内的错误信息
     */

    return [[PHCachingImageManager defaultManager] requestImageForAsset:asset targetSize:size contentMode:PHImageContentModeAspectFill options:option resultHandler:^(UIImage * _Nullable image, NSDictionary * _Nullable info) {
        BOOL downloadFinined = ![[info objectForKey:PHImageCancelledKey] boolValue] && ![info objectForKey:PHImageErrorKey];
        //不要该判断，即如果该图片在iCloud上时候，会先显示一张模糊的预览图，待加载完毕后会显示高清图
        // && ![[info objectForKey:PHImageResultIsDegradedKey] boolValue]
        if (downloadFinined && completion) {
            completion(image, info);
        }
    }];
    //    return [[PHCachingImageManager defaultManager] requestImageDataForAsset:asset options:option resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
    //        BOOL downloadFinined = ![[info objectForKey:PHImageCancelledKey] boolValue] && ![info objectForKey:PHImageErrorKey];
    //        if (downloadFinined && completion) {
    //            UIImage * image = [[UIImage alloc]initWithData:imageData];
    //            completion(image, info);
    //        }
    //    }];
}

- (void)startCacheAssetWithArray:(NSMutableArray<PHAsset *> *)array size:(CGSize)size{
    PHCachingImageManager * manager = [WYAPhotoBrowserManager sharedPhotoBrowserManager].cachingManager;
    [manager startCachingImagesForAssets:array targetSize:size contentMode:PHImageContentModeAspectFill options:nil];
}

- (void)stopCacheAssetWithArray:(NSMutableArray<PHAsset *> *)array size:(CGSize)size{
    PHCachingImageManager * manager = [WYAPhotoBrowserManager sharedPhotoBrowserManager].cachingManager;
    [manager stopCachingImagesForAssets:array targetSize:size contentMode:PHImageContentModeAspectFill options:nil];
}

- (void)stopAllCacheAsset{
    PHCachingImageManager * manager = [WYAPhotoBrowserManager sharedPhotoBrowserManager].cachingManager;
    [manager stopCachingImagesForAllAssets];
}
@end
