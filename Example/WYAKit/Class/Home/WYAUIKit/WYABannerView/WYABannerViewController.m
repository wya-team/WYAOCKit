//
//  WYABannerViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYABannerViewController.h"


@interface WYABannerViewController ()
@property (nonatomic, strong) WYABannerView * bannerView;
@property (nonatomic, strong) WYABannerView * netBannerView;
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
    label.text = @"加载本地图片，时间1s";
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
    CGFloat bannerView_Height = 100*SizeAdapter;
    self.bannerView.frame = CGRectMake(bannerView_X, bannerView_Y, bannerView_Width, bannerView_Height);
    [self.view addSubview:self.bannerView];
    
    UILabel * label1 = [[UILabel alloc]init];
    label1.text = @"加载网络图片，时间2s";
    label1.textColor = random(51, 51, 51, 1);
    label1.font = FONT(15);
    [self.view addSubview:label1];
    CGFloat label1_X = 10;
    CGFloat label1_Y = CGRectGetMaxY(self.bannerView.frame)+120*SizeAdapter;
    CGFloat label1_Width = ScreenWidth-20;
    CGFloat label1_Height = 20*SizeAdapter;
    label1.frame = CGRectMake(label1_X, label1_Y, label1_Width, label1_Height);

    [self.view addSubview:self.netBannerView];
    CGFloat netBannerView_X = 0;
    CGFloat netBannerView_Y = CGRectGetMaxY(label1.frame);
    CGFloat netBannerView_Width = ScreenWidth;
    CGFloat netBannerView_Height = 100*SizeAdapter;
    self.netBannerView.frame = CGRectMake(netBannerView_X, netBannerView_Y, netBannerView_Width, netBannerView_Height);
}



- (WYABannerView *)bannerView{
    if(!_bannerView){
        _bannerView = ({
            WYABannerView * object = [[WYABannerView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 200*SizeAdapter) BannerSourceStyle:WYABannerSourceStyleLocal TimeInterval:1];
            object.images = [@[@"0",@"1",@"2",] mutableCopy];
            object;
       });
    }
    return _bannerView;
}

- (WYABannerView *)netBannerView{
    if(!_netBannerView){
        _netBannerView = ({
            WYABannerView * object = [[WYABannerView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 200*SizeAdapter) BannerSourceStyle:WYABannerSourceStyleNet TimeInterval:2];
            object.placeholdImage = [UIImage imageNamed:@"icon_picture"];
            object.images = [@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543397933202&di=89eecac599e0e2c145e7d2d477dc1681&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D9c1b09f27c094b36cf9f13aecba516ac%2Fadaf2edda3cc7cd920a6c3f43301213fb80e9110.jpg",
                             @"https://wx4.sinaimg.cn/large/a1b61d0aly1fn2h3xwat6j20dw0dwtbp.jpg",
                             @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543397575223&di=031c91014151391d9502840cbf85953f&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D6f4ac07d0633874488c8273f3966b38c%2Feaf81a4c510fd9f94e44cb442f2dd42a2834a448.jpg"] mutableCopy];
            object;
       });
    }
    return _netBannerView;
}
@end
