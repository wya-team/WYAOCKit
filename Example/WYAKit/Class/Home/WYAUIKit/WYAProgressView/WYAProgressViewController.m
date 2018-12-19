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
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
    vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/WYAProgressView/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIProgressView * progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(10, WYATopHeight+20, self.view.frame.size.width-20, 20)];
    progressView.progressTintColor = [UIColor redColor];
    progressView.trackTintColor = [UIColor grayColor];
    [self.view addSubview:progressView];
    [progressView setProgress:0.5 animated:YES];
    
    WYAProgressView * progressV = [[WYAProgressView alloc]initWithFrame:CGRectMake((ScreenWidth-200)/2, CGRectGetMaxY(progressView.frame)+30, 200, 200)];
    progressV.borderWidth = 2;
    [self.view addSubview:progressV];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        progressV.progress = 0.3;
        
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
