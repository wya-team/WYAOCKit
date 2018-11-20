//
//  WYAChooseMenuCell.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import "WYAChooseMenuCell.h"
#import "WYAChooseMenuModel.h"

@interface WYAChooseMenuCell ()
@property (nonatomic, strong) UILabel * titleLabel;
@end

@implementation WYAChooseMenuCell

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
-(void)setModel:(WYAChooseMenuModel *)model{
    _model = model;
    if (model) {
        if (model.select) {
            self.contentView.backgroundColor = [UIColor whiteColor];
        }else{
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
