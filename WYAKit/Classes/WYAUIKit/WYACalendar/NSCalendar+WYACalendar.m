//
//  NSCalendar+WYACalendar.m
//  WYAKit
//
//  Created by 李世航 on 2019/8/8.
//

#import "NSCalendar+WYACalendar.h"

@implementation NSCalendar (WYACalendar)

- (NSDate *)wya_fetchMonthFristDay:(NSDate *)date
{
    NSDateComponents * components = [self components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour fromDate:date];
    components.day                = 1;
    return [self dateFromComponents:components];
}

@end
