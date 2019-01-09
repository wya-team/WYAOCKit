//
//  NSNotificationCenter+WYANotificationCenter.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/1/3.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "NSNotificationCenter+WYANotificationCenter.h"
#import <objc/runtime.h>

@implementation NSNotificationCenter (WYANotificationCenter)

- (void)wya_addObserverWithName:(NSString *)name object:(id)object selector:(void (^)(NSNotification *))sel
{
    objc_setAssociatedObject(self, @"notifition", sel, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedNotice:) name:name object:object];
}

- (void)receivedNotice:(NSNotification *) not
{
    void (^sel)(NSNotification * n) = objc_getAssociatedObject(self, @"notifition");
    if (sel) {
        sel(not);
    }
}

@end
