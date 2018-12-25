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
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
    vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/WYANoticeBar/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self wya_addRightNavBarButtonWithNormalImage:@[@"icon_help"] highlightedImg:@[]];

    // Do any additional setup after loading the view.
    self.navTitle = @"WYANoticeBar";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel * label = [[UILabel alloc]init];
    label.text = @"通告栏";
    label.textColor = random(51, 51, 51, 1);
    label.font = FONT(15);
    [self.view addSubview:label];
    CGFloat label_X = 10;
    CGFloat label_Y = WYATopHeight + 20*SizeAdapter;
    CGFloat label_Width = ScreenWidth-20;
    CGFloat label_Height = 44*SizeAdapter;
    label.frame = CGRectMake(label_X, label_Y, label_Width, label_Height);
    
    
    self.bar = [[WYANoticeBar alloc]initWithFrame:CGRectMake(10*SizeAdapter, CGRectGetMaxY(label.frame)+20*SizeAdapter, self.view.frame.size.width-20*SizeAdapter, 44*SizeAdapter)];
    self.bar.showNoticeButton = YES;
    self.bar.noticeButtonImage = [UIImage imageNamed:@"icon_voiceorange"];
    self.bar.showRightButton = YES;
    self.bar.rightButtonImage = [UIImage imageNamed:@"icon_back_notice"];
    self.bar.showText = @"ABCDEFG HIJKLMN OPQ RST UVW XYZ 123 456 789 0";
    self.bar.showTextColor = REDCOLOR;
    self.bar.noticeBackgroundColor = random(253, 253, 240, 1);
    [self.view addSubview:self.bar];

    self.bar1 = [[WYANoticeBar alloc]initWithFrame:CGRectMake(10*SizeAdapter, CGRectGetMaxY(self.bar.frame)+20*SizeAdapter, self.view.frame.size.width-20*SizeAdapter, 44*SizeAdapter)];
    self.bar1.showNoticeButton = YES;
    self.bar1.noticeButtonImage = [UIImage imageNamed:@"icon_voiceorange"];
    self.bar1.showText = @"ABCDEFG HIJKLMN OPQ RST UVW XYZ 123 456 789 0";
    self.bar1.showTextColor = REDCOLOR;
    self.bar1.noticeBackgroundColor = random(253, 253, 240, 1);
    [self.view addSubview:self.bar1];

    self.bar2 = [[WYANoticeBar alloc]initWithFrame:CGRectMake(10*SizeAdapter, CGRectGetMaxY(self.bar1.frame)+20*SizeAdapter, self.view.frame.size.width-20*SizeAdapter, 44*SizeAdapter)];
    self.bar2.showRightButton = YES;
    self.bar2.rightButtonImage = [UIImage imageNamed:@"icon_cancel_notice"];
    self.bar2.showText = @"ABCDEFG HIJKLMN OPQ RST UVW XYZ 123 456 789 0";
    self.bar2.showTextColor = REDCOLOR;
    self.bar2.noticeBackgroundColor = random(253, 253, 240, 1);
    WeakSelf(weakSelf);
    self.bar2.rightButtonHandle = ^{
        [weakSelf.bar2 removeFromSuperview];
    };
    [self.view addSubview:self.bar2];
    
    self.bar3 = [[WYANoticeBar alloc]initWithFrame:CGRectMake(10*SizeAdapter, CGRectGetMaxY(self.bar2.frame)+20*SizeAdapter, self.view.frame.size.width-20*SizeAdapter, 44*SizeAdapter)];
    self.bar3.showText = @"ABCDEFG HIJKLMN OPQ RST UVW XYZ 123 456 789 0";
    self.bar3.showTextColor = REDCOLOR;
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
