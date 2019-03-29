//
//  ImagePicker.h
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/25.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

/*
 PHAsset: 代表照片库中的一个资源，跟 ALAsset 类似，通过 PHAsset 可以获取和保存资源
 PHFetchOptions: 获取资源时的参数，可以传 nil，即使用系统默认值
 PHAssetCollection: PHCollection
 的子类，表示一个相册或者一个时刻，或者是一个「智能相册（系统提供的特定的一系列相册，例如：最近删除，视频列表，收藏等等，如下图所示）
 PHFetchResult: 表示一系列的资源结果集合，也可以是相册的集合，从?PHCollection 的类方法中获得
 PHImageManager: 用于处理资源的加载，加载图片的过程带有缓存处理，可以通过传入一个
 PHImageRequestOptions 控制资源的输出尺寸等规格
 PHImageRequestOptions: 如上面所说，控制加载图片时的一系列参数
 */

// PHAssetCollectionType  相簿类型(手机相册APP中三个分组)
// PHAssetCollectionTypeAlbum          (可能是自己创建的相册)
// PHAssetCollectionTypeSmartAlbum     （相簿）
// PHAssetCollectionTypeMoment          (照片)

// PHAssetCollectionSubtype 子类型
// PHAssetCollectionTypeAlbum regular subtypes
// PHAssetCollectionSubtypeAlbumRegular (用户相册，照片APP中的相册)
// PHAssetCollectionTypeAlbum shared subtypes
// PHAssetCollectionSubtypeAlbumMyPhotoStream
// PHAssetCollectionTypeSmartAlbum subtypes
//  PHAssetCollectionSubtypeSmartAlbumGeneric

//获取用户创建的所有相册
//    PHFetchResult *topLevelUserCollections = [PHCollectionList
//    fetchTopLevelUserCollectionsWithOptions:nil];
//
//    for (NSInteger tag = 0; tag<topLevelUserCollections.count; tag++) {
//        PHCollectionList * list = topLevelUserCollections[tag];
//        NSLog(@"listName==%@",list.localizedLocationNames);
//    }
//
//    // 获取所有资源的集合，并按资源的创建时间排序（默认选择的是PHAssetSourceTypeUserLibrary）
//    PHFetchResult *assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
//    NSLog(@"ass==%@,ass.count==%d ",assetsFetchResults, assetsFetchResults.count);

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@class WYAPhotoBrowserModel;

// PHAssetCollectionTypeAlbum          (可能是自己创建的相册)
// PHAssetCollectionTypeSmartAlbum     （相簿）
// PHAssetCollectionTypeMoment          (照片)
typedef NS_OPTIONS(NSInteger, AssetCollectionType) {
    AssetCollectionTypeAlbum,      //用户创建智能相册(自建)
    AssetCollectionTypeSmartAlbum, //系统创建智能相册
};

typedef NS_OPTIONS(NSInteger, AssetCollectionSubType) {
    AssetCollectionSubTypeUserLibrary,   //用户相册
    AssetCollectionSubTypeAlbumRegular,  //在照片应用中创建的相册
    AssetCollectionSubTypeVideo,         //视频
    AssetCollectionSubTypeScreenshots,   //屏幕快照
    AssetCollectionSubTypeRecentlyAdded, //最近添加
    AssetCollectionSubTypeLivePhotos,    //实况照片
    AssetCollectionSubTypeAny,
};

typedef NS_OPTIONS(NSInteger, AssetCollectionSort) {
    //    AssetCollectionLocalIdentifier,     //资源标识符
    //    AssetCollectionLocalizedTitle,      //资源名称
    AssetCollectionStartDate, //资源创建日期
    AssetCollectionEndDate,   //资源最新编辑日期
    //    AssetCollectionEstimatedAssetCount, //预估资源个数
};

typedef NS_OPTIONS(NSInteger, AssetSort) {
    //    AssetLocalIdentifier,               //资源标识符
    AssetCreationDate,     //资源创建日期
    AssetModificationDate, //资源最新编辑日期
    //    AssetDuration,                      //资源持续时间
    //    AssetWidth,                         //资源宽度
    //    AssetHeight,                        //资源高度
    //    AssetFavorite,                      //资源是否被标记喜欢
    //    AssetHidden,                        //资源是否隐藏
};

typedef NS_OPTIONS(NSInteger, AssetMediaType) {
    AssetMediaTypeUnknown,
    AssetMediaTypeImage,
    AssetMediaTypeVideo,
    AssetMediaTypeAudio,
};

@interface WYAPhotoBrowserManager : NSObject

@property (nonatomic, assign) AssetMediaType mediaType;

/**
 获取相册分组

 @param collectionType 集合类型
 @param subType 子集合类型
 @param collectionSort 集合排序方式
 @return 集合数组
 */
+ (NSMutableArray<PHAssetCollection *> *)
screenAssetCollectionWithFilter:(AssetCollectionType)collectionType
AssetCollectionSubType:(AssetCollectionSubType)subType
CollectionSort:(AssetCollectionSort)collectionSort;

/**
 获取图片资源

 @param collectionType 集合类型
 @param subType 子集合类型
 @param collectionSort 集合排序方式
 @param assetSort 子集合排序方式
 @return 图片数组
 */
+ (NSMutableArray<WYAPhotoBrowserModel *> *)
 screenAssetWithFilter:(AssetCollectionType)collectionType
AssetCollectionSubType:(AssetCollectionSubType)subType
        CollectionSort:(AssetCollectionSort)collectionSort
             assetSort:(AssetSort)assetSort;



/**
 获取对应的图片资源

 @param collectionType 集合类型
 @param subType 子集合类型
 @param collectionSort 集合排序方式
 @param assetSort 子集合排序方式
 @return 图片数组
 */
+ (NSMutableArray<WYAPhotoBrowserModel *> *)
screenAssetFromAssetCollectionWithFilter:(PHAssetCollectionType)collectionType
                  AssetCollectionSubType:(PHAssetCollectionSubtype)subType
                          CollectionSort:(AssetCollectionSort)collectionSort
                               assetSort:(AssetSort)assetSort;

+ (NSMutableArray<WYAPhotoBrowserModel *> *)screenAssetWithCollection:
    (PHAssetCollection *)collection;

///**
// 检查图片是否在本地
//
// @param asset <#asset description#>
// @return <#return value description#>
// */
//+ (BOOL)checkImageLocalWithAsset:(PHAsset *)asset;
@end
