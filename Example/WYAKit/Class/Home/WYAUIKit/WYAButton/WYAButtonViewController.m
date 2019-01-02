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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = random(237, 237, 237, 1);

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"主按钮 Normal" forState:UIControlStateNormal];
    [button setTitle:@"主按钮 Highlight" forState:UIControlStateHighlighted];
    [button setTitle:@"主按钮 Select" forState:UIControlStateSelected];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = FONT(15);
    [button setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor wya_hex:@"#108ee9"]] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage wya_createImageWithColor:random(60, 141, 212, 1)] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage wya_createImageWithColor:random(195, 240, 255, 1)] forState:UIControlStateSelected];
    [self.view addSubview:button];
    button.layer.cornerRadius  = 4.f;
    button.layer.masksToBounds = YES;

    CGFloat button_X      = 10 * SizeAdapter;
    CGFloat button_Y      = WYATopHeight + 10 * SizeAdapter;
    CGFloat button_Width  = ScreenWidth - 20 * SizeAdapter;
    CGFloat button_Height = 44 * SizeAdapter;
    button.frame          = CGRectMake(button_X, button_Y, button_Width, button_Height);

    UIImage * animation        = [UIImage wya_svgImageName:@"spin_white" size:CGSizeMake(15, 15)];
    UIButton * animationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [animationButton setTitle:@"主按钮 Loading" forState:UIControlStateNormal];
    [animationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    animationButton.titleLabel.font = FONT(15);
    [animationButton setImage:animation forState:UIControlStateNormal];
    [animationButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor wya_hex:@"#108ee9"]] forState:UIControlStateNormal];
    [animationButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [animationButton setTitleEdgeInsets:UIEdgeInsetsMake(0, animation.size.width + 5 * SizeAdapter, 0, 0)];
    [animationButton addCallBackAction:^(UIButton * button){

    }];
    [self.view addSubview:animationButton];
    animationButton.layer.cornerRadius  = 4.f;
    animationButton.layer.masksToBounds = YES;
    [animationButton.imageView wya_setRotationAnimation:360 time:1 repeatCount:0];

    CGFloat animationButton_X      = 10 * SizeAdapter;
    CGFloat animationButton_Y      = CGRectGetMaxY(button.frame) + 5 * SizeAdapter;
    CGFloat animationButton_Width  = ScreenWidth - 20 * SizeAdapter;
    CGFloat animationButton_Height = 44 * SizeAdapter;
    animationButton.frame          = CGRectMake(animationButton_X, animationButton_Y, animationButton_Width, animationButton_Height);

    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"主按钮 Disable" forState:UIControlStateNormal];
    [button1 setTitleColor:random(196, 196, 196, 1) forState:UIControlStateNormal];
    button1.titleLabel.font = FONT(15);
    [button1 setBackgroundImage:[UIImage wya_createImageWithColor:random(225, 225, 225, 1)] forState:UIControlStateNormal];
    button1.enabled = NO;
    [self.view addSubview:button1];
    button1.layer.cornerRadius  = 4.f;
    button1.layer.masksToBounds = YES;

    CGFloat button1_X      = 10 * SizeAdapter;
    CGFloat button1_Y      = CGRectGetMaxY(animationButton.frame) + 5 * SizeAdapter;
    CGFloat button1_Width  = ScreenWidth - 20 * SizeAdapter;
    CGFloat button1_Height = 44 * SizeAdapter;
    button1.frame          = CGRectMake(button1_X, button1_Y, button1_Width, button1_Height);

    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"次按钮 Normal" forState:UIControlStateNormal];
    [button2 setTitle:@"次按钮 Highlight" forState:UIControlStateHighlighted];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.titleLabel.font = FONT(15);
    [button2 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage wya_createImageWithColor:random(225, 225, 225, 1)] forState:UIControlStateHighlighted];
    [self.view addSubview:button2];

    CGFloat button2_X      = 10 * SizeAdapter;
    CGFloat button2_Y      = CGRectGetMaxY(button1.frame) + 5 * SizeAdapter;
    CGFloat button2_Width  = ScreenWidth - 20 * SizeAdapter;
    CGFloat button2_Height = 44 * SizeAdapter;
    button2.frame          = CGRectMake(button2_X, button2_Y, button2_Width, button2_Height);

    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setTitle:@"次按钮 Disable" forState:UIControlStateNormal];
    [button3 setTitleColor:random(196, 196, 196, 1) forState:UIControlStateNormal];
    button3.titleLabel.font = FONT(15);
    [button3 setBackgroundImage:[UIImage wya_createImageWithColor:random(225, 225, 225, 1)] forState:UIControlStateNormal];
    button3.enabled = NO;
    [self.view addSubview:button3];
    button3.layer.cornerRadius  = 4.f;
    button3.layer.masksToBounds = YES;

    CGFloat button3_X      = 10 * SizeAdapter;
    CGFloat button3_Y      = CGRectGetMaxY(button2.frame) + 5 * SizeAdapter;
    CGFloat button3_Width  = ScreenWidth - 20 * SizeAdapter;
    CGFloat button3_Height = 44 * SizeAdapter;
    button3.frame          = CGRectMake(button3_X, button3_Y, button3_Width, button3_Height);

    UIImage * loading        = [UIImage wya_svgImageName:@"spin" size:CGSizeMake(15, 15)];
    UIButton * loadingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loadingButton setTitle:@"次按钮 Loading" forState:UIControlStateNormal];
    [loadingButton setTitleColor:random(196, 196, 196, 1) forState:UIControlStateNormal];
    loadingButton.titleLabel.font = FONT(15);
    [loadingButton setImage:loading forState:UIControlStateNormal];
    [loadingButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [loadingButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [loadingButton setTitleEdgeInsets:UIEdgeInsetsMake(0, loading.size.width + 5 * SizeAdapter, 0, 0)];
    [loadingButton addCallBackAction:^(UIButton * button){

    }];
    [self.view addSubview:loadingButton];
    loadingButton.layer.cornerRadius  = 4.f;
    loadingButton.layer.masksToBounds = YES;
    [loadingButton.imageView wya_setRotationAnimation:360 time:1 repeatCount:0];

    CGFloat loadingButton_X      = 10 * SizeAdapter;
    CGFloat loadingButton_Y      = CGRectGetMaxY(button3.frame) + 5 * SizeAdapter;
    CGFloat loadingButton_Width  = ScreenWidth - 20 * SizeAdapter;
    CGFloat loadingButton_Height = 44 * SizeAdapter;
    loadingButton.frame          = CGRectMake(loadingButton_X, loadingButton_Y, loadingButton_Width, loadingButton_Height);

    UIButton * button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setTitle:@"点击" forState:UIControlStateNormal];
    [button4 setTitleColor:random(132, 185, 228, 1) forState:UIControlStateNormal];
    button4.titleLabel.font = FONT(13);
    [button4 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [self.view addSubview:button4];
    button4.layer.cornerRadius  = 2.f;
    button4.layer.masksToBounds = YES;
    button4.layer.borderColor   = random(132, 185, 228, 1).CGColor;
    button4.layer.borderWidth   = 0.5;

    CGFloat button4_X      = 10 * SizeAdapter;
    CGFloat button4_Y      = CGRectGetMaxY(loadingButton.frame) + 5 * SizeAdapter;
    CGFloat button4_Width  = ScreenWidth / 3;
    CGFloat button4_Height = 44 * SizeAdapter;
    button4.frame          = CGRectMake(button4_X, button4_Y, button4_Width, button4_Height);

    UIButton * imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageButton setImage:[UIImage wya_svgImageName:@"spin" size:CGSizeMake(30 * SizeAdapter, 30 * SizeAdapter)] forState:UIControlStateNormal];
    [imageButton setBackgroundImage:[UIImage wya_createImageWithColor:WHITECOLOR] forState:UIControlStateNormal];
    [self.view addSubview:imageButton];
    imageButton.layer.cornerRadius  = 2.f;
    imageButton.layer.masksToBounds = YES;
    imageButton.layer.borderColor   = random(132, 185, 228, 1).CGColor;
    imageButton.layer.borderWidth   = 0.5;
    [imageButton.imageView wya_setRotationAnimation:360 time:1 repeatCount:0];
    CGFloat svgView_X      = CGRectGetMaxX(button4.frame) + 10 * SizeAdapter;
    CGFloat svgView_Y      = CGRectGetMaxY(loadingButton.frame) + 5 * SizeAdapter;
    CGFloat svgView_Width  = 44 * SizeAdapter;
    CGFloat svgView_Height = 44 * SizeAdapter;
    imageButton.frame      = CGRectMake(svgView_X, svgView_Y, svgView_Width, svgView_Height);
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
