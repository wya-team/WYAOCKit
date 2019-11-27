//
//  WYACardViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/19.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYACardViewController.h"

@interface WYACardViewController ()

@end

@implementation WYACardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navTitle = @"WYACard";

    self.view.backgroundColor = BGCOLOR;

    UILabel * label = [[UILabel alloc] init];
    label.text      = @"默认";
    label.textColor = random(51, 51, 51, 1);
    label.font      = FONT(15);
    [self.view addSubview:label];
    CGFloat label_X      = 10;
    CGFloat label_Y      = WYATopHeight + 20 * SizeAdapter;
    CGFloat label_Width  = ScreenWidth - 20;
    CGFloat label_Height = 20 * SizeAdapter;
    label.frame          = CGRectMake(label_X, label_Y, label_Width, label_Height);

    WYACard * card           = [[WYACard alloc] init];
    card.layer.cornerRadius  = 4.f;
    card.layer.masksToBounds = YES;
    [self.view addSubview:card];
    CGFloat card_X      = 10 * SizeAdapter;
    CGFloat card_Y      = CGRectGetMaxY(label.frame) + 20 * SizeAdapter;
    CGFloat card_Width  = ScreenWidth - 20 * SizeAdapter;
    CGFloat card_Height = 100 * SizeAdapter;
    card.frame          = CGRectMake(card_X, card_Y, card_Width, card_Height);
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
