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
    
    [self configUI];
}

- (void)configUI{
    UILabel * label = [[UILabel alloc]init];
    label.text = @"基本(动画需要更改)";
    label.textColor = random(51, 51, 51, 1);
    label.font = FONT(15);
    [self.view addSubview:label];
    
    CGFloat label_X = 10;
    CGFloat label_Y = WYATopHeight+20*SizeAdapter;
    CGFloat label_Width = ScreenWidth-20;
    CGFloat label_Height = 44*SizeAdapter;
    label.frame = CGRectMake(label_X, label_Y, label_Width, label_Height);
    
    CGFloat searchBar_X = 0;
    CGFloat searchBar_Y = CGRectGetMaxY(label.frame);
    CGFloat searchBar_Width = self.view.cmam_width;
    CGFloat searchBar_Height = 44*SizeAdapter;
    self.searchBar.frame = CGRectMake(searchBar_X, searchBar_Y, searchBar_Width, searchBar_Height);
    [self.view addSubview:self.searchBar];
    [self.searchBar cleanOtherSubViews];
    
    UILabel * label1 = [[UILabel alloc]init];
    label1.text = @"手动获取光标";
    label1.textColor = random(51, 51, 51, 1);
    label1.font = FONT(15);
    [self.view addSubview:label1];
    
    CGFloat label1_X = 10;
    CGFloat label1_Y = CGRectGetMaxY(self.searchBar.frame)+20*SizeAdapter;
    CGFloat label1_Width = ScreenWidth-20;
    CGFloat label1_Height = 44*SizeAdapter;
    label1.frame = CGRectMake(label1_X, label1_Y, label1_Width, label1_Height);
    
    CGFloat searchBar2_X = 0;
    CGFloat searchBar2_Y = CGRectGetMaxY(label1.frame);
    CGFloat searchBar2_Width = self.view.cmam_width;
    CGFloat searchBar2_Height = 44*SizeAdapter;
    self.searchBar2.frame = CGRectMake(searchBar2_X, searchBar2_Y, searchBar2_Width, searchBar2_Height);
    [self.view addSubview:self.searchBar2];
    [self.searchBar2 cleanOtherSubViews];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点击获取光标" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = FONT(15);
    [button setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [button addCallBackAction:^(UIButton *button) {
        [self.searchBar2 becomeFirstResponder];
    }];
    [self.view addSubview:button];
    
    CGFloat button_X = 10;
    CGFloat button_Y = CGRectGetMaxY(self.searchBar2.frame)+5*SizeAdapter;
    CGFloat button_Width = ScreenWidth-20;
    CGFloat button_Height = 44;
    button.frame = CGRectMake(button_X, button_Y, button_Width, button_Height);
}

#pragma mark - UISearchBarDelegate  -
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    if (searchBar == self.searchBar) {
        self.searchBar.showsCancelButton = YES;
    }
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    if (searchBar == self.searchBar) {
        self.searchBar.showsCancelButton = NO;
    }
    [self.view endEditing:YES];
}

#pragma mark - Getter -
- (WYASearchBar *)searchBar{
    if(!_searchBar){
        _searchBar = ({
            WYASearchBar * object = [[WYASearchBar alloc]init];
            object.placeholder = @"搜索";
            object.delegate = self;
            object.barTintColor = random(239, 239, 243, 1);
            object;
       });
    }
    return _searchBar;
}

- (WYASearchBar *)searchBar2{
    if(!_searchBar2){
        _searchBar2 = ({
            WYASearchBar * object = [[WYASearchBar alloc]init];
            object.placeholder = @"搜索";
            object.showsCancelButton = YES;
            object.delegate = self;
            object;
       });
    }
    return _searchBar2;
}
@end
