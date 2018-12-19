//
//  WYAPaginationViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/20.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPaginationViewController.h"

@interface WYAPaginationViewController ()<WYAPaginationViewDelegate>
@property (nonatomic, assign) NSInteger  index;
@property (nonatomic, strong) WYAPaginationView * pagination;
@end

@implementation WYAPaginationViewController

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
    vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/tree/master/WYAKit/Classes/WYAUIKit/WYAPaginationView";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.index = 0;
    self.navTitle = @"WYAPaginationView";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self wya_addRightNavBarButtonWithNormalImage:@[@"icon_help"] highlightedImg:@[]];

    self.pagination = [[WYAPaginationView alloc]initWithFrame:CGRectMake(20*SizeAdapter, WYATopHeight+20*SizeAdapter, ScreenWidth-40*SizeAdapter, 44*SizeAdapter)];
    self.pagination.wya_Delegate = self;
    [self.view addSubview:self.pagination];
    [self changeNumber];
}

#pragma mark - WYAPaginationViewDelegate  -
/**
 左按钮点击事件
 */
- (void)wya_LeftAction{
    if (self.index<1) {
        return;
    }
    self.index--;
    [self changeNumber];
}

/**
 右按钮点击事件
 */
- (void)wya_RightAction{
    if (self.index>9) {
        return;
    }
    self.index++;
    [self changeNumber];
}

-(void)changeNumber{
    NSString * string = [NSString stringWithFormat:@"%d/10",self.index];
    NSMutableAttributedString * text = [[NSMutableAttributedString alloc]initWithString:string];
    [text addAttribute:NSForegroundColorAttributeName value:random(58, 149, 226, 1) range:[string rangeOfString:[NSString stringWithFormat:@"%d",self.index]]];
    self.pagination.titleLabel.attributedText = text;
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
