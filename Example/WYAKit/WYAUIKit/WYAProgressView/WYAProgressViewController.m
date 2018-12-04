//
//  WYAProgressViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAProgressViewController.h"

@interface WYAProgressViewController ()

@end

@implementation WYAProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIProgressView * progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(10, WYATopHeight+20, self.view.frame.size.width-20, 20)];
    progressView.progressTintColor = [UIColor redColor];
    progressView.trackTintColor = [UIColor grayColor];
    [self.view addSubview:progressView];
    [progressView setProgress:0.5 animated:YES];
    
    WYAProgressView * progressV = [[WYAProgressView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(progressView.frame)+30, 50, 50)];
    [self.view addSubview:progressV];
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
