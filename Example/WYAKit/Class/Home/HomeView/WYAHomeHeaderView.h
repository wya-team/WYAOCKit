//
//  WYAHomeHeaderView.h
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/17.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WYAHomeModel;

@interface WYAHomeHeaderView : UITableViewHeaderFooterView
@property (nonatomic, strong) WYAHomeModel * model;
@property (nonatomic, copy) void (^headerHandle)(void);
@end

NS_ASSUME_NONNULL_END
