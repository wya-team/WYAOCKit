//
//  WYASliderViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/20.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYASliderViewController.h"

@interface WYASliderViewController ()<WYASliderDelegate>
@property (nonatomic, strong) WYASlider * slider1;
@property (nonatomic, strong) WYASlider * slider3;
@end

@implementation WYASliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    WYASlider * slider = [[WYASlider alloc]initWithFrame:CGRectMake(30, 100, self.view.frame.size.width-60, 30)];
    slider.showNoteLabel = NO;
    slider.minTintColor = BLUECOLOR;
    [self.view addSubview:slider];
    
    self.slider1 = [[WYASlider alloc]initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, 30)];
    self.slider1.minText = @"0.0";
    self.slider1.maxText = @"100.0";
    self.slider1.delegate = self;
    [self.view addSubview:self.slider1];


    WYASlider * slider2 = [[WYASlider alloc]initWithFrame:CGRectMake(10, 300, self.view.frame.size.width-20, 30)];
    slider2.minImage = [UIImage imageNamed:@"喇叭"];
    slider2.maxImage = [UIImage imageNamed:@"大喇叭"];
    [self.view addSubview:slider2];

    self.slider3 = [[WYASlider alloc]initWithFrame:CGRectMake(10, 400, self.view.frame.size.width-20, 30)];
    self.slider3.sliderStyle = WYASliderStyleDouble;
    self.slider3.minText = @"0.0";
    self.slider3.maxText = @"100.0";
    self.slider3.minTintColor = BLACKTEXTCOLOR;
    self.slider3.maxTintColor = BLACKTEXTCOLOR;
    self.slider3.mainTintColor = REDCOLOR;
    self.slider3.delegate = self;
    [self.view addSubview:self.slider3];
}

#pragma mark - WYASliderDelegate  -
-(void)wya_slider:(WYASlider *)slider MinValueChange:(CGFloat)value{
    if (self.slider1 == slider) {
        self.slider1.maxText = [NSString stringWithFormat:@"%.2f",value];
    }else if (self.slider3 == slider) {
        self.slider3.minText = [NSString stringWithFormat:@"%.2f",value];
    }
}

-(void)wya_slider:(WYASlider *)slider MaxValueChange:(CGFloat)value{
    if (self.slider3 == slider) {
        self.slider3.maxText = [NSString stringWithFormat:@"%.2f",1.0-value];
    }
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
