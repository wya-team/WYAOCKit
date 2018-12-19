//
//  WYAHomeTableCell.h
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/17.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WYAHomeItemModel;

@interface WYAHomeTableCell : WYATableViewCell
@property (nonatomic, strong) WYAHomeItemModel * model;
@end

NS_ASSUME_NONNULL_END
