//
//  WYANoticeViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/21.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYANoticeViewController.h"

@interface WYANoticeViewController ()
@property (nonatomic, strong) WYANoticeBar * bar;
@property (nonatomic, strong) WYANoticeBar * bar1;
@property (nonatomic, strong) WYANoticeBar * bar2;
@property (nonatomic, strong) WYANoticeBar * bar3;
@end

@implementation WYANoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navTitle = @"WYANoticeBar";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.bar = [[WYANoticeBar alloc]initWithFrame:CGRectMake(10*SizeAdapter, WYATopHeight+20*SizeAdapter, self.view.frame.size.width-20*SizeAdapter, 44*SizeAdapter)];
    self.bar.showNoticeButton = YES;
    self.bar.noticeButtonImage = [UIImage imageNamed:@"icon_voiceopen"];
    self.bar.showRightButton = YES;
    self.bar.rightButtonImage = [UIImage imageNamed:@"icon_voiceopen"];
    self.bar.showText = @"今天天气不错，阳光明媚，好像出去装转,哈哈哈哈哈哈哈哈哈哈";
    self.bar.noticeBackgroundColor = random(253, 253, 240, 1);
    [self.view addSubview:self.bar];

    self.bar1 = [[WYANoticeBar alloc]initWithFrame:CGRectMake(10*SizeAdapter, CGRectGetMaxY(self.bar.frame)+20*SizeAdapter, self.view.frame.size.width-20*SizeAdapter, 44*SizeAdapter)];
    self.bar1.showNoticeButton = YES;
    self.bar1.noticeButtonImage = [UIImage imageNamed:@"icon_voiceopen"];
    self.bar1.showText = @"今天天气不错，阳光明媚，好像出去装转,哈哈哈哈哈哈哈哈哈哈";
    self.bar1.noticeBackgroundColor = random(253, 253, 240, 1);
    [self.view addSubview:self.bar1];

    self.bar2 = [[WYANoticeBar alloc]initWithFrame:CGRectMake(10*SizeAdapter, CGRectGetMaxY(self.bar1.frame)+20*SizeAdapter, self.view.frame.size.width-20*SizeAdapter, 44*SizeAdapter)];
    self.bar2.showRightButton = YES;
    self.bar2.rightButtonImage = [UIImage imageNamed:@"icon_voiceopen"];
    self.bar2.showText = @"今天天气不错，阳光明媚，好像出去装转,哈哈哈哈哈哈哈哈哈哈";
    self.bar2.noticeBackgroundColor = random(253, 253, 240, 1);
    [self.view addSubview:self.bar2];
    
    self.bar3 = [[WYANoticeBar alloc]initWithFrame:CGRectMake(10*SizeAdapter, CGRectGetMaxY(self.bar2.frame)+20*SizeAdapter, self.view.frame.size.width-20*SizeAdapter, 44*SizeAdapter)];
    self.bar3.showText = @"今天天气不错，阳光明媚，好像出去装转,哈哈哈哈哈哈哈哈哈哈";
    self.bar3.noticeBackgroundColor = random(253, 253, 240, 1);
    [self.view addSubview:self.bar3];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.bar wya_start];
        [self.bar1 wya_start];
        [self.bar2 wya_start];
        [self.bar3 wya_start];
    });
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.bar wya_stop];
    [self.bar1 wya_stop];
    [self.bar2 wya_stop];
    [self.bar3 wya_stop];
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
