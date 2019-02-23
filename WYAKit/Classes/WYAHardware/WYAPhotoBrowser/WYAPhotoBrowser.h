//
//  WYAPhotoBrowserNav.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import "WYAPhotoBrowserSource.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WYAPhotoBrowser : UINavigationController

/**
 如果选中的是图片数组中存放的就是图片，如果选中的是视频，存放的就是视频url
 */
@property (nonatomic, copy) void (^callBackBlock)(NSMutableArray * medias);

/**
 初始化

 @param maxCount 最大选中个数
 @return self
 */
- (instancetype)initWithMaxCount:(NSInteger)maxCount photoBrowserType:(WYAPhotoBrowserType)type;
@end

NS_ASSUME_NONNULL_END
