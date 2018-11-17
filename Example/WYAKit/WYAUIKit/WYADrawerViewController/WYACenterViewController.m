//
//  WYACenterViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/16.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYACenterViewController.h"
#import <WYAKit/WYADrawerViewController.h>
@interface WYACenterViewController ()

@end

@implementation WYACenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 88, 50, 50);
    [self.view addSubview:button];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundColor:[UIColor redColor]];
    [button1 addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    button1.frame = CGRectMake(self.view.frame.size.width-50, 88, 50, 50);
    [self.view addSubview:button1];
}

-(void)buttonClick{
    WYADrawerViewController * vc = (WYADrawerViewController *)self.parentViewController;
    [vc leftViewControllerMove];
}

-(void)btnClick{
    WYADrawerViewController * vc = (WYADrawerViewController *)self.parentViewController;
    [vc rightViewControllerMove];
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
