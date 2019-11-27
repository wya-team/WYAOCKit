//
//  NSString+Restructuring.m
//  WYAKit
//
//  Created by 李世航 on 2019/6/22.
//

#import "NSString+Restructuring.h"

@implementation NSString (Restructuring)
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

- (NSString *)wya_trimmedString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
}

- (NSString *)wya_trimmingWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)wya_trimmingWhitespaceAndNewlines
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

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

+ (NSString *)wya_randomStringWithLength:(NSInteger)len
{
    NSString * letters             = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString * randomString = [NSMutableString stringWithCapacity:len];

    for (NSInteger i = 0; i < len; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random_uniform([letters length])]];
    }
    return randomString;
}
@end

@implementation NSString (RestructuringUrl)

+ (NSDictionary *)wya_breakupUrlStringFetchParams:(NSString *)urlString
{
    if (!urlString) return nil;
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithCapacity:0];
    NSArray * arr             = [urlString componentsSeparatedByString:@"?"];
    NSString * paramsString   = [arr lastObject];
    NSArray * keyValues       = [paramsString componentsSeparatedByString:@"&"];
    if (keyValues.count > 0) {
        for (NSString * string in keyValues) {
            NSArray * array = [string componentsSeparatedByString:@"="];
            [dic setObject:[array lastObject] forKey:[array firstObject]];
        }
    }
    NSLog(@"dic==%@", dic);
    return [dic copy];
}

@end
