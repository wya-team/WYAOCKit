//
//  NSMutableArray+Safe.m
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSMutableArray+Safe.h"

@implementation NSMutableArray (Safe)
- (void)wya_safeAddObject:(id)object {
    if (object == nil) {
        return;
    } else {
        [self addObject:object];
    }
}

- (void)wya_safeInsertObject:(id)object atIndex:(NSUInteger)index {
    if (object == nil) {
        return;
    } else if (index > self.count) {
        return;
    } else {
        [self insertObject:object atIndex:index];
    }
}

- (void)wya_safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs {
    NSUInteger firstIndex = indexs.firstIndex;
    if (indexs == nil) {
        return;
    } else if (indexs.count != objects.count || firstIndex > objects.count) {
        return;
    } else {
        [self insertObjects:objects atIndexes:indexs];
    }
}

- (void)wya_safeRemoveObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return;
    } else {
        [self removeObjectAtIndex:index];
    }
}

- (void)wya_safeRemoveObjectsInRange:(NSRange)range {
    NSUInteger location = range.location;
    NSUInteger length   = range.length;
    if (location + length > self.count) {
        return;
    } else {
        [self removeObjectsInRange:range];
    }
}
- (void)wya_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
    if (index >= self.count) {
        return;
    } else {
        [self replaceObjectAtIndex:index withObject:object];
    }
}
@end
