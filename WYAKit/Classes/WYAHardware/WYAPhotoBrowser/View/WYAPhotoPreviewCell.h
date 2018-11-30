//
//  WYAPhotoPreviewCell.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/30.
//

#import <UIKit/UIKit.h>

@class WYAPhotoBrowserModel;
NS_ASSUME_NONNULL_BEGIN

@interface WYAPhotoPreviewCell : UICollectionViewCell
@property (nonatomic, strong) UIScrollView * scrollV;
@property (nonatomic, strong) WYAPhotoBrowserModel * model;
@end

NS_ASSUME_NONNULL_END
