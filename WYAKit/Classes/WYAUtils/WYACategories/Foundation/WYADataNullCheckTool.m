//
//  WYADataNullCheckTool.m
//  WYA_Project
//
//  Created by 李俊恒 on 2018/4/9.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYADataNullCheckTool.h"

@implementation WYADataNullCheckTool

@end

NSString *checkString(id str){
    NSString *tmpStr =  [NSString stringWithFormat:@"%@",str];
    if ([str isKindOfClass:[NSNull class]]||
        [tmpStr isEqualToString:@"(null)"]||
        [tmpStr isEqualToString:@"<null>"]) {
        tmpStr = @"暂无数据";
    }
    return tmpStr;
}
NSArray *checkArray(id arr){
    NSArray *tmpArr =  arr;
    if ([arr isKindOfClass:[NSNull class]]) {
        tmpArr = @[];
    }
    return tmpArr;
}
NSString *checkNumber(id str){
    NSString *tmpStr = [NSString stringWithFormat:@"%@",str];
    if ( [str isKindOfClass:[NSNull class]]||![str floatValue]) {
        tmpStr = @"0";
    }
    //去掉数字中的","
    NSMutableString *newStr = [NSMutableString stringWithString:tmpStr];
    for (int i = 0; i < newStr.length; i++) {
        unichar c = [newStr characterAtIndex:i];
        NSRange range = NSMakeRange(i, 1);
        if (c == ',') {
            [newStr deleteCharactersInRange:range];
            --i;
        }
    }
    NSString *newString = [NSString stringWithString:newStr];
    CGFloat tmpFloat = [newString floatValue] ;
    tmpStr = [NSString stringWithFormat:@"%.2f",tmpFloat];
    return tmpStr;
}
