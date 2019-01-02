//
//  RootViewController.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/3.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "RootControllerModel.h"
#import <UIKit/UIKit.h>

@interface RootViewController : UITabBarController
/**
 文字普通状态的颜色， 要先设置
 */
@property (nonatomic, strong) UIColor * normalTitleColor;

/**
 选中的颜色 要先设置
 */
@property (nonatomic, strong) UIColor * selectedTitleColor;

/**
 tabBarItem文字字体大小，在初始化后设置
 */
@property (nonatomic, assign) CGFloat tabBarTitleFont;
@end
