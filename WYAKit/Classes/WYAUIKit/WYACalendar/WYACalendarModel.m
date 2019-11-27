//
//  WYACalendarModel.m
//  WYAKit
//
//  Created by 李世航 on 2019/8/2.
//

#import "WYACalendarModel.h"

@implementation WYACalendarModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titleColor  = [UIColor blackColor];
        self.titleFont   = FONT(15);
        self.selectColor = [UIColor clearColor];
        self.tagColor    = [UIColor clearColor];
    }
    return self;
}

- (NSString *)text
{
    if (self.day == 0) {
        return @"";
    }
    return [NSString stringWithFormat:@"%d", self.day];
}

- (NSInteger)year
{
    return [self.date wya_year];
}

- (NSInteger)month
{
    return [self.date wya_month];
}

- (NSInteger)day
{
    return [self.date wya_day];
}

@end
