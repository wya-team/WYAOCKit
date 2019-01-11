//
//  WYAListFourCell.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAListFourCell.h"
#define leftSpace 10 * SizeAdapter

@interface WYAListFourCell ()
@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * titLabel;
@property (nonatomic, strong) UIImageView * arrowImageView;
@end

@implementation WYAListFourCell
#pragma mark ======= Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titLabel];
        [self.contentView addSubview:self.arrowImageView];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.model.type != 0) {
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker * make) {
            make.left.equalTo(self.mas_left).offset(leftSpace);
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.size.mas_equalTo(CGSizeMake(15 * SizeAdapter, 15 * SizeAdapter));
        }];

        [self.titLabel mas_makeConstraints:^(MASConstraintMaker * make) {
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.left.equalTo(self.iconImageView.mas_right).offset(leftSpace);
            make.size.mas_equalTo(CGSizeMake(100 * SizeAdapter, 20 * SizeAdapter));
        }];
    } else {
        [self.titLabel mas_makeConstraints:^(MASConstraintMaker * make) {
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.left.equalTo(self.mas_left).offset(leftSpace);
            make.size.mas_equalTo(CGSizeMake(100 * SizeAdapter, 20 * SizeAdapter));
        }];
    }

    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.right.equalTo(self.mas_right).offset(-5 * SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(15 * SizeAdapter, 15 * SizeAdapter));
    }];
}
- (void)setModel:(WYAListCellModel *)model {
    _model             = model;
    NSInteger type     = model.type;
    self.titLabel.text = model.titleString;
    switch (type) {
        case 0: {
            self.arrowImageView.image = [UIImage imageNamed:model.arrowImageNamed];
        } break;
        case 1: {
            self.iconImageView.image = [UIImage imageNamed:model.iconImageNamed];
        } break;
        case 2: {
            self.iconImageView.image  = [UIImage imageNamed:model.iconImageNamed];
            self.arrowImageView.image = [UIImage imageNamed:model.arrowImageNamed];
        } break;
        default:
            break;
    }
}
#pragma mark ======= getter
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = ({
            UIImageView * object = [[UIImageView alloc] init];
            object;
        });
    }
    return _iconImageView;
}

- (UILabel *)titLabel {
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

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = ({
            UIImageView * object = [[UIImageView alloc] init];
            object;
        });
    }
    return _arrowImageView;
}

@end
