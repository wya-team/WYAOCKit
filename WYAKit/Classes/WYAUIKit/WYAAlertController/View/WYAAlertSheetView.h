//
//  WYAAlertSheetView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WYAAlertAction;

@interface WYAAlertSheetView : UIView

@property (nonatomic, assign) CGFloat height;

/** 保存当前的视图控制器，用来dismiss */
@property (nonatomic, weak, nullable) UIViewController * controller;

/**
 *    初始化 AlertView
 *
 *    @param title   标题
 *    @param message 消息
 */
- (_Nonnull instancetype)initWithTitle:(NSString * _Nullable)title
                               message:(NSString * _Nullable)message;

/**
 *    添加一个 action
 *
 *    @param action action
 */
- (void)wya_addAction:(WYAAlertAction * _Nonnull)action;

- (void)wya_addCornerRadiusWithNumber:(CGFloat)number;
@end

NS_ASSUME_NONNULL_END
