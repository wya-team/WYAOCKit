//
//  WYAHomeViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/26.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAHomeViewController.h"
#import "WYAViewController.h"
@interface WYAHomeViewController ()
@property (nonatomic, strong) UIButton * testBtn;
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
    self.view.backgroundColor = [UIColor whiteColor];
    self.testBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, WYATopHeight, 100, 100)];
    self.testBtn.backgroundColor = [UIColor yellowColor];
    [self.testBtn addTarget:self action:@selector(testBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.testBtn];
}

- (void)testBtn:(UIButton *)sender{
    WYAViewController * vc = [WYAViewController new];
    [self.navigationController pushViewController:vc animated:YES];
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
