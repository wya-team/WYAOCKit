//
//  WYAShareViewItem.m
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/12/3.
//

#import "WYAShareViewItem.h"

@interface WYAShareViewItem()
@property (nonatomic, strong) UIImageView * iconImgView;
@property (nonatomic, strong) UILabel * titleLabel;
@end
@implementation WYAShareViewItem
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.iconImgView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_top).offset(10*SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(60*SizeAdapter, 60*SizeAdapter));
    }];
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImgView.mas_bottom).offset(5*SizeAdapter);
        make.left.equalTo(self.contentView.mas_left).offset(5*SizeAdapter);
        make.right.equalTo(self.contentView.mas_right).offset(-5*SizeAdapter);
        make.height.mas_equalTo(20*SizeAdapter);
    }];
}

- (UIImageView *)iconImgView{
    if(!_iconImgView){
        _iconImgView = ({
            UIImageView * object = [[UIImageView alloc]init];
            object.layer.cornerRadius = 8*SizeAdapter;
            object.layer.masksToBounds = YES;
            object;
        });
    }
    return _iconImgView;
}

- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor= [UIColor blackColor];
            object.numberOfLines = 0;
            object.textAlignment = NSTextAlignmentCenter;
            object.adjustsFontSizeToFitWidth = YES;
            object.font = FONT(12);
            object;
        });
    }
    return _titleLabel;
}
- (void)setTitleString:(NSString *)titleString{
    _titleString = titleString;
    self.titleLabel.text = _titleString;
    _iconImgView.image = [UIImage imageNamed:titleString];
    [self layoutIfNeeded];
}

@end
