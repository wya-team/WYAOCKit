//
//  UIButton+Category.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonActionCallBack)(UIButton * button);

@interface UIButton (Category)

@property (nonatomic, assign) double debounceTime;// 防抖保护时长，单位s
@property (nonatomic, assign) double endTime;// 上次事件触发保护期至

- (void)addCallBackAction:(ButtonActionCallBack)action
         forControlEvents:(UIControlEvents)controlEvents;

- (void)addCallBackAction:(ButtonActionCallBack)action;

- (void)wya_gifImageWithSource:(NSArray<NSString *> *)source;

/**
 设置背景色

 @param color 颜色
 @param state state
 */
- (void)wya_setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state;

@end

@interface UIButton (EnlargeTouchArea)

/**
 *  扩大 UIButton 的點擊範圍
 *  控制上下左右的延長範圍
 *
 *  @param top    顶部
 *  @param right  右边
 *  @param bottom 底部
 *  @param left   左边
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top
                        right:(CGFloat)right
                       bottom:(CGFloat)bottom
                         left:(CGFloat)left;

/**
 设置图片在右，需先指定button.frame

 @param space 间距
 */
- (void)wya_setButtonImageLoctionRightWithSpace:(CGFloat)space;

/**
 设置图片在上，需先指定button.frame

 @param space 间距
 */
- (void)wya_setButtonImageLocationTopWithSpace:(CGFloat)space;

/**
 设置图片在下，需先指定button.frame

 @param space 间距
 */
- (void)wya_setButtonImageLocationBottomWithSpace:(CGFloat)space;

@end
