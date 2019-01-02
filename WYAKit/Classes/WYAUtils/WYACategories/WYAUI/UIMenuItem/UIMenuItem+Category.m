//
//  UIMenuItem+Category.m
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UIMenuItem+Category.h"
#import <objc/runtime.h>
static int UIMenuItem_key;

@implementation UIMenuItem (Category)

- (instancetype)initWithTitle:(NSString *)title actionBlock:(void (^)(id sender))block
{
    self = [self initWithTitle:title action:@selector(invoke:)];
    objc_setAssociatedObject(self, &UIMenuItem_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return self;
}

- (void)invoke:(id)sender
{
    void (^block)(void) = objc_getAssociatedObject(self, &UIMenuItem_key);
    if (block) {
        block();
    }
}
@end
