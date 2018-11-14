//
//  WYABannerViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYABannerViewController.h"
#import <WYAKit/WYABannerView.h>

@interface WYABannerViewController ()

@end

@implementation WYABannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = NSStringFromClass([self class]);
    
    NSArray * array = @[@"0",@"1",@"2"];
    
    WYABannerView * view = [[WYABannerView alloc]initWithFrame:self.view.frame];
    NSMutableArray * images = [[NSMutableArray alloc]init];
    for (NSInteger index = 0; index<array.count; index++) {
        UIImage * image = [UIImage imageNamed:array[index]];
        [images addObject:image];
    }
    view.images = [images copy];
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