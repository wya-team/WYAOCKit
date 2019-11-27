//
//  WYANavBarViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/18.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYANavBarViewController.h"
#import "WYANavBarTableViewCell.h"

@interface WYANavBarViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong) UIButton * tempRightButton1;
@property (nonatomic, strong) UIButton * tempRightButton2;
@property (nonatomic, strong) UIButton * tempLeftButton1;
@property (nonatomic, strong) UIButton * tempLeftButton2;
@end

@implementation WYANavBarViewController
#pragma mark ======= Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navTitle = @"WYANavBar";
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];
    [self.view addSubview:self.tableView];
}

#pragma mark ======= action

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
    vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/"
                   @"WYANavBar/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)wya_goBack
{
    [super wya_goBack];
}

- (void)wya_customLeftBarButtonItemPressed:(UIButton *)sender
{
    if ((sender.tag - 1000) == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark ======= getter

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = ({
            UITableView * object = [[UITableView alloc]
            initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight)
                    style:UITableViewStylePlain];
            object.delegate      = self;
            object.dataSource    = self;
            object.scrollEnabled = NO;
            [object registerClass:[WYANavBarTableViewCell class] forCellReuseIdentifier:@"cellID"];
            object.tableFooterView = [UIView new];
            object.separatorStyle  = UITableViewCellSeparatorStyleNone;
            object.backgroundColor = BGCOLOR;
            object;
        });
    }
    return _tableView;
}
- (NSArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = ({
            NSArray * object = @[
                @"    设置背景色",
                @"    设置背景图片",
                @"    设置标题字体大小",
                @"    设置右侧文字+图片显示样式",
                @"    设置右侧两个图片格式",
                @"    设置右侧两个文字格式",
                @"    设置左侧文字+图片格式",
                @"    设置左侧两个文字格式",
                @"    设置左侧两个图片格式"
            ];
            object;
        });
    }
    return _dataSource;
}

- (UIButton *)tempRightButton1
{
    if (!_tempRightButton1) {
        _tempRightButton1 = ({
            UIButton * object = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
            [object setTitle:@"更多" forState:UIControlStateNormal];
            [object setTitleColor:BLUECOLOR forState:UIControlStateNormal];
            [object setTitleColor:GRAYTITLECOLOR forState:UIControlStateHighlighted];
            object.titleLabel.font = FONT(16);
            object;
        });
    }
    return _tempRightButton1;
}

- (UIButton *)tempRightButton2
{
    if (!_tempRightButton2) {
        _tempRightButton2 = ({
            UIButton * object = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
            [object setImage:[UIImage imageNamed:@"icon_help"] forState:UIControlStateNormal];
            [object addTarget:self
                       action:@selector(wya_customrRightBarButtonItemPressed:)
             forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _tempRightButton2;
}

- (UIButton *)tempLeftButton1
{
    if (!_tempLeftButton1) {
        _tempLeftButton1 = ({
            UIButton * object = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
            [object setTitle:@"返回" forState:UIControlStateNormal];
            [object setTitleColor:BLACKTITLECOLOR forState:UIControlStateNormal];
            [object setTitleColor:GRAYTITLECOLOR forState:UIControlStateHighlighted];
            object.titleLabel.font = FONT(16);
            [object addTarget:self
                       action:@selector(wya_goBack)
             forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _tempLeftButton1;
}

- (UIButton *)tempLeftButton2
{
    if (!_tempLeftButton2) {
        _tempLeftButton2 = ({
            UIButton * object = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
            [object setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
            [object addTarget:self
                       action:@selector(wya_goBack)
             forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _tempLeftButton2;
}

#pragma mark ======= UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
#pragma mark ======= UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WYANavBarTableViewCell * cell =
    [tableView dequeueReusableCellWithIdentifier:@"cellID"
                                    forIndexPath:indexPath];
    cell.backgroundColor = BGCOLOR;
    cell.titleString     = [self.dataSource wya_safeObjectAtIndex:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger index = indexPath.row;
    switch (index) {
        case 0: {
            // 设置背景色
            self.navBackGroundColor      = BLUECOLOR;
            self.navBackGroundImageNamed = @"";

        } break;
        case 1: {
            // 设置背景图片
            self.navBackGroundColor      = WHITECOLOR;
            self.navTitleFont            = 18;
            self.navBackGroundImageNamed = @"2";
        } break;
        case 2: {
            // 设置标题大小
            self.navBackGroundColor      = WHITECOLOR;
            self.navTitleFont            = 26;
            self.navBackGroundImageNamed = @"";

        } break;
        case 3: {
            // 设置右侧文字+图片显示样式
            self.navBackGroundColor      = WHITECOLOR;
            self.navTitleFont            = 18;
            self.navBackGroundImageNamed = @"";

            self.navBar.rightButtons = @[ self.tempRightButton2, self.tempRightButton1 ];
        } break;
        case 4: {
            // 设置右侧两个图片
            self.navBackGroundColor      = WHITECOLOR;
            self.navTitleFont            = 18;
            self.navBackGroundImageNamed = @"";

            [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help", @"icon_search" ]
                                           highlightedImg:@[]];
        } break;
        case 5: {
            // 设置右侧两个文字格式
            self.navBackGroundColor      = WHITECOLOR;
            self.navTitleFont            = 18;
            self.navBackGroundImageNamed = @"";

            [self wya_addRightNavBarButtonWithNormalTitle:@[ @"帮助", @"更多" ]
                                              normalColor:@[ BLUECOLOR, BLUECOLOR ]
                                         highlightedColor:@[]];
        } break;
        case 6: {
            // 设置左侧文字+图片
            self.navBackGroundColor      = WHITECOLOR;
            self.navTitleFont            = 18;
            self.navBackGroundImageNamed = @"";
            self.navBar.leftButtons      = @[ self.tempLeftButton2, self.tempLeftButton1 ];
        } break;
        case 7: {
            // 设置左侧两个文字格式
            self.navBackGroundColor      = WHITECOLOR;
            self.navTitleFont            = 18;
            self.navBackGroundImageNamed = @"";
            [self wya_addLeftNavBarButtonWithNormalTitle:@[ @"返回", @"搜索" ]
                                             normalColor:@[ BLUECOLOR, BLUECOLOR ]
                                        highlightedColor:@[]];
        } break;
        case 8: {
            // 设置两个图片格式
            self.navBackGroundColor      = WHITECOLOR;
            self.navTitleFont            = 18;
            self.navBackGroundImageNamed = @"";
            [self wya_addLeftNavBarButtonWithNormalImage:@[ @"返回", @"icon_friend" ]
                                          highlightedImg:@[]];
        } break;
        default:
            break;
    }
}

@end
