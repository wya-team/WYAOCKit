//
//  WYAShowNavController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/27.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAShowNavController.h"
#import "WYAOneTableViewController.h"
#import "WYAThreeTableViewController.h"
#import "WYATwoTableViewController.h"

@interface WYAShowNavController () <WYANavBarDelegate>
@property (nonatomic, strong) UIView * redView;
@property (nonatomic, strong) WYANavBar * customNavBar;
@end

@implementation WYAShowNavController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navBar.delegate = self;
}
- (void)wya_goBackPressed:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ======= delegate
- (NSInteger)wya_numberOfTitlesInMenuView:(WYAMenuView *)menu
{
    return 3;
}
- (NSInteger)wya_numbersOfChildControllersInPageController:(WYAPageController *)pageController
{
    return 3;
}
- (NSString *)wya_pageController:(WYAPageController *)pageController titleAtIndex:(NSInteger)index
{
    switch (index % 3) {
        case 0: return @"item1";
        case 1: return @"item2";
        case 2: return @"item3";
    }
    return @"NONE";
}

- (UIViewController *)wya_pageController:(WYAPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    switch (index % 3) {
        case 0: return [[WYAOneTableViewController alloc] init];
        case 1: return [[WYATwoTableViewController alloc] init];
        case 2: return [[WYAThreeTableViewController alloc] init];
    }
    return [[UIViewController alloc] init];
}

- (CGFloat)wya_menuView:(WYAMenuView *)menu widthForItemAtIndex:(NSInteger)index
{
    CGFloat tempW = [[self.titles wya_safeObjectAtIndex:index] wya_widthWithFontSize:15 height:WYANavBarHeight];
    return tempW;
}
- (CGRect)wya_pageController:(WYAPageController *)pageController preferredFrameForMenuView:(WYAMenuView *)menuView
{
    return CGRectMake(0, 0, ScreenWidth - 46 * 2, WYANavBarHeight);
}

- (CGRect)wya_pageController:(WYAPageController *)pageController preferredFrameContentView:(WYAPageScrollView *)contentView
{
    return CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight);
}
@end
