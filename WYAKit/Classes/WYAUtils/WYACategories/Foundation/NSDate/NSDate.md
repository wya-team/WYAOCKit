# NSDate
## 说明
- 对NSDate做出扩展满足常用的需求

## 方法
```Object-C
/**
 * 根据日期返回字符串
 */
+ (NSString *)wya_stringWithDate:(NSDate *)date format:(NSString *)format;
- (NSString *)wya_stringWithFormat:(NSString *)format;
+ (NSDate *)wya_dateWithString:(NSString *)string format:(NSString *)format;

/**
 * 根据TimeInterval获取时间字符串,带有时区偏移
 */
+ (NSString *)wya_stringWithTimeInterval:(unsigned int)time Formatter:(NSString *)format;
/**
 * 根据字符串和格式获取TimeInterval时间,带有时区偏移
 */
+ (NSTimeInterval)wya_timeIntervalFromString:(NSString *)timeStr Formatter:(NSString *)format;

/**
 * 当前TimeInterval时间,带有时区偏移
 */
+ (NSTimeInterval)wya_now;

/**
 * yyyy-MM-dd HH:mm:ss格式的当前时间
 */
+ (NSString *)wya_stringNowWithFullFormatter;

/**
 * 自定义格式的当前时间
 */
+ (NSString *)wya_stringNowWithFormatter:(NSString *)format;

/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)wya_day;
- (NSUInteger)wya_month;
- (NSUInteger)wya_year;
- (NSUInteger)wya_hour;
- (NSUInteger)wya_minute;
- (NSUInteger)wya_second;
+ (NSUInteger)wya_day:(NSDate *)date;
+ (NSUInteger)wya_month:(NSDate *)date;
+ (NSUInteger)wya_year:(NSDate *)date;
+ (NSUInteger)wya_hour:(NSDate *)date;
+ (NSUInteger)wya_minute:(NSDate *)date;
+ (NSUInteger)wya_second:(NSDate *)date;

/**
 * 获取一年中的总天数
 */
- (NSUInteger)wya_daysInYear;
+ (NSUInteger)wya_daysInYear:(NSDate *)date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)wya_isLeapYear;
+ (BOOL)wya_isLeapYear:(NSDate *)date;

/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)wya_weekOfYear;
+ (NSUInteger)wya_weekOfYear:(NSDate *)date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)wya_formatYMD;
+ (NSString *)wya_formatYMD:(NSDate *)date;

/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)wya_weeksOfMonth;
+ (NSUInteger)wya_weeksOfMonth:(NSDate *)date;

/**
 * 获取该月的第一天的日期
 */
- (NSDate *)wya_begindayOfMonth;
+ (NSDate *)wya_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)wya_lastdayOfMonth;
+ (NSDate *)wya_lastdayOfMonth:(NSDate *)date;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)wya_dateAfterDay:(NSUInteger)day;
+ (NSDate *)wya_dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回day月后的日期(若month为负数,则为|month|月前的日期)
 */
- (NSDate *)wya_dateAfterMonth:(NSUInteger)month;
+ (NSDate *)wya_dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)wya_offsetYears:(int)numYears;
+ (NSDate *)wya_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)wya_offsetMonths:(int)numMonths;
+ (NSDate *)wya_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)wya_offsetDays:(int)numDays;
+ (NSDate *)wya_offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)wya_offsetHours:(int)hours;
+ (NSDate *)wya_offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/**
 * 距离该日期前几天
 */
- (NSUInteger)wya_daysAgo;
+ (NSUInteger)wya_daysAgo:(NSDate *)date;

/**
 *  获取星期几
 */
- (NSInteger)wya_weekday;
+ (NSInteger)wya_weekday:(NSDate *)date;

/**
 *  获取星期几(名称)
 */
- (NSString *)wya_dayFromWeekday;
+ (NSString *)wya_dayFromWeekday:(NSDate *)date;

/**
 *  日期是否相等
 */
- (BOOL)wya_isSameDay:(NSDate *)anotherDate;

/**
 *  是否是今天
 */
- (BOOL)wya_isToday;

/**
 *  增加
 */
- (NSDate *)wya_dateByAddingDays:(NSUInteger)days;

/**
 *  获得NSString的月份
 */
+ (NSString *)wya_monthWithMonthNumber:(NSInteger)month;

/**
 * 获取指定月份的天数
 */
- (NSUInteger)wya_daysInMonth:(NSUInteger)month;
+ (NSUInteger)wya_daysInMonth:(NSDate *)date month:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)wya_daysInMonth;
+ (NSUInteger)wya_daysInMonth:(NSDate *)date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)wya_timeInfo;
+ (NSString *)wya_timeInfoWithDate:(NSDate *)date;
+ (NSString *)wya_timeInfoWithDateString:(NSString *)dateString;

/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)wya_ymdFormat;
- (NSString *)wya_hmsFormat;
- (NSString *)wya_ymdHmsFormat;
+ (NSString *)wya_ymdFormat;
+ (NSString *)wya_hmsFormat;
+ (NSString *)wya_ymdHmsFormat;

/**
 获取当前时间戳（毫秒）

 @return 返回字符串时间戳
 */
+ (NSString *)wya_getNowTimeTimes;

```
- 暂定这写功能，后续有需求可以继续完善

