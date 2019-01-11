//
//  NSString+Predicate.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Predicate)

/**
 有效的电话号码

 @return YES or NO
 */
- (BOOL)wya_isValidMobileNumber;

/**
 是否是由字母数字下划线中文组成2位到8位

 @return YES or NO
 */
- (BOOL)wya_isValidRealName;

/**
 是否只有中文

 @return YES or NO
 */
- (BOOL)wya_isOnlyChinese;

/**
 有效的验证码(根据需求进行位数修改)这里是4位

 */
- (BOOL)wya_isValidVerifyCode;

/**
 有效的银行卡号

 */
- (BOOL)wya_isValidBankCardNumber;

/**
 有效的邮箱

 */
- (BOOL)wya_isValidEmail;

/**
 有效的字母数字密码
 */
- (BOOL)wya_isValidAlphaNumberPassword;

/**
 检测有效身份证 15位
 */
- (BOOL)wya_isValidIdentifyFifteen;

/**
 检测有效身份证 18位
 */
- (BOOL)wya_isValidIdentifyEighteen;

/**
 车牌号的有效性

 @return yes 有效  no 无效
 */
- (BOOL)wya_isCarNumber;

/**
 简单的身份证有效性

 @return yes 有效  no 无效
 */
- (BOOL)wya_simpleVerifyIdentityCardNum;

/**
 精确的身份证号码有效性检测

 @param value 精确的身份证号码有效性检测
 @return yes 有效  no 无效
 */
+ (BOOL)wya_accurateVerifyIDCardNumber:(NSString *)value;

/**
 银行卡的有效性

 @return yes 有效  no 无效
 */
- (BOOL)wya_bankCardluhmCheck;

/**
 IP地址有效性

 @return yes 有效  no 无效
 */
- (BOOL)wya_isIPAddress;

/**
 Mac地址有效性

 @return yes 有效  no 无效
 */
- (BOOL)wya_isMacAddress;

/**
 网址有效性

 @return yes 有效  no 无效
 */
- (BOOL)wya_isValidUrl;

/**
 邮政编码

 @return yes 有效  no 无效
 */
- (BOOL)wya_isValidPostalcode;

/**
 工商税号

 @return yes 有效  no 无效
 */
- (BOOL)wya_isValidTaxNo;

/**
 限制只能输入数字
 */
- (BOOL)wya_isOnlyNumber;
@end

/**
 *  正则表达式简单说明
 *  语法：
 .       匹配除换行符以外的任意字符
 \w      匹配字母或数字或下划线或汉字
 \s      匹配任意的空白符
 \d      匹配数字
 \b      匹配单词的开始或结束
 ^       匹配字符串的开始
 $       匹配字符串的结束
 *       重复零次或更多次
 +       重复一次或更多次
 ?       重复零次或一次
 {n}     重复n次
 {n,}     重复n次或更多次
 {n,m}     重复n到m次
 \W      匹配任意不是字母，数字，下划线，汉字的字符
 \S      匹配任意不是空白符的字符
 \D      匹配任意非数字的字符
 \B      匹配不是单词开头或结束的位置
 [^x]     匹配除了x以外的任意字符
 [^aeiou]匹配除了aeiou这几个字母以外的任意字符
 *?      重复任意次，但尽可能少重复
 +?      重复1次或更多次，但尽可能少重复
 ??      重复0次或1次，但尽可能少重复
 {n,m}?     重复n到m次，但尽可能少重复
 {n,}?     重复n次以上，但尽可能少重复
 \a      报警字符(打印它的效果是电脑嘀一声)
 \b      通常是单词分界位置，但如果在字符类里使用代表退格
 \t      制表符，Tab
 \r      回车
 \v      竖向制表符
 \f      换页符
 \n      换行符
 \e      Escape
 \0nn     ASCII代码中八进制代码为nn的字符
 \xnn     ASCII代码中十六进制代码为nn的字符
 \unnnn     Unicode代码中十六进制代码为nnnn的字符
 \cN     ASCII控制字符。比如\cC代表Ctrl+C
 \A      字符串开头(类似^，但不受处理多行选项的影响)
 \Z      字符串结尾或行尾(不受处理多行选项的影响)
 \z      字符串结尾(类似$，但不受处理多行选项的影响)
 \G      当前搜索的开头
 \p{name}     Unicode中命名为name的字符类，例如\p{IsGreek}
 (?>exp)     贪婪子表达式
 (?<x>-<y>exp)     平衡组
 (?im-nsx:exp)     在子表达式exp中改变处理选项
 (?im-nsx)       为表达式后面的部分改变处理选项
 (?(exp)yes|no) 把exp当作零宽正向先行断言，如果在这个位置能匹配，使用yes作为此组的表达式；否则使用no
 (?(exp)yes)     同上，只是使用空表达式作为no
 (?(name)yes|no) 如果命名为name的组捕获到了内容，使用yes作为表达式；否则使用no
 (?(name)yes)     同上，只是使用空表达式作为no

 捕获
 (exp)               匹配exp,并捕获文本到自动命名的组里
 (?<name>exp)        匹配exp,并捕获文本到名称为name的组里，也可以写成(?'name'exp)
 (?:exp)             匹配exp,不捕获匹配的文本，也不给此分组分配组号
 零宽断言
 (?=exp)             匹配exp前面的位置
 (?<=exp)            匹配exp后面的位置
 (?!exp)             匹配后面跟的不是exp的位置
 (?<!exp)            匹配前面不是exp的位置
 注释
 (?#comment)         这种类型的分组不对正则表达式的处理产生任何影响，用于提供注释让人阅读

 *  表达式：\(?0\d{2}[) -]?\d{8}
 *  这个表达式可以匹配几种格式的电话号码，像(010)88886666，或022-22334455，或02912345678等。
 *  我们对它进行一些分析吧：
 *
 首先是一个转义字符\(,它能出现0次或1次(?),然后是一个0，后面跟着2个数字(\d{2})，然后是)或-或空格中的一个，它出现1次或不出现(?)，
 *  最后是8个数字(\d{8})
 */
