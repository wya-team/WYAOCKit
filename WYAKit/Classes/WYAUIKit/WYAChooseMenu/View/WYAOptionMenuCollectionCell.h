//
//  WYAMenuCollectionCell.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WYAOptionMenuSecondLevelModel;

@interface WYAOptionMenuCollectionCell : UICollectionViewCell
@property (nonatomic, strong) WYAOptionMenuSecondLevelModel * model;
@end

NS_ASSUME_NONNULL_END
