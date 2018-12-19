//
//  WYASearchBarViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/19.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYASearchBarViewController.h"

@interface WYASearchBarViewController ()<UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar * searchBar;
@property (nonatomic, strong) UISearchBar * searchBar1;
@end

@implementation WYASearchBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navTitle = @"WYASearchBar";
    
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, WYATopHeight+20*SizeAdapter, self.view.cmam_width, 44)];
    self.searchBar.placeholder = @"搜索";
    self.searchBar.delegate = self;
    [self.view addSubview:self.searchBar];
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchBar.frame)+20*SizeAdapter, self.view.cmam_width, 44)];
    view.backgroundColor = random(201, 201, 206, 1);
    [self.view addSubview:view];
    UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(10*SizeAdapter, 7, view.cmam_width-20*SizeAdapter, 30)];
    textField.placeholder = @"搜索";
    textField.backgroundColor = [UIColor whiteColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [view addSubview:textField];
    
    UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    leftView.backgroundColor = [UIColor whiteColor];
    leftView.layer.cornerRadius = 4.f;
    leftView.layer.masksToBounds = YES;
    
    UIButton * search = [UIButton buttonWithType:UIButtonTypeCustom];
    [search setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
    search.frame = CGRectMake(6.5, 6.5, 15, 15);
    search.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [leftView addSubview:search];
    [textField wya_setLeftViewWithView:leftView];
    
    self.searchBar1 = [[UISearchBar alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(view.frame)+20*SizeAdapter, self.view.cmam_width, 44)];
    self.searchBar1.placeholder = @"搜索";
    self.searchBar1.showsCancelButton = YES;
    self.searchBar1.delegate = self;
    [self.view addSubview:self.searchBar1];
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
