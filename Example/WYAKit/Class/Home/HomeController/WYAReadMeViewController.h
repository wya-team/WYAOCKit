//
//  WYAReadMeViewController.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/19.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYABaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WYAReadMeViewController : WYABaseViewController
@property (nonatomic, copy) NSString * readMeUrl;
@property (nonatomic, assign) BOOL isAllowPush;

/**
 悬浮窗的icon
 */
@property(nonatomic, strong) UIImage * hk_iconImage;// 固定写法，名字也需要固定
@end

NS_ASSUME_NONNULL_END
