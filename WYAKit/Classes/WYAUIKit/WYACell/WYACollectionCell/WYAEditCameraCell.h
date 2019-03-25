//
//  WYAEditCameraCell.h
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 imagePicker展示图片的cell
 */
@interface WYAEditCameraCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, copy) void (^editBlock)(void);
@end

NS_ASSUME_NONNULL_END
