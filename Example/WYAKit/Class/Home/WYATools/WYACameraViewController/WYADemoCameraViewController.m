//
//  WYACameraViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/22.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYADemoCameraViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface WYADemoCameraViewController () <UITextFieldDelegate>
@property (nonatomic, copy) NSString * time;
@property (nonatomic, assign) WYACameraType type;
@property (nonatomic, strong) NSArray * array;
@property (nonatomic, strong) AVPlayer * player;
@end

@implementation WYADemoCameraViewController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender {
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
    vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAHardware/"
                   @"WYACamera/README.md";
    vc.hk_iconImage = [UIImage imageNamed:@"0"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"WYACamera";
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];
    [self configUI];
}

- (void)configUI {
    WeakSelf(weakSelf);
    UIImageView * imageV          = [[UIImageView alloc] init];
    imageV.contentMode            = UIViewContentModeScaleAspectFit;
    imageV.userInteractionEnabled = YES;
    [self.view addSubview:imageV];

    UIButton * playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [playButton setImage:[UIImage imageNamed:@"icon_begin"] forState:UIControlStateNormal];
    [playButton setImage:[UIImage imageNamed:@"icon_pause"] forState:UIControlStateSelected];
    [playButton addCallBackAction:^(UIButton * button) {
        button.selected = !button.selected;
        if (button.selected) {
            if (weakSelf.player) { [weakSelf.player play]; }
        } else {
            if (weakSelf.player) { [weakSelf.player pause]; }
        }

    }];
    playButton.hidden = YES;
    [self.view addSubview:playButton];

    UILabel * videoPathLabel     = [[UILabel alloc] init];
    videoPathLabel.textColor     = random(51, 51, 51, 1);
    videoPathLabel.font          = FONT(13);
    videoPathLabel.numberOfLines = 0;
    [self.view addSubview:videoPathLabel];

    UILabel * label = [[UILabel alloc] init];
    label.text      = @"最长拍摄时间(s)";
    label.textColor = random(51, 51, 51, 1);
    label.font      = FONT(15);
    [self.view addSubview:label];

    CGFloat label_X      = 10;
    CGFloat label_Y      = WYATopHeight + 20 * SizeAdapter;
    CGFloat label_Width  = ScreenWidth - 20;
    CGFloat label_Height = 20 * SizeAdapter;
    label.frame          = CGRectMake(label_X, label_Y, label_Width, label_Height);

    UITextField * textfield   = [[UITextField alloc] init];
    textfield.placeholder     = @"请输入时间";
    textfield.text            = @"15";
    textfield.keyboardType    = UIKeyboardTypeNumberPad;
    textfield.delegate        = self;
    textfield.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textfield];
    CGFloat textfield_X      = 10;
    CGFloat textfield_Y      = CGRectGetMaxY(label.frame) + 10 * SizeAdapter;
    CGFloat textfield_Width  = ScreenWidth - 20;
    CGFloat textfield_Height = 44 * SizeAdapter;
    textfield.frame          = CGRectMake(textfield_X, textfield_Y, textfield_Width, textfield_Height);
    self.time                = textfield.text;

    UILabel * label1 = [[UILabel alloc] init];
    label1.text      = @"拍摄类型";
    label1.textColor = random(51, 51, 51, 1);
    label1.font      = FONT(15);
    [self.view addSubview:label1];

    CGFloat label1_X      = 10;
    CGFloat label1_Y      = CGRectGetMaxY(textfield.frame) + 10 * SizeAdapter;
    CGFloat label1_Width  = ScreenWidth - 20;
    CGFloat label1_Height = 20 * SizeAdapter;
    label1.frame          = CGRectMake(label1_X, label1_Y, label1_Width, label1_Height);

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"拍照" forState:UIControlStateNormal];
    [button setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_radio_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_radio_selected"] forState:UIControlStateSelected];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.titleEdgeInsets            = UIEdgeInsetsMake(0, 30 * SizeAdapter, 0, 0);
    button.titleLabel.font            = FONT(15);
    [button addCallBackAction:^(UIButton * button) {
        for (UIButton * btn in self.array) {
            if (btn == button) {
                if (button.selected) {
                    button.selected = NO;
                    self.type       = WYACameraTypeAll;
                } else {
                    button.selected = YES;
                    self.type       = WYACameraTypeImage;
                }
            } else {
                btn.selected = NO;
            }
        }

    }];
    [self.view addSubview:button];

    CGFloat button_X      = 10;
    CGFloat button_Y      = CGRectGetMaxY(label1.frame) + 10 * SizeAdapter;
    CGFloat button_Width  = 100 * SizeAdapter;
    CGFloat button_Height = 30 * SizeAdapter;
    button.frame          = CGRectMake(button_X, button_Y, button_Width, button_Height);

    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"录制" forState:UIControlStateNormal];
    [button1 setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"icon_radio_normal"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"icon_radio_selected"] forState:UIControlStateSelected];
    button1.titleLabel.font            = FONT(15);
    button1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button1.titleEdgeInsets            = UIEdgeInsetsMake(0, 30 * SizeAdapter, 0, 0);
    [button1 addCallBackAction:^(UIButton * button) {
        for (UIButton * btn in self.array) {
            if (btn == button) {
                if (button.selected) {
                    button.selected = NO;
                    self.type       = WYACameraTypeAll;
                } else {
                    button.selected = YES;
                    self.type       = WYACameraTypeVideo;
                }
            } else {
                btn.selected = NO;
            }
        }
    }];
    [self.view addSubview:button1];

    CGFloat button1_X      = 10;
    CGFloat button1_Y      = CGRectGetMaxY(button.frame) + 10 * SizeAdapter;
    CGFloat button1_Width  = 100 * SizeAdapter;
    CGFloat button1_Height = 30 * SizeAdapter;
    button1.frame          = CGRectMake(button1_X, button1_Y, button1_Width, button1_Height);

    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"拍照+录制" forState:UIControlStateNormal];
    [button2 setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"icon_radio_normal"] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"icon_radio_selected"] forState:UIControlStateSelected];
    button2.titleLabel.font            = FONT(15);
    button2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button2.titleEdgeInsets            = UIEdgeInsetsMake(0, 30 * SizeAdapter, 0, 0);
    [button2 addCallBackAction:^(UIButton * button) {
        for (UIButton * btn in self.array) {
            if (btn == button) {
                if (button.selected) {
                    button.selected = NO;
                    self.type       = WYACameraTypeAll;
                } else {
                    button.selected = YES;
                    self.type       = WYACameraTypeAll;
                }
            } else {
                btn.selected = NO;
            }
        }
    }];
    [self.view addSubview:button2];
    button2.selected = YES;

    CGFloat button2_X      = 10;
    CGFloat button2_Y      = CGRectGetMaxY(button1.frame) + 10 * SizeAdapter;
    CGFloat button2_Width  = 200 * SizeAdapter;
    CGFloat button2_Height = 30 * SizeAdapter;
    button2.frame          = CGRectMake(button2_X, button2_Y, button2_Width, button2_Height);

    UIButton * startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [startButton setTitle:@"拍照" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    startButton.titleLabel.font = FONT(15);
    [startButton setBackgroundImage:[UIImage wya_createImageWithColor:BLUECOLOR]
                           forState:UIControlStateNormal];

    [startButton addCallBackAction:^(UIButton * button) {
        [weakSelf.view endEditing:YES];
        playButton.hidden = YES;
        WYACameraViewController * cameraVC =
            [[WYACameraViewController alloc] initWithType:self.type
                                        cameraOrientation:WYACameraOrientationBack];
        cameraVC.time      = [self.time floatValue];
        cameraVC.takePhoto = ^(UIImage * photo, NSString * imagePath) { imageV.image = photo; };
        StrongSelf(strongSelf);
        cameraVC.takeVideo = ^(NSString * videoPath) {
            videoPathLabel.text = [NSString stringWithFormat:@"视频地址：%@", videoPath];
            playButton.hidden   = NO;
            imageV.image        = nil;
            AVPlayerItem * item =
                [AVPlayerItem playerItemWithURL:[NSURL fileURLWithPath:videoPath]];
            strongSelf.player     = [AVPlayer playerWithPlayerItem:item];
            AVPlayerLayer * layer = [AVPlayerLayer playerLayerWithPlayer:strongSelf.player];
            layer.frame           = imageV.bounds;
            [imageV.layer insertSublayer:layer atIndex:0];
        };
        [weakSelf presentViewController:cameraVC animated:YES completion:nil];
    }];
    startButton.layer.cornerRadius  = 5.f;
    startButton.layer.masksToBounds = YES;
    [self.view addSubview:startButton];

    CGFloat startButton_X      = 10;
    CGFloat startButton_Y      = CGRectGetMaxY(button2.frame) + 20 * SizeAdapter;
    CGFloat startButton_Width  = ScreenWidth - 20;
    CGFloat startButton_Height = 44 * SizeAdapter;
    startButton.frame =
        CGRectMake(startButton_X, startButton_Y, startButton_Width, startButton_Height);

    self.array = @[ button, button1, button2 ];

    CGFloat imageV_X      = (ScreenWidth - 200 * SizeAdapter) / 2;
    CGFloat imageV_Y      = CGRectGetMaxY(startButton.frame) + 20 * SizeAdapter;
    CGFloat imageV_Width  = 200 * SizeAdapter;
    CGFloat imageV_Height = 200 * SizeAdapter;
    imageV.frame          = CGRectMake(imageV_X, imageV_Y, imageV_Width, imageV_Height);

    playButton.center = imageV.center;
    playButton.bounds = CGRectMake(0, 0, 30 * SizeAdapter, 30 * SizeAdapter);

    CGFloat videoPathLabel_X      = 10;
    CGFloat videoPathLabel_Y      = CGRectGetMaxY(imageV.frame) + 10 * SizeAdapter;
    CGFloat videoPathLabel_Width  = ScreenWidth - 20;
    CGFloat videoPathLabel_Height = 60 * SizeAdapter;
    videoPathLabel.frame =
        CGRectMake(videoPathLabel_X, videoPathLabel_Y, videoPathLabel_Width, videoPathLabel_Height);
}

#pragma mark - UITextFieldDelegate -
- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.time = textField.text;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
