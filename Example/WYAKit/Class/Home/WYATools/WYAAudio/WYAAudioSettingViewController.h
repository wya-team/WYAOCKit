//
//  WYAAudioSettingViewController.h
//  WYAKit_Example
//
//  Created by 李世航 on 2019/11/16.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYABaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WYAAudioSettingViewController : WYABaseViewController

@property (nonatomic, copy) void(^infoCallback)(NSString * sound, NSString * speed, NSString * numberLoop);

@end

NS_ASSUME_NONNULL_END
