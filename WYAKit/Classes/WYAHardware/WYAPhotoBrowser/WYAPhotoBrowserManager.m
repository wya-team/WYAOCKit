//
//  ImagePicker.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/25.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAPhotoBrowserManager.h"
#import "WYAPhotoBrowserModel.h"

@implementation WYAPhotoBrowserManager

+ (NSMutableArray<WYAPhotoBrowserModel *> *)
 screenAssetWithFilter:(AssetCollectionType)collectionType
AssetCollectionSubType:(AssetCollectionSubType)subType
        CollectionSort:(AssetCollectionSort)collectionSort
             assetSort:(AssetSort)assetSort {
    NSMutableArray * datas = [NSMutableArray arrayWithCapacity:0];
    //建立筛选项
    NSMutableArray * sortDescriptors = [NSMutableArray arrayWithCapacity:0];
    PHFetchOptions * options         = [[PHFetchOptions alloc] init];
    switch (collectionSort) {
        case AssetCollectionEndDate:
            [sortDescriptors
                addObject:[NSSortDescriptor sortDescriptorWithKey:@"endDate" ascending:YES]];
            break;
        case AssetCollectionStartDate:
            [sortDescriptors
                addObject:[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:YES]];
            break;
        default:
            break;
    }
    //按照筛选项排序
    options.sortDescriptors = sortDescriptors;

    //获取手机上相册中所有子相册（此时获取的集合中的元素类型应该是相册类型，即：PHAssetCollection）
    PHAssetCollectionType collType;
    switch (collectionType) {
        case AssetCollectionTypeAlbum:
            collType = PHAssetCollectionTypeAlbum;
            break;
        case AssetCollectionTypeSmartAlbum:
            collType = PHAssetCollectionTypeSmartAlbum;
            break;
        default:
            break;
    }

    PHAssetCollectionSubtype collSubType;
    switch (subType) {
        case AssetCollectionSubTypeUserLibrary:
            collSubType = PHAssetCollectionSubtypeSmartAlbumUserLibrary;
            break;
        case AssetCollectionSubTypeVideo:
            collSubType = PHAssetCollectionSubtypeSmartAlbumVideos;
            break;
        case AssetCollectionSubTypeScreenshots:
            collSubType = PHAssetCollectionSubtypeSmartAlbumScreenshots;
            break;
        case AssetCollectionSubTypeRecentlyAdded:
            collSubType = PHAssetCollectionSubtypeSmartAlbumRecentlyAdded;
            break;
        case AssetCollectionSubTypeLivePhotos:
            collSubType = PHAssetCollectionSubtypeSmartAlbumLivePhotos;
            break;
        case AssetCollectionSubTypeAlbumRegular:
            collSubType = PHAssetCollectionSubtypeAlbumRegular;
            break;
        case AssetCollectionSubTypeAny:
            collSubType = PHAssetCollectionSubtypeAny;
        default:
            break;
    }

    PHFetchResult * userAlbums = [PHAssetCollection fetchAssetCollectionsWithType:collType
                                                                          subtype:collSubType
                                                                          options:options];

    if (userAlbums.count > 0) {
        //获取相机胶卷中的照片

        for (NSInteger index = 0; index < userAlbums.count; index++) {
            PHAssetCollection * collection = userAlbums[index];
            if ([collection isKindOfClass:[PHAssetCollection class]]) {
                //代表当前的collection是一个相册

                //                NSLog(@"name==%@",collection.localizedTitle);
                //                NSLog(@"type==%d",collection.assetCollectionType);
                //                NSLog(@"subType==%d",collection.assetCollectionSubtype);
                PHFetchOptions * fetchO             = [[PHFetchOptions alloc] init];
                NSMutableArray * subSortDescriptors = [NSMutableArray arrayWithCapacity:0];
                switch (assetSort) {
                    case AssetCreationDate:
                        [subSortDescriptors
                            addObject:[NSSortDescriptor sortDescriptorWithKey:@"creationDate"
                                                                    ascending:YES]];
                        break;
                    case AssetModificationDate:
                        [subSortDescriptors
                            addObject:[NSSortDescriptor sortDescriptorWithKey:@"modificationDate"
                                                                    ascending:YES]];
                        break;
                    default:
                        break;
                }

                fetchO.sortDescriptors = subSortDescriptors;

                PHFetchResult * smartSubResult =
                    [PHAsset fetchAssetsInAssetCollection:collection
                                                  options:fetchO];
                NSLog(@"smartCount==%d", smartSubResult.count);
                if (smartSubResult.count > 0) {
                    for (NSInteger aaa = 0; aaa < smartSubResult.count; aaa++) {
                        PHAsset * assert             = (PHAsset *)smartSubResult[aaa];
                        WYAPhotoBrowserModel * model = [[WYAPhotoBrowserModel alloc] init];
                        model.asset                  = assert;
                        model.selected               = NO;
                        [datas addObject:model];
                    }
                }
            }
        }
    }

    return datas;
}

