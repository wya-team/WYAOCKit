//
//  WYAPopCell.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/17.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPopCell.h"

@interface WYAPopCell ()
@property (nonatomic, strong) UIImageView * leftImageView;
@property (nonatomic, strong) UILabel * titleLabel;

@end

@implementation WYAPopCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.leftImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.line];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.leftImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.contentView.mas_left).with.offset(10*SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(20*SizeAdapter, 20*SizeAdapter));
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.leftImageView.mas_right).with.offset(5*SizeAdapter);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(20*SizeAdapter);
    }];
    
    [self.line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).with.offset(5*SizeAdapter);
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(-5*SizeAdapter);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.height.mas_equalTo(0.5);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Setter -
-(void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
}

-(void)setImageName:(NSString *)imageName{
    self.leftImageView.image = [UIImage imageNamed:imageName];
}

#pragma mark - Getter -
- (UIImageView *)leftImageView{
    if(!_leftImageView){
        _leftImageView = ({
            UIImageView * object = [[UIImageView alloc]init];
            object;
       });
    }
    return _leftImageView;
}

- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = random(51, 51, 51, 1);
            object.font = FONT(15);
            object;
       });
    }
    return _titleLabel;
}

- (UIView *)line{
    if(!_line){
        _line = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = random(233, 233, 233, 1);
            object;
       });
    }
    return _line;
}
@end
