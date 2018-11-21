//
//  WYAPageViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/21.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPageViewController.h"
#import "WYAPageController.h"
#import "WYACustomPageController.h"
@interface WYAPageViewController ()
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSDictionary *stylesMap;
@end

@implementation WYAPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

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
                    @"WYAMenuViewPositionBottom"];
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
    NSString * key = self.titles[indexPath.row];
    WYAMenuViewStyle style = [self.stylesMap[key] integerValue];
    WYACustomPageController * vc = [[WYACustomPageController alloc]init];
    vc.selectIndex = 1;
    vc.title = key;
    vc.menuViewStyle = style;
    vc.automaticallyCalculatesItemWidths = YES;
    if ([key isEqualToString:@"WMMenuViewStyleNaughty"]) {
        vc.progressViewIsNaughty = YES;
        vc.progressWidth = 10;
    }
    if ([key isEqualToString:@"WMMenuViewCornerRadius"]) {
        vc.progressViewCornerRadius = 5.0f;
    }
    if ([key isEqualToString:@"WMMenuViewPositionBottom"]) {
        vc.menuViewPosition = WYAMenuViewPositionBottom;
    }
    [self customPageController:vc];
    [self.navigationController pushViewController:vc animated:YES];
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
