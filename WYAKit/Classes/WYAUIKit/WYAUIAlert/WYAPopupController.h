//
//  ASPopupController.h
//  ASPopupController
//
//  Created by wya on 16/3/26.
//  Copyright © 2016年 code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYAPopupAction.h"
#import "WYAPopupHeader.h"

@class WYAPopupView;

/** 灰色背景透明度 */
static const CGFloat as_backgroundAlpha = 0.4;

@interface WYAPopupController : UIViewController

/** alert 视图 */
@property (nonnull, nonatomic, strong)UIView *alertView;

/** 半透明背景 */
@property (nonnull, nonatomic, strong)UIButton *backgroundButton;

/** present 转场风格 */
@property (nonatomic, assign)WYAPopupPresentStyle presentStyle;

/** dismiss 转场风格 */
@property (nonatomic, assign)WYAPopupDismissStyle dismissStyle;

@property (nonatomic, assign) WYAPopStyle    popStyle;

- (void)setAlertViewCornerRadius:(CGFloat)cornerRadius;

/**
 *    添加 action
 *
 *    @param action action
 */
- (void)addAction:(WYAPopupAction * _Nonnull)action;

/**
 *    直接添加一个数组的 action
 *
 *    @param actions 放有 action 的数组
 */
- (void)addActions:(NSArray<WYAPopupAction *> * _Nonnull)actions;

/**
 *    标准初始化方法
 *
 *    @param title        标题
 *    @param message      消息
 *    @param presentStyle present 转场风格
 *    @param dismissStyle dismiss 转场风格
 *
 *    @return alert控制器
 */
+ (_Nonnull instancetype)alertWithTitle:(NSString * _Nullable)title
                                message:(NSString * _Nullable)message
                           presentStyle:(WYAPopupPresentStyle)presentStyle
                           dismissStyle:(WYAPopupDismissStyle)dismissStyle;

/**
 *    默认转场初始化方法
 *
 *    @param title   标题
 *    @param message 消息
 *
 *    @return alert控制器
 */
+ (_Nonnull instancetype)alertWithTitle:(NSString * _Nullable)title
                                message:(NSString * _Nullable)message;

/**
 自定义弹出视图（视图需使用bounds属性确定大小，事件，按钮需自行添加）

 @param view 自定义视图
 @return alert控制器
 */
+ (_Nonnull instancetype)alertWithCustomView:(UIView *)view PopStyle:(WYAPopStyle)style;
@end
