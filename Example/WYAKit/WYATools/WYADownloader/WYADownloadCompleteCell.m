//
//  WYADownloadCompleteCell.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/12.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYADownloadCompleteCell.h"
#import "WYADownloadTaskManager.h"
@interface WYADownloadCompleteCell ()
@property (nonatomic, strong) UIImageView * imgView;
@property (nonatomic, strong) UILabel * titleLabel;
@end

@implementation WYADownloadCompleteCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgView = [[UIImageView alloc]init];
        self.imgView.layer.cornerRadius = 2.f;
        self.imgView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.imgView];
        
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = FONT(15);
        self.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.imgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.contentView.mas_left).mas_equalTo(16*SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(40*SizeAdapter, 40*SizeAdapter));
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.imgView.mas_right).with.offset(10*SizeAdapter);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(40*SizeAdapter);
    }];
}

-(void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
}

-(void)setImage:(UIImage *)image{
    self.imgView.image = image;
}

-(void)setModel:(WYADownloadTaskManager *)model{
    _model = model;
    if (model) {
        self.titleLabel.text = model.destinationPath;
        self.imgView.backgroundColor = [UIColor redColor];
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
