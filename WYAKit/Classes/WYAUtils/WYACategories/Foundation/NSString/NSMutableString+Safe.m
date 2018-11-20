//
//  NSMutableString+Safe.m
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSMutableString+Safe.h"

@implementation NSMutableString (Safe)
- (void)wya_safeInsertString:(NSString *)aString atIndex:(NSUInteger)loc
{
    if (aString == nil) {
        return;
    } else if (loc > self.length) {
        return;
    } else {
        [self insertString:aString atIndex:loc];
    }
}

- (void)wya_safeAppendString:(NSString *)aString
{
    if (aString == nil) {
        return;
    } else {
        [self appendString:aString];
    }
}

- (void)wya_safeSetString:(NSString *)aString
{
    if (aString == nil) {
        return;
    } else {
        [self setString:aString];
    }
}

- (NSUInteger)wya_safeReplaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
{
    NSUInteger location = searchRange.location;
    NSUInteger length = searchRange.length;

    if (target == nil || replacement == nil) {
        return 0;
    } else if (location + length > self.length) {
        return 0;
    } else {
        return [self replaceOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
}
@end
