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
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
    vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/WYAProgressView/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];

    UILabel * label = [[UILabel alloc] init];
    label.text      = @"系统进度条";
    label.textColor = random(51, 51, 51, 1);
    label.font      = FONT(15);
    [self.view addSubview:label];
    CGFloat label_X      = 10;
    CGFloat label_Y      = WYATopHeight + 20 * SizeAdapter;
    CGFloat label_Width  = ScreenWidth - 20;
    CGFloat label_Height = 44 * SizeAdapter;
    label.frame          = CGRectMake(label_X, label_Y, label_Width, label_Height);

    UIProgressView * progressView  = [[UIProgressView alloc] init];
    progressView.progressTintColor = BLUECOLOR;
    progressView.trackTintColor    = GRAYBGCOLOR;
    [self.view addSubview:progressView];
    [progressView setProgress:0.5 animated:YES];
    CGFloat progressView_X      = 10;
    CGFloat progressView_Y      = CGRectGetMaxY(label.frame);
    CGFloat progressView_Width  = ScreenWidth - 20;
    CGFloat progressView_Height = 20;
    progressView.frame          = CGRectMake(progressView_X, progressView_Y, progressView_Width, progressView_Height);

    UILabel * customLabel = [[UILabel alloc] init];
    customLabel.text      = @"自定义圆环进度条";
    customLabel.textColor = random(51, 51, 51, 1);
    customLabel.font      = FONT(15);
    [self.view addSubview:customLabel];
    CGFloat customLabel_X      = 10;
    CGFloat customLabel_Y      = CGRectGetMaxY(progressView.frame) + 20 * SizeAdapter;
    CGFloat customLabel_Width  = ScreenWidth - 20;
    CGFloat customLabel_Height = 44 * SizeAdapter;
    customLabel.frame          = CGRectMake(customLabel_X, customLabel_Y, customLabel_Width, customLabel_Height);

    CGFloat progressV_X         = (ScreenWidth - 200) / 2;
    CGFloat progressV_Y         = CGRectGetMaxY(customLabel.frame);
    CGFloat progressV_Width     = 200;
    CGFloat progressV_Height    = 200;
    CGRect rect                 = CGRectMake(progressV_X, progressV_Y, progressV_Width, progressV_Height);
    WYAProgressView * progressV = [[WYAProgressView alloc] initWithFrame:rect progressViewStyle:WYAProgressViewStyleCircle];
    progressV.borderWidth       = 2;
    [self.view addSubview:progressV];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
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
