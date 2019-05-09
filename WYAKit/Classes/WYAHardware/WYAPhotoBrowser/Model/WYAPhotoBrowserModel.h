//
//  WYAPhotoBrowserModel.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/15.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN
@class WYAPhotoBrowserModel;

typedef void(^WYAImageModelRequestSuccessBlock)(UIImage *image, WYAPhotoBrowserModel * model, NSDictionary *info);

@interface WYAPhotoBrowserModel : NSObject

@property (nonatomic, strong) PHAsset * asset;      //资源
@property (nonatomic, strong) UIImage * cacheImage; //缓存图片
@property (nonatomic, strong) UIImage * cropImage;  //裁剪过的图片
@property (nonatomic, assign) BOOL selected;        //是否被选中
@property (nonatomic, assign) BOOL isMaxCount;      //是否到最大个数
@property (nonatomic, strong) NSURL * videoUrl;     //视频url

@property (nonatomic, assign) CGSize requestSize;

@end

NS_ASSUME_NONNULL_END
