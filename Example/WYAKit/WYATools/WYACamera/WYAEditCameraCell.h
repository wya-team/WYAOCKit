//
//  WYAEditCameraCell.h
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAEditCameraCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, copy)   void(^editBlock)(void);
@end

NS_ASSUME_NONNULL_END
