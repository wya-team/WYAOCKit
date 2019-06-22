//
//  NSString+Category.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

//数组中文格式（几万）可自行添加

/**
 金额数字添加单位（暂时写了万和亿，有更多的需求请参考写法来自行添加）

 @param value 金额
 @return string
 */
+ (NSString *)wya_stringChineseFormat:(double)value;

/**
 添加数字的千位符

 @param num need change string
 @return string
 */
+ (NSString *)wya_countNumAndChangeformat:(NSString *)num;

/**
 *  NSString转为NSNumber
 *
 *  @return NSNumber
 */
- (NSNumber *)wya_toNumber;

/**
 计算文字高度

 @param fontSize 字体
 @param width 最大宽度
 @return hight 高度
 */
- (CGFloat)wya_heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width;

/**
 计算文字宽度

 @param fontSize 字体
 @param maxHeight 最大高度
 @return width宽度
 */
- (CGFloat)wya_widthWithFontSize:(CGFloat)fontSize height:(CGFloat)maxHeight;
@end

@interface NSString (Html)
/**
 清除html标签

 @return string
 */
- (NSString *)wya_stringByStrippingHTML;

/**
 清除js脚本

 @return string
 */
- (NSString *)wya_stringByRemovingScriptsAndStrippingHTML;
@end
