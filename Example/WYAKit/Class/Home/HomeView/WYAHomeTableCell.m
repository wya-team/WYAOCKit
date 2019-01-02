//
//  WYAHomeTableCell.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/17.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAHomeTableCell.h"
#import "WYAHomeModel.h"

@interface WYAHomeTableCell ()
@property (nonatomic, strong) UIView * backgroundV;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIImageView * arrowImageView;
@end

@implementation WYAHomeTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle              = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:self.backgroundV];
        [self.backgroundV addSubview:self.titleLabel];
        [self.backgroundV addSubview:self.arrowImageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.backgroundV mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView.mas_left).with.offset(10 * SizeAdapter);
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(-10 * SizeAdapter);
    }];

    [self.arrowImageView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.backgroundV.mas_centerY);
        make.right.mas_equalTo(self.backgroundV.mas_right).with.offset(-10 * SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(15 * SizeAdapter, 15 * SizeAdapter));
    }];

    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.mas_equalTo(self.backgroundV);
        make.left.mas_equalTo(self.backgroundV.mas_left).with.offset(16 * SizeAdapter);
        make.right.mas_equalTo(self.arrowImageView.mas_left);
    }];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    if (selected) {
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundV.backgroundColor = GRAYBGCOLOR;
        }];
    } else {
        if (animated) {
            [UIView animateWithDuration:0.3 animations:^{
                self.backgroundV.backgroundColor = [UIColor whiteColor];
            }];
        }
    }
    // Configure the view for the selected state
}

#pragma mark - Setter -
- (void)setModel:(WYAHomeItemModel *)model
{
    _model = model;
    if (model) {
        self.titleLabel.text = model.rowName;
    }
}

#pragma mark - Getter -
- (UIView *)backgroundV
{
    if (!_backgroundV) {
        _backgroundV = ({
            UIView * object        = [[UIView alloc] init];
            object.backgroundColor = [UIColor whiteColor];
            object;
        });
    }
    return _backgroundV;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel * object = [[UILabel alloc] init];
            object.textColor = random(51, 51, 51, 1);
            object.font      = FONT(13);
            object;
        });
    }
    return _titleLabel;
}

- (UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = ({
            UIImageView * object = [[UIImageView alloc] init];
            object.image         = [UIImage imageNamed:@"icon_arrow"];
            object;
        });
    }
    return _arrowImageView;
}
@end
