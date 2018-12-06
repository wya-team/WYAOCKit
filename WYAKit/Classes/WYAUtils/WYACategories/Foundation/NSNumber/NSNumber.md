# NSNumber
## 说明
- 对于NSNumber常用的功能进行扩展

##NSNumber+Category

```Object-C
/** 返回自己对应的罗马数字 */
- (NSString *)wya_romanNumeral;

/**
 四舍五入
 
 @param digit 限制最大位数
 @return 结果
 */
- (NSNumber *)wya_doRoundWithDigit:(NSUInteger)digit;

/**
 取上整
 
 @param digit 限制最大位数
 @return 结果
 */
- (NSNumber *)wya_doCeilWithDigit:(NSUInteger)digit;

/**
 取下整
 
 @param digit 限制最大位数
 @return 结果
 */
- (NSNumber *)wya_doFloorWithDigit:(NSUInteger)digit;
```


