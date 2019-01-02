//
//  WYAPopVerReadMeViewController.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/20.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYABaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WYAPopVerReadMeViewController : WYABaseViewController
@property (nonatomic, copy) void (^pushCallback)(NSIndexPath * indexPath);
@property (nonatomic, strong) NSArray * dataSource;
@end

NS_ASSUME_NONNULL_END
