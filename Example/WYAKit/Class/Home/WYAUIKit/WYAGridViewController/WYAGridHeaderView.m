//
//  WYAGridHeaderView.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/22.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAGridHeaderView.h"

@interface WYAGridHeaderView ()
@property (nonatomic, strong) UILabel * titleLabel;
@end

@implementation WYAGridHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        self.backgroundColor = GRAYBGCOLOR;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.top.bottom.mas_equalTo(self);
    }];
}
- (void)setTitle:(NSString *)title
{
    _title               = title;
    self.titleLabel.text = title;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel * object = [[UILabel alloc] init];
            object.textColor = GRAYTITLECOLOR;
            object.font      = FONT(14);
            object;
        });
    }
    return _titleLabel;
}
@end
