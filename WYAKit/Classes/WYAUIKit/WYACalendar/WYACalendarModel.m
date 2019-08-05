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
        self.titleColor = [UIColor blackColor];
        self.titleFont = FONT(15);
        self.selectColor = [UIColor clearColor];
        self.tagColor = [UIColor clearColor];
        self.isSelect = NO;
    }
    return self;
}

@end
