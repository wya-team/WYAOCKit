//
//  WYAPhotoBrowserNav.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import "WYAPhotoBrowserSource.h"
#import <UIKit/UIKit.h>
#import "WYAPhotoBrowserConfig.h"
#import <Photos/Photos.h>
NS_ASSUME_NONNULL_BEGIN

@interface WYAPhotoBrowser : UINavigationController
/// 相册配置项
@property (nonatomic, strong) WYAPhotoBrowserConfig * config;
/// 相册选择结束之后的回调,medias中包括选中的图片，assets中只有选中了视频时会有值
@property (nonatomic, copy) void (^callBackBlock)(NSMutableArray<UIImage *> * medias, NSMutableArray<PHAsset *> * assets);
@end

NS_ASSUME_NONNULL_END
