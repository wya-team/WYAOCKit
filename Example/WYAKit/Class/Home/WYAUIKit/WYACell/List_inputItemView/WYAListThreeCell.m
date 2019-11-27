//
//  WYAListThreeCell.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAListThreeCell.h"
#define leftSpace 10 * SizeAdapter

@interface WYAListThreeCell ()
@property (nonatomic, strong) UILabel * titLabel;
@property (nonatomic, strong) UILabel * rightLabel;
@property (nonatomic, strong) UIImageView * rightImageView;
@property (nonatomic, strong) UIImageView * arrowImageView;
@end

@implementation WYAListThreeCell

#pragma mark ======= Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titLabel];
        [self.contentView addSubview:self.rightLabel];
        [self.contentView addSubview:self.rightImageView];
        [self.contentView addSubview:self.arrowImageView];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.titLabel mas_makeConstraints:^(MASConstraintMaker * make) {
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.left.equalTo(self.mas_left).offset(leftSpace);
        make.size.mas_equalTo(CGSizeMake(100 * SizeAdapter, 20 * SizeAdapter));
    }];

    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.right.equalTo(self.mas_right).offset(-5 * SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(15 * SizeAdapter, 15 * SizeAdapter));
    }];

    if (self.model.type == 0) {
        [self.rightImageView mas_makeConstraints:^(MASConstraintMaker * make) {
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.right.equalTo(self.arrowImageView.mas_left).offset(-5 * SizeAdapter);
            make.size.mas_equalTo(CGSizeMake(30 * SizeAdapter, 30 * SizeAdapter));
        }];
    } else {
        [self.rightLabel mas_makeConstraints:^(MASConstraintMaker * make) {
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.right.equalTo(self.arrowImageView.mas_left).offset(-5 * SizeAdapter);
            make.size.mas_equalTo(CGSizeMake(100 * SizeAdapter, 20 * SizeAdapter));
        }];
    }
}
- (void)setModel:(WYATextListModel *)model
{
    _model                    = model;
    NSInteger type            = model.type;
    self.titLabel.text        = model.titleString;
    self.arrowImageView.image = [UIImage imageNamed:model.arrowImageNamed];
    switch (type) {
        case 0: {
            self.rightLabel.hidden    = YES;
            self.rightImageView.image = [UIImage imageNamed:model.rightImage];
        } break;
        case 1: {
            self.rightImageView.hidden = YES;
            self.rightLabel.text       = model.rightString;

        } break;
        default:
            break;
    }
}
#pragma mark ======= getter

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

- (UIImageView *)rightImageView
{
    if (!_rightImageView) {
        _rightImageView = ({
            UIImageView * object = [[UIImageView alloc] init];
            object;
        });
    }
    return _rightImageView;
}
@end
