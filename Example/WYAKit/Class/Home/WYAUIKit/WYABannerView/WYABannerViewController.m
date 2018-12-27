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
    [self wya_addRightNavBarButtonWithNormalImage:@[@"icon_help"] highlightedImg:@[]];

    self.navTitle = @"WYABannerView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self configUI];
    
}

- (void)configUI{
    UILabel * label = [[UILabel alloc]init];
    label.text = @"加载本地图片，时间2s";
    label.textColor = random(51, 51, 51, 1);
    label.font = FONT(15);
    [self.view addSubview:label];
    CGFloat label_X = 10;
    CGFloat label_Y = WYATopHeight+20*SizeAdapter;
    CGFloat label_Width = ScreenWidth-20;
    CGFloat label_Height = 20*SizeAdapter;
    label.frame = CGRectMake(label_X, label_Y, label_Width, label_Height);
    
    
    CGFloat bannerView_X = 0;
    CGFloat bannerView_Y = CGRectGetMaxY(label.frame);
    CGFloat bannerView_Width = ScreenWidth;
    CGFloat bannerView_Height = 200*SizeAdapter;
    CGRect rectB = CGRectMake(bannerView_X, bannerView_Y, bannerView_Width, bannerView_Height);
    
    WYABannerView *banner1 = [WYABannerView wya_bannerViewWithFrame:rectB delegate:nil placeholderImage:nil];
    banner1.localizationImageNamesGroup = @[@"0",@"1",@"2"];
    banner1.pageControlAliment = WYABannerViewPageContolAlimentCenter;
    banner1.pageControlStyle = WYABannerViewPageContolStyleClassic;
    [self.view addSubview:banner1];
    
    UILabel * label1 = [[UILabel alloc]init];
    label1.text = @"加载网络图片，时间2s";
    label1.textColor = random(51, 51, 51, 1);
    label1.font = FONT(15);
    [self.view addSubview:label1];
    CGFloat label1_X = 10;
    CGFloat label1_Y = CGRectGetMaxY(banner1.frame)+20*SizeAdapter;
    CGFloat label1_Width = ScreenWidth-20;
    CGFloat label1_Height = 20*SizeAdapter;
    label1.frame = CGRectMake(label1_X, label1_Y, label1_Width, label1_Height);


    CGFloat netBannerView_X = 0;
    CGFloat netBannerView_Y = CGRectGetMaxY(label1.frame);
    CGFloat netBannerView_Width = ScreenWidth;
    CGFloat netBannerView_Height = 200*SizeAdapter;
    CGRect rect2 = CGRectMake(netBannerView_X, netBannerView_Y, netBannerView_Width, netBannerView_Height);
    
    
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    // 图片配文字
    NSArray *titles = @[@"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到",
                        @"感谢您的支持"
                        ];
    
//    CGFloat banner2_X = 0;
//    CGFloat banner2_Y = CGRectGetMaxY(self.netBannerView.frame)+20*SizeAdapter;
//    CGFloat banner2_Width = ScreenWidth;
//    CGFloat banner2_Height = 140;
//    CGRect rect = CGRectMake(banner2_X, banner2_Y, banner2_Width, banner2_Height);
    
    WYABannerView *banner2 = [WYABannerView wya_bannerViewWithFrame:rect2 delegate:nil placeholderImage:nil];
    banner2.pageControlAliment = WYABannerViewPageContolAlimentRight;
    banner2.imageURLStringsGroup = imagesURLStrings;
    banner2.titlesGroup = titles;
    banner2.pageControlStyle = WYABannerViewPageContolStyleAnimated;
    [self.view addSubview:banner2];
}

@end
