//
//  WYAPhotoBrowserModel.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PHAsset;

@interface WYAPhotoBrowserModel : NSObject

@property (nonatomic, strong) PHAsset * asset;//资源
@property (nonatomic, strong) UIImage * cacheImage; //缓存图片
@property (nonatomic, assign) BOOL  selected;



@end

NS_ASSUME_NONNULL_END
