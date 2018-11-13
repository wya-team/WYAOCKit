//
//  NSDictionary+Safe.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)
- (id)safeObjectForKey:(NSString *)key;

- (void)safeSetValue:(id)object forKey:(id)key;

- (id)objectForKeyCustom:(id)aKey;

- (id)safeKeyForValue:(id)value;
@end
