//
//  WYAHomeViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/26.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAHomeViewController.h"
#import <WYAKit/WYANavBar.h>
@interface WYAHomeViewController ()
@property (nonatomic, strong) WYANavBar * navBar;
@end

@implementation WYAHomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"center.view.willAppear");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"center.view.willDisAppear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar = [[WYANavBar alloc]init];
    self.navBar.navTitle = @"test";
    [self.navBar wya_goBackButtonWithTitle:@"返回" normalColor:[UIColor blackColor] highlightedColor:[UIColor blueColor]];
    [self.view addSubview:self.navBar];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
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
