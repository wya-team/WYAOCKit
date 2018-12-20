//
//  WYASearchBarViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/19.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYASearchBarViewController.h"

@interface WYASearchBarViewController ()<UISearchBarDelegate>
@property (nonatomic, strong) WYASearchBar * searchBar;
@property (nonatomic, strong) UISearchBar * searchBar1;
@property (nonatomic, strong) WYASearchBar * searchBar2;
@end

@implementation WYASearchBarViewController

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
    vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/WYASearchBar/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self wya_addRightNavBarButtonWithNormalImage:@[@"icon_help"] highlightedImg:@[]];

    self.navTitle = @"WYASearchBar";
    
    self.searchBar = [[WYASearchBar alloc]initWithFrame:CGRectMake(0, WYATopHeight+20*SizeAdapter, self.view.cmam_width, 44)];
    self.searchBar.placeholder = @"搜索";
    self.searchBar.delegate = self;
    self.searchBar.barTintColor = random(201, 201, 201, 1);
    [self.view addSubview:self.searchBar];
    
    self.searchBar1 = [[UISearchBar alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchBar.frame)+20*SizeAdapter, self.view.cmam_width, 44)];
    self.searchBar1.placeholder = @"搜索";
    self.searchBar1.delegate = self;
    self.searchBar1.barTintColor = random(201, 201, 201, 1);
    [self.view addSubview:self.searchBar1];
    
    self.searchBar2 = [[WYASearchBar alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchBar1.frame)+20*SizeAdapter, self.view.cmam_width, 44)];
    self.searchBar2.placeholder = @"搜索";
    self.searchBar2.showsCancelButton = YES;
    self.searchBar2.delegate = self;
    self.searchBar2.barTintColor = random(201, 201, 201, 1);
    [self.view addSubview:self.searchBar2];
}

#pragma mark - UISearchBarDelegate  -
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    if (self.searchBar == searchBar) {
        self.searchBar.showsCancelButton = YES;
    }
    return YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    if (self.searchBar == searchBar) {
        self.searchBar.showsCancelButton = NO;
    }
    [self.view endEditing:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
