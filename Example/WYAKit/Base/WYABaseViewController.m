//
//  WYABaseViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/27.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYABaseViewController.h"
@interface WYABaseViewController ()<WYANavBarDelegate>
@property (nonatomic, strong) WYANavBar * navBar;
@end

@implementation WYABaseViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [self addCustomNavBar];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark ======= praived
- (void)addCustomNavBar{
    self.navBar = [[WYANavBar alloc]init];
    self.navBar.delegate = self;
    self.navBar.backgroundColor = [UIColor whiteColor];
    self.navBar.navTitle = @"Example";
    NSArray *arrViewControllers = self.navigationController.viewControllers;
    if ([arrViewControllers indexOfObject:self] > 0){
        [self.navBar wya_goBackButtonWithImage:@"返回"];
    }
    [self.view addSubview:self.navBar];
}
#pragma mark ======= setter
- (void)setNavTitle:(NSString *)navTitle{
    _navTitle = navTitle;
    self.navBar.navTitle = _navTitle;
}
- (void)setNavTitleFont:(CGFloat)navTitleFont{
    _navTitleFont = navTitleFont;
    self.navBar.navTitleFont = _navTitleFont;
}
- (void)setNavTitleColor:(UIColor *)navTitleColor{
    _navTitleColor = navTitleColor;
    self.navBar.navTitleColor = _navTitleColor;
}
- (void)setNavBackGroundColor:(UIColor *)navBackGroundColor{
    _navBackGroundColor = navBackGroundColor;
    self.navBar.backgroundColor = _navBackGroundColor;
}
- (void)setIsShowNavLine:(BOOL)isShowNavLine{
    _isShowNavLine = isShowNavLine;
    self.navBar.isShowLine = _isShowNavLine;
}
- (void)setNavBackGroundImageNamed:(NSString *)navBackGroundImageNamed{
    _navBackGroundImageNamed = navBackGroundImageNamed;
    self.navBar.backgroundImage = [UIImage imageNamed:_navBackGroundImageNamed];
}
- (void)setItemsSpace:(CGFloat)itemsSpace{
    _itemsSpace = itemsSpace;
    self.navBar.space = _itemsSpace;
}
- (void)setLeftBarButtonItemTitleFont:(CGFloat)leftBarButtonItemTitleFont{
    _leftBarButtonItemTitleFont = leftBarButtonItemTitleFont;
    self.navBar.leftBarButtonItemTitleFont = _leftBarButtonItemTitleFont;
}
- (void)setRightBarButtonItemTitleFont:(CGFloat)rightBarButtonItemTitleFont{
    _rightBarButtonItemTitleFont = rightBarButtonItemTitleFont;
    self.navBar.rightBarButtonItemTitleFont = _rightBarButtonItemTitleFont;
}
#pragma mark ======= public methods
#pragma mark --------- keft
- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles{
    [self.navBar wya_addLeftNavBarButtonWithNormalTitle:normalTitles];
}
- (void)wya_addLeftNavBarButtonWithNormalImage:(NSArray<NSString *> *)normalImages highlightedImg:(NSArray<NSString *> *)highlightedImgs{
    [self.navBar wya_addLeftNavBarButtonWithNormalImage:normalImages highlightedImg:highlightedImgs];
}
- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles normalColor:(NSArray<UIColor *> *)normalColors highlightedColor:(NSArray<UIColor *> *)highlightedColors{
    [self.navBar wya_addLeftNavBarButtonWithNormalTitle:normalTitles normalColor:normalColors highlightedColor:highlightedColors];
}
#pragma mark -------- right
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles{
    [self.navBar wya_addRightNavBarButtonWithNormalTitle:normalTitles];
}
- (void)wya_addRightNavBarButtonWithNormalImage:(NSArray<NSString *> *)normalImages highlightedImg:(NSArray<NSString *> *)highlightedImgs{
    [self.navBar wya_addRightNavBarButtonWithNormalImage:normalImages highlightedImg:highlightedImgs];
}
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles normalColor:(NSArray<UIColor *> *)normalColors highlightedColor:(NSArray<UIColor *> *)highlightedColors
{
    [self.navBar wya_addRightNavBarButtonWithNormalTitle:normalTitles normalColor:normalColors highlightedColor:highlightedColors];
}
#pragma mark ======= WYANavBarDelegate
- (void)wya_goBackPressed:(UIButton *)sender{
    [self wya_goBack];
}
- (void)wya_leftBarButtonItemPressed:(UIButton *)sender{
    [self wya_customLeftBarButtonItemPressed:sender];
}
- (void)wya_rightBarButtonItemPressed:(UIButton *)sender{
    [self wya_customrRightBarButtonItemPressed:sender];
}
#pragma mark ======= Event
- (void)wya_goBack{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)wya_customLeftBarButtonItemPressed:(UIButton *)sender{
    NSLog(@"%@",sender.titleLabel.text);
}
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    NSLog(@"%@",sender.titleLabel.text);
}
@end
