//
//  WYAPhotoEditVideoViewController.h
//  WYAKit
//
//  Created by 李世航 on 2019/5/22.
//

#import <UIKit/UIKit.h>
@class WYAPhotoBrowserModel;
NS_ASSUME_NONNULL_BEGIN

@interface WYAPhotoEditVideoViewController : UIViewController
@property (nonatomic, strong) WYAPhotoBrowserModel * model;
@property (nonatomic, copy) void (^editVideoFinishBlock)(WYAPhotoBrowserModel * videoModel);
@end

NS_ASSUME_NONNULL_END
