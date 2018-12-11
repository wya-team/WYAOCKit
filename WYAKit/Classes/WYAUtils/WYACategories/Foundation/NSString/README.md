# NSString 
## 功能

- 防止越界的增删存取、特殊显示需要的处理、时间戳计算、路径获取、MD5加密、正则匹配等

## 说明
- 系统方法的扩展二次封装会用<font color="red">前缀wya_safe</font>+原始的API名字命名

## NSString+Safe

```Object-C
- (NSString *)wya_safeSubstringFromIndex:(NSUInteger)from;

- (NSString *)wya_safeSubstringToIndex:(NSUInteger)to;

- (NSString *)wya_safeSubstringWithRange:(NSRange)range;

- (NSRange)wya_safeRangeOfString:(NSString *)aString;

- (NSRange)wya_safeRangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask;

- (NSString *)wya_safeStringByAppendingString:(NSString *)aString;
```

## NSMutableString+Safe

```Object-C
- (void)wya_safeInsertString:(NSString *)aString atIndex:(NSUInteger)loc;

- (void)wya_safeAppendString:(NSString *)aString;

- (void)wya_safeSetString:(NSString *)aString;

- (NSUInteger)wya_safeReplaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange;
```
## NSString+Category

```Object-C
/**
 电话号码中间4位*显示
 
 @param phoneNum 电话号码
 @return 135****2262
 */
+ (NSString *)wya_getSecrectStringWithPhoneNumber:(NSString *)phoneNum;

/**
 银行卡号中间8位*显示
 
 @param accountNo 银行卡号
 @return string
 */
+ (NSString *)wya_getSecrectStringWithAccountNo:(NSString *)accountNo;


/**
 转为手机格式，默认为-

 @param mobile 手机号
 @return 格式化的手机号
 */
+ (NSString *)wya_stringMobileFormat:(NSString *)mobile;

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
/**
 抹除小数末尾的0
 
 @return string
 */
- (NSString *)wya_removeUnwantedZero;

/**
 //去掉前后空格
 
 @return string
 */
- (NSString *)wya_trimmedString;

/**
 在utf-8环境下判断字符串是否包含汉字
 
 @return bool
 */
- (BOOL)wya_isContainChineseInUTF8CodeingFormat;

/**
 在gbk环境下判断字符串是否包含汉字
 
 @return bool
 */
- (BOOL)wya_isContainChineseInGBKCodeingFormat;

/**
 在gbk环境下计算字符串有多少个汉字
 
 @return 汉字个数
 */
- (NSInteger)wya_chineseCountOfStringInGBKCodeingFormat;

/**
 获取文件或文件夹大小
 
 @return 大小
 */
- (unsigned long long)wya_fileSize;

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

/**
 去除空格
 
 @return string
 */
- (NSString *)wya_trimmingWhitespace;

/**
 去除空格与空行
 
 @return string
 */
- (NSString *)wya_trimmingWhitespaceAndNewlines;
```

## NSString+DisplayTime

```Object-C
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
```

## NSString+FilePath

```Object-C
/**
 程序主目录，可见子目录(3个):Documents、Library、tmp
 
 @return 主目录路径
 */
+ (NSString *)wya_homePath;

/**
 程序目录，不能存任何东西
 
 @return 路径
 */
+ (NSString *)wya_appPath;

/**
 文档目录，需要ITUNES同步备份的数据存这里，可存放用户数据
 
 @return 路径
 */
+ (NSString *)wya_docPath;

/**
 配置目录，配置文件存这里
 
 @return 路径
 */
+ (NSString *)wya_libPrefPath;

/**
 缓存目录，系统永远不会删除这里的文件，ITUNES会删除
 
 @return 路径
 */
+ (NSString *)wya_libCachePath;

/**
 缓存目录，系统永远不会删除这里的文件，ITUNES会删除
 
 @return 路径
 */
+ (NSString *)wya_tmpPath;
```

## NSString+MD5

```Object-C
- (NSString *)wya_md5WithString; //MD5加密
- (NSString *)wya_to16MD5;
- (NSString *)wya_sha1;
- (NSString *)wya_sha256;
- (NSString *)wya_sha512;
```

## NSString+Predicate

```Object-C

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
```

## NSString+WYAVersionCompare

```Object-C
/**
 对比版本号
 
 @param v1 线上版本
 @param v2 当前系统版本
 @return 返回0（版本号相等）、1（提示用户更新）、-1（线上版本大于当前版本）
 */
+ (NSInteger)wya_compareVersion:(NSString *)v1 to:(NSString *)v2;
```


