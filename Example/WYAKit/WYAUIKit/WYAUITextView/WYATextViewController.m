//
//  WYATextViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYATextViewController.h"
#import <WYAKit/WYATextView.h>

@interface WYATextViewController ()

@end

@implementation WYATextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WYATextView * textView = [[WYATextView alloc]initWithFrame:CGRectMake(0, 100, 100, 30)];
    [self.view addSubview:textView];
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
