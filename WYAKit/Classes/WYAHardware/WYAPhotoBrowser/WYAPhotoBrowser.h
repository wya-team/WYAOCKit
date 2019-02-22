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
 返回选中的照片
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
