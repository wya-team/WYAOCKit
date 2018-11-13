//
//  ImagePicker.h
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/25.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
// PHAssetCollectionTypeAlbum          (可能是自己创建的相册)
// PHAssetCollectionTypeSmartAlbum     （相簿）
// PHAssetCollectionTypeMoment          (照片)
typedef NS_OPTIONS(NSInteger, AssetCollectionType) {
    AssetCollectionTypeAlbum,             //用户创建智能相册(自建)
    AssetCollectionTypeSmartAlbum,        //系统创建智能相册
};

typedef NS_OPTIONS(NSInteger, AssetCollectionSubType) {
    AssetCollectionSubTypeUserLibrary,    //用户相册
    AssetCollectionSubTypeAlbumRegular,   //在照片应用中创建的相册
    AssetCollectionSubTypeVideo,          //视频
    AssetCollectionSubTypeScreenshots,    //屏幕快照
    AssetCollectionSubTypeRecentlyAdded,  //最近添加
    AssetCollectionSubTypeLivePhotos,     //实况照片
    AssetCollectionSubTypeAny,
};

typedef NS_OPTIONS(NSInteger, AssetCollectionSort) {
//    AssetCollectionLocalIdentifier,     //资源标识符
//    AssetCollectionLocalizedTitle,      //资源名称
    AssetCollectionStartDate,           //资源创建日期
    AssetCollectionEndDate,             //资源最新编辑日期
//    AssetCollectionEstimatedAssetCount, //预估资源个数
};

typedef NS_OPTIONS(NSInteger, AssetSort) {
//    AssetLocalIdentifier,               //资源标识符
    AssetCreationDate,                  //资源创建日期
    AssetModificationDate,              //资源最新编辑日期
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

@interface ImagePicker : NSObject

@property (nonatomic, assign) AssetMediaType  mediaType;

- (NSMutableArray *)screenAssetWithFilter:(AssetCollectionType)collectionType AssetCollectionSubType:(AssetCollectionSubType)subType CollectionSort:(AssetCollectionSort)collectionSort assetSort:(AssetSort)assetSort;

- (NSMutableArray *)screenAssetCollectionWithFilter:(AssetCollectionType)collectionType AssetCollectionSubType:(AssetCollectionSubType)subType CollectionSort:(AssetCollectionSort)collectionSort;

- (NSMutableArray *)screenAssetFromAssetCollectionWithFilter:(PHAssetCollectionType)collectionType AssetCollectionSubType:(PHAssetCollectionSubtype)subType CollectionSort:(AssetCollectionSort)collectionSort assetSort:(AssetSort)assetSort;

@end
