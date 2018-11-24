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
#import "Category.h"
#import "MJRefresh.h"
#define SizeAdapter ScreenWidth/375
//获取设备的物理高度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//获取设备的物理宽度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽高
#define ScreenBounds [UIScreen mainScreen].bounds

#define WYAiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define RectStatus  [[UIApplication sharedApplication] statusBarFrame]

#define WYAStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#define WYANavBarHeight 44.0

#define WYATabBarHeight (WYAStatusBarHeight > 20 ? 83 : 49)

#define WYABottomHeight (WYAStatusBarHeight > 20 ? 34 : 0)

#define WYATopHeight (WYAStatusBarHeight + WYANavBarHeight)
@interface WYATablePageController ()
@property (nonatomic, strong) UIImageView * headerImageView;
@end

@implementation WYATablePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.headerImageView;
}
- (NSInteger)wya_numberOfTitlesInMenuView:(WYAMenuView *)menu{
    return 4;
}
- (NSInteger)wya_numbersOfChildControllersInPageController:(WYAPageTableViewController *)pageController{
    return 4;
}
- (NSString *)wya_pageController:(WYAPageTableViewController *)pageController titleAtIndex:(NSInteger)index {
    switch (index % 4) {
        case 0: return @"LIST";
        case 1: return @"INTRODUCTION";
        case 2: return @"INTRODUCTION";
         case 3: return @"LIST";
    }
    return @"NONE";

}

- (UIViewController *)wya_pageController:(WYAPageTableViewController *)pageController viewControllerAtIndex:(NSInteger)index{
    switch (index % 4) {
            
        case 0:
        {
            WYAOneTableViewController * vc = [[WYAOneTableViewController alloc] init];
            vc.notificationName = WYATabControllerChildControllerChangeContentOffstNotification;
            return vc;
        }
        case 1:
        {
            WYATwoTableViewController * vc = [[WYATwoTableViewController alloc] init];
            vc.notificationName = WYATabControllerChildControllerChangeContentOffstNotification;
            return vc;
        }
        case 2:
        {
            WYATwoTableViewController * vc = [[WYATwoTableViewController alloc] init];
            vc.notificationName = WYATabControllerChildControllerChangeContentOffstNotification;
            return vc;
        }
        case 3:
        {
            WYAOneTableViewController * vc = [[WYAOneTableViewController alloc] init];
            vc.notificationName = WYATabControllerChildControllerChangeContentOffstNotification;
            return vc;
        }

    }
    return [[UIViewController alloc] init];
}

- (CGFloat)wya_menuView:(WYAMenuView *)menu widthForItemAtIndex:(NSInteger)index{
    CGFloat tempW = [[self.titles wya_safeObjectAtIndex:index] wya_widthWithFontSize:15 height:WYANavBarHeight];
    return tempW;
}
- (CGRect)wya_pageController:(WYAPageTableViewController *)pageController preferredFrameForMenuView:(WYAMenuView *)menuView{
    return CGRectMake(0, CGRectGetMaxY(self.headerImageView.frame), ScreenWidth, WYANavBarHeight);
}

- (CGRect)wya_pageController:(WYAPageTableViewController *)pageController preferredFrameContentView:(WYAPageScrollView *)contentView{
    return CGRectMake(0, 0, ScreenWidth, ScreenHeight - WYATopHeight - WYANavBarHeight - WYABottomHeight);
}
- (UIImageView *)headerImageView{
    if(!_headerImageView){
        _headerImageView = ({
            UIImageView * object = [[UIImageView alloc]init];
            object.frame = CGRectMake(0, 0, ScreenWidth, 200);
            object.backgroundColor = [UIColor brownColor];
            object.image = [UIImage imageNamed:@"0"];
            object;
        });
    }
    return _headerImageView;
}

@end
