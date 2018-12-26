//
//  WYAImageBrowserViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/27.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAImageBrowserViewController.h"

@interface WYAImageBrowserViewController ()

@end

@implementation WYAImageBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navTitle = NSStringFromClass([self class]);
    
    NSArray * array = @[@"0",@"1",@"2"];
    
    WYAImageBrowser * view = [[WYAImageBrowser alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight-WYATopHeight)];
    NSMutableArray * images = [[NSMutableArray alloc]init];
    for (NSInteger index = 0; index<array.count; index++) {
        UIImage * image = [UIImage imageNamed:array[index]];
        [images addObject:image];
    }
    if (self.array) {
        view.images = self.array;
    }else{
        view.images = [images copy];
    }
    
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
