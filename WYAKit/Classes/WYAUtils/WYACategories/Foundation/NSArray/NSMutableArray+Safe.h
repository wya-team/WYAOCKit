//
//  NSMutableArray+Safe.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Safe)

/**
 添加对象

 @param object 需要添加的对象
 */
- (void)wya_safeAddObject:(id)object;

/**
 在某个位置插入对象

 @param object 需要插入的对象
 @param index 插入的下标
 */
- (void)wya_safeInsertObject:(id)object atIndex:(NSUInteger)index;

/**
 在多个位置上插入一个数组

 @param objects 需要插入的对象
 @param indexs 需要插入的集合
 */
- (void)wya_safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs;

/**
 移除某个位置的元素

 @param index 需要移除的位置
 */
- (void)wya_safeRemoveObjectAtIndex:(NSUInteger)index;

/**
 移除某个区间的元素

 @param range 需要移除的区间
 */
- (void)wya_safeRemoveObjectsInRange:(NSRange)range;

/**
 替换某个位置的元素

 @param index 需要替换的位置
 @param object 新的对象
 */
- (void)wya_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)object;
@end
