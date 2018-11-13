//
//  NSString+Category.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

/*
 *  中文字符在utf-8环境下占3个字节，在gbk环境下占2个字节
 */

#import <Foundation/Foundation.h>

@interface NSString (Category)
/**
 电话号码中间4位*显示
 
 @param phoneNum 电话号码
 @return 135****2262
 */
+ (NSString *)getSecrectStringWithPhoneNumber:(NSString *)phoneNum;

/**
 银行卡号中间8位*显示
 
 @param accountNo 银行卡号
 @return string
 */
+ (NSString *)getSecrectStringWithAccountNo:(NSString *)accountNo;


/**
 转为手机格式，默认为-

 @param mobile 手机号
 @return 格式化的手机号
 */
+ (NSString *)stringMobileFormat:(NSString *)mobile;

//数组中文格式（几万）可自行添加

/**
 金额数字添加单位（暂时写了万和亿，有更多的需求请参考写法来自行添加）
 
 @param value 金额
 @return string
 */
+ (NSString *)stringChineseFormat:(double)value;

/**
 添加数字的千位符
 
 @param num need change string
 @return string
 */
+ (NSString *)countNumAndChangeformat:(NSString *)num;

/**
 *  NSString转为NSNumber
 *
 *  @return NSNumber
 */
- (NSNumber *)toNumber;

/**
 计算文字高度
 
 @param fontSize 字体
 @param width 最大宽度
 @return hight 高度
 */
- (CGFloat)heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width;

/**
 计算文字宽度
 
 @param fontSize 字体
 @param maxHeight 最大高度
 @return width宽度
 */
- (CGFloat)widthWithFontSize:(CGFloat)fontSize height:(CGFloat)maxHeight;
/**
 抹除小数末尾的0
 
 @return string
 */
- (NSString *)removeUnwantedZero;

/**
 //去掉前后空格
 
 @return string
 */
- (NSString *)trimmedString;

/**
 在utf-8环境下判断字符串是否包含汉字
 
 @return bool
 */
- (BOOL)isContainChineseInUTF8CodeingFormat;

/**
 在gbk环境下判断字符串是否包含汉字
 
 @return bool
 */
- (BOOL)isContainChineseInGBKCodeingFormat;

/**
 在gbk环境下计算字符串有多少个汉字
 
 @return 汉字个数
 */
- (NSInteger)chineseCountOfStringInGBKCodeingFormat;

/**
 获取文件或文件夹大小
 
 @return 大小
 */
- (unsigned long long)fileSize;

/**
 清除html标签

 @return string
 */
- (NSString *)stringByStrippingHTML;

/**
 清除js脚本
 
 @return string
 */
- (NSString *)stringByRemovingScriptsAndStrippingHTML;

/**
 去除空格
 
 @return string
 */
- (NSString *)trimmingWhitespace;

/**
 去除空格与空行
 
 @return string
 */
- (NSString *)trimmingWhitespaceAndNewlines;
@end
