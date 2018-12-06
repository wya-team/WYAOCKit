//
//  NSString+DisplayTime.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DisplayTime)
/**
 通过时间戳计算时间差（几小时前、几天前
 
 @param compareDate compareDate
 @return String
 */
+ (NSString *)wya_compareCurrentTime:(NSTimeInterval)compareDate;

/**
 通过时间戳得出对应的时间
 
 @param timestamp 时间戳
 @return String
 */
+ (NSString *)wya_getDateStringWithTimestamp:(NSTimeInterval)timestamp;

/**
 //通过时间戳和显示时间
 @param timestamp 时间戳
 @param formatter 格式
 @return String
 */
+ (NSString *)wya_getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString *)formatter;

@end
