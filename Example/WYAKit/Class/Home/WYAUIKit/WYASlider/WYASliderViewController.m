//
//  WYASliderViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/20.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYASliderViewController.h"

@interface WYASliderViewController () <WYASliderDelegate>
@property (nonatomic, strong) WYASlider * slider1;
@property (nonatomic, strong) WYASlider * slider3;
@end

@implementation WYASliderViewController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
    vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/"
                   @"WYASlidder/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];

    UILabel * label = [[UILabel alloc] init];
    label.text      = @"Slider";
    label.textColor = random(51, 51, 51, 1);
    label.font      = FONT(15);
    [self.view addSubview:label];
    CGFloat label_X      = 10;
    CGFloat label_Y      = WYATopHeight + 20 * SizeAdapter;
    CGFloat label_Width  = ScreenWidth - 20;
    CGFloat label_Height = 20 * SizeAdapter;
    label.frame          = CGRectMake(label_X, label_Y, label_Width, label_Height);

    WYASlider * slider   = [[WYASlider alloc] init];
    slider.showNoteLabel = NO;
    slider.mainTintColor = GRAYBGCOLOR;
    slider.minTintColor  = BLUECOLOR;
    [self.view addSubview:slider];
    CGFloat slider_X      = 30;
    CGFloat slider_Y      = CGRectGetMaxY(label.frame) + 20 * SizeAdapter;
    CGFloat slider_Width  = self.view.frame.size.width - 60;
    CGFloat slider_Height = 30;
    slider.frame          = CGRectMake(slider_X, slider_Y, slider_Width, slider_Height);

    UILabel * textLabel = [[UILabel alloc] init];
    textLabel.text      = @"Slider Text";
    textLabel.textColor = random(51, 51, 51, 1);
    textLabel.font      = FONT(15);
    [self.view addSubview:textLabel];
    CGFloat textLabel_X      = 10;
    CGFloat textLabel_Y      = CGRectGetMaxY(slider.frame) + 20 * SizeAdapter;
    CGFloat textLabel_Width  = ScreenWidth - 20;
    CGFloat textLabel_Height = 20 * SizeAdapter;
    textLabel.frame          = CGRectMake(textLabel_X, textLabel_Y, textLabel_Width, textLabel_Height);

    self.slider1               = [[WYASlider alloc] init];
    self.slider1.minText       = @"0.0";
    self.slider1.maxText       = @"100.0";
    self.slider1.mainTintColor = GRAYBGCOLOR;
    self.slider1.delegate      = self;
    [self.view addSubview:self.slider1];
    CGFloat slider1_X      = 10;
    CGFloat slider1_Y      = CGRectGetMaxY(textLabel.frame) + 20 * SizeAdapter;
    CGFloat slider1_Width  = self.view.cmam_width - 20;
    CGFloat slider1_Height = 30 * SizeAdapter;
    self.slider1.frame     = CGRectMake(slider1_X, slider1_Y, slider1_Width, slider1_Height);

    UILabel * imageLabel = [[UILabel alloc] init];
    imageLabel.text      = @"Slider Image";
    imageLabel.textColor = random(51, 51, 51, 1);
    imageLabel.font      = FONT(15);
    [self.view addSubview:imageLabel];
    CGFloat imageLabel_X      = 10;
    CGFloat imageLabel_Y      = CGRectGetMaxY(self.slider1.frame) + 20 * SizeAdapter;
    CGFloat imageLabel_Width  = ScreenWidth - 20;
    CGFloat imageLabel_Height = 20 * SizeAdapter;
    imageLabel.frame          = CGRectMake(imageLabel_X, imageLabel_Y, imageLabel_Width, imageLabel_Height);

    WYASlider * slider2   = [[WYASlider alloc] init];
    slider2.minImage      = [UIImage imageNamed:@"icon_voiceclose"];
    slider2.maxImage      = [UIImage imageNamed:@"icon_voiceopen"];
    slider2.mainTintColor = GRAYBGCOLOR;
    [self.view addSubview:slider2];
    CGFloat slider2_X      = 10;
    CGFloat slider2_Y      = CGRectGetMaxY(imageLabel.frame) + 20 * SizeAdapter;
    CGFloat slider2_Width  = ScreenWidth - 20;
    CGFloat slider2_Height = 30 * SizeAdapter;
    slider2.frame          = CGRectMake(slider2_X, slider2_Y, slider2_Width, slider2_Height);

    UILabel * doubleLabel = [[UILabel alloc] init];
    doubleLabel.text      = @"Bidirectional slider";
    doubleLabel.textColor = random(51, 51, 51, 1);
    doubleLabel.font      = FONT(15);
    [self.view addSubview:doubleLabel];
    CGFloat doubleLabel_X      = 10;
    CGFloat doubleLabel_Y      = CGRectGetMaxY(slider2.frame) + 20 * SizeAdapter;
    CGFloat doubleLabel_Width  = ScreenWidth - 20;
    CGFloat doubleLabel_Height = 20 * SizeAdapter;
    doubleLabel.frame =
    CGRectMake(doubleLabel_X, doubleLabel_Y, doubleLabel_Width, doubleLabel_Height);

    self.slider3               = [[WYASlider alloc] init];
    self.slider3.sliderStyle   = WYASliderStyleDouble;
    self.slider3.minText       = @"0.0";
    self.slider3.maxText       = @"100.0";
    self.slider3.minTintColor  = GRAYBGCOLOR;
    self.slider3.maxTintColor  = GRAYBGCOLOR;
    self.slider3.mainTintColor = BLUECOLOR;
    self.slider3.delegate      = self;
    [self.view addSubview:self.slider3];
    CGFloat slider3_X      = 10;
    CGFloat slider3_Y      = CGRectGetMaxY(doubleLabel.frame) + 20 * SizeAdapter;
    CGFloat slider3_Width  = ScreenWidth - 20;
    CGFloat slider3_Height = 30 * SizeAdapter;
    self.slider3.frame     = CGRectMake(slider3_X, slider3_Y, slider3_Width, slider3_Height);
}

#pragma mark - WYASliderDelegate  -
- (void)wya_slider:(WYASlider *)slider MinValueChange:(CGFloat)value
{
    if (self.slider1 == slider) {
        self.slider1.maxText = [NSString stringWithFormat:@"%.2f", value];
    } else if (self.slider3 == slider) {
        self.slider3.minText = [NSString stringWithFormat:@"%.2f", value];
    }
}

- (void)wya_slider:(WYASlider *)slider MaxValueChange:(CGFloat)value
{
    if (self.slider3 == slider) {
        self.slider3.maxText = [NSString stringWithFormat:@"%.2f", 1.0 - value];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before
navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
