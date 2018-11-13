//
//  NSString+Safe.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Safe)
- (NSString *)wya_safeSubstringFromIndex:(NSUInteger)from;

- (NSString *)wya_safeSubstringToIndex:(NSUInteger)to;

- (NSString *)wya_safeSubstringWithRange:(NSRange)range;

- (NSRange)wya_safeRangeOfString:(NSString *)aString;

- (NSRange)wya_safeRangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask;

- (NSString *)wya_safeStringByAppendingString:(NSString *)aString;
@end
