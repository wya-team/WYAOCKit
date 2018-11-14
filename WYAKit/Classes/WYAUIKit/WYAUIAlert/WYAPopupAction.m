//
//  ASPopupAction.m
//  ASPopupView
//
//  Created by wya on 16/4/13.
//  Copyright © 2016年 code. All rights reserved.
//

#import "WYAPopupAction.h"

@implementation WYAPopupAction

+ (instancetype)actionWithTitle:(NSString *)title style:(WYAPopupActionStyle)style handler:(void(^)(void))handler {
    WYAPopupAction *action = [[WYAPopupAction alloc] init];
    action.title = title;
    action.handler = handler;
    action.style = style;
    return action;
}


@end
