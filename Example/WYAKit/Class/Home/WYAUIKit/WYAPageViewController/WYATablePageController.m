//
//  WYATablePageController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/23.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYATablePageController.h"
#import "WYAOneTableViewController.h"
#import "WYATwoTableViewController.h"

@interface WYATablePageController () <WYANavBarDelegate>
@property (nonatomic, strong) UIImageView * headerImageView;
@property (nonatomic, strong) WYANavBar * customNavBar;

@end

@implementation WYATablePageController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.headerView            = self.headerImageView;
    self.customNavBar          = [[WYANavBar alloc] init];
    self.customNavBar.navTitle = @"pageControllerExample";
    [self.customNavBar wya_goBackButtonWithImage:@"返回"];
    self.customNavBar.delegate = self;
    self.titleColorSelected    = BLUECOLOR;
    self.titleColorNormal      = BLACKTITLECOLOR;
    [self.view addSubview:self.customNavBar];
}

- (void)wya_goBackPressed:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)wya_numberOfTitlesInMenuView:(WYAMenuView *)menu
{
    return 4;
}
- (NSInteger)wya_numbersOfChildControllersInPageController:(WYAPageTableViewController *)pageController
{
    return 4;
}
- (NSString *)wya_pageController:(WYAPageTableViewController *)pageController titleAtIndex:(NSInteger)index
{
    switch (index % 4) {
        case 0: return @"item1";
        case 1: return @"item2";
        case 2: return @"item3";
        case 3: return @"item4";
    }
    return @"NONE";
}

- (UIViewController *)wya_pageController:(WYAPageTableViewController *)pageController viewControllerAtIndex:(NSInteger)index
{
    switch (index % 4) {
        case 0: {
            WYAOneTableViewController * vc = [[WYAOneTableViewController alloc] init];
            vc.notificationName            = WYATabControllerChildControllerChangeContentOffstNotification;
            return vc;
        }
        case 1: {
            WYATwoTableViewController * vc = [[WYATwoTableViewController alloc] init];
            vc.notificationName            = WYATabControllerChildControllerChangeContentOffstNotification;
            return vc;
        }
        case 2: {
            WYATwoTableViewController * vc = [[WYATwoTableViewController alloc] init];
            vc.notificationName            = WYATabControllerChildControllerChangeContentOffstNotification;
            return vc;
        }
        case 3: {
            WYAOneTableViewController * vc = [[WYAOneTableViewController alloc] init];
            vc.notificationName            = WYATabControllerChildControllerChangeContentOffstNotification;
            return vc;
        }
    }
    return [[UIViewController alloc] init];
}

- (CGFloat)wya_menuView:(WYAMenuView *)menu widthForItemAtIndex:(NSInteger)index
{
    CGFloat tempW = [[self.titles wya_safeObjectAtIndex:index] wya_widthWithFontSize:15 height:WYANavBarHeight];
    return tempW;
}
- (CGRect)wya_pageController:(WYAPageTableViewController *)pageController preferredFrameForMenuView:(WYAMenuView *)menuView
{
    return CGRectMake(0, CGRectGetMaxY(self.headerImageView.frame), ScreenWidth, WYANavBarHeight);
}

- (CGRect)wya_pageController:(WYAPageTableViewController *)pageController preferredFrameContentView:(WYAPageScrollView *)contentView
{
    return CGRectMake(0, 0, ScreenWidth, ScreenHeight - WYATopHeight - WYANavBarHeight - WYABottomHeight);
}
- (UIImageView *)headerImageView
{
    if (!_headerImageView) {
        _headerImageView = ({
            UIImageView * object   = [[UIImageView alloc] init];
            object.frame           = CGRectMake(0, 0, ScreenWidth, 200);
            object.backgroundColor = [UIColor brownColor];
            object.image           = [UIImage imageNamed:@"0"];
            object;
        });
    }
    return _headerImageView;
}

@end
