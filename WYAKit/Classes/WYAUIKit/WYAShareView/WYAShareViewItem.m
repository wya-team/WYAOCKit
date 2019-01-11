//
//  WYAShareViewItem.m
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/12/3.
//

#import "WYAShareViewItem.h"

@interface WYAShareViewItem ()
@property (nonatomic, strong) UIView * bgImageView;
@property (nonatomic, strong) UIImageView * iconImgView;
@property (nonatomic, strong) UILabel * titleLabel;
@end

@implementation WYAShareViewItem
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.bgImageView addSubview:self.iconImgView];
        [self.contentView addSubview:self.bgImageView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];

    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.centerX.mas_equalTo(self.contentView);
        make.centerY.equalTo(self.contentView.mas_centerY).offset(-10 * SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(60 * SizeAdapter, 60 * SizeAdapter));
    }];

    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.centerX.mas_equalTo(self.bgImageView);
        make.centerY.mas_equalTo(self.bgImageView);
        make.size.mas_equalTo(CGSizeMake(30 * SizeAdapter, 30 * SizeAdapter));
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker * make) {
        make.top.equalTo(self.bgImageView.mas_bottom).offset(5 * SizeAdapter);
        make.left.equalTo(self.contentView.mas_left).offset(5 * SizeAdapter);
        make.right.equalTo(self.contentView.mas_right).offset(-5 * SizeAdapter);
        make.height.mas_equalTo(20 * SizeAdapter);
    }];
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = ({
            UIImageView * object = [[UIImageView alloc] init];

            object;
        });
    }
    return _iconImgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel * object                 = [[UILabel alloc] init];
            object.textColor                 = [UIColor wya_hex:@"#868686"];
            object.numberOfLines             = 0;
            object.textAlignment             = NSTextAlignmentCenter;
            object.adjustsFontSizeToFitWidth = YES;
            object.font                      = FONT(12);
            object;
        });
    }
    return _titleLabel;
}
- (void)setTitleString:(NSString *)titleString {
    _titleString         = titleString;
    self.titleLabel.text = _titleString;
    NSString * imageString;
    if ([_titleString isEqualToString:@"新浪微博"]) { imageString = @"icon_weibo"; }
    if ([_titleString isEqualToString:@"微信朋友圈"]) { imageString = @"icon_pengyouquan"; }
    if ([_titleString isEqualToString:@"微信好友"]) { imageString = @"icon_weixin"; }
    if ([_titleString isEqualToString:@"QQ"]) { imageString = @"icon_qq"; }
    if ([_titleString isEqualToString:@"字号"]) { imageString = @"icon_font"; }
    if ([_titleString isEqualToString:@"刷新"]) { imageString = @"icon_refresh"; }
    if ([_titleString isEqualToString:@"复制链接"]) { imageString = @"icon_link"; }
    if ([_titleString isEqualToString:@"投诉"]) { imageString = @"icon_complain"; }
    _iconImgView.image =
        [UIImage loadBundleImage:imageString
                       ClassName:NSStringFromClass([self class])];
    [self layoutIfNeeded];
}

- (UIView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = ({
            UIView * object            = [[UIView alloc] init];
            object.layer.cornerRadius  = 8 * SizeAdapter;
            object.layer.masksToBounds = YES;
            object.backgroundColor     = [UIColor whiteColor];
            object;
        });
    }
    return _bgImageView;
}
@end
