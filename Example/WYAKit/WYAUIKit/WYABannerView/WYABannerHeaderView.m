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
        WYABannerView * view = [[WYABannerView alloc]initWithFrame:frame BannerSourceStyle:WYABannerSourceStyleNet];
        view.images = [@[@"https://https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543397536351&di=4bc0282cb3a8f9a692abbe5b1118c040&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3Dd4d871f772f0f736ccf34442623cd96c%2Faec379310a55b3199478c5fd49a98226cefc17b0.jpg",
                         @"https://wx4.sinaimg.cn/large/a1b61d0aly1fn2h3xwat6j20dw0dwtbp.jpg",
                         @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543397575223&di=031c91014151391d9502840cbf85953f&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D6f4ac07d0633874488c8273f3966b38c%2Feaf81a4c510fd9f94e44cb442f2dd42a2834a448.jpg"] mutableCopy];
        [self addSubview:view];
    }
    return self;
}

@end
