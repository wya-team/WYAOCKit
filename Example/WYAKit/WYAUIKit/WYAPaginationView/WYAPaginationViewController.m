//
//  WYAPaginationViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/20.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPaginationViewController.h"
#import <WYAKit/WYAPaginationView.h>
@interface WYAPaginationViewController ()

@end

@implementation WYAPaginationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WYAPaginationView * view = [[WYAPaginationView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    [self.view addSubview:view];
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