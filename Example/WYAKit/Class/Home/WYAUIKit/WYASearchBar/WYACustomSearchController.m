//
//  WYACustomSearchController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/26.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYACustomSearchController.h"
@interface WYACustomSearchController ()<UISearchBarDelegate>
@property (nonatomic, strong) UIView * bgView;
@property (nonatomic, strong) UILabel * titleLabel1;
@property (nonatomic, strong) WYACustomSearchBar * customSearchBar1;
@property (nonatomic, strong) UILabel * titleLabel2;
@property (nonatomic, strong) WYACustomSearchBar * customSearchBar2;
@property (nonatomic, strong) UILabel * titleLabel3;
@property (nonatomic, strong) WYACustomSearchBar * customSearchBar3;
@property (nonatomic, strong) UIButton * button;
@property (nonatomic, assign) BOOL  isEdit;
@end

@implementation WYACustomSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.bgView addSubview:self.titleLabel1];
    [self.bgView addSubview:self.customSearchBar1];

    [self.bgView addSubview:self.titleLabel2];
    [self.bgView addSubview:self.customSearchBar2];
    
    [self.bgView addSubview:self.titleLabel3];
    [self.bgView addSubview:self.customSearchBar3];
    
    [self.bgView addSubview:self.button];
    
    [self.view addSubview:self.bgView];
}
#pragma mark ======= getter
- (UIView *)bgView{
    if(!_bgView){
        _bgView = ({
            UIView * object = [[UIView alloc]initWithFrame:self.view.frame];
            object;
        });
    }
    return _bgView;
}

- (UILabel *)titleLabel1{
    if(!_titleLabel1){
        _titleLabel1 = ({
            UILabel * object = [[UILabel alloc]initWithFrame:CGRectMake(10, WYATopHeight + 10, ScreenWidth- 20, 30)];
            object.text = @"  Normal";
            object.textColor = GRAYTITLECOLOR;
            object.font = FONT(15);
            object;
        });
    }
    return _titleLabel1;
}
- (WYACustomSearchBar *)customSearchBar1{
    if(!_customSearchBar1){
        _customSearchBar1 = ({
            WYACustomSearchBar * object = [[WYACustomSearchBar alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.titleLabel1.frame)+10, ScreenWidth - 20, 44)];
            object.delegate = self;
            object.placeholderString = @"搜索";
            object.tintColor = BLACKTEXTCOLOR;
            object;
       });
    }
    return _customSearchBar1;
}

- (UILabel *)titleLabel2{
    if(!_titleLabel2){
        _titleLabel2 = ({
            UILabel * object = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.customSearchBar1.frame)+10, ScreenWidth- 20, 30)];
            object.text = @"  AutoFocus when enter page";
            object.textColor = GRAYTITLECOLOR;
            object.font = FONT(15);
            object;
        });
    }
    return _titleLabel2;
}
- (WYACustomSearchBar *)customSearchBar2{
    if(!_customSearchBar2){
        _customSearchBar2 = ({
            WYACustomSearchBar * object = [[WYACustomSearchBar alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.titleLabel2.frame)+10, ScreenWidth - 20, 44)];
            object.delegate = self;
            object.placeholderString = @"自动获取光标";
            object.tintColor = BLACKTEXTCOLOR;
            object;
        });
    }
    return _customSearchBar2;
}

- (UILabel *)titleLabel3{
    if(!_titleLabel3){
        _titleLabel3 = ({
            UILabel * object = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.customSearchBar2.frame)+10, ScreenWidth- 20, 30)];
            object.text = @"  Focus by operation";
            object.textColor = GRAYTITLECOLOR;
            object.font = FONT(15);
            object;
        });
    }
    return _titleLabel3;
}
- (WYACustomSearchBar *)customSearchBar3{
    if(!_customSearchBar3){
        _customSearchBar3 = ({
            WYACustomSearchBar * object = [[WYACustomSearchBar alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.titleLabel3.frame)+10, ScreenWidth - 20, 44)];
            object.delegate = self;
            object.placeholderString = @"手动获取光标";
            object.tintColor = BLACKTEXTCOLOR;
            object;
        });
    }
    return _customSearchBar3;
}

