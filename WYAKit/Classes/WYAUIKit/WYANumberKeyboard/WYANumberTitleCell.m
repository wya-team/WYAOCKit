//
//  WYANumberTitleCell.m
//  AFNetworking
//
//  Created by 李俊恒 on 2018/12/20.
//

#import "WYANumberTitleCell.h"

@interface WYANumberTitleCell ()

@property (nonatomic, strong) UIButton * button;
@end

@implementation WYANumberTitleCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.button];
        self.contentView.backgroundColor     = [UIColor whiteColor];
        self.contentView.layer.borderWidth   = 0.5;
        self.contentView.layer.borderColor   = [UIColor groupTableViewBackgroundColor].CGColor;
        self.contentView.layer.masksToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.button mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.top.bottom.mas_equalTo(self.contentView);
    }];
}

- (void)setTitleString:(NSString *)titleString
{
    _titleString = titleString;
    [self.button setTitle:_titleString forState:UIControlStateNormal];
}
- (void)setBgColor:(UIColor *)bgColor
{
    _bgColor                    = bgColor;
    self.button.backgroundColor = bgColor;
}
- (UIButton *)button
{
    if (!_button) {
        _button = ({
            UIButton * object = [[UIButton alloc] init];
            [object setTitleColor:[UIColor wya_hex:@"#333333"] forState:UIControlStateNormal];
            object.titleLabel.font        = FONT(27);
            object.userInteractionEnabled = NO;
            object;
        });
    }
    return _button;
}
@end

@interface WYANumberImageCell ()

@property (nonatomic, strong) UIButton * button1;
@end

@implementation WYANumberImageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.button1];
        self.contentView.backgroundColor     = [UIColor whiteColor];
        self.contentView.layer.borderWidth   = 0.5;
        self.contentView.layer.borderColor   = [UIColor groupTableViewBackgroundColor].CGColor;
        self.contentView.layer.masksToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.button1 mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.top.bottom.mas_equalTo(self.contentView);
    }];
}

- (void)setImageNamed:(NSString *)imageNamed
{
    _imageNamed = imageNamed;
    [self.button1
    setImage:[UIImage loadBundleImage:_imageNamed ClassName:NSStringFromClass(self.class)]
    forState:UIControlStateNormal];
}

- (void)setBgColor:(UIColor *)bgColor
{
    _bgColor                     = bgColor;
    self.button1.backgroundColor = bgColor;
}

- (UIButton *)button1
{
    if (!_button1) {
        _button1 = ({
            UIButton * object             = [[UIButton alloc] init];
            object.userInteractionEnabled = NO;
            object;
        });
    }
    return _button1;
}
@end
