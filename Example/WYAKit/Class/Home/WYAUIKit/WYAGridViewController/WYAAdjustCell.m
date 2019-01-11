//
//  WYAAdjustCell.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/22.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAAdjustCell.h"

@interface WYAAdjustCell ()
@property (nonatomic, strong) UIImageView * iconImgView;
@property (nonatomic, strong) UILabel * titleLabel;
@end

@implementation WYAAdjustCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.iconImgView];
        [self.contentView addSubview:self.titleLabel];
        self.contentView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        self.contentView.layer.borderWidth = 0.5;
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];

    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_top).offset(10 * SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(40 * SizeAdapter, 60 * SizeAdapter));
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker * make) {
        make.top.equalTo(self.iconImgView.mas_bottom).offset(5 * SizeAdapter);
        make.left.equalTo(self.contentView.mas_left).offset(5 * SizeAdapter);
        make.right.equalTo(self.contentView.mas_right).offset(-5 * SizeAdapter);
        make.height.mas_equalTo(20 * SizeAdapter);
    }];
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = ({
            UIImageView * object = [[UIImageView alloc] init];
            object.image         = [UIImage imageNamed:@"icon_grid_Placeholder"];
            object;
        });
    }
    return _iconImgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel * object                 = [[UILabel alloc] init];
            object.textColor                 = [UIColor blackColor];
            object.numberOfLines             = 0;
            object.textAlignment             = NSTextAlignmentCenter;
            object.adjustsFontSizeToFitWidth = YES;
            object.font                      = FONT(12);
            object;
        });
    }
    return _titleLabel;
}
- (void)setTitleString:(NSString *)titleString {
    _titleString         = titleString;
    self.titleLabel.text = _titleString;
    [self layoutIfNeeded];
}

@end
