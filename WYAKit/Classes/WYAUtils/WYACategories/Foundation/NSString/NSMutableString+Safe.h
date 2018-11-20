//
//  NSMutableString+Safe.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString (Safe)
- (void)wya_safeInsertString:(NSString *)aString atIndex:(NSUInteger)loc;

- (void)wya_safeAppendString:(NSString *)aString;

- (void)wya_safeSetString:(NSString *)aString;

- (NSUInteger)wya_safeReplaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange;
@end
