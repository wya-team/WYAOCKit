//
//  NSDate+Category.m
//  WYAiOSEnv
//
//  Created by 李世航 on 2018/7/9.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

- (NSUInteger)wya_day
{
    return [NSDate wya_day:self];
}

- (NSUInteger)wya_month
{
    return [NSDate wya_month:self];
}

- (NSUInteger)wya_year
{
    return [NSDate wya_year:self];
}

- (NSUInteger)wya_hour
{
    return [NSDate wya_hour:self];
}

- (NSUInteger)wya_minute
{
    return [NSDate wya_minute:self];
}

- (NSUInteger)wya_second
{
    return [NSDate wya_second:self];
}

+ (NSUInteger)wya_day:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];

    return [dayComponents day];
}

+ (NSUInteger)wya_month:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];

    return [dayComponents month];
}

+ (NSUInteger)wya_year:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];

    return [dayComponents year];
}

+ (NSUInteger)wya_hour:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];

    return [dayComponents hour];
}

+ (NSUInteger)wya_minute:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];

    return [dayComponents minute];
}

+ (NSUInteger)wya_second:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];

    return [dayComponents second];
}

- (NSUInteger)wya_daysInYear
{
    return [NSDate wya_daysInYear:self];
}

+ (NSUInteger)wya_daysInYear:(NSDate *)date
{
    return [self wya_isLeapYear:date] ? 366 : 365;
}

- (BOOL)wya_isLeapYear
{
    return [NSDate wya_isLeapYear:self];
}

+ (BOOL)wya_isLeapYear:(NSDate *)date
{
    NSUInteger year = [date wya_year];
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)wya_formatYMD
{
    return [NSDate wya_formatYMD:self];
}

+ (NSString *)wya_formatYMD:(NSDate *)date
{
    return [NSString stringWithFormat:@"%lu-%02lu-%02lu", (unsigned long)[date wya_year], (unsigned long)[date wya_month], (unsigned long)[date wya_day]];
}

- (NSUInteger)wya_weeksOfMonth
{
    return [NSDate wya_weeksOfMonth:self];
}

+ (NSUInteger)wya_weeksOfMonth:(NSDate *)date
{
    return [[date wya_lastdayOfMonth] wya_weekOfYear] - [[date wya_begindayOfMonth] wya_weekOfYear] + 1;
}

- (NSUInteger)wya_weekOfYear
{
    return [NSDate wya_weekOfYear:self];
}

+ (NSUInteger)wya_weekOfYear:(NSDate *)date
{
    NSUInteger i;
    NSUInteger year = [date wya_year];

    NSDate * lastdate = [date wya_lastdayOfMonth];

    for (i = 1;[[lastdate wya_dateAfterDay:-7 * i] wya_year] == year; i++) {
    }

    return i;
}

- (NSDate *)wya_dateAfterDay:(NSUInteger)day
{
    return [NSDate wya_dateAfterDate:self day:day];
}

+ (NSDate *)wya_dateAfterDate:(NSDate *)date day:(NSInteger)day
{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];

    NSDate * dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];

    return dateAfterDay;
}

- (NSDate *)wya_dateAfterMonth:(NSUInteger)month
{
    return [NSDate wya_dateAfterDate:self month:month];
}

+ (NSDate *)wya_dateAfterDate:(NSDate *)date month:(NSInteger)month
{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate * dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];

    return dateAfterMonth;
}

- (NSDate *)wya_begindayOfMonth
{
    return [NSDate wya_begindayOfMonth:self];
}

+ (NSDate *)wya_begindayOfMonth:(NSDate *)date
{
    return [self wya_dateAfterDate:date day:-[date wya_day] + 1];
}

- (NSDate *)wya_lastdayOfMonth
{
    return [NSDate wya_lastdayOfMonth:self];
}

+ (NSDate *)wya_lastdayOfMonth:(NSDate *)date
{
    NSDate * lastDate = [self wya_begindayOfMonth:date];
    return [[lastDate wya_dateAfterMonth:1] wya_dateAfterDay:-1];
}

- (NSUInteger)wya_daysAgo
{
    return [NSDate wya_daysAgo:self];
}

+ (NSUInteger)wya_daysAgo:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * components = [calendar components:(NSCalendarUnitDay)
                                                fromDate:date
                                                  toDate:[NSDate date]
                                                 options:0];

    return [components day];
}

