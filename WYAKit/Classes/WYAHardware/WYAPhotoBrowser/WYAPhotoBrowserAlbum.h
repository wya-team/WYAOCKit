//
//  WYAPhotoBrowser.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import "WYAPhotoBrowserSource.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WYAPhotoBrowserAlbum : UIViewController
@property (nonatomic, assign) NSInteger maxCount;
@property (nonatomic, assign) WYAPhotoBrowserType photoBrowserType;
@end

NS_ASSUME_NONNULL_END
