//
//  WYASliderViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/20.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYASliderViewController.h"

@interface WYASliderViewController ()

@end

@implementation WYASliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    WYASlider * slider = [[WYASlider alloc]initWithFrame:CGRectMake(30, 100, self.view.frame.size.width-60, 30)];
    slider.showNoteLabel = NO;
    [self.view addSubview:slider];
    
    WYASlider * slider1 = [[WYASlider alloc]initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, 30)];
    slider1.minText = @"0.0";
    slider1.maxText = @"100.0";
    [self.view addSubview:slider1];
    
    
    WYASlider * slider2 = [[WYASlider alloc]initWithFrame:CGRectMake(10, 300, self.view.frame.size.width-20, 30)];
    slider2.minImage = [UIImage imageNamed:@"喇叭"];
    slider2.maxImage = [UIImage imageNamed:@"大喇叭"];
    [self.view addSubview:slider2];
    
    WYASlider * slider3 = [[WYASlider alloc]initWithFrame:CGRectMake(10, 400, self.view.frame.size.width-20, 30)];
    slider3.sliderStyle = WYASliderStyleDouble;
    slider3.minText = @"0.0";
    slider3.maxText = @"100.0";
    [self.view addSubview:slider3];
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
