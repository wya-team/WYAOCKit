//
//  WYADemoDrawerRightViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/27.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYADemoDrawerRightViewController.h"

@interface WYADemoDrawerRightViewController ()

@end

@implementation WYADemoDrawerRightViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.hiddenNavBar = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.hiddenNavBar = NO;
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
