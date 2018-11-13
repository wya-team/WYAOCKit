//
//  ASPopupView.h
//  ASPopupView
//
//  Created by wya on 16/4/13.
//  Copyright © 2016年 code. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WYAPopupAction;

@interface WYAPopupView : UIView

/** 保存当前的视图控制器，用来dismiss */
@property (nonatomic, weak, nullable)UIViewController *controller;

/**
 *    初始化 AlertView
 *
 *    @param title   标题
 *    @param message 消息
 */
- (_Nonnull instancetype)initWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message;

/**
 *    添加一个 action
 *
 *    @param action action
 */
- (void)addAction:(WYAPopupAction * _Nonnull)action;

@end
