//
//  WYAPhotoEditViewController.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import <UIKit/UIKit.h>

@class WYAPhotoBrowserModel;

NS_ASSUME_NONNULL_BEGIN

@interface WYAPhotoEditViewController : UIViewController
@property (nonatomic, strong) NSMutableArray <WYAPhotoBrowserModel *> * models;

@end

NS_ASSUME_NONNULL_END
