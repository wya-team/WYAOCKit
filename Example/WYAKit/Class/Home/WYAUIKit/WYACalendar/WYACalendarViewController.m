//
//  WYACalendarViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/7/31.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYACalendarViewController.h"

@interface WYACalendarViewController ()

@end

@implementation WYACalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WYACalendar * calendar = [[WYACalendar alloc] initWithFrame:self.view.frame];
    [self.view addSubview:calendar];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
