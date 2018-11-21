//
//  WYANoticeViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/21.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYANoticeViewController.h"
#import <WYAKit/WYANoticeBar.h>
@interface WYANoticeViewController ()

@end

@implementation WYANoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    WYANoticeBar * bar = [[WYANoticeBar alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    bar.showNoticeButton = YES;
    bar.noticeButtonImage = [UIImage imageNamed:@"喇叭"];
    bar.showRightButton = YES;
    bar.rightButtonImage = [UIImage imageNamed:@"喇叭"];
    bar.showText = @"今天天气不错，阳光明媚，好像出去装转,哈哈哈哈哈哈哈哈哈哈";
    [self.view addSubview:bar];

    WYANoticeBar * bar1 = [[WYANoticeBar alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 30)];
    bar1.showNoticeButton = YES;
    bar1.noticeButtonImage = [UIImage imageNamed:@"喇叭"];
    bar1.showText = @"今天天气不错，阳光明媚，好像出去装转,哈哈哈哈哈哈哈哈哈哈";
    [self.view addSubview:bar1];

    WYANoticeBar * bar2 = [[WYANoticeBar alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 30)];
    bar2.showRightButton = YES;
    bar2.rightButtonImage = [UIImage imageNamed:@"喇叭"];
    bar2.showText = @"今天天气不错，阳光明媚，好像出去装转,哈哈哈哈哈哈哈哈哈哈";
    [self.view addSubview:bar2];
    
    WYANoticeBar * bar3 = [[WYANoticeBar alloc]initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, 30)];
    bar3.showText = @"今天天气不错，阳光明媚，好像出去装转,哈哈哈哈哈哈哈哈哈哈";
    [self.view addSubview:bar3];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [bar start];
        [bar1 start];
        [bar2 start];
        [bar3 start];
    });
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