+ (NSMutableArray<PHAssetCollection *> *)
screenAssetCollectionWithFilter:(AssetCollectionType)collectionType
         AssetCollectionSubType:(AssetCollectionSubType)subType
                 CollectionSort:(AssetCollectionSort)collectionSort {
    NSMutableArray * datas = [NSMutableArray arrayWithCapacity:0];
    //建立筛选项
    NSMutableArray * sortDescriptors = [NSMutableArray arrayWithCapacity:0];
    PHFetchOptions * options         = [[PHFetchOptions alloc] init];
    switch (collectionSort) {
        case AssetCollectionEndDate:
            [sortDescriptors
                addObject:[NSSortDescriptor sortDescriptorWithKey:@"endDate" ascending:YES]];
            break;
        case AssetCollectionStartDate:
            [sortDescriptors
                addObject:[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:YES]];
            break;
        default:
            break;
    }
    //按照最新创建时间排序
    options.sortDescriptors = sortDescriptors;

    //获取手机上相册中所有子相册（此时获取的集合中的元素类型应该是相册类型，即：PHAssetCollection）
    PHAssetCollectionType collType;
    switch (collectionType) {
        case AssetCollectionTypeAlbum:
            collType = PHAssetCollectionTypeAlbum;
            break;
        case AssetCollectionTypeSmartAlbum:
            collType = PHAssetCollectionTypeSmartAlbum;
            break;
        default:
            break;
    }

    PHAssetCollectionSubtype collSubType;
    switch (subType) {
        case AssetCollectionSubTypeUserLibrary:
            collSubType = PHAssetCollectionSubtypeSmartAlbumUserLibrary;
            break;
        case AssetCollectionSubTypeVideo:
            collSubType = PHAssetCollectionSubtypeSmartAlbumVideos;
            break;
        case AssetCollectionSubTypeScreenshots:
            collSubType = PHAssetCollectionSubtypeSmartAlbumScreenshots;
            break;
        case AssetCollectionSubTypeRecentlyAdded:
            collSubType = PHAssetCollectionSubtypeSmartAlbumRecentlyAdded;
            break;
        case AssetCollectionSubTypeLivePhotos:
            collSubType = PHAssetCollectionSubtypeSmartAlbumLivePhotos;
            break;
        case AssetCollectionSubTypeAlbumRegular:
            collSubType = PHAssetCollectionSubtypeAlbumRegular;
            break;
        case AssetCollectionSubTypeAny:
            collSubType = PHAssetCollectionSubtypeAny;

        default:
            break;
    }

    PHFetchResult * userAlbums = [PHAssetCollection fetchAssetCollectionsWithType:collType
                                                                          subtype:collSubType
                                                                          options:options];

    if (userAlbums.count > 0) {
        //获取相机胶卷中的照片

        for (NSInteger index = 0; index < userAlbums.count; index++) {
            PHAssetCollection * collection = userAlbums[index];
            if ([collection isKindOfClass:[PHAssetCollection class]]) {
                //代表当前的collection是一个相册

                [datas addObject:collection];
                //                NSLog(@"name==%@",collection.localizedTitle);
            }
        }
    }
    return datas;
}

