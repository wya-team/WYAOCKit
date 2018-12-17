//
//  WYAButtonViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/17.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAButtonViewController.h"

@interface WYAButtonViewController ()

@end

@implementation WYAButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = random(237, 237, 237, 1);
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"主按钮 Normal" forState:UIControlStateNormal];
    [button setTitle:@"主按钮 Highlight" forState:UIControlStateHighlighted];
    [button setTitle:@"主按钮 Select" forState:UIControlStateSelected];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = FONT(15);
    [button setBackgroundImage:[UIImage wya_createImageWithColor:random(67, 152, 229, 1)] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage wya_createImageWithColor:random(60, 141, 212, 1)] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage wya_createImageWithColor:random(195, 240, 255, 1)] forState:UIControlStateSelected];
    button.frame = CGRectMake((ScreenWidth-200*SizeAdapter)*0.5, WYATopHeight+10*SizeAdapter, 200*SizeAdapter, 44*SizeAdapter);
    [self.view addSubview:button];
    button.layer.cornerRadius = 4.f;
    button.layer.masksToBounds = YES;
    
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"主按钮 Disable" forState:UIControlStateNormal];
    [button1 setTitleColor:random(196, 196, 196, 1) forState:UIControlStateNormal];
    button1.titleLabel.font = FONT(15);
    [button1 setBackgroundImage:[UIImage wya_createImageWithColor:random(225, 225, 225, 1)] forState:UIControlStateNormal];
    button1.frame = CGRectMake((ScreenWidth-200*SizeAdapter)*0.5, CGRectGetMaxY(button.frame)+5*SizeAdapter, 200*SizeAdapter, 44*SizeAdapter);
    button1.enabled = NO;
    [self.view addSubview:button1];
    button1.layer.cornerRadius = 4.f;
    button1.layer.masksToBounds = YES;
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"次按钮 Normal" forState:UIControlStateNormal];
    [button2 setTitle:@"次按钮 Highlight" forState:UIControlStateHighlighted];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.titleLabel.font = FONT(15);
    [button2 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage wya_createImageWithColor:random(225, 225, 225, 1)] forState:UIControlStateHighlighted];
    button2.frame = CGRectMake((ScreenWidth-200*SizeAdapter)*0.5, CGRectGetMaxY(button1.frame)+5*SizeAdapter, 200*SizeAdapter, 44*SizeAdapter);
    [self.view addSubview:button2];
    
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setTitle:@"主按钮 Disable" forState:UIControlStateNormal];
    [button3 setTitleColor:random(196, 196, 196, 1) forState:UIControlStateNormal];
    button3.titleLabel.font = FONT(15);
    [button3 setBackgroundImage:[UIImage wya_createImageWithColor:random(225, 225, 225, 1)] forState:UIControlStateNormal];
    button3.frame = CGRectMake((ScreenWidth-200*SizeAdapter)*0.5, CGRectGetMaxY(button2.frame)+5*SizeAdapter, 200*SizeAdapter, 44*SizeAdapter);
    button3.enabled = NO;
    [self.view addSubview:button3];
    button3.layer.cornerRadius = 4.f;
    button3.layer.masksToBounds = YES;
    
    UIButton * button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setTitle:@"点击" forState:UIControlStateNormal];
    [button4 setTitleColor:random(132, 185, 228, 1) forState:UIControlStateNormal];
    button4.titleLabel.font = FONT(13);
    [button4 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    button4.frame = CGRectMake((ScreenWidth - 50*SizeAdapter)/2, CGRectGetMaxY(button3.frame)+5*SizeAdapter, 50*SizeAdapter, 44*SizeAdapter);
    [self.view addSubview:button4];
    button4.layer.cornerRadius = 2.f;
    button4.layer.masksToBounds = YES;
    button4.layer.borderColor = random(132, 185, 228, 1).CGColor;
    button4.layer.borderWidth = 0.5;
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
