//
//  NSDate+ChineseDate.m
//  WYAKit
//
//  Created by 李世航 on 2019/8/5.
//

#import "NSDate+ChineseDate.h"

@implementation NSDate (ChineseDate)

+ (NSUInteger)wya_chineseYearWithDate:(NSDate *)date{
    return [date wya_chineseYear];
}

+ (NSUInteger)wya_chineseMouthWithDate:(NSDate *)date{
    return [date wya_chineseMouth];
}

+ (NSUInteger)wya_chineseDayWithDate:(NSDate *)date{
    return [date wya_chineseDay];
}


- (NSUInteger)wya_chineseYear{
    NSCalendar * calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    return [calendar component:NSCalendarUnitYear fromDate:self];
}

- (NSUInteger)wya_chineseMouth{
    NSCalendar * calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    return [calendar component:NSCalendarUnitMonth fromDate:self];
}

- (NSUInteger)wya_chineseDay{
    NSCalendar * calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    return [calendar component:NSCalendarUnitDay fromDate:self];
}

- (NSString *)wya_chineseDayString{
    NSArray * array = @[@"初一",@"初二",@"初三",@"初四",@"初五",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",];
    return @"";

}

@end
