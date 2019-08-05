//
//  WYACalendarViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/7/31.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYACalendarViewController.h"

@interface WYACalendarViewController ()<WYACalendarDataSource>

@end

@implementation WYACalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"日历";
    // Do any additional setup after loading the view.
    WYACalendar * calendar = [[WYACalendar alloc] initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, 388) ScrollDirection:WYACalendarScrollHorizontal];
//    calendar.backgroundImage = [UIImage imageNamed:@"1"];
//    calendar.calenderDateTitleColor = [UIColor redColor];
    calendar.dataSource = self;
    calendar.calenderDateTitleFont = FONT(15);
    calendar.calenderDateSelectColor = [UIColor redColor];
    calendar.canSelectMore = YES;
    calendar.calenderDateTagColor = [UIColor redColor];
    calendar.calenderTodayColor = [UIColor blueColor];
    calendar.calenderTodayTagColor = [UIColor blueColor];
    [self.view addSubview:calendar];
}

- (NSArray <NSNumber *>*)calendarDateRange{
    return @[@(2018),@(2019)];
}

- (UIImage *)calendarView:(WYACalendar *)calendarView imageWithIndexPath:(NSIndexPath *)indexPath{
    return [UIImage imageNamed:@"7"];
}

//- (NSMutableAttributedString *)calendarView:(WYACalendar *)calendarView textWithIndexPath:(NSIndexPath *)indexPath{
//    NSMutableAttributedString * text = [[NSMutableAttributedString alloc] initWithString:@"日历"];
//    return text;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
