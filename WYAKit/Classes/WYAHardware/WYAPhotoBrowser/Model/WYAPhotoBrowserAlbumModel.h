//
//  WYAPhotoBrowserAlbunModel.h
//  WYAKit
//
//  Created by 李世航 on 2019/4/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAPhotoBrowserAlbumModel : NSObject
/// 标题
@property (nonatomic, copy) NSString * title;
/// 图片
@property (nonatomic, strong) UIImage * image;

@end

NS_ASSUME_NONNULL_END
