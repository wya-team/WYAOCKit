//
//  WYACard.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import "WYACard.h"

@interface WYACard ()
@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * subTitleLabel;
@property (nonatomic, strong) UIView * line;
@property (nonatomic, strong) UILabel * detailLabel;
@property (nonatomic, strong) UILabel * subDetailLabel;
@end

@implementation WYACard

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).with.offset(5*SizeAdapter);
        make.top.mas_equalTo(self.mas_top).with.offset(7*SizeAdapter);
        make.height.mas_equalTo(30*SizeAdapter);
        make.right.mas_equalTo(self.subTitleLabel.mas_left);
    }];
    
    [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).with.offset(16*SizeAdapter);
        make.centerY.mas_equalTo(self.titleLabel.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(14*SizeAdapter, 14*SizeAdapter));
    }];
    
    [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.titleLabel.mas_centerY);
        make.right.mas_equalTo(self.mas_right).with.offset(-10*SizeAdapter);
        make.height.mas_equalTo(30*SizeAdapter);
        make.width.mas_lessThanOrEqualTo(50*SizeAdapter);
    }];
    
    [self.line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).with.offset(7*SizeAdapter);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.subDetailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.detailLabel);
        make.bottom.mas_equalTo(self.mas_bottom).with.offset(-5*SizeAdapter);
        make.height.mas_equalTo(20*SizeAdapter);
    }];
    
    [self.detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_left);
        make.right.mas_equalTo(self.subTitleLabel.mas_right);
        make.top.mas_equalTo(self.line.mas_bottom).with.offset(5*SizeAdapter);
        make.bottom.mas_equalTo(self.subDetailLabel.mas_top);
    }];
}

#pragma mark --- Private Method
-(void)createUI{
    self.backgroundColor = [UIColor whiteColor];
    
    self.iconImageView = [[UIImageView alloc]init];
    //        imageV.image = [UIImage imageNamed:<#(nonnull NSString *)#>];
    //        imageV.contentMode = <#ContentModel#>;
    self.iconImageView.backgroundColor = [UIColor redColor];
    [self addSubview:self.iconImageView];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.text = @"标题";
    //        self.titleLabel.textColor = random(<#r#>, <#g#>, <#b#>, <#a#>);
    self.titleLabel.font = FONT(15);
    //        self.titleLabel.textAlignment = <#TextAlignMent#>;
    [self addSubview:self.titleLabel];
    
    self.subTitleLabel = [[UILabel alloc]init];
    self.subTitleLabel.text = @"文本";
    //        self.subTitleLabel.textColor = random(<#r#>, <#g#>, <#b#>, <#a#>);
    self.subTitleLabel.font = FONT(15);
    //        self.subTitleLabel.textAlignment = <#TextAlignMent#>;
    [self addSubview:self.subTitleLabel];
    
    self.line = [[UIView alloc]init];
    self.line.backgroundColor = random(153, 153, 153, 1);
    [self addSubview:self.line];
    
    self.detailLabel = [[UILabel alloc]init];
    self.detailLabel.text = @"测试";
    self.detailLabel.numberOfLines = 0;
    //        self.detailLabel.textColor = random(<#r#>, <#g#>, <#b#>, <#a#>);
    self.detailLabel.font = FONT(14);
    //        self.detailLabel.textAlignment = <#TextAlignMent#>;
    [self addSubview:self.detailLabel];
    
    self.subDetailLabel = [[UILabel alloc]init];
    self.subDetailLabel.text = @"测试";
    self.subDetailLabel.textColor = random(153, 153, 153, 1);
    self.subDetailLabel.font = FONT(13);
    //        self.subDetailLabel.textAlignment = <#TextAlignMent#>;
    [self addSubview:self.subDetailLabel];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
