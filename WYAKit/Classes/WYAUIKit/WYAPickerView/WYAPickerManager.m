//
//  WYAPickerManager.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/22.
//

#import "WYAPickerManager.h"

@interface WYAPickerManager ()
@property (nonatomic, copy)   NSCalendar *calendar;
@property (nonatomic, assign) NSCalendarUnit unitFlags;
@property (nonatomic, strong) NSDateComponents *minimumComponents;
@property (nonatomic, strong) NSDateComponents *maximumComponents;
@property (nonatomic, strong) NSDateComponents *currentComponents;


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

- (void)setMinimumDate:(NSDate *)minimumDate {
    _minimumDate = minimumDate;
    self.minimumComponents = [self.calendar components:self.unitFlags fromDate:minimumDate];
}

- (void)setMaximumDate:(NSDate *)maximumDate {
    _maximumDate = maximumDate;
    self.maximumComponents = [self.calendar components:self.unitFlags fromDate:maximumDate];
}



#pragma mark - Getter
- (NSCalendar *)calendar {
    if (!_calendar) {
        _calendar = [NSCalendar currentCalendar];
//        _calendar.timeZone = self.timeZone;
//        _calendar.locale = self.locale;
    }
    return _calendar;
}
- (NSCalendarUnit)unitFlags {
    if (!_unitFlags) {
        _unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday;
    }
    return _unitFlags;
}


- (NSDateComponents *)minimumComponents {
    if (self.minimumDate) {
        _minimumComponents = [self.calendar components:self.unitFlags fromDate:self.minimumDate];
    }else {
        _minimumComponents = [self.calendar components:self.unitFlags fromDate:[NSDate distantPast]];
        _minimumComponents.day = 1;
        _minimumComponents.month = 1;
        _minimumComponents.hour = 0;
        _minimumComponents.minute = 0;
        _minimumComponents.second = 0;
    }
    return _minimumComponents;
}

- (NSDateComponents *)maximumComponents {
    if (self.maximumDate) {
        _maximumComponents = [self.calendar components:self.unitFlags fromDate:self.maximumDate];
    }else {
        _maximumComponents = [self.calendar components:self.unitFlags fromDate:[NSDate distantFuture]];
        NSInteger day = [self howManyDaysWithMonthInThisYear:self.currentComponents.year withMonth:self.currentComponents.month];
        _maximumComponents.day = day;
        _maximumComponents.month = 12;
        _maximumComponents.hour = 23;
        _maximumComponents.minute = 59;
        _maximumComponents.second = 59;
    }
    return _maximumComponents;
}

- (NSDateComponents *)currentComponents {
    if (!_currentComponents) {
        _currentComponents = [self.calendar components:self.unitFlags fromDate:[NSDate date]];
    }
    return _currentComponents;
}

-(NSMutableArray *)yearArray{
    if (!_yearArray) {
        NSInteger index = self.maximumComponents.year-self.minimumComponents.year;
        NSMutableArray * years = [NSMutableArray arrayWithCapacity:index];
        for (NSInteger i=self.minimumComponents.year; i<self.maximumComponents.year; i++) {
            [years addObject:[@(i) stringValue]];
        }
        _yearArray = years;
    }
    return _yearArray;
}

-(NSMutableArray *)monthArray{
    if (!_monthArray) {
        NSInteger minimum = 1;
        NSInteger maximum = 12;
//        if (_setDate == nil && self.maximumComponents.year <= self.currentComponents.year) {
//            maximum = self.maximumComponents.month;
//        }
        if (self.selectComponents.year == self.minimumComponents.year) {
            minimum = self.minimumComponents.month;
        }
        if (self.selectComponents.year == self.maximumComponents.year) {
            maximum = self.maximumComponents.month;
        }
        if (self.minimumComponents.year == self.maximumComponents.year) {
            minimum = self.minimumComponents.month;
            maximum = self.maximumComponents.month;
            
        }
        NSMutableArray *months = [NSMutableArray arrayWithCapacity:maximum];
        for (NSUInteger i = minimum; i <= maximum; i++) {
            [months addObject:[@(i) stringValue]];
        }
        _monthArray = months;
    }
    return _monthArray;
}

-(NSMutableArray *)dayArray{
    NSInteger day;
    if (self.selectYear && self.selectMonth) {
        day = [self howManyDaysWithMonthInThisYear:self.selectYear withMonth:self.selectMonth];
        
    }else{
        if (self.selectMonth && !self.selectYear) {
            day = [self howManyDaysWithMonthInThisYear:self.currentComponents.year withMonth:self.selectMonth];
        }else{
            day = [self howManyDaysWithMonthInThisYear:self.currentComponents.year withMonth:1];
        }
    }
    NSMutableArray *days = [NSMutableArray arrayWithCapacity:day];
    NSInteger minDay = 1, maxDay = day;
    for (NSUInteger i = minDay; i <= maxDay; i++) {
        [days addObject:[@(i) stringValue]];
    }
    _dayArray = days;
    return _dayArray;
}

-(NSMutableArray *)hourArray{
    if (!_hourArray) {
        NSInteger minimum = 0;
        NSInteger maximum = 23;
        NSInteger index = maximum - minimum;
        NSMutableArray *hours = [NSMutableArray arrayWithCapacity:index];
        for (NSUInteger i = minimum; i <= maximum; i++) {
            [hours addObject:[@(i) stringValue]];
        }
        _hourArray = hours;
    }
    return _hourArray;
}

-(NSMutableArray *)minuteArray{
    if (!_minuteArray) {
        NSInteger minimum = 0;
        NSInteger maximum = 59;
        NSInteger index = maximum - minimum;
        NSMutableArray *minutes = [NSMutableArray arrayWithCapacity:index];
        for (NSUInteger i = minimum; i <= maximum; i++) {
            [minutes addObject:[@(i) stringValue]];
        }
        _minuteArray = minutes;
    }
    return _minuteArray;
}

-(NSMutableArray *)secondArray{
    if (!_secondArray) {
        NSInteger minimum = 0;
        NSInteger maximum = 59;
        NSInteger index = maximum - minimum;
        NSMutableArray *seconds = [NSMutableArray arrayWithCapacity:index];
        for (NSUInteger i = minimum; i <= maximum; i++) {
            [seconds addObject:[@(i) stringValue]];
        }
        _secondArray = seconds;
    }
    return _secondArray;
}

#pragma mark --- Private Method
- (NSInteger)howManyDaysWithMonthInThisYear:(NSInteger)year withMonth:(NSInteger)month {
    if((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10) || (month == 12))
        return 31 ;
    if((month == 4) || (month == 6) || (month == 9) || (month == 11))
        return 30;
    if((year % 4 == 1) || (year % 4 == 2) || (year % 4 == 3))
        return 28;
    if(year % 400 == 0)
        return 29;
    if(year % 100 == 0)
        return 28;
    return 29;
}
@end
