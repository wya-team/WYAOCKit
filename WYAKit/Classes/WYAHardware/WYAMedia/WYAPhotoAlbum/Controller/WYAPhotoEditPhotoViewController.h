//
//  WYAPhotoEditViewController.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import <UIKit/UIKit.h>

@class WYAPhotoBrowserModel;

NS_ASSUME_NONNULL_BEGIN

@interface WYAPhotoEditPhotoViewController : UIViewController
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) NSMutableArray<WYAPhotoBrowserModel *> * models;
@property (nonatomic, strong) NSMutableArray<WYAPhotoBrowserModel *> * selectedModels;
@property (nonatomic, copy) void (^callback)(NSMutableArray<WYAPhotoBrowserModel *> * array);

@end

NS_ASSUME_NONNULL_END
