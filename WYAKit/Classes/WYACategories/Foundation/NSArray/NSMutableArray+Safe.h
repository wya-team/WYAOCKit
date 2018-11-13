//
//  NSMutableArray+Safe.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Safe)
- (void)wya_safeAddObject:(id)object;

- (void)wya_safeInsertObject:(id)object atIndex:(NSUInteger)index;

- (void)wya_safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs;

- (void)wya_safeRemoveObjectAtIndex:(NSUInteger)index;

- (void)wya_safeRemoveObjectsInRange:(NSRange)range;
@end
