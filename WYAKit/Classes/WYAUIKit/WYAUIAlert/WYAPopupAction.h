//
//  ASPopupAction.h
//  ASPopupView
//
//  Created by wya on 16/4/13.
//  Copyright © 2016年 code. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, WYAPopupActionStyle) {
    WYAPopupActionStyleDefault,
    WYAPopupActionStyleCancel,
    WYAPopupActionStyleDestructive
};

@interface WYAPopupAction : NSObject

/** action 标题 */
@property (nonatomic, copy)NSString *title;

/** action 事件 */
@property (nonatomic, copy)void (^handler) (void);

/** action 风格 */
@property (nonatomic, assign)WYAPopupActionStyle style;

/**
 *    创建一个 action
 *
 *    @param title   标题
 *    @param style   风格
 *    @param handler 回调
 *
 */
+ (instancetype)actionWithTitle:(NSString *)title style:(WYAPopupActionStyle)style handler:(void(^)(void))handler;

@end
