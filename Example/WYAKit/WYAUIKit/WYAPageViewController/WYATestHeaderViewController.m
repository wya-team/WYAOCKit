//
//  WYATestHeaderViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/22.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYATestHeaderViewController.h"
#import "WYAOneTableViewController.h"
#import "WYATwoTableViewController.h"
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
@interface WYATestHeaderViewController ()
@property (nonatomic, strong) UIImageView * headerImageView;
@property (nonatomic, strong) UITableView * testTable;
@end

@implementation WYATestHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HeaderImageTable";
    [self.view addSubview:self.testTable];
    [self.view sendSubviewToBack:self.testTable];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeOffset:) name:@"CHANGE" object:nil];
}
- (void)changeOffset:(NSNotification *)info{
    NSDictionary * dict = [info userInfo];
    CGFloat y = [dict[@"key"] floatValue];
    self.testTable.contentOffset = CGPointMake(0, y);
    CGRect menuViewFrame = CGRectMake(0, CGRectGetMaxY(self.headerImageView.frame) + WYATopHeight - y, ScreenWidth, WYANavBarHeight);
    
    self.menuView.frame = menuViewFrame;
    
 CGRect contentViewFrame = CGRectMake(0, CGRectGetMaxY(self.menuView.frame) - y, ScreenWidth, ScreenHeight - CGRectGetMaxY(self.menuView.frame) - WYABottomHeight + y);
    self.scrollView.frame = contentViewFrame;
}
#pragma mark ======= delegate
- (NSInteger)wya_numberOfTitlesInMenuView:(WYAMenuView *)menu{
    return 2;
}
- (NSInteger)wya_numbersOfChildControllersInPageController:(WYAPageController *)pageController{
    return 2;
}
- (NSString *)wya_pageController:(WYAPageController *)pageController titleAtIndex:(NSInteger)index {
    switch (index % 2) {
        case 0: return @"LISTsdfvasfadsf";
        case 1: return @"INTRODUCTION";
    }
    return @"NONE";
}

- (UIViewController *)wya_pageController:(WYAPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    switch (index % 2) {
        case 0: return [[WYAOneTableViewController alloc] init];
        case 1: return [[WYATwoTableViewController alloc] init];
    }
    return [[UIViewController alloc] init];
}

- (CGFloat)wya_menuView:(WYAMenuView *)menu widthForItemAtIndex:(NSInteger)index{
    CGFloat width = [super wya_menuView:menu widthForItemAtIndex:index];
    return width + 20;
}
- (CGRect)wya_pageController:(WYAPageController *)pageController preferredFrameForMenuView:(WYAMenuView *)menuView{
        return CGRectMake(0, CGRectGetMaxY(self.headerImageView.frame) + WYATopHeight, ScreenWidth, WYANavBarHeight);
}

- (CGRect)wya_pageController:(WYAPageController *)pageController preferredFrameContentView:(WYAPageScrollView *)contentView{
        return CGRectMake(0,WYATopHeight + 200 + WYANavBarHeight, ScreenWidth, ScreenHeight - WYATopHeight - 200 - WYANavBarHeight - WYABottomHeight);
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

- (UITableView *)testTable{
    if(!_testTable){
        _testTable = ({
            UITableView * object = [[UITableView alloc]init];
            object.frame = CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight - WYABottomHeight);
            object.tableHeaderView = self.headerImageView;
            object.scrollEnabled = NO;
            object;
       });
    }
    return _testTable;
}
@end
