//
//  WYAPickerManager.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/22.
//

#import "WYAPickerManager.h"

@interface WYAPickerManager ()
@property (nonatomic, copy) NSCalendar * calendar;
@property (nonatomic, assign) NSCalendarUnit unitFlags;
@property (nonatomic, strong) NSDateComponents * minimumComponents;
@property (nonatomic, strong) NSDateComponents * maximumComponents;
@property (nonatomic, strong) NSDateComponents * currentComponents;

//@property (nonatomic, strong) NSDateComponents *selectedComponents;
@end

@implementation WYAPickerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.selectComponents = [self.calendar components:self.unitFlags fromDate:[NSDate date]];
    }
    return self;
}

- (void)setMinimumDate:(NSDate *)minimumDate
{
    _minimumDate           = minimumDate;
    self.minimumComponents = [self.calendar components:self.unitFlags fromDate:minimumDate];
}

- (void)setMaximumDate:(NSDate *)maximumDate
{
    _maximumDate           = maximumDate;
    self.maximumComponents = [self.calendar components:self.unitFlags fromDate:maximumDate];
}

- (void)setSelectDate:(NSDate *)selectDate
{
    if (selectDate) {
        self.selectComponents = [self.calendar components:self.unitFlags fromDate:selectDate];
    }
}

#pragma mark - Getter
- (NSCalendar *)calendar
{
    if (!_calendar) {
        _calendar = [NSCalendar currentCalendar];
        //        _calendar.timeZone = self.timeZone;
        //        _calendar.locale = self.locale;
    }
    return _calendar;
}
- (NSCalendarUnit)unitFlags
{
    if (!_unitFlags) {
        _unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |
                     NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond |
                     NSCalendarUnitWeekday;
    }
    return _unitFlags;
}

- (NSDateComponents *)minimumComponents
{
    if (self.minimumDate) {
        _minimumComponents = [self.calendar components:self.unitFlags fromDate:self.minimumDate];
    } else {
        _minimumComponents =
        [self.calendar components:self.unitFlags
                         fromDate:[NSDate distantPast]];
        _minimumComponents.day    = 1;
        _minimumComponents.month  = 1;
        _minimumComponents.hour   = 0;
        _minimumComponents.minute = 0;
        _minimumComponents.second = 0;
    }
    return _minimumComponents;
}

- (NSDateComponents *)maximumComponents
{
    if (self.maximumDate) {
        _maximumComponents = [self.calendar components:self.unitFlags fromDate:self.maximumDate];
    } else {
        _maximumComponents =
        [self.calendar components:self.unitFlags
                         fromDate:[NSDate distantFuture]];
        NSInteger day = [self howManyDaysWithMonthInThisYear:self.currentComponents.year
                                                   withMonth:self.currentComponents.month];
        _maximumComponents.day    = day;
        _maximumComponents.month  = 12;
        _maximumComponents.hour   = 23;
        _maximumComponents.minute = 59;
        _maximumComponents.second = 59;
    }
    return _maximumComponents;
}

- (NSDateComponents *)currentComponents
{
    if (!_currentComponents) {
        _currentComponents = [self.calendar components:self.unitFlags fromDate:[NSDate date]];
    }
    return _currentComponents;
}

- (NSMutableArray *)yearArray
{
    NSInteger index        = self.maximumComponents.year - self.minimumComponents.year;
    NSMutableArray * years = [NSMutableArray arrayWithCapacity:index];
    for (NSInteger i = self.minimumComponents.year; i <= self.maximumComponents.year; i++) {
        [years addObject:[@(i) stringValue]];
    }
    return years;
}

- (NSMutableArray *)monthArray
{
    NSInteger minimum = 1;
    NSInteger maximum = 12;
    //        if (_setDate == nil && self.maximumComponents.year <= self.currentComponents.year)
    //        {
    //            maximum = self.maximumComponents.month;
    //        }
    //    if (self.selectYear) {
    //        if (self.selectYear == self.minimumComponents.year) {
    //            minimum = self.minimumComponents.month;
    //        }
    //        if (self.selectYear == self.maximumComponents.year) {
    //            maximum = self.maximumComponents.month;
    //        }
    //    } else {
    //
    //    }
    if (self.minimumComponents.year == self.maximumComponents.year) {
        minimum = self.minimumComponents.month;
        maximum = self.maximumComponents.month;
    } else {
        if (self.selectComponents.year == self.minimumComponents.year) {
            minimum = self.minimumComponents.month;
        }
        if (self.selectComponents.year == self.maximumComponents.year) {
            maximum = self.maximumComponents.month;
        }
    }

    NSMutableArray * months = [NSMutableArray array];
    for (NSUInteger i = minimum; i <= maximum; i++) {
        [months addObject:[@(i) stringValue]];
    }
    _monthArray = months;
    return _monthArray;
}

