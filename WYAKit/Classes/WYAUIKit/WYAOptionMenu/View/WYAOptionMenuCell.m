//
//  WYAChooseMenuCell.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import "WYAOptionMenuCell.h"
#import "WYAOptionMenuModel.h"

@interface WYAOptionMenuCell ()
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIImageView * rightImageView;
@property (nonatomic, strong) UIView * line;
@end

@implementation WYAOptionMenuCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel           = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor wya_hex:@"#000000"];
        self.titleLabel.font      = FONT(16);
        [self.contentView addSubview:self.titleLabel];

        self.rightImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.rightImageView];

        self.line = [[UIView alloc] init];
        [self.contentView addSubview:self.line];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(-5 * SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(20 * SizeAdapter, 20 * SizeAdapter));
    }];

    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.mas_equalTo(self.contentView);
        if (self.model.xOffset != 0) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(self.model.xOffset * SizeAdapter);
        } else {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(12 * SizeAdapter);
        }

        make.right.mas_equalTo(self.rightImageView.mas_left);
    }];

    [self.line mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.bottom.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
}

#pragma mark--- Setter
- (void)setModel:(WYAOptionMenuModel *)model
{
    _model = model;
    if (model) {
        if (model.select) {
            if (model.selectColor) {
                self.contentView.backgroundColor = model.selectColor;
            } else {
                self.contentView.backgroundColor = [UIColor whiteColor];
            }
        } else {
            if (model.normalColor) {
                self.contentView.backgroundColor = model.normalColor;
            } else {
                self.contentView.backgroundColor = random(248, 248, 248, 1);
            }
        }
        self.titleLabel.text      = model.title;
        self.titleLabel.textColor = model.titleColor;
        self.titleLabel.font      = model.titleFont;
        self.line.backgroundColor = model.lineColor;
        [self layoutIfNeeded];
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
