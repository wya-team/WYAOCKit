//
//  WYARealmSectionView.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/5.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYARealmHeaderView.h"
#define LEFTSPACE 10 * SizeAdapter

@interface WYARealmHeaderView ()
/// 新建一个表
@property (nonatomic, strong) UIButton * insterTableButton;
/// 删除一个表
@property (nonatomic, strong) UIButton * deleteTableButton;
@property (nonatomic, strong) UIButton * updateButton;
@property (nonatomic, strong) UIButton * lookButton;
@end

@implementation WYARealmHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.insterTableButton];

        [self addSubview:self.deleteTableButton];
        [self addSubview:self.updateButton];
        [self addSubview:self.lookButton];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.insterTableButton mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.mas_left).offset(LEFTSPACE);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake((ScreenWidth - 5 * LEFTSPACE) / 4, self.frame.size.height - 10 * SizeAdapter));
    }];
    [self.deleteTableButton mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.insterTableButton.mas_right).offset(LEFTSPACE);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake((ScreenWidth - 5 * LEFTSPACE) / 4, self.frame.size.height - 10 * SizeAdapter));
    }];
    [self.updateButton mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.deleteTableButton.mas_right).offset(LEFTSPACE);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake((ScreenWidth - 5 * LEFTSPACE) / 4, self.frame.size.height - 10 * SizeAdapter));
    }];
    [self.lookButton mas_makeConstraints:^(MASConstraintMaker * make) {
        make.right.equalTo(self.mas_right).offset(-LEFTSPACE);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake((ScreenWidth - 5 * LEFTSPACE) / 4, self.frame.size.height - 10 * SizeAdapter));
    }];
}
#pragma mark ======= Action
- (void)insterButtonPressed:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        sender.backgroundColor                 = [UIColor redColor];
        self.deleteTableButton.backgroundColor = wya_rgb(24, 144, 255);
        self.deleteTableButton.selected        = NO;
        self.updateButton.backgroundColor      = wya_rgb(24, 144, 255);
        self.updateButton.selected             = NO;
        self.lookButton.backgroundColor        = wya_rgb(24, 144, 255);
        self.lookButton.selected               = NO;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_headerViewInsterButton:)]) {
        [self.delegate wya_headerViewInsterButton:sender];
    }
}
- (void)deletetButtonPressed:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        sender.backgroundColor                 = [UIColor redColor];
        self.insterTableButton.backgroundColor = wya_rgb(24, 144, 255);
        self.insterTableButton.selected        = NO;
        self.updateButton.backgroundColor      = wya_rgb(24, 144, 255);
        self.updateButton.selected             = NO;
        self.lookButton.backgroundColor        = wya_rgb(24, 144, 255);
        self.lookButton.selected               = NO;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_headerViewDeleteButton:)]) {
        [self.delegate wya_headerViewDeleteButton:sender];
    }
}
- (void)updateButtonPressed:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        sender.backgroundColor                 = [UIColor redColor];
        self.deleteTableButton.backgroundColor = wya_rgb(24, 144, 255);
        self.deleteTableButton.selected        = NO;
        self.insterTableButton.backgroundColor = wya_rgb(24, 144, 255);
        self.insterTableButton.selected        = NO;
        self.lookButton.backgroundColor        = wya_rgb(24, 144, 255);
        self.lookButton.selected               = NO;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_headerViewUpdateButton:)]) {
        [self.delegate wya_headerViewUpdateButton:sender];
    }
}
- (void)lookButtonPressed:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        sender.backgroundColor                 = [UIColor redColor];
        self.deleteTableButton.backgroundColor = wya_rgb(24, 144, 255);
        self.deleteTableButton.selected        = NO;
        self.updateButton.backgroundColor      = wya_rgb(24, 144, 255);
        self.updateButton.selected             = NO;
        self.insterTableButton.backgroundColor = wya_rgb(24, 144, 255);
        self.insterTableButton.selected        = NO;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_headerViewLookButton:)]) {
        [self.delegate wya_headerViewLookButton:sender];
    }
}
#pragma mark ======= getter
- (UIButton *)insterTableButton
{
    if (!_insterTableButton) {
        _insterTableButton = ({
            UIButton * object = [[UIButton alloc] init];
            [object setTitle:@"插入" forState:0];
            [object setTitleColor:[UIColor whiteColor] forState:0];
            object.backgroundColor     = [UIColor redColor];
            object.layer.cornerRadius  = 8 * SizeAdapter;
            object.selected            = YES;
            object.layer.masksToBounds = YES;
            [object addTarget:self action:@selector(insterButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _insterTableButton;
}

- (UIButton *)deleteTableButton
{
    if (!_deleteTableButton) {
        _deleteTableButton = ({
            UIButton * object = [[UIButton alloc] init];
            [object setTitle:@"删除" forState:0];
            [object setTitleColor:[UIColor whiteColor] forState:0];
            object.backgroundColor     = wya_rgb(24, 144, 255);
            object.layer.cornerRadius  = 8 * SizeAdapter;
            object.layer.masksToBounds = YES;
            [object addTarget:self action:@selector(deletetButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _deleteTableButton;
}

- (UIButton *)updateButton
{
    if (!_updateButton) {
        _updateButton = ({
            UIButton * object = [[UIButton alloc] init];
            [object setTitle:@"更新" forState:0];
            [object setTitleColor:[UIColor whiteColor] forState:0];
            object.backgroundColor     = wya_rgb(24, 144, 255);
            object.layer.cornerRadius  = 8 * SizeAdapter;
            object.layer.masksToBounds = YES;
            [object addTarget:self action:@selector(updateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _updateButton;
}

- (UIButton *)lookButton
{
    if (!_lookButton) {
        _lookButton = ({
            UIButton * object = [[UIButton alloc] init];
            [object setTitle:@"查询" forState:0];
            [object setTitleColor:[UIColor whiteColor] forState:0];
            object.backgroundColor     = wya_rgb(24, 144, 255);
            object.layer.cornerRadius  = 8 * SizeAdapter;
            object.layer.masksToBounds = YES;
            [object addTarget:self action:@selector(lookButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _lookButton;
}
@end
