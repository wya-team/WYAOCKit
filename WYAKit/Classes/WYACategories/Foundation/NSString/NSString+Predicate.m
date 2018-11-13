//
//  NSString+Predicate.m
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSString+Predicate.h"

@implementation NSString (Predicate)
- (BOOL)isValidMobileNumber
{
    NSString * const MOBILE = @"^1(3|4|5|7|8)\\d{9}$";

    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isValidVerifyCode
{
    NSString * pattern = @"^[0-9]{4}";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isValidRealName

{
    NSString * nicknameRegex = @"^[\u4e00-\u9fa5]{2,8}$";

    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nicknameRegex];

    return [predicate evaluateWithObject:self];
}

- (BOOL)isOnlyChinese
{
    NSString * chineseTest = @"^[\u4e00-\u9fa5]{0,}$";
    NSPredicate * chinesePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", chineseTest];
    return [chinesePredicate evaluateWithObject:self];
}

- (BOOL)isValidBankCardNumber
{
    NSString * const BANKCARD = @"^(\\d{16}|\\d{19})$";

    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", BANKCARD];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isValidEmail
{
    NSString * emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate * emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];

    return [emailTest evaluateWithObject:self];
}
- (BOOL)validateNickName
{
    NSString * userNameRegex = @"^[A-Za-z0-9\u4e00-\u9fa5]{1,24}+$";

    NSPredicate * userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", userNameRegex];

    return [userNamePredicate evaluateWithObject:self];
}
- (BOOL)isValidAlphaNumberPassword
{
    NSString * regex = @"^(?!\\d+$|[a-zA-Z]+$)\\w{6,12}$";
    NSPredicate * identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [identityCardPredicate evaluateWithObject:self];
}

- (BOOL)isValidIdentifyFifteen
{
    NSString * identifyTest = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    NSPredicate * identifyPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", identifyTest];
    return [identifyPredicate evaluateWithObject:self];
}

- (BOOL)isValidIdentifyEighteen
{
    NSString * identifyTest = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    NSPredicate * identifyPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", identifyTest];
    return [identifyPredicate evaluateWithObject:self];
}

//身份证号
- (BOOL)simpleVerifyIdentityCardNum
{
    NSString * regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
    return [pre evaluateWithObject:self];
}

//车牌
- (BOOL)isCarNumber
{
    //车牌号:湘K-DE829 香港车牌号码:粤Z-J499港
    NSString * carRegex = @"^[\u4e00-\u9fff]{1}[a-zA-Z]{1}[-][a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fff]$"; //其中\u4e00-\u9fa5表示unicode编码中汉字已编码部分，\u9fa5-\u9fff是保留部分，将来可能会添加
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", carRegex];
    return [pre evaluateWithObject:self];
}

//精确的身份证号码有效性检测
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value
{
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    int length = 0;
    if (!value) {
        return NO;
    } else {
        length = (int)value.length;

        if (length != 15 && length != 18) {
            return NO;
        }
    }
    // 省份代码
    NSArray * areasArray = @[ @"11", @"12", @"13", @"14", @"15", @"21", @"22", @"23", @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"41", @"42", @"43", @"44", @"45", @"46", @"50", @"51", @"52", @"53", @"54", @"61", @"62", @"63", @"64", @"65", @"71", @"81", @"82", @"91" ];

    NSString * valueStart2 = [value substringToIndex:2];
    BOOL areaFlag = NO;
    for (NSString * areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag = YES;
            break;
        }
    }

    if (!areaFlag) {
        return false;
    }

    NSRegularExpression * regularExpression;
    NSUInteger numberofMatch;

    int year = 0;
    switch (length) {
        case 15:
            year = [value substringWithRange:NSMakeRange (6, 2)].intValue + 1900;

            if (year % 4 == 0 || (year % 100 == 0 && year % 4 == 0)) {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil]; //测试出生日期的合法性
            } else {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil]; //测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange (0, value.length)];

            if (numberofMatch > 0) {
                return YES;
            } else {
                return NO;
            }
        case 18:
            year = [value substringWithRange:NSMakeRange (6, 4)].intValue;
            if (year % 4 == 0 || (year % 100 == 0 && year % 4 == 0)) {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil]; //测试出生日期的合法性
            } else {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil]; //测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange (0, value.length)];

            if (numberofMatch > 0) {
                int S = ([value substringWithRange:NSMakeRange (0, 1)].intValue + [value substringWithRange:NSMakeRange (10, 1)].intValue) * 7 + ([value substringWithRange:NSMakeRange (1, 1)].intValue + [value substringWithRange:NSMakeRange (11, 1)].intValue) * 9 + ([value substringWithRange:NSMakeRange (2, 1)].intValue + [value substringWithRange:NSMakeRange (12, 1)].intValue) * 10 + ([value substringWithRange:NSMakeRange (3, 1)].intValue + [value substringWithRange:NSMakeRange (13, 1)].intValue) * 5 + ([value substringWithRange:NSMakeRange (4, 1)].intValue + [value substringWithRange:NSMakeRange (14, 1)].intValue) * 8 + ([value substringWithRange:NSMakeRange (5, 1)].intValue + [value substringWithRange:NSMakeRange (15, 1)].intValue) * 4 + ([value substringWithRange:NSMakeRange (6, 1)].intValue + [value substringWithRange:NSMakeRange (16, 1)].intValue) * 2 + [value substringWithRange:NSMakeRange (7, 1)].intValue * 1 + [value substringWithRange:NSMakeRange (8, 1)].intValue * 6 + [value substringWithRange:NSMakeRange (9, 1)].intValue * 3;
                int Y = S % 11;
                NSString * M = @"F";
                NSString * JYM = @"10X98765432";
                M = [JYM substringWithRange:NSMakeRange (Y, 1)]; // 判断校验位
                NSString * test = [value substringWithRange:NSMakeRange (17, 1)];
                if ([[M lowercaseString] isEqualToString:[test lowercaseString]]) {
                    return YES; // 检测ID的校验位
                } else {
                    return NO;
                }

            } else {
                return NO;
            }
        default:
            return NO;
    }
}

