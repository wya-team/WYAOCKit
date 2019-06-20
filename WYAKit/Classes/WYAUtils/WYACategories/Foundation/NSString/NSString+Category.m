//
//  NSString+Category.m
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSString+Category.h"
#include <sys/mount.h>
#include <sys/param.h>

@implementation NSString (Category)
+ (NSString *)wya_getSecrectStringWithPhoneNumber:(NSString *)phoneNum {
    if (phoneNum.length == 11) {
        NSMutableString * newStr = [NSMutableString stringWithString:phoneNum];
        NSRange range            = NSMakeRange(3, 7);
        [newStr replaceCharactersInRange:range withString:@"*****"];
        return newStr;
    }
    return nil;
}

+ (NSString *)wya_getSecrectStringWithAccountNo:(NSString *)accountNo {
    NSMutableString * newStr = [NSMutableString stringWithString:accountNo];
    NSRange range            = NSMakeRange(4, 8);
    if (newStr.length > 12) { [newStr replaceCharactersInRange:range withString:@" **** **** "]; }
    return newStr;
}

+ (NSString *)wya_stringMobileFormat:(NSString *)mobile {
    if (mobile.length == 11) {
        NSMutableString * value = [[NSMutableString alloc] initWithString:mobile];
        [value insertString:@"-" atIndex:3];
        [value insertString:@"-" atIndex:8];
        return value;
    }

    return nil;
}

+ (NSString *)wya_stringChineseFormat:(double)value {
    if (value / 100000000 >= 1) {
        return [NSString stringWithFormat:@"%.0f亿", value / 100000000];
    } else if (value / 10000 >= 1 && value / 100000000 < 1) {
        return [NSString stringWithFormat:@"%.0f万", value / 10000];
    } else {
        return [NSString stringWithFormat:@"%.0f", value];
    }
}

+ (NSString *)wya_countNumAndChangeformat:(NSString *)num {
    NSNumberFormatter * moneyFormatter = [[NSNumberFormatter alloc] init];
    moneyFormatter.positiveFormat      = @"###,###";
    //如要增加小数点请自行修改为@"###,###,##"
    return [moneyFormatter stringFromNumber:[num wya_toNumber]];
}

- (CGFloat)wya_heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width {
  return  [UILabel getHeightByWidth:width title:self font:[UIFont systemFontOfSize:fontSize]];
}

- (CGFloat)wya_widthWithFontSize:(CGFloat)fontSize height:(CGFloat)maxHeight {
    return [UILabel getWidthWithTitle:self font:FONT(fontSize)];
}

- (NSNumber *)wya_toNumber {
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * number = [formatter numberFromString:self];
    return number;
}

/*抹除运费小数末尾的0*/
- (NSString *)wya_removeUnwantedZero {
    if ([[self substringWithRange:NSMakeRange(self.length - 3, 3)] isEqualToString:@"000"]) {
        return [self substringWithRange:NSMakeRange(0, self.length - 4)]; // 多一个小数点
    } else if ([[self substringWithRange:NSMakeRange(self.length - 2, 2)] isEqualToString:@"00"]) {
        return [self substringWithRange:NSMakeRange(0, self.length - 2)];
    } else if ([[self substringWithRange:NSMakeRange(self.length - 1, 1)] isEqualToString:@"0"]) {
        return [self substringWithRange:NSMakeRange(0, self.length - 1)];
    } else {
        return self;
    }
}

//去掉前后空格
- (NSString *)wya_trimmedString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
}

- (BOOL)wya_isContainChineseInUTF8CodeingFormat {
    NSUInteger length = [self length];
    for (NSUInteger i = 0; i < length; i++) {
        NSRange range        = NSMakeRange(i, 1);
        NSString * subString = [self substringWithRange:range];
        const char * cString = [subString UTF8String];
        if (strlen(cString) == 3) { return YES; }
    }
    return NO;
}

