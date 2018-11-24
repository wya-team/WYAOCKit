//
//  WYAChooseMenuSecondLevelCell.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import "WYAChooseMenuSecondLevelCell.h"
#import "WYAChooseMenuSecondLevelModel.h"
@interface WYAChooseMenuSecondLevelCell ()
@property (nonatomic, strong) UILabel * titleLabel;
@end

@implementation WYAChooseMenuSecondLevelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.textColor = random(51, 51, 51, 1);
        self.titleLabel.font = FONT(15);
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 5*SizeAdapter, 0, 5*SizeAdapter));
    }];
}

#pragma mark --- Setter
-(void)setModel:(WYAChooseMenuSecondLevelModel *)model{
    _model = model;
    if (model) {
        if (model.enableCell) {
            self.titleLabel.textColor = random(203, 203, 203, 1);
            self.selectionStyle = UITableViewCellSelectionStyleNone;
        }else{
            self.selectionStyle = UITableViewCellSelectionStyleDefault;
            if (model.select) {
                self.titleLabel.textColor = [UIColor blueColor];
                self.accessoryView = [[UIImageView alloc]initWithImage:[UIImage loadBundleImage:@"对号_blue" ClassName:NSStringFromClass([self class])]];
            }else{
                self.titleLabel.textColor = random(51, 51, 51, 1);
                self.accessoryView = nil;
            }
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