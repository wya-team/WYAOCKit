//
//  NSString+Safe.m
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)
- (NSString *)wya_safeSubstringFromIndex:(NSUInteger)from
{
    if (from > self.length) {
        return nil;
    } else {
        return [self substringFromIndex:from];
    }
}

- (NSString *)wya_safeSubstringToIndex:(NSUInteger)to
{
    if (to > self.length) {
        return nil;
    } else {
        return [self substringToIndex:to];
    }
}

- (NSString *)wya_safeSubstringWithRange:(NSRange)range
{
    NSUInteger location = range.location;
    NSUInteger length   = range.length;
    if (location + length > self.length) {
        return nil;
    } else {
        return [self substringWithRange:range];
    }
}

- (NSRange)wya_safeRangeOfString:(NSString *)aString
{
    if (aString == nil) {
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self rangeOfString:aString];
    }
}

- (NSRange)wya_safeRangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask
{
    if (aString == nil) {
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self rangeOfString:aString options:mask];
    }
}

- (NSString *)wya_safeStringByAppendingString:(NSString *)aString
{
    if (aString == nil) {
        return [self stringByAppendingString:@""];
    } else {
        return [self stringByAppendingString:aString];
    }
}
@end
