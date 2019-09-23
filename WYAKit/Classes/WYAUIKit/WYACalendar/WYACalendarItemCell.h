//
//  WYACalendarCell.h
//  WYAKit
//
//  Created by 李世航 on 2019/7/31.
//

#import <UIKit/UIKit.h>
#import "WYACalendarModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WYACalendarItemCell : UICollectionViewCell
@property (nonatomic, strong) WYACalendarModel * model;
- (void)reloadUI;
@end

NS_ASSUME_NONNULL_END