- (NSMutableArray *)dayArray
{
    NSInteger minDay, maxDay;
    //    if (self.selectYear && self.selectMonth) {
    //
    //    } else{
    //        minDay = 1;
    //        maxDay = [self howManyDaysWithMonthInThisYear:self.selectComponents.year withMonth:self.selectComponents.month];
    //    }
    if (self.minimumComponents.year == self.maximumComponents.year &&
        self.minimumComponents.month == self.maximumComponents.month) {
        minDay = self.minimumComponents.day;
        maxDay = self.maximumComponents.day;
    } else {
        if (self.selectComponents.year == self.minimumComponents.year &&
            self.selectComponents.month == self.minimumComponents.month) {
            // 现在是最小的
            minDay = self.minimumComponents.day;
            maxDay = [self howManyDaysWithMonthInThisYear:self.minimumComponents.year withMonth:self.minimumComponents.month];
        } else if (self.selectComponents.year == self.maximumComponents.year &&
                   self.selectComponents.month == self.maximumComponents.month) {
            // 日期最大范围的
            minDay = 1;
            maxDay = self.maximumComponents.day;
        } else {
            minDay = 1;
            maxDay = [self howManyDaysWithMonthInThisYear:self.selectComponents.year withMonth:self.selectComponents.month];
        }
    }

    NSMutableArray * days = [NSMutableArray array];

    for (NSUInteger i = minDay; i <= maxDay; i++) {
        [days addObject:[@(i) stringValue]];
    }
    _dayArray = days;
    return _dayArray;
}

- (NSMutableArray *)hourArray
{
    NSInteger minimum = 0;
    NSInteger maximum = 23;
    if (self.minimumComponents.year == self.maximumComponents.year &&
        self.minimumComponents.month == self.maximumComponents.month &&
        self.minimumComponents.day == self.maximumComponents.day) {
        minimum = self.minimumComponents.hour;
        maximum = self.maximumComponents.hour;
    } else {
        if (self.selectComponents.year == self.minimumComponents.year &&
            self.selectComponents.month == self.minimumComponents.month &&
            self.selectComponents.day == self.minimumComponents.day) {
            minimum = self.minimumComponents.hour;
        } else if (self.selectComponents.year == self.maximumComponents.year &&
                   self.selectComponents.month == self.maximumComponents.month &&
                   self.selectComponents.day == self.maximumComponents.day) {
            maximum = self.maximumComponents.hour;
        }
    }

    NSInteger index        = maximum - minimum;
    NSMutableArray * hours = [NSMutableArray array];
    for (NSUInteger i = minimum; i <= maximum; i++) {
        [hours addObject:[@(i) stringValue]];
    }
    return hours;
}

- (NSMutableArray *)minuteArray
{
    NSInteger minimum = 0;
    NSInteger maximum = 59;
    if (self.minimumComponents.year == self.maximumComponents.year &&
        self.minimumComponents.month == self.maximumComponents.month &&
        self.minimumComponents.day == self.maximumComponents.day &&
        self.minimumComponents.hour == self.maximumComponents.hour) {
        minimum = self.minimumComponents.minute;
        maximum = self.maximumComponents.minute;
    } else {
        if (self.selectComponents.year == self.minimumComponents.year &&
            self.selectComponents.month == self.minimumComponents.month &&
            self.selectComponents.day == self.minimumComponents.day &&
            self.selectComponents.hour == self.minimumComponents.hour) {
            minimum = self.minimumComponents.minute;
        } else if (self.selectComponents.year == self.maximumComponents.year &&
                   self.selectComponents.month == self.maximumComponents.month &&
                   self.selectComponents.day == self.maximumComponents.day &&
                   self.selectComponents.hour == self.maximumComponents.hour) {
            maximum = self.maximumComponents.minute;
        }
    }
    NSInteger index          = maximum - minimum;
    NSMutableArray * minutes = [NSMutableArray array];
    for (NSUInteger i = minimum; i <= maximum; i++) {
        [minutes addObject:[@(i) stringValue]];
    }
    return minutes;
}