- (UIButton *)button{
    if(!_button){
        _button = ({
            UIButton * object = [[UIButton alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.customSearchBar3.frame)+20, ScreenWidth-40, 49)];
            [object setTitle:@"click to focus" forState:UIControlStateNormal];
            [object setTitleColor:BLACKTITLECOLOR forState:UIControlStateNormal];
            object.titleLabel.font = FONT(15);
            object.backgroundColor = WHITECOLOR;
            object.layer.cornerRadius = 8;
            object.layer.borderColor = GRAYBGCOLOR.CGColor;
            object.layer.borderWidth = 0.5;
            object.layer.masksToBounds = YES;
            [object addTarget:self action:@selector(buttonCilcked:) forControlEvents:UIControlEventTouchUpInside];
            object;
       });
    }
    return _button;
}
#pragma mark ======= UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    if (searchBar == self.customSearchBar1) {
        [self.customSearchBar1 setShowsCancelButton:YES animated:YES];
        [self.customSearchBar1 wya_shouldBeginEditingState];// 自定义方法将图标位置改变移动到左侧
        return YES;
    }else if (searchBar == self.customSearchBar2){
        [self.customSearchBar2 setShowsCancelButton:YES animated:YES];
        [self.customSearchBar2 wya_shouldBeginEditingState];// 自定义方法将图标位置改变移动到左侧
        return YES;
    }else{
        if (self.isEdit) {
            [self.customSearchBar3 setShowsCancelButton:YES animated:YES];
            [self.customSearchBar3 wya_shouldBeginEditingState];// 自定义方法将图标位置改变移动到左侧
        }
//        else{
//            [UIView wya_showBottomToastWithMessage:@"点击按钮获取光标"];
//        }
        return self.isEdit;
    }
   
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    if (searchBar == self.customSearchBar1) {
        [self.customSearchBar1 resignFirstResponder];
        [self.customSearchBar1 wya_searchButtonClickedState];// 自定义方法将图标根据是否有内容移动到合适位置（没有内容移动到居中，否则在最左侧）
        self.isEdit = NO;
    }else if (searchBar == self.customSearchBar2){
        [self.customSearchBar2 resignFirstResponder];
        [self.customSearchBar2 wya_searchButtonClickedState];// 自定义方法将图标根据是否有内容移动到合适位置（没有内容移动到居中，否则在最左侧）
        self.isEdit = NO;
    }else{
        [self.customSearchBar3 resignFirstResponder];
        [self.customSearchBar3 wya_searchButtonClickedState];// 自定义方法将图标根据是否有内容移动到合适位置（没有内容移动到居中，否则在最左侧）
        self.isEdit = NO;
    }
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    if (searchBar == self.customSearchBar1) {
        [self.customSearchBar1 resignFirstResponder];
        [self.customSearchBar1 wya_searchButtonClickedState];// 自定义方法将图标根据内容移动到合适位置（没有内容移动到居中，否则在最左侧）
        self.isEdit = NO;
        
        return YES;
    }else if (searchBar == self.customSearchBar2){
        [self.customSearchBar2 resignFirstResponder];
        [self.customSearchBar2 wya_searchButtonClickedState];// 自定义方法将图标根据内容移动到合适位置（没有内容移动到居中，否则在最左侧）
        self.isEdit = NO;
        
        return YES;
    }else{
        [self.customSearchBar3 resignFirstResponder];
        [self.customSearchBar3 wya_searchButtonClickedState];// 自定义方法将图标根据内容移动到合适位置（没有内容移动到居中，否则在最左侧）
        self.isEdit = NO;
        
        return YES;
    }
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    if (searchBar == self.customSearchBar1) {
        [self.customSearchBar1 setShowsCancelButton:NO animated:YES];
        [self.customSearchBar1 resignFirstResponder];
        [self.customSearchBar1 wya_cancleButtonClickedState];// 自定义方法将图标根据内容移动到合适位置（没有内容移动到居中，否则在最左侧）
        self.isEdit = NO;
    }else if (searchBar == self.customSearchBar2){
        [self.customSearchBar2 setShowsCancelButton:NO animated:YES];
        [self.customSearchBar2 resignFirstResponder];
        [self.customSearchBar2 wya_cancleButtonClickedState];// 自定义方法将图标根据内容移动到合适位置（没有内容移动到居中，否则在最左侧）
        self.isEdit = NO;
    }else{
        [self.customSearchBar3 setShowsCancelButton:NO animated:YES];
        [self.customSearchBar3 resignFirstResponder];
        [self.customSearchBar3 wya_cancleButtonClickedState];// 自定义方法将图标根据内容移动到合适位置（没有内容移动到居中，否则在最左侧）
        self.isEdit = NO;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.customSearchBar1 wya_touchesBeganState];
    [self.customSearchBar1 resignFirstResponder];
    [self.customSearchBar2 wya_touchesBeganState];
    [self.customSearchBar2 resignFirstResponder];
    [self.customSearchBar3 wya_touchesBeganState];
    [self.customSearchBar3 resignFirstResponder];
    self.isEdit = NO;
}

#pragma mark ======= action
- (void)buttonCilcked:(UIButton *)sender{
    self.isEdit = YES;
    [self.customSearchBar3 becomeFirstResponder];
}
@end
