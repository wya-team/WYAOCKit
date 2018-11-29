//
//  WYACardCell.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/27.
//

#import "WYACardCell.h"

@interface WYACardCell ()

@property (nonatomic, strong) UIView * line;
@property (nonatomic, strong) UILabel * detailLabel;
@property (nonatomic, strong) UILabel * subDetailLabel;
@end

@implementation WYACardCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.iconImageView = [[UIImageView alloc]init];
//        imageV.image = [UIImage imageNamed:<#(nonnull NSString *)#>];
//        imageV.contentMode = <#ContentModel#>;
        self.iconImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.iconImageView];
        
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.text = @"标题";
//        self.titleLabel.textColor = random(<#r#>, <#g#>, <#b#>, <#a#>);
        self.titleLabel.font = FONT(15);
//        self.titleLabel.textAlignment = <#TextAlignMent#>;
        [self.contentView addSubview:self.titleLabel];
        
        self.subTitleLabel = [[UILabel alloc]init];
        self.subTitleLabel.text = @"文本";
//        self.subTitleLabel.textColor = random(<#r#>, <#g#>, <#b#>, <#a#>);
        self.subTitleLabel.font = FONT(15);
//        self.subTitleLabel.textAlignment = <#TextAlignMent#>;
        [self.contentView addSubview:self.subTitleLabel];
        
        self.line = [[UIView alloc]init];
        self.line.backgroundColor = random(153, 153, 153, 1);
        [self.contentView addSubview:self.line];
        
        self.detailLabel = [[UILabel alloc]init];
        self.detailLabel.numberOfLines = 0;
//        self.detailLabel.textColor = random(<#r#>, <#g#>, <#b#>, <#a#>);
        self.detailLabel.font = FONT(14);
//        self.detailLabel.textAlignment = <#TextAlignMent#>;
        [self.contentView addSubview:self.detailLabel];
        
        self.subDetailLabel = [[UILabel alloc]init];
        self.subDetailLabel.textColor = random(153, 153, 153, 1);
        self.subDetailLabel.font = FONT(13);
//        self.subDetailLabel.textAlignment = <#TextAlignMent#>;
        [self.contentView addSubview:self.subDetailLabel];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).with.offset(16*SizeAdapter);
        make.top.mas_equalTo(self.contentView.mas_top).with.offset(10*SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(24*SizeAdapter, 24*SizeAdapter));
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).with.offset(5*SizeAdapter);
        make.centerY.mas_equalTo(self.iconImageView.mas_centerY);
        make.height.mas_equalTo(30*SizeAdapter);
        make.right.mas_equalTo(self.subTitleLabel.mas_left);
    }];
    
    [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.iconImageView.mas_centerY);
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(-10*SizeAdapter);
        make.height.mas_equalTo(30*SizeAdapter);
        make.width.mas_lessThanOrEqualTo(50*SizeAdapter);
    }];
    
    [self.line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.iconImageView.mas_bottom).with.offset(10*SizeAdapter);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_left);
        make.right.mas_equalTo(self.subTitleLabel.mas_right);
        make.top.mas_equalTo(self.line.mas_bottom).with.offset(5*SizeAdapter);
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    
    [self.subDetailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.detailLabel);
        make.top.mas_equalTo(self.detailLabel.mas_bottom).with.offset(10*SizeAdapter);
        make.height.mas_equalTo(20*SizeAdapter);
    }];
}

#pragma mark --- Setter
-(void)setContentString:(NSString *)contentString{
    _contentString = contentString;
    self.detailLabel.text = contentString;
    [self layoutIfNeeded];
}

-(void)setSubContentString:(NSString *)subContentString{
    _subContentString = subContentString;
    self.subDetailLabel.text = subContentString;
    [self layoutIfNeeded];
}

#pragma mark --- Public Method
+(CGFloat)wya_cellHeight:(NSString *)text{
    WYACardCell * card = [[WYACardCell alloc]init];
    
    return 64*SizeAdapter+[text wya_heightWithFontSize:14 width:card.contentView.cmam_width-26*SizeAdapter];
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
