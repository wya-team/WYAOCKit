//
//  ImagePicker.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/25.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAPhotoBrowserManager.h"

@implementation WYAPhotoBrowserManager

//- (void)getCameraRollAlbum:(BOOL)allowPickingVideo allowPickingImage:(BOOL)allowPickingImage needFetchAssets:(BOOL)needFetchAssets completion:(void (^)(WYAPhotoBrowserAlbumModel *model))completion {
//    __block WYAPhotoBrowserAlbumModel *model;
//    PHFetchOptions *option = [[PHFetchOptions alloc] init];
//    if (!allowPickingVideo) option.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeImage];
//    if (!allowPickingImage) option.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld",
//                                                PHAssetMediaTypeVideo];
//    // option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"modificationDate" ascending:self.sortAscendingByModificationDate]];
//    if (!self.sortAscendingByModificationDate) {
//        option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:self.sortAscendingByModificationDate]];
//    }
//    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
//    for (PHAssetCollection *collection in smartAlbums) {
//        // 有可能是PHCollectionList类的的对象，过滤掉
//        if (![collection isKindOfClass:[PHAssetCollection class]]) continue;
//        // 过滤空相册
//        if (collection.estimatedAssetCount <= 0) continue;
//        if ([self isCameraRollAlbum:collection]) {
//            PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:collection options:option];
//            model = [self modelWithResult:fetchResult name:collection.localizedTitle isCameraRoll:YES needFetchAssets:needFetchAssets];
//            if (completion) completion(model);
//            break;
//        }
//    }
//}

@end
