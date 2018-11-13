//
//  NSMutableDictionary+Safe.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Safe)
- (void)wya_safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey;

- (id)wya_safeObjectForKey:(id<NSCopying>)aKey;
@end
