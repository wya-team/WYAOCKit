//
//  WYAChooseMenuSecondLevelCell.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import "WYAOptionMenuSecondLevelCell.h"
#import "WYAOptionMenuModel.h"

@interface WYAOptionMenuSecondLevelCell ()
@property (nonatomic, strong) UILabel * titleLabel;
@end

@implementation WYAOptionMenuSecondLevelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel           = [[UILabel alloc] init];
        self.titleLabel.textColor = random(51, 51, 51, 1);
        self.titleLabel.font      = FONT(16);
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 16 * SizeAdapter, 0, 5 * SizeAdapter));
    }];
}

#pragma mark--- Setter
- (void)setModel:(WYAOptionMenuSecondLevelModel *)model
{
    _model = model;
    if (model) {
        if (model.enableCell) {
            self.titleLabel.textColor = [UIColor wya_hex:@"#bebebe"];
            self.selectionStyle       = UITableViewCellSelectionStyleNone;
        } else {
            self.selectionStyle = UITableViewCellSelectionStyleDefault;
            if (model.select) {
                self.titleLabel.textColor = random(65, 153, 247, 1);
                self.accessoryView        = [[UIImageView alloc]
                initWithImage:[UIImage loadBundleImage:@"icon_radio2_selected"
                                             ClassName:NSStringFromClass([self class])]];
            } else {
                self.titleLabel.textColor = random(51, 51, 51, 1);
                self.accessoryView        = nil;
            }
        }

        self.titleLabel.text = model.title;
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
