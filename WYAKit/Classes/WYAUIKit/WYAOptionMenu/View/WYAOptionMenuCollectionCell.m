//
//  WYAMenuCollectionCell.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import "WYAOptionMenuCollectionCell.h"
#import "WYAOptionMenuModel.h"

@interface WYAOptionMenuCollectionCell ()
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UILabel * titleLabel;
@end

@implementation WYAOptionMenuCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView                 = [[UIImageView alloc] init];
        self.imageView.backgroundColor = randomColor;
        [self.contentView addSubview:self.imageView];

        self.titleLabel               = [[UILabel alloc] init];
        self.titleLabel.font          = FONT(15);
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        ;
        self.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.imageView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(self.contentView.mas_top).with.offset(10 * SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(30 * SizeAdapter, 30 * SizeAdapter));
    }];

    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.right.bottom.mas_equalTo(self.contentView);
        make.height.mas_equalTo(20 * SizeAdapter);
    }];
}

- (void)setModel:(WYAOptionMenuSecondLevelModel *)model
{
    _model = model;
    if (model) {
        self.titleLabel.text = model.title;
    }
}

@end
