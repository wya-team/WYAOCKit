//
//  NSDictionary+Safe.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)
- (id)wya_safeObjectForKey:(NSString *)key;

- (void)wya_safeSetValue:(id)object forKey:(id)key;

- (id)wya_objectForKeyCustom:(id)aKey;

- (id)wya_safeKeyForValue:(id)value;
@end
