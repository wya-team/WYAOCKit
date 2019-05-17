//
//  WYAPhotoBrowserModel.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/15.
//

#import "WYAPhotoBrowserModel.h"

@implementation WYAPhotoBrowserAlbumModel


@end

@implementation WYAPhotoBrowserModel

+ (instancetype)modelWithAsset:(PHAsset *)asset type:(WYAAssetMediaType)type duration:(NSString *)duration
{
    WYAPhotoBrowserModel *model = [[WYAPhotoBrowserModel alloc] init];
    model.asset = asset;
    model.type = type;
    model.duration = duration;
    model.selected = NO;
    return model;
}


@end