- (NSMutableArray *)secondArray
{
    NSInteger minimum = 0;
    NSInteger maximum = 59;
    if (self.minimumComponents.year == self.maximumComponents.year &&
        self.minimumComponents.month == self.maximumComponents.month &&
        self.minimumComponents.day == self.maximumComponents.day &&
        self.minimumComponents.hour == self.maximumComponents.hour &&
        self.minimumComponents.minute == self.maximumComponents.minute) {
        minimum = self.minimumComponents.second;
        maximum = self.maximumComponents.second;
    } else {
        if (self.selectComponents.year == self.minimumComponents.year &&
            self.selectComponents.month == self.minimumComponents.month &&
            self.selectComponents.day == self.minimumComponents.day &&
            self.selectComponents.hour == self.minimumComponents.hour &&
            self.selectComponents.minute == self.minimumComponents.minute) {
            minimum = self.minimumComponents.second;
        } else if (self.selectComponents.year == self.maximumComponents.year &&
                   self.selectComponents.month == self.maximumComponents.month &&
                   self.selectComponents.day == self.maximumComponents.day &&
                   self.selectComponents.hour == self.maximumComponents.hour &&
                   self.selectComponents.minute == self.maximumComponents.minute) {
            maximum = self.maximumComponents.second;
        }
    }
    NSInteger index          = maximum - minimum;
    NSMutableArray * seconds = [NSMutableArray array];
    for (NSUInteger i = minimum; i <= maximum; i++) {
        [seconds addObject:[@(i) stringValue]];
    }
    return seconds;
}

- (NSInteger)yearRow
{
    return self.selectComponents.year - self.minimumComponents.year;
}

- (NSInteger)monthRow
{
    if (self.selectComponents.year == self.minimumComponents.year) {
        return self.selectComponents.month - self.minimumComponents.month;
    } else {
        return self.selectComponents.month - 1;
    }
}

- (NSInteger)dayRow
{
    if (self.selectComponents.year == self.minimumComponents.year &&
        self.selectComponents.month == self.minimumComponents.month) {
        return self.selectComponents.day - self.minimumComponents.day;
    } else {
        return self.selectComponents.day - 1;
    }
}

- (NSInteger)hourRow
{
    if (self.selectComponents.year == self.minimumComponents.year &&
        self.selectComponents.month == self.minimumComponents.month &&
        self.selectComponents.day == self.minimumComponents.day) {
        return self.selectComponents.hour - self.minimumComponents.hour;
    } else {
        return self.selectComponents.hour;
    }
}

- (NSInteger)minuteRow
{
    if (self.selectComponents.year == self.minimumComponents.year &&
        self.selectComponents.month == self.minimumComponents.month &&
        self.selectComponents.day == self.minimumComponents.day &&
        self.selectComponents.hour == self.minimumComponents.hour) {
        return self.selectComponents.minute - self.minimumComponents.minute;
    } else {
        return self.selectComponents.minute;
    }
}

- (NSInteger)secondRow
{
    if (self.selectComponents.year == self.minimumComponents.year &&
        self.selectComponents.month == self.minimumComponents.month &&
        self.selectComponents.day == self.minimumComponents.day &&
        self.selectComponents.hour == self.minimumComponents.hour &&
        self.selectComponents.minute == self.minimumComponents.minute) {
        return self.selectComponents.second - self.minimumComponents.second;
    } else {
        return self.selectComponents.second;
    }
}

#pragma mark--- Private Method
- (NSInteger)howManyDaysWithMonthInThisYear:(NSInteger)year withMonth:(NSInteger)month
{
    if ((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) ||
        (month == 10) || (month == 12))
        return 31;
    if ((month == 4) || (month == 6) || (month == 9) || (month == 11)) return 30;
    if ((year % 4 == 1) || (year % 4 == 2) || (year % 4 == 3)) return 28;
    if (year % 400 == 0) return 29;
    if (year % 100 == 0) return 28;
    return 29;
}
@end
