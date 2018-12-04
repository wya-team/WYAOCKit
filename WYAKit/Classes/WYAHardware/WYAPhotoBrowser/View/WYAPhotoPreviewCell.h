//
//  WYAPhotoPreviewCell.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/30.
//

#import <UIKit/UIKit.h>

@class WYAPhotoBrowserModel;
NS_ASSUME_NONNULL_BEGIN

@class WYAPhotoPreview;
@interface WYAPhotoPreviewCell : UICollectionViewCell
@property (nonatomic, strong) WYAPhotoPreview * preview;
@property (nonatomic, strong) WYAPhotoBrowserModel * model;
- (void)setScrollZoom;
@end

@interface WYAPhotoPreview : UIView
@property (nonatomic, strong) UIScrollView * scrollV;
@property (nonatomic, strong) UIImageView * imageView;
- (void)setScrollZoom;
@end

NS_ASSUME_NONNULL_END
