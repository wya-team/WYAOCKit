//
//  UITextField+WYATextFieldBlock.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/1/3.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "UITextField+WYATextFieldBlock.h"

@implementation UITextField (WYATextFieldBlock)

- (void)wya_addTextChangeWithEvent:(UIControlEvents)event textHandle:(void (^)(UITextField * text))textHandle
{
    objc_setAssociatedObject(self, @"WYATextFieldBlock", textHandle, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(textChange:) forControlEvents:event];
}

- (void)textChange:(UITextField *)textField
{
    void (^textH)(UITextField * textField) = objc_getAssociatedObject(self, @"WYATextFieldBlock");
    if (textH) {
        textH(textField);
    }
}

@end
