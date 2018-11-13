//
//  NSArray+Safe.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/4.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Safe)

/**
 保证该对象不为nil

 @param object 一个未知对象
 @return 返回一个数组
 */
+ (instancetype)wya_safeArrayWithObject:(id)object;

/**
 安全的取出数组下标对应的元素，可以防止越界

 @param index 需要取出的元素的index
 @return 返回一个index对应的元素
 */
- (id)wya_safeObjectAtIndex:(NSUInteger)index;

/**
 截取数组元素

 @param range 需要截取的起始位置以及长度
 @return 截取后的数组
 */
- (NSArray *)wya_safeSubarrayWithRange:(NSRange)range;

/**
 保证安全的获得一个元素的index

 @param anObject object
 @return index
 */
- (NSUInteger)wya_safeIndexOfObject:(id)anObject;
@end
