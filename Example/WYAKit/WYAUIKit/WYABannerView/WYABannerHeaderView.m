//
//  WYABannerHeaderView.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/28.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYABannerHeaderView.h"

@implementation WYABannerHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        WYABannerView * view = [[WYABannerView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height*0.8) BannerSourceStyle:WYABannerSourceStyleLocal];
//        view.images = [@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543397933202&di=89eecac599e0e2c145e7d2d477dc1681&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D9c1b09f27c094b36cf9f13aecba516ac%2Fadaf2edda3cc7cd920a6c3f43301213fb80e9110.jpg",
//                         @"https://wx4.sinaimg.cn/large/a1b61d0aly1fn2h3xwat6j20dw0dwtbp.jpg",
//                         @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543397575223&di=031c91014151391d9502840cbf85953f&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D6f4ac07d0633874488c8273f3966b38c%2Feaf81a4c510fd9f94e44cb442f2dd42a2834a448.jpg"] mutableCopy];
        view.images = [@[@"0",@"1",@"2",] mutableCopy];
        [self addSubview:view];
        
        WYANoticeBar * bar = [[WYANoticeBar alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(view.frame), frame.size.width, frame.size.height-view.cmam_height)];
        bar.showRightButton = NO;
        bar.showNoticeButton = NO;
        bar.showText = @"以下是自定义控件，点击进入详情介绍                                 ";
        [self addSubview:bar];
        [bar wya_start];
    }
    return self;
}

@end
