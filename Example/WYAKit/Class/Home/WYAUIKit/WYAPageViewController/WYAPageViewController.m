//
//  WYAPageViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/21.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPageViewController.h"
#import "WYACustomPageController.h"
#import "WYAShowNavController.h"
#import "WYATablePageController.h"

@interface WYAPageViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray * titles;
@property (nonatomic, strong) NSDictionary * stylesMap;
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation WYAPageViewController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
    vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/WYAPageViewController/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navTitle = @"PageControllerStyle";
    [self.view addSubview:self.tableView];
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];
}
- (void)wya_goBackPressed:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSArray *)titles
{
    if (_titles == nil) {
        _titles = @[ @"WYAMenuViewStyleDefault",
                     @"WYAMenuViewStyleLine",
                     @"WYAMenuViewStyleFlood",
                     @"WYAMenuViewStyleFloodHollow",
                     @"WYAMenuViewShowOnNav",
                     @"WYAMenuViewStyleSegmented",
                     @"WYAMenuViewStyleTriangle",
                     @"WYAMenuViewStyleNaughty",
                     @"WYAMenuViewCornerRadius",
                     @"WYAMenuViewPositionBottom",
                     @"WYATablePageController" ];
    }
    return _titles;
}

- (NSDictionary *)stylesMap
{
    if (!_stylesMap) {
        _stylesMap = @{ @"WYAMenuViewStyleDefault" : @(WYAMenuViewStyleDefault),
                        @"WYAMenuViewStyleLine" : @(WYAMenuViewStyleLine),
                        @"WYAMenuViewStyleFlood" : @(WYAMenuViewStyleFlood),
                        @"WYAMenuViewStyleFloodHollow" : @(WYAMenuViewStyleFloodHollow),
                        @"WYAMenuViewShowOnNav" : @(WYAMenuViewStyleFlood),
                        @"WYAMenuViewStyleSegmented" : @(WYAMenuViewStyleSegmented),
                        @"WYAMenuViewStyleTriangle" : @(WYAMenuViewStyleTriangle),
                        @"WYAMenuViewStyleNaughty" : @(WYAMenuViewStyleLine),
                        @"WYAMenuViewCornerRadius" : @(WYAMenuViewStyleFlood),
                        @"WYAMenuViewPositionBottom" : @(WYAMenuViewStyleDefault) };
    }
    return _stylesMap;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView                 = [[UITableView alloc] initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate        = self;
        _tableView.dataSource      = self;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const cellIdentifier = @"WYAPageViewControllerCell";
    UITableViewCell * cell                 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSString * key         = [self.titles wya_safeObjectAtIndex:indexPath.row];
    WYAMenuViewStyle style = [[self.stylesMap wya_safeObjectForKey:key] integerValue];

    if (![key isEqualToString:@"WYATablePageController"]) {
        if (style == WYAMenuViewStyleFlood || style == WYAMenuViewStyleSegmented) {
            WYAShowNavController * vc = [[WYAShowNavController alloc] init];
            vc.selectIndex            = 1;
            vc.titleColorSelected     = [UIColor whiteColor];
            vc.menuViewStyle          = style;
            vc.titleColorNormal       = BLUECOLOR;
            vc.progressColor          = BLUECOLOR;
            vc.navBar                 = [[WYANavBar alloc] init];
            [vc.navBar wya_goBackButtonWithImage:@"返回"];
            vc.showOnNavigationBar      = YES;
            vc.menuViewLayoutMode       = WYAMenuViewLayoutModeCenter;
            vc.titleSizeSelected        = 15;
            vc.progressViewCornerRadius = 2.0f;
            vc.titles                   = @[ @"item1", @"item2", @"item3", @"item4" ];
            [self.navigationController pushViewController:vc animated:YES];
        } else {
            WYACustomPageController * vc         = [[WYACustomPageController alloc] init];
            vc.selectIndex                       = 1;
            vc.title                             = key;
            vc.menuViewStyle                     = style;
            vc.automaticallyCalculatesItemWidths = YES;
            vc.titleColorSelected                = BLUECOLOR;
            vc.titleColorNormal                  = BLACKTITLECOLOR;
            vc.progressColor                     = BLUECOLOR;
            if ([key isEqualToString:@"WYAMenuViewStyleNaughty"]) {
                vc.progressViewIsNaughty = YES;
                vc.progressWidth         = 10;
            }
            if ([key isEqualToString:@"WYAMenuViewCornerRadius"]) {
                vc.progressViewCornerRadius = 2.0f;
            }
            if ([key isEqualToString:@"WYAMenuViewPositionBottom"]) {
                vc.menuViewPosition = WYAMenuViewPositionBottom;
            }

            [self customPageController:vc];
            [self.navigationController pushViewController:vc animated:YES];
        }
    } else if ([key isEqualToString:@"WYATablePageController"]) {
        WYATablePageController * vc          = [[WYATablePageController alloc] init];
        vc.selectIndex                       = 1;
        vc.titles                            = @[ @"item1", @"item2", @"item3", @"item4" ];
        vc.menuViewStyle                     = WYAMenuViewStyleLine;
        vc.automaticallyCalculatesItemWidths = YES;
        vc.menuViewLayoutMode                = WYAMenuViewLayoutModeScatter;
        vc.titleSizeSelected                 = 16;
        vc.titleSizeNormal                   = 14;
        vc.itemMargin                        = 20;
        vc.progressColor                     = BLUECOLOR;
        vc.acceptNotification                = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (void)customPageController:(WYAPageController *)vc
{
    switch (vc.menuViewStyle) {
        case WYAMenuViewStyleTriangle: {
            vc.progressWidth     = 6;
            vc.progressHeight    = 4;
            vc.titleSizeSelected = 15;
        } break;
        case WYAMenuViewStyleDefault: {
            vc.titleSizeSelected = 16;
        } break;
        default:
            break;
    }
}
@end
