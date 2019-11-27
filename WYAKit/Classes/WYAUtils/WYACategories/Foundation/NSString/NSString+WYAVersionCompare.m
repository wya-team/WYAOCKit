//
//  NSString+WYAVersionCompare.m
//  WYASDProject
//
//  Created by 李俊恒 on 2018/9/18.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSString+WYAVersionCompare.h"

@implementation NSString (WYAVersionCompare)
+ (NSInteger)wya_compareVersion:(NSString *)v1 to:(NSString *)v2
{
    // 都为空，相等，返回0
    if (!v1 && !v2) {
        return 0;
    }

    // v1为空，v2不为空，返回-1
    if (!v1 && v2) {
        return -1;
    }

    // v2为空，v1不为空，返回1
    if (v1 && !v2) {
        return 1;
    }

    // 获取版本号字段
    NSArray * v1Array = [v1 componentsSeparatedByString:@"."];
    NSArray * v2Array = [v2 componentsSeparatedByString:@"."];
    // 取字段最少的，进行循环比较
    NSInteger smallCount = (v1Array.count > v2Array.count) ? v2Array.count : v1Array.count;

    for (int i = 0; i < smallCount; i++) {
        NSInteger value1 = [[v1Array wya_safeObjectAtIndex:i] integerValue];
        NSInteger value2 = [[v2Array wya_safeObjectAtIndex:i] integerValue];
        if (value1 > value2) {
            // v1版本字段大于v2版本字段，返回1
            return 1;
        } else if (value1 < value2) {
            // v2版本字段大于v1版本字段，返回-1
            return -1;
        }

        // 版本相等，继续循环。
    }

    // 版本可比较字段相等，则字段多的版本高于字段少的版本。
    if (v1Array.count > v2Array.count) {
        return 1;
    } else if (v1Array.count < v2Array.count) {
        return -1;
    } else {
        return 0;
    }

    return 0;
}
@end
