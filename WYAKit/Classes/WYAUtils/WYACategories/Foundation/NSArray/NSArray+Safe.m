//
//  NSArray+Safe.m
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/4.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)
+ (instancetype)wya_safeArrayWithObject:(id)object
{
    if (object == nil) {
        return [self array];
    } else {
        return [self arrayWithObject:object];
    }
}

- (id)wya_safeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    } else {
        return [self objectAtIndex:index];
    }
}

- (NSUInteger)wya_safeIndexOfObject:(id)anObject
{
    if (anObject == nil) {
        return NSNotFound;
    } else {
        return [self indexOfObject:anObject];
    }
}

- (NSArray *)wya_safeSubarrayWithRange:(NSRange)range
{
    NSUInteger location = range.location;
    NSUInteger length   = range.length;
    if (location + length > self.count) {
        //超过了边界,就获取从loction开始所有的item
        if ((location + length) > self.count) {
            length = (self.count - location);
            return [self wya_safeSubarrayWithRange:NSMakeRange(location, length)];
        }

        return nil;
    } else {
        return [self subarrayWithRange:range];
    }
}
@end
