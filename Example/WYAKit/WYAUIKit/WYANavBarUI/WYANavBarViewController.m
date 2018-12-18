//
//  WYANavBarViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/18.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYANavBarViewController.h"

@interface WYANavBarViewController ()
@property (nonatomic, strong) UIView * tempView;
@property (nonatomic, strong) WYANavBar * tempNavBar1;
@property (nonatomic, strong) WYANavBar * tempNavBar2;
@end

@implementation WYANavBarViewController
#pragma mark ======= Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tempView];
}


#pragma mark ======= getter
- (WYANavBar *)tempNavBar1{
    if(!_tempNavBar1){
        _tempNavBar1 = ({
            WYANavBar * object = [[WYANavBar alloc]init];
            object.navTitle = @"WYANavBar";
            [object wya_customGobackWithImage:[UIImage imageNamed:@"返回"]];
            [object wya_addRightNavBarButtonWithNormalImage:@[@"icon_search",@"list"] highlightedImg:@[]];
            object;
       });
    }
    return _tempNavBar1;
}

- (WYANavBar *)tempNavBar2{
    if(!_tempNavBar2){
        _tempNavBar2 = ({
            WYANavBar * object = [[WYANavBar alloc]init];
            object.navTitle = @"WYANavBar";
            [object wya_addLeftNavBarButtonWithNormalTitle:@[@"返回"] normalColor:@[[UIColor wya_hex:@"#108DE7"]] highlightedColor:@[[UIColor wya_hex:@"#FFFFFFF"]]];
            [object wya_addRightNavBarButtonWithNormalTitle:@[@"搜索",@"更多"] normalColor:@[[UIColor wya_hex:@"#108DE7"],[UIColor wya_hex:@"#108DE7"]] highlightedColor:@[[UIColor wya_hex:@"#FFFFFFF"],[UIColor wya_hex:@"#FFFFFFF"]]];
            object;
       });
    }
    return _tempNavBar2;
}

- (UIView *)tempView{
    if(!_tempView){
        _tempView = ({
            UIView * object = [[UIView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, 100)];
            self.tempNavBar1.frame = CGRectMake(0, 0, ScreenWidth, 44);
            self.tempNavBar2.frame = CGRectMake(0, WYATopHeight, ScreenWidth, 44);
            [object addSubview:self.tempNavBar1];
            [object addSubview:self.tempNavBar2];
            object;
       });
    }
    return _tempView;
}
@end