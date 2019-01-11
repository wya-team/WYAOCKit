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
@end

@implementation WYAOptionMenuCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel           = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor wya_hex:@"#000000"];
        self.titleLabel.font      = FONT(16);
        [self.contentView addSubview:self.titleLabel];

        self.rightImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.rightImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(-5 * SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(20 * SizeAdapter, 20 * SizeAdapter));
    }];

    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView.mas_left).with.offset(12 * SizeAdapter);
        make.right.mas_equalTo(self.rightImageView.mas_left);
    }];
}

#pragma mark--- Setter
- (void)setModel:(WYAOptionMenuModel *)model {
    _model = model;
    if (model) {
        if (model.select) {
            self.contentView.backgroundColor = [UIColor whiteColor];
        } else {
            self.contentView.backgroundColor = random(248, 248, 248, 1);
        }
        self.titleLabel.text = model.title;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
