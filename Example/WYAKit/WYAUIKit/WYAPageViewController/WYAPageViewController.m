//
//  WYAPageViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/21.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPageViewController.h"
#import "WYACustomPageController.h"
#import "WYATablePageController.h"

@interface WYAPageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSDictionary *stylesMap;
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation WYAPageViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"PageControllerStyle";
    [self.view addSubview:self.tableView];
}
- (void)wya_goBackPressed:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSArray *)titles {
    if (_titles == nil) {
        _titles = @[@"WYAMenuViewStyleDefault",
                    @"WYAMenuViewStyleLine",
                    @"WYAMenuViewStyleFlood",
                    @"WYAMenuViewStyleFloodHollow",
                    @"WYAMenuViewShowOnNav",
                    @"WYAMenuViewStyleSegmented",
                    @"WYAMenuViewStyleTriangle",
                    @"WYAMenuViewStyleNaughty",
                    @"WYAMenuViewCornerRadius",
                    @"WYAMenuViewPositionBottom",
                    @"WYATablePageController"];
    }
    return _titles;
}

- (NSDictionary *)stylesMap {
    if (!_stylesMap) {
        _stylesMap = @{@"WYAMenuViewStyleDefault": @(WYAMenuViewStyleDefault),
                       @"WYAMenuViewStyleLine": @(WYAMenuViewStyleLine),
                       @"WYAMenuViewStyleFlood": @(WYAMenuViewStyleFlood),
                       @"WYAMenuViewStyleFloodHollow": @(WYAMenuViewStyleFloodHollow),
                       @"WYAMenuViewShowOnNav": @(WYAMenuViewStyleFlood),
                       @"WYAMenuViewStyleSegmented": @(WYAMenuViewStyleSegmented),
                       @"WYAMenuViewStyleTriangle": @(WYAMenuViewStyleTriangle),
                       @"WYAMenuViewStyleNaughty": @(WYAMenuViewStyleLine),
                       @"WYAMenuViewCornerRadius": @(WYAMenuViewStyleFlood),
                       @"WYAMenuViewPositionBottom": @(WYAMenuViewStyleDefault)};
    }
    return _stylesMap;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const cellIdentifier = @"WYAPageViewControllerCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    NSString * key = [self.titles wya_safeObjectAtIndex:indexPath.row];
    if (![key isEqualToString:@"WYATablePageController"]) {
    WYAMenuViewStyle style = [[self.stylesMap wya_safeObjectForKey:key]integerValue];
    WYACustomPageController * vc = [[WYACustomPageController alloc]init];
    vc.selectIndex = 1;
    vc.title = key;
    vc.menuViewStyle = style;
    vc.automaticallyCalculatesItemWidths = YES;
    if ([key isEqualToString:@"WYAMenuViewStyleNaughty"]) {
        vc.progressViewIsNaughty = YES;
        vc.progressWidth = 10;
    }
    if ([key isEqualToString:@"WYAMenuViewCornerRadius"]) {
        vc.progressViewCornerRadius = 5.0f;
    }
    if ([key isEqualToString:@"WYAMenuViewPositionBottom"]) {
        vc.menuViewPosition = WYAMenuViewPositionBottom;
    }
    [self customPageController:vc];
    [self.navigationController pushViewController:vc animated:YES];
    }else{
        WYATablePageController * vc = [[WYATablePageController alloc]init];
        vc.selectIndex = 0;
        vc.menuViewStyle = WYAMenuViewStyleLine;
        vc.automaticallyCalculatesItemWidths = YES;
        vc.titleColorNormal = [UIColor blackColor];
        vc.titleColorSelected = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
        vc.progressColor = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
        vc.menuViewLayoutMode = WYAMenuViewLayoutModeScatter;
        vc.titleSizeSelected = 16;
        vc.titleSizeNormal = 14;
        vc.itemMargin = 20;
        vc.acceptNotification = YES;
        vc.titles = @[@"LIST",@"INTRODUCTION",@"INTRODUCTION",@"LIST"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (void)customPageController:(WYAPageController *)vc{
    switch (vc.menuViewStyle) {
        case WYAMenuViewStyleSegmented:
        case WYAMenuViewStyleFlood:{
            vc.titleColorSelected = [UIColor whiteColor];
            vc.titleColorNormal = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
            vc.progressColor = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
            vc.showOnNavigationBar = YES;
            vc.menuViewLayoutMode = WYAMenuViewLayoutModeCenter;
            vc.titleSizeSelected = 15;
        }
            break;
        case WYAMenuViewStyleTriangle: {
            vc.progressWidth = 6;
            vc.progressHeight = 4;
            vc.titleSizeSelected = 15;
        }
            break;
        case WYAMenuViewStyleDefault: {
            vc.titleSizeSelected = 16;
        }
            break;
        default:
            break;
    }
}
@end
