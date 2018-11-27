//
//  WYAViewController.m
//  WYAKit
//
//  Created by 1228506851@qq.com on 11/12/2018.
//  Copyright (c) 2018 1228506851@qq.com. All rights reserved.
//

#import "WYAViewController.h"
#import <WYAKit/WYANavBar.h>

@interface WYAViewController ()
@property (nonatomic, strong) WYANavBar * navBar;
@end

@implementation WYAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navTitle = @"push1";
    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"self.view.frame==%@",NSStringFromCGRect(self.view.frame));
    
    self.navBar = [[WYANavBar alloc]init];
    self.navBar.navTitle = @"test";
    [self.navBar wya_goBackButtonWithTitle:@"返回" normalColor:[UIColor blackColor] highlightedColor:[UIColor blueColor]];
    [self.view addSubview:self.navBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
