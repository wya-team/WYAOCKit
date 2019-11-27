
//
//  WYAListTwoCell.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAListTwoCell.h"
#define leftSpace 10 * SizeAdapter

@interface WYAListTwoCell ()
@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * titLabel;
@property (nonatomic, strong) UILabel * rightLabel;
@property (nonatomic, strong) UIImageView * arrowImageView;
@property (nonatomic, strong) UILabel * subLabel;
@end

@implementation WYAListTwoCell
#pragma mark ======= Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titLabel];
        [self.contentView addSubview:self.rightLabel];
        [self.contentView addSubview:self.arrowImageView];
        [self.contentView addSubview:self.subLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.model.type == 0) {
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker * make) {
            make.left.equalTo(self.mas_left).offset(leftSpace);
            make.top.equalTo(self.mas_top).offset(leftSpace);
            make.size.mas_equalTo(CGSizeMake(45 * SizeAdapter, 45 * SizeAdapter));
        }];

        [self.titLabel mas_makeConstraints:^(MASConstraintMaker * make) {
            make.top.equalTo(self.mas_top).offset(leftSpace);
            make.left.equalTo(self.iconImageView.mas_right).offset(leftSpace);
            make.size.mas_equalTo(CGSizeMake(100 * SizeAdapter, 20 * SizeAdapter));
        }];

        [self.subLabel mas_makeConstraints:^(MASConstraintMaker * make) {
            make.top.equalTo(self.titLabel.mas_bottom).offset(5);
            make.left.equalTo(self.iconImageView.mas_right).offset(leftSpace);
            make.size.mas_equalTo(CGSizeMake(100 * SizeAdapter, 20 * SizeAdapter));
        }];
    } else {
        [self.titLabel mas_makeConstraints:^(MASConstraintMaker * make) {
            make.top.equalTo(self.mas_top).offset(leftSpace);
            make.left.equalTo(self.mas_left).offset(leftSpace);
            make.size.mas_equalTo(CGSizeMake(100 * SizeAdapter, 20 * SizeAdapter));
        }];

        [self.subLabel mas_makeConstraints:^(MASConstraintMaker * make) {
            make.top.equalTo(self.titLabel.mas_bottom).offset(5 * SizeAdapter);
            make.left.equalTo(self.mas_left).offset(leftSpace);
            make.size.mas_equalTo(CGSizeMake(100 * SizeAdapter, 20 * SizeAdapter));
        }];
    }
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.centerY.equalTo(self.mas_centerY).offset(0 * SizeAdapter);
        make.right.equalTo(self.mas_right).offset(-5 * SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(15 * SizeAdapter, 15 * SizeAdapter));
    }];

    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker * make) {
        make.centerY.equalTo(self.mas_centerY).offset(0 * SizeAdapter);
        make.right.equalTo(self.arrowImageView.mas_left).offset(-5 * SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(80 * SizeAdapter, 20 * SizeAdapter));
    }];
}
- (void)setModel:(WYATwoRowListModel *)model
{
    _model                    = model;
    NSInteger type            = model.type;
    self.titLabel.text        = model.titleString;
    self.subLabel.text        = model.subTitleString;
    self.rightLabel.text      = model.rightString;
    self.arrowImageView.image = [UIImage imageNamed:model.arrowImageNamed];

    switch (type) {
        case 0: {
            self.iconImageView.image = [UIImage imageNamed:model.iconNamed];
        } break;
        case 1: {
            self.iconImageView.hidden = YES;

        } break;
        default:
            break;
    }
    [self layoutIfNeeded];
}
#pragma mark ======= getter
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = ({
            UIImageView * object = [[UIImageView alloc] init];
            object;
        });
    }
    return _iconImageView;
}

- (UILabel *)titLabel
{
    if (!_titLabel) {
        _titLabel = ({
            UILabel * object = [[UILabel alloc] init];
            object.textColor = [UIColor blackColor];
            object.font      = FONT(14);
            object;
        });
    }
    return _titLabel;
}

- (UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = ({
            UIImageView * object = [[UIImageView alloc] init];
            object;
        });
    }
    return _arrowImageView;
}

- (UILabel *)rightLabel
{
    if (!_rightLabel) {
        _rightLabel = ({
            UILabel * object = [[UILabel alloc] init];
            object.textColor = [UIColor grayColor];
            object.font      = FONT(12);
            object;
        });
    }
    return _rightLabel;
}

- (UILabel *)subLabel
{
    if (!_subLabel) {
        _subLabel = ({
            UILabel * object = [[UILabel alloc] init];
            object.textColor = [UIColor grayColor];
            object.font      = FONT(12);
            object;
        });
    }
    return _subLabel;
}
@end