+ (NSMutableArray<WYAPhotoBrowserModel *> *)
screenAssetFromAssetCollectionWithFilter:(PHAssetCollectionType)collectionType
                  AssetCollectionSubType:(PHAssetCollectionSubtype)subType
                          CollectionSort:(AssetCollectionSort)collectionSort
                               assetSort:(AssetSort)assetSort {
    NSMutableArray * datas = [NSMutableArray arrayWithCapacity:0];
    //建立筛选项
    NSMutableArray * sortDescriptors = [NSMutableArray arrayWithCapacity:0];
    PHFetchOptions * options         = [[PHFetchOptions alloc] init];
    switch (collectionSort) {
        case AssetCollectionEndDate:
            [sortDescriptors
                addObject:[NSSortDescriptor sortDescriptorWithKey:@"endDate" ascending:YES]];
            break;
        case AssetCollectionStartDate:
            [sortDescriptors
                addObject:[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:YES]];
            break;
        default:
            break;
    }
    //按照最新创建时间排序
    options.sortDescriptors = sortDescriptors;

    PHFetchResult * userAlbums = [PHAssetCollection fetchAssetCollectionsWithType:collectionType
                                                                          subtype:subType
                                                                          options:options];

    if (userAlbums.count > 0) {
        //获取相机胶卷中的照片

        for (NSInteger index = 0; index < userAlbums.count; index++) {
            PHAssetCollection * collection = userAlbums[index];
            if ([collection isKindOfClass:[PHAssetCollection class]]) {
                //代表当前的collection是一个相册

                //                NSLog(@"name==%@",collection.localizedTitle);
                PHFetchOptions * fetchO             = [[PHFetchOptions alloc] init];
                NSMutableArray * subSortDescriptors = [NSMutableArray arrayWithCapacity:0];
                switch (assetSort) {
                    case AssetCreationDate:
                        [subSortDescriptors
                            addObject:[NSSortDescriptor sortDescriptorWithKey:@"creationDate"
                                                                    ascending:YES]];
                        break;
                    case AssetModificationDate:
                        [subSortDescriptors
                            addObject:[NSSortDescriptor sortDescriptorWithKey:@"modificationDate"
                                                                    ascending:YES]];
                        break;
                    default:
                        break;
                }

                fetchO.sortDescriptors = subSortDescriptors;

                PHFetchResult * smartSubResult =
                    [PHAsset fetchAssetsInAssetCollection:collection
                                                  options:fetchO];
                //                NSLog(@"smartCount==%d",smartSubResult.count);
                if (smartSubResult.count > 0) {
                    for (NSInteger aaa = 0; aaa < smartSubResult.count; aaa++) {
                        PHAsset * assert             = (PHAsset *)smartSubResult[aaa];
                        WYAPhotoBrowserModel * model = [[WYAPhotoBrowserModel alloc] init];
                        model.asset                  = assert;
                        model.selected               = NO;
                        [datas addObject:model];
                    }
                }
            }
        }
    }

    return datas;
}

+ (NSMutableArray<WYAPhotoBrowserModel *> *)screenAssetWithCollection:
    (PHAssetCollection *)collection {
    NSMutableArray * datas              = [NSMutableArray array];
    PHFetchOptions * fetchO             = [[PHFetchOptions alloc] init];
    NSMutableArray * subSortDescriptors = [NSMutableArray arrayWithCapacity:0];
    [subSortDescriptors
        addObject:[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];

    fetchO.sortDescriptors = subSortDescriptors;

    PHFetchResult * smartSubResult =
        [PHAsset fetchAssetsInAssetCollection:collection
                                      options:fetchO];
    //                NSLog(@"smartCount==%d",smartSubResult.count);
    if (smartSubResult.count > 0) {
        for (NSInteger aaa = 0; aaa < smartSubResult.count; aaa++) {
            PHAsset * assert             = (PHAsset *)smartSubResult[aaa];
            WYAPhotoBrowserModel * model = [[WYAPhotoBrowserModel alloc] init];
            model.asset                  = assert;
            model.selected               = NO;
            [datas addObject:model];
        }
    }
    return datas;
}
@end
