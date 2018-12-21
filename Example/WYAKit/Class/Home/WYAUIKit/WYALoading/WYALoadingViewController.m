//
//  WYALoadingViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/21.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYALoadingViewController.h"

@interface WYALoadingViewController ()

@end

@implementation WYALoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel * systemLabel = [[UILabel alloc]init];
    systemLabel.text = @"系统加载";
    systemLabel.textColor = [UIColor blackColor];
    systemLabel.font = FONT(15);
    [self.view addSubview:systemLabel];
    
    CGFloat systemLabel_X = 10;
    CGFloat systemLabel_Y = WYATopHeight+10*SizeAdapter;
    CGFloat systemLabel_Width = 100;
    CGFloat systemLabel_Height = 20;
    systemLabel.frame = CGRectMake(systemLabel_X, systemLabel_Y, systemLabel_Width, systemLabel_Height);
    
    UIActivityIndicatorView * systemView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:systemView];
    [systemView startAnimating];
    CGFloat systemView_X = (ScreenWidth-50)/2;
    CGFloat systemView_Y = CGRectGetMaxY(systemLabel.frame)+20*SizeAdapter;
    CGFloat systemView_Width = 50;
    CGFloat systemView_Height = 50;
    systemView.frame = CGRectMake(systemView_X, systemView_Y, systemView_Width, systemView_Height);
    
    UILabel * customLabel = [[UILabel alloc]init];
    customLabel.text = @"自定义加载";
    customLabel.textColor = [UIColor blackColor];
    customLabel.font = FONT(15);
    [self.view addSubview:customLabel];
    
    CGFloat customLabel_X = 10;
    CGFloat customLabel_Y = CGRectGetMaxY(systemView.frame)+20*SizeAdapter;
    CGFloat customLabel_Width = 100;
    CGFloat customLabel_Height = 20;
    customLabel.frame = CGRectMake(customLabel_X, customLabel_Y, customLabel_Width, customLabel_Height);
    
    UIImageView * imageV = [[UIImageView alloc]init];
    imageV.image = [UIImage imageNamed:@"icon_loading"];
    [self.view addSubview:imageV];
    [imageV wya_setRotationAnimation:360 time:1 repeatCount:0];
    
    CGFloat imageV_X = (ScreenWidth-30)/2;
    CGFloat imageV_Y = CGRectGetMaxY(customLabel.frame)+20*SizeAdapter;
    CGFloat imageV_Width = 30;
    CGFloat imageV_Height = 30;
    imageV.frame = CGRectMake(imageV_X, imageV_Y, imageV_Width, imageV_Height);
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
