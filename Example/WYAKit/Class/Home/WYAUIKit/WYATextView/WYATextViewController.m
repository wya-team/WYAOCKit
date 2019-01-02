//
//  WYATextViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYATextViewController.h"

@interface WYATextViewController ()

@end

@implementation WYATextViewController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
    vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/WYATextView/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];

    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    WYATextView * textView = [[WYATextView alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 100)];
    [textView wya_PlaceHoldString:@"占位文字" PlaceHoldColor:[UIColor grayColor] PlaceHoldFont:15.f];
    textView.textViewWordsCount  = 50;
    textView.showTitle           = NO;
    textView.layer.cornerRadius  = 4.f;
    textView.layer.masksToBounds = YES;
    textView.textViewMaxHeight   = 100;
    [self.view addSubview:textView];

    WYATextView * textView1 = [[WYATextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(textView.frame) + 20, self.view.frame.size.width - 20, 100)];
    [textView1 wya_PlaceHoldString:@"占位文字" PlaceHoldColor:[UIColor grayColor] PlaceHoldFont:15.f];
    textView1.textViewWordsCount  = 100;
    textView1.title               = @"哈哈";
    textView1.layer.cornerRadius  = 4.f;
    textView1.layer.masksToBounds = YES;
    textView1.textViewMaxHeight   = 100;
    [self.view addSubview:textView1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