- (BOOL)wya_isContainChineseInGBKCodeingFormat {
    for (int i = 0; i < self.length; i++) {
        unichar ch = [self characterAtIndex:i];
        if (0x4E00 <= ch && ch <= 0x9FA5) { return YES; }
    }
    return NO;
}

- (NSInteger)wya_chineseCountOfStringInGBKCodeingFormat {
    int ChineseCount = 0;

    if (self.length == 0) { return 0; }

    for (int i = 0; i < self.length; i++) {
        unichar c = [self characterAtIndex:i];

        if (c >= 0x4E00 && c <= 0x9FA5) {
            ChineseCount++; //汉字
        }
    }

    return ChineseCount;
}

+ (double)wya_phoneFreeMemory {
    //可用大小
    struct statfs buf;
    long long freespace = -1;
    if (statfs("/var", &buf) >= 0) { freespace = (long long)(buf.f_bsize * buf.f_bfree); }
    return (double)freespace / 1024 / 1024 / 1024;
}

- (unsigned long long)wya_fileSize {
    // 总大小
    unsigned long long size = 0;
    //    NSString *sizeText = nil;
    NSFileManager * manager = [NSFileManager defaultManager];

    BOOL isDir = NO;
    BOOL exist = [manager fileExistsAtPath:self isDirectory:&isDir];

    // 判断路径是否存在
    if (!exist) return size;
    if (isDir) { // 是文件夹
        NSDirectoryEnumerator * enumerator = [manager enumeratorAtPath:self];
        for (NSString * subPath in enumerator) {
            NSString * fullPath = [self stringByAppendingPathComponent:subPath];
            size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
    } else { // 是文件
        size += [manager attributesOfItemAtPath:self error:nil].fileSize;
    }
    return size;
}

- (NSString *)wya_stringByStrippingHTML {
    return [self stringByReplacingOccurrencesOfString:@"<[^>]+>"
                                           withString:@""
                                              options:NSRegularExpressionSearch
                                                range:NSMakeRange(0, self.length)];
}

- (NSString *)wya_stringByRemovingScriptsAndStrippingHTML {
    NSMutableString * mString = [self mutableCopy];
    NSError * error;
    NSRegularExpression * regex =
        [NSRegularExpression regularExpressionWithPattern:@"<script[^>]*>[\\w\\W]*</script>"
                                                  options:NSRegularExpressionCaseInsensitive
                                                    error:&error];
    NSArray * matches = [regex matchesInString:mString
                                       options:NSMatchingReportProgress
                                         range:NSMakeRange(0, [mString length])];
    for (NSTextCheckingResult * match in [matches reverseObjectEnumerator]) {
        [mString replaceCharactersInRange:match.range withString:@""];
    }
    return [mString wya_stringByStrippingHTML];
}

- (NSString *)wya_trimmingWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)wya_trimmingWhitespaceAndNewlines {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)getNowTimeTimesSeconds {
    // 获取10位时间戳
    NSDate * dat = [NSDate dateWithTimeIntervalSinceNow:0];

    NSTimeInterval a = [dat timeIntervalSince1970];

    NSString * timeString = [NSString stringWithFormat:@"%0.f", a]; //转为字符型
    return timeString;
}

+ (NSString *)wya_randomStringWithLength:(NSInteger)len {
    NSString * letters             = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString * randomString = [NSMutableString stringWithCapacity:len];

    for (NSInteger i = 0; i < len; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random_uniform([letters length])]];
    }
    return randomString;
}

+ (NSDictionary *)wya_breakupUrlStringFetchParams:(NSString *)urlString{
    if (!urlString) return nil;
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithCapacity:0];
    NSArray * arr = [urlString componentsSeparatedByString:@"?"];
    NSString * paramsString = [arr lastObject];
    NSArray * keyValues = [paramsString componentsSeparatedByString:@"&"];
    if (keyValues.count > 0) {
        for (NSString * string in keyValues) {
            NSArray * array = [string componentsSeparatedByString:@"="];
            [dic setObject:[array lastObject] forKey:[array firstObject]];
        }
    }
    NSLog(@"dic==%@",dic);
    return [dic copy];
}

@end
