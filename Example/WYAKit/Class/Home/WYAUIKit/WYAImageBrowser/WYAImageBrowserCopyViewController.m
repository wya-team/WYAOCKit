//
//  WYAImageBrowserCopyViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/3/8.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYAImageBrowserCopyViewController.h"
#import <WYAKit/WYAImageBrowser.h>
@interface WYAImageBrowserCopyViewController ()

@end

@implementation WYAImageBrowserCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIImage * image1 = [UIImage imageNamed:@"1"];
    UIImage * image2 = [UIImage imageNamed:@"2"];
    UIImage * image3 = [UIImage imageNamed:@"icon_cancel_notice"];

    WYAImageBrowser * imageBrowser = [[WYAImageBrowser alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight-WYATopHeight-WYABottomHeight)];
    imageBrowser.images = @[image1, image2, image3];
    imageBrowser.selectIndex = 1;
    imageBrowser.pageControlNormalColor = [UIColor grayColor];
    imageBrowser.pageControlSelectColor = [UIColor whiteColor];
    imageBrowser.imageSelectBlock = ^(NSInteger index) {

    };
    [self.view addSubview:imageBrowser];
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