- (NSInteger)wya_weekday
{
    return [NSDate wya_weekday:self];
}

+ (NSInteger)wya_weekday:(NSDate *)date
{
    NSCalendar * gregorian = [[NSCalendar alloc]
                        initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents * comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    weekday == 1 ? weekday = 7 : weekday--;
    return weekday;
}

- (NSString *)wya_dayFromWeekday
{
    return [NSDate wya_dayFromWeekday:self];
}

+ (NSString *)wya_dayFromWeekday:(NSDate *)date
{
    switch ([date wya_weekday]) {
        case 7:
            return @"星期天";
            break;
        case 1:
            return @"星期一";
            break;
        case 2:
            return @"星期二";
            break;
        case 3:
            return @"星期三";
            break;
        case 4:
            return @"星期四";
            break;
        case 5:
            return @"星期五";
            break;
        case 6:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
}

- (BOOL)wya_isSameDay:(NSDate *)anotherDate
{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * components1 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                 fromDate:self];
    NSDateComponents * components2 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                 fromDate:anotherDate];
    return ([components1 year] == [components2 year] && [components1 month] == [components2 month] && [components1 day] == [components2 day]);
}

- (BOOL)wya_isToday
{
    return [self wya_isSameDay:[NSDate date]];
}

- (NSDate *)wya_dateByAddingDays:(NSUInteger)days
{
    NSDateComponents * c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

+ (NSString *)wya_monthWithMonthNumber:(NSInteger)month
{
    switch (month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

+ (NSString *)wya_stringWithDate:(NSDate *)date format:(NSString *)format
{
    return [date wya_stringWithFormat:format];
}

- (NSString *)wya_stringWithFormat:(NSString *)format
{
    NSDateFormatter * outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];

    NSString * retStr = [outputFormatter stringFromDate:self];

    return retStr;
}

+ (NSDate *)wya_dateWithString:(NSString *)string format:(NSString *)format
{
    NSDateFormatter * inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];

    NSDate * date = [inputFormatter dateFromString:string];

    return date;
}

- (NSUInteger)wya_daysInMonth:(NSUInteger)month
{
    return [NSDate wya_daysInMonth:self month:month];
}

+ (NSUInteger)wya_daysInMonth:(NSDate *)date month:(NSUInteger)month
{
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
        case 2:
            return [date wya_isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (NSUInteger)wya_daysInMonth
{
    return [NSDate wya_daysInMonth:self];
}

+ (NSUInteger)wya_daysInMonth:(NSDate *)date
{
    return [self wya_daysInMonth:date month:[date wya_month]];
}

- (NSString *)wya_timeInfo
{
    return [NSDate wya_timeInfoWithDate:self];
}

+ (NSString *)wya_timeInfoWithDate:(NSDate *)date
{
    return [self wya_timeInfoWithDateString:[self wya_stringWithDate:date format:[self wya_ymdHmsFormat]]];
}

+ (NSString *)wya_timeInfoWithDateString:(NSString *)dateString
{
    NSDate * date = [self wya_dateWithString:dateString format:[self wya_ymdHmsFormat]];

    NSDate * curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];

    int month = (int)([curDate wya_month] - [date wya_month]);
    int year = (int)([curDate wya_year] - [date wya_year]);
    int day = (int)([curDate wya_day] - [date wya_day]);

    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs (year) == 0 && abs (month) <= 1) || (abs (year) == 1 && [curDate wya_month] == 1 && [date wya_month] == 12)) {
        int retDay = 0;
        if (year == 0) {      // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }

        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self wya_daysInMonth:date month:[date wya_month]];

            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate wya_day] + (totalDays - (int)[date wya_day]);
        }

        return [NSString stringWithFormat:@"%d天前", (abs) (retDay)];
    } else {
        if (abs (year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs (month)];
            }

            // 隔年
            int month = (int)[curDate wya_month];
            int preMonth = (int)[date wya_month];
            if (month == 12 && preMonth == 12) { // 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs) (12 - preMonth + month)];
        }

        return [NSString stringWithFormat:@"%d年前", abs (year)];
    }

    return @"1小时前";
}

- (NSString *)wya_ymdFormat
{
    return [NSDate wya_ymdFormat];
}

- (NSString *)wya_hmsFormat
{
    return [NSDate wya_hmsFormat];
}

- (NSString *)wya_ymdHmsFormat
{
    return [NSDate wya_ymdHmsFormat];
}

+ (NSString *)wya_ymdFormat
{
    return @"yyyy-MM-dd";
}

+ (NSString *)wya_hmsFormat
{
    return @"HH:mm:ss";
}

+ (NSString *)wya_ymdHmsFormat
{
    return [NSString stringWithFormat:@"%@ %@", [self wya_ymdFormat], [self wya_hmsFormat]];
}

- (NSDate *)wya_offsetYears:(int)numYears
{
    return [NSDate wya_offsetYears:numYears fromDate:self];
}

+ (NSDate *)wya_offsetYears:(int)numYears fromDate:(NSDate *)fromDate
{
    if (fromDate == nil) {
        return nil;
    }
    NSCalendar * gregorian = [[NSCalendar alloc]
                        initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];

    return [gregorian dateByAddingComponents:offsetComponents
                                        toDate:fromDate
                                       options:0];
}

- (NSDate *)wya_offsetMonths:(int)numMonths
{
    return [NSDate wya_offsetMonths:numMonths fromDate:self];
}

+ (NSDate *)wya_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate
{
    if (fromDate == nil) {
        return nil;
    }

    NSCalendar * gregorian = [[NSCalendar alloc]
                        initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];

    return [gregorian dateByAddingComponents:offsetComponents
                                        toDate:fromDate
                                       options:0];
}

- (NSDate *)wya_offsetDays:(int)numDays
{
    return [NSDate wya_offsetDays:numDays fromDate:self];
}

+ (NSDate *)wya_offsetDays:(int)numDays fromDate:(NSDate *)fromDate
{
    if (fromDate == nil) {
        return nil;
    }
    NSCalendar * gregorian = [[NSCalendar alloc]
                        initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];

    return [gregorian dateByAddingComponents:offsetComponents
                                        toDate:fromDate
                                       options:0];
}

- (NSDate *)wya_offsetHours:(int)hours
{
    return [NSDate wya_offsetHours:hours fromDate:self];
}

+ (NSDate *)wya_offsetHours:(int)numHours fromDate:(NSDate *)fromDate
{
    if (fromDate == nil) {
        return nil;
    }

    NSCalendar * gregorian = [[NSCalendar alloc]
                        initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:numHours];

    return [gregorian dateByAddingComponents:offsetComponents
                                        toDate:fromDate
                                       options:0];
}

+ (NSString *)wya_stringNowWithFullFormatter
{
    NSDate * now = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * str = [formatter stringFromDate:now];
    return str;
}

+ (NSString *)wya_stringNowWithFormatter:(NSString *)format
{
    NSDate * now = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString * str = [formatter stringFromDate:now];
    return str;
}

+ (NSString *)wya_stringWithTimeInterval:(unsigned int)time Formatter:(NSString *)format
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSTimeZone * localtimezone = [NSTimeZone systemTimeZone];
    NSInteger offset = [localtimezone secondsFromGMT];
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:(time - offset)];
    NSString * timeStr = [formatter stringFromDate:date];
    return timeStr;
}

+ (NSTimeInterval)wya_now
{
    NSDate * now = [NSDate date];
    NSTimeZone * zone = [NSTimeZone systemTimeZone];
    NSInteger offset = [zone secondsFromGMT];
    return [now timeIntervalSince1970] + offset;
}

+ (NSTimeInterval)wya_timeIntervalFromString:(NSString *)timeStr Formatter:(NSString *)format
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate * date = [formatter dateFromString:timeStr];
    NSTimeZone * zone = [NSTimeZone systemTimeZone];
    NSInteger offset = [zone secondsFromGMT];
    return ([date timeIntervalSince1970] + offset);
}
+ (NSString *)wya_getNowTimeTimes
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];

    [formatter setDateStyle:NSDateFormatterMediumStyle];

    [formatter setTimeStyle:NSDateFormatterShortStyle];

    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制

    //设置时区,这个对于时间的处理有时很重要

    NSTimeZone * timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];

    [formatter setTimeZone:timeZone];

    NSDate * datenow = [NSDate date]; //现在时间,你可以输出来看下是什么格式

    NSString * timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970] * 1000];

    return timeSp;
}
@end
