//
//  NSString+Category.m
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)
+ (NSString *)wya_getSecrectStringWithPhoneNumber:(NSString *)phoneNum
{
    if (phoneNum.length == 11) {
        NSMutableString * newStr = [NSMutableString stringWithString:phoneNum];
        NSRange range            = NSMakeRange(3, 7);
        [newStr replaceCharactersInRange:range withString:@"*****"];
        return newStr;
    }
    return nil;
}

+ (NSString *)wya_getSecrectStringWithAccountNo:(NSString *)accountNo
{
    NSMutableString * newStr = [NSMutableString stringWithString:accountNo];
    NSRange range            = NSMakeRange(4, 8);
    if (newStr.length > 12) {
        [newStr replaceCharactersInRange:range withString:@" **** **** "];
    }
    return newStr;
}

+ (NSString *)wya_stringMobileFormat:(NSString *)mobile
{
    if (mobile.length == 11) {
        NSMutableString * value = [[NSMutableString alloc] initWithString:mobile];
        [value insertString:@"-" atIndex:3];
        [value insertString:@"-" atIndex:8];
        return value;
    }

    return nil;
}

+ (NSString *)wya_stringChineseFormat:(double)value
{
    if (value / 100000000 >= 1) {
        return [NSString stringWithFormat:@"%.0f亿", value / 100000000];
    } else if (value / 10000 >= 1 && value / 100000000 < 1) {
        return [NSString stringWithFormat:@"%.0f万", value / 10000];
    } else {
        return [NSString stringWithFormat:@"%.0f", value];
    }
}

+ (NSString *)wya_countNumAndChangeformat:(NSString *)num
{
    NSNumberFormatter * moneyFormatter = [[NSNumberFormatter alloc] init];
    moneyFormatter.positiveFormat      = @"###,###";
    //如要增加小数点请自行修改为@"###,###,##"
    return [moneyFormatter stringFromNumber:[num wya_toNumber]];
}

- (CGFloat)wya_heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width
{
    NSDictionary * attrs = @{NSFontAttributeName : FONT(fontSize)};
    return [self boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.height + fontSize;
}

- (CGFloat)wya_widthWithFontSize:(CGFloat)fontSize height:(CGFloat)maxHeight
{
    NSDictionary * attrs = @{NSFontAttributeName : FONT(fontSize)};
    return [self boundingRectWithSize:CGSizeMake(0, maxHeight) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.width + fontSize;
}

- (NSNumber *)wya_toNumber
{
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * number = [formatter numberFromString:self];
    return number;
}

/*抹除运费小数末尾的0*/
- (NSString *)wya_removeUnwantedZero
{
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
- (NSString *)wya_trimmedString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
}

- (BOOL)wya_isContainChineseInUTF8CodeingFormat
{
    NSUInteger length = [self length];
    for (NSUInteger i = 0; i < length; i++) {
        NSRange range        = NSMakeRange(i, 1);
        NSString * subString = [self substringWithRange:range];
        const char * cString = [subString UTF8String];
        if (strlen(cString) == 3) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)wya_isContainChineseInGBKCodeingFormat
{
    for (int i = 0; i < self.length; i++) {
        unichar ch = [self characterAtIndex:i];
        if (0x4E00 <= ch && ch <= 0x9FA5) {
            return YES;
        }
    }
    return NO;
}

- (NSInteger)wya_chineseCountOfStringInGBKCodeingFormat
{
    int ChineseCount = 0;

    if (self.length == 0) {
        return 0;
    }

    for (int i = 0; i < self.length; i++) {
        unichar c = [self characterAtIndex:i];

        if (c >= 0x4E00 && c <= 0x9FA5) {
            ChineseCount++; //汉字
        }
    }

    return ChineseCount;
}

- (unsigned long long)wya_fileSize
{
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

- (NSString *)wya_stringByStrippingHTML
{
    return [self stringByReplacingOccurrencesOfString:@"<[^>]+>" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, self.length)];
}

- (NSString *)wya_stringByRemovingScriptsAndStrippingHTML
{
    NSMutableString * mString = [self mutableCopy];
    NSError * error;
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:@"<script[^>]*>[\\w\\W]*</script>" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray * matches           = [regex matchesInString:mString options:NSMatchingReportProgress range:NSMakeRange(0, [mString length])];
    for (NSTextCheckingResult * match in [matches reverseObjectEnumerator]) {
        [mString replaceCharactersInRange:match.range withString:@""];
    }
    return [mString wya_stringByStrippingHTML];
}

- (NSString *)wya_trimmingWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)wya_trimmingWhitespaceAndNewlines
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