/** 银行卡号有效性问题Luhn算法
 *  现行 16 位银联卡现行卡号开头 6 位是 622126～622925 之间的，7 到 15 位是银行自定义的，
 *  可能是发卡分行，发卡网点，发卡序号，第 16 位是校验码。
 *  16 位卡号校验位采用 Luhm 校验方法计算：
 *  1，将未带校验位的 15 位卡号从右依次编号 1 到 15，位于奇数位号上的数字乘以 2
 *  2，将奇位乘积的个十位全部相加，再加上所有偶数位上的数字
 *  3，将加法和加上校验位能被 10 整除。
 */
- (BOOL)bankCardluhmCheck
{
    NSString * lastNum = [[self substringFromIndex:(self.length - 1)] copy];  //取出最后一位
    NSString * forwardNum = [[self substringToIndex:(self.length - 1)] copy]; //前15或18位

    NSMutableArray * forwardArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < forwardNum.length; i++) {
        NSString * subStr = [forwardNum substringWithRange:NSMakeRange (i, 1)];
        [forwardArr addObject:subStr];
    }

    NSMutableArray * forwardDescArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = (int)(forwardArr.count - 1); i > -1; i--) { //前15位或者前18位倒序存进数组
        [forwardDescArr addObject:forwardArr[i]];
    }

    NSMutableArray * arrOddNum = [[NSMutableArray alloc] initWithCapacity:0];  //奇数位*2的积 < 9
    NSMutableArray * arrOddNum2 = [[NSMutableArray alloc] initWithCapacity:0]; //奇数位*2的积 > 9
    NSMutableArray * arrEvenNum = [[NSMutableArray alloc] initWithCapacity:0]; //偶数位数组

    for (int i = 0; i < forwardDescArr.count; i++) {
        NSInteger num = [forwardDescArr[i] intValue];
        if (i % 2) { //偶数位
            [arrEvenNum addObject:[NSNumber numberWithInteger:num]];
        } else { //奇数位
            if (num * 2 < 9) {
                [arrOddNum addObject:[NSNumber numberWithInteger:num * 2]];
            } else {
                NSInteger decadeNum = (num * 2) / 10;
                NSInteger unitNum = (num * 2) % 10;
                [arrOddNum2 addObject:[NSNumber numberWithInteger:unitNum]];
                [arrOddNum2 addObject:[NSNumber numberWithInteger:decadeNum]];
            }
        }
    }

    __block NSInteger sumOddNumTotal = 0;
    [arrOddNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL * stop) {
        sumOddNumTotal += [obj integerValue];
    }];

    __block NSInteger sumOddNum2Total = 0;
    [arrOddNum2 enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL * stop) {
        sumOddNum2Total += [obj integerValue];
    }];

    __block NSInteger sumEvenNumTotal = 0;
    [arrEvenNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL * stop) {
        sumEvenNumTotal += [obj integerValue];
    }];

    NSInteger lastNumber = [lastNum integerValue];

    NSInteger luhmTotal = lastNumber + sumEvenNumTotal + sumOddNum2Total + sumOddNumTotal;

    return (luhmTotal % 10 == 0) ? YES : NO;
}

- (BOOL)isIPAddress
{
    NSString * regex = [NSString stringWithFormat:@"^(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})$"];
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL rc = [pre evaluateWithObject:self];

    if (rc) {
        NSArray * componds = [self componentsSeparatedByString:@","];

        BOOL v = YES;
        for (NSString * s in componds) {
            if (s.integerValue > 255) {
                v = NO;
                break;
            }
        }

        return v;
    }

    return NO;
}

- (BOOL)isMacAddress
{
    NSString * macAddRegex = @"([A-Fa-f\\d]{2}:){5}[A-Fa-f\\d]{2}";
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", macAddRegex];
    return [pre evaluateWithObject:self];
}

- (BOOL)isValidUrl
{
    NSString * regex = @"^((http)|(https))+:[^\\s]+\\.[^\\s]*$";
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pre evaluateWithObject:self];
}

- (BOOL)isValidPostalcode
{
    NSString * postalRegex = @"^[0-8]\\d{5}(?!\\d)$";
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", postalRegex];
    return [pre evaluateWithObject:self];
}

- (BOOL)isValidTaxNo
{
    NSString * taxNoRegex = @"[0-9]\\d{13}([0-9]|X)$";
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", taxNoRegex];
    return [pre evaluateWithObject:self];
}

- (BOOL)isOnlyNumber
{
    BOOL res = YES;
    NSCharacterSet * tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < self.length) {
        NSString * string = [self substringWithRange:NSMakeRange (i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }

    return res;
}

@end
