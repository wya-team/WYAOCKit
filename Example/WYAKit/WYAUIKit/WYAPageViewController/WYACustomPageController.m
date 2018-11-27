//
//  WYACustomPageController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/21.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYACustomPageController.h"
#import "WYAOneTableViewController.h"
#import "WYATwoTableViewController.h"
#import "WYAThreeTableViewController.h"
@interface WYACustomPageController ()<WYANavBarDelegate>
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) WYANavBar * navBar;
@end

@implementation WYACustomPageController
- (UIView *)redView {
    if (!_redView) {
        _redView = [[UIView alloc] initWithFrame:CGRectZero];
        _redView.backgroundColor = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
    }
    return _redView;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.menuViewStyle == WYAMenuViewStyleTriangle) {
        [self.view addSubview:self.redView];
    }
    self.navBar = [[WYANavBar alloc]init];
    self.navBar.navTitle = @"pageControllerExample";
    [self.navBar wya_goBackButtonWithImage:@"返回"];
    self.navBar.delegate = self;
    [self.view addSubview:self.navBar];
}
- (void)wya_goBackPressed:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.redView.frame = CGRectMake(0, CGRectGetMaxY(self.menuView.frame), self.view.frame.size.width, 2.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ======= delegate
- (NSInteger)wya_numberOfTitlesInMenuView:(WYAMenuView *)menu{
    return 3;
}
- (NSInteger)wya_numbersOfChildControllersInPageController:(WYAPageController *)pageController{
    return 3;
}
- (NSString *)wya_pageController:(WYAPageController *)pageController titleAtIndex:(NSInteger)index {
    switch (index % 3) {
        case 0: return @"LISTsdfvasfadsf";
        case 1: return @"INTRODUCTION";
        case 2: return @"IMAGESsdfasdfasfadsfas";
    }
    return @"NONE";
}

- (UIViewController *)wya_pageController:(WYAPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    switch (index % 3) {
        case 0: return [[WYAOneTableViewController alloc] init];
        case 1: return [[WYATwoTableViewController alloc] init];
        case 2: return [[WYAThreeTableViewController alloc] init];
    }
    return [[UIViewController alloc] init];
}

- (CGFloat)wya_menuView:(WYAMenuView *)menu widthForItemAtIndex:(NSInteger)index{
    CGFloat width = [super wya_menuView:menu widthForItemAtIndex:index];
    return width + 20;
}
- (CGRect)wya_pageController:(WYAPageController *)pageController preferredFrameForMenuView:(WYAMenuView *)menuView{
    if (self.menuViewPosition == WYAMenuViewPositionBottom) {
        menuView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        return CGRectMake(0, self.view.frame.size.height - WYATabBarHeight, ScreenWidth, WYATabBarHeight);
    }
    CGFloat leftMargin = self.showOnNavigationBar ? 50 : 0;
    CGFloat originY = self.showOnNavigationBar ? 0 : CGRectGetMaxY(self.navigationController.navigationBar.frame);
    return CGRectMake(leftMargin, originY, self.view.frame.size.width - 2*leftMargin, WYANavBarHeight);
}

- (CGRect)wya_pageController:(WYAPageController *)pageController preferredFrameContentView:(WYAPageScrollView *)contentView{
    if (self.menuViewPosition == WYAMenuViewPositionBottom) {
        return CGRectMake(0, WYATopHeight, self.view.frame.size.width, self.view.frame.size.height - WYATopHeight - WYATabBarHeight);
    }
    CGFloat originY = CGRectGetMaxY([self wya_pageController:pageController preferredFrameForMenuView:self.menuView]);
    if (self.menuViewStyle == WYAMenuViewStyleTriangle) {
        originY += self.redView.frame.size.height;
    }
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
}

@end
