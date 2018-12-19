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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navTitle = @"WYACard";
    
    self.view.backgroundColor = BGCOLOR;
    
    WYACard * card = [[WYACard alloc]initWithFrame:CGRectMake(10*SizeAdapter, WYATopHeight+20*SizeAdapter, self.view.cmam_width-20*SizeAdapter, 90)];
    card.layer.cornerRadius = 4.f;
    card.layer.masksToBounds = YES;
    [self.view addSubview:card];
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
