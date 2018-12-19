//
//  WYABannerViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYABannerViewController.h"


@interface WYABannerViewController ()

@end

@implementation WYABannerViewController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
    vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/WYABannerView/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navTitle = @"WYABannerView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //        view.images = [@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543397933202&di=89eecac599e0e2c145e7d2d477dc1681&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D9c1b09f27c094b36cf9f13aecba516ac%2Fadaf2edda3cc7cd920a6c3f43301213fb80e9110.jpg",
    //                         @"https://wx4.sinaimg.cn/large/a1b61d0aly1fn2h3xwat6j20dw0dwtbp.jpg",
    //                         @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543397575223&di=031c91014151391d9502840cbf85953f&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D6f4ac07d0633874488c8273f3966b38c%2Feaf81a4c510fd9f94e44cb442f2dd42a2834a448.jpg"] mutableCopy];
    
    WYABannerView * view = [[WYABannerView alloc]initWithFrame:CGRectMake(0, WYATopHeight, self.view.cmam_width, 200*SizeAdapter) BannerSourceStyle:WYABannerSourceStyleLocal TimeInterval:1];
    
    view.images = [@[@"0",@"1",@"2",] mutableCopy];
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
