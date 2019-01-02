//
//  WYASlider.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import "WYASlider.h"

@interface WYASlider ()
@property (nonatomic, strong) UIButton * minButton; //显示较小的数button
@property (nonatomic, strong) UIButton * maxButton; //显示较大的数button
@property (nonatomic, strong) UIView * minSliderLine;
@property (nonatomic, strong) UIView * maxSliderLine;
@property (nonatomic, strong) UIView * mainSliderLine;
@property (nonatomic, assign) CGFloat CurrentMinNum;
@property (nonatomic, assign) CGFloat CurrentMaxNum;
@property (nonatomic, strong) UIButton * minSliderButton; //min 滑块
@property (nonatomic, strong) UIButton * maxSliderButton; //max 滑块
@property (nonatomic, assign) CGFloat tatol;
@property (nonatomic, assign) CGFloat padding;
@end

@implementation WYASlider

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.minButton mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self.mas_left).with.offset(self.padding);
        make.size.mas_equalTo(CGSizeMake(self.showNoteLabel ? 50 * SizeAdapter : 0, self.showNoteLabel ? 20 * SizeAdapter : 0));
    }];

    [self.maxButton mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(self.mas_right).with.offset(-self.padding);
        make.size.mas_equalTo(CGSizeMake(self.showNoteLabel ? 50 * SizeAdapter : 0, self.showNoteLabel ? 20 * SizeAdapter : 0));
    }];

    [self.mainSliderLine mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        if (self.showNoteLabel) {
            make.left.mas_equalTo(self.minButton.mas_right).with.offset(self.padding);
            make.right.mas_equalTo(self.maxButton.mas_left).with.offset(-self.padding);
        } else {
            make.left.mas_equalTo(self.mas_left).with.offset(5 * SizeAdapter);
            make.right.mas_equalTo(self.mas_right).with.offset(-5 * SizeAdapter);
        }

        make.height.mas_equalTo(3 * SizeAdapter);
    }];

    if (self.sliderStyle == WYASliderStyleSingle) {
        [self.minSliderLine mas_remakeConstraints:^(MASConstraintMaker * make) {
            make.left.mas_equalTo(self.mainSliderLine.mas_left);
            make.centerY.mas_equalTo(self.mainSliderLine.mas_centerY);
            make.height.mas_equalTo(3 * SizeAdapter);
        }];

        [self.minSliderButton mas_remakeConstraints:^(MASConstraintMaker * make) {
            make.centerY.mas_equalTo(self.minSliderLine.mas_centerY);
            make.centerX.mas_equalTo(self.minSliderLine.mas_left);
            make.size.mas_equalTo(CGSizeMake(20 * SizeAdapter, 20 * SizeAdapter));
        }];
    } else {
        [self.minSliderLine mas_remakeConstraints:^(MASConstraintMaker * make) {
            make.left.mas_equalTo(self.mainSliderLine.mas_left);
            make.centerY.mas_equalTo(self.mainSliderLine.mas_centerY);
            make.height.mas_equalTo(3 * SizeAdapter);
        }];

        [self.minSliderButton mas_remakeConstraints:^(MASConstraintMaker * make) {
            make.centerY.mas_equalTo(self.minSliderLine.mas_centerY);
            make.centerX.mas_equalTo(self.minSliderLine.mas_right);
            make.size.mas_equalTo(CGSizeMake(20 * SizeAdapter, 20 * SizeAdapter));
        }];

        [self.maxSliderLine mas_remakeConstraints:^(MASConstraintMaker * make) {
            make.right.mas_equalTo(self.mainSliderLine.mas_right);
            make.centerY.mas_equalTo(self.mainSliderLine.mas_centerY);
            make.height.mas_equalTo(3 * SizeAdapter);
        }];

        [self.maxSliderButton mas_remakeConstraints:^(MASConstraintMaker * make) {
            make.centerY.mas_equalTo(self.maxSliderLine.mas_centerY);
            make.centerX.mas_equalTo(self.maxSliderLine.mas_left);
            make.size.mas_equalTo(CGSizeMake(20 * SizeAdapter, 20 * SizeAdapter));
        }];
    }
}

#pragma mark--- Setter
- (void)setSliderStyle:(WYASliderStyle)sliderStyle
{
    _sliderStyle = sliderStyle;
    if (sliderStyle == WYASliderStyleSingle) {
        [self.maxSliderLine removeFromSuperview];
        [self.maxSliderButton removeFromSuperview];

    } else if (sliderStyle == WYASliderStyleDouble) {
        [self addSubview:self.maxSliderLine];
        [self addSubview:self.maxSliderButton];
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
- (void)setMinTintColor:(UIColor *)minTintColor
{
    _minTintColor                      = minTintColor;
    self.minSliderLine.backgroundColor = minTintColor;
    if (self.sliderStyle == WYASliderStyleSingle) {
        self.minSliderButton.layer.borderColor = minTintColor.CGColor;
    }
}

- (void)setMaxTintColor:(UIColor *)maxTintColor
{
    _maxTintColor                      = maxTintColor;
    self.maxSliderLine.backgroundColor = maxTintColor;
}

- (void)setMainTintColor:(UIColor *)mainTintColor
{
    _mainTintColor                      = mainTintColor;
    self.mainSliderLine.backgroundColor = mainTintColor;
    if (self.sliderStyle == WYASliderStyleDouble) {
        self.minSliderButton.layer.borderColor = mainTintColor.CGColor;
        self.maxSliderButton.layer.borderColor = mainTintColor.CGColor;
    }
}

- (void)setMinText:(NSString *)minText
{
    [self.minButton setTitle:minText forState:UIControlStateNormal];
}

- (void)setMaxText:(NSString *)maxText
{
    [self.maxButton setTitle:maxText forState:UIControlStateNormal];
}

- (void)setMinImage:(UIImage *)minImage
{
    [self.minButton setImage:minImage forState:UIControlStateNormal];
}

- (void)setMaxImage:(UIImage *)maxImage
{
    [self.maxButton setImage:maxImage forState:UIControlStateNormal];
}

- (void)setShowNoteLabel:(BOOL)showNoteLabel
{
    _showNoteLabel = showNoteLabel;
    if (showNoteLabel == NO) {
        self.padding = 0;
    } else {
        self.padding = 5 * SizeAdapter;
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark--- Getter
- (UIView *)minSliderLine
{
    if (!_minSliderLine) {
        _minSliderLine                 = [[UIView alloc] init];
        _minSliderLine.backgroundColor = [UIColor redColor];
    }
    return _minSliderLine;
}

- (UIView *)maxSliderLine
{
    if (!_maxSliderLine) {
        _maxSliderLine                 = [[UIView alloc] init];
        _maxSliderLine.backgroundColor = [UIColor blueColor];
    }
    return _maxSliderLine;
}

- (UIView *)mainSliderLine
{
    if (!_mainSliderLine) {
        _mainSliderLine                 = [[UIView alloc] init];
        _mainSliderLine.backgroundColor = [UIColor darkGrayColor];
    }
    return _mainSliderLine;
}

- (UIButton *)minSliderButton
{
    if (!_minSliderButton) {
        _minSliderButton                                             = [UIButton buttonWithType:UIButtonTypeCustom];
        _minSliderButton.backgroundColor                             = [UIColor whiteColor];
        _minSliderButton.showsTouchWhenHighlighted                   = YES;
        _minSliderButton.layer.cornerRadius                          = 10 * SizeAdapter;
        _minSliderButton.layer.masksToBounds                         = YES;
        _minSliderButton.layer.borderColor                           = [UIColor redColor].CGColor;
        _minSliderButton.layer.borderWidth                           = 1;
        UIPanGestureRecognizer * minSliderButtonPanGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMinSliderButton:)];
        [_minSliderButton addGestureRecognizer:minSliderButtonPanGestureRecognizer];
    }
    return _minSliderButton;
}

- (UIButton *)maxSliderButton
{
    if (!_maxSliderButton) {
        _maxSliderButton                                             = [UIButton buttonWithType:UIButtonTypeCustom];
        _maxSliderButton.backgroundColor                             = [UIColor whiteColor];
        _maxSliderButton.showsTouchWhenHighlighted                   = YES;
        _maxSliderButton.layer.cornerRadius                          = 10 * SizeAdapter;
        _maxSliderButton.layer.masksToBounds                         = YES;
        _maxSliderButton.layer.borderColor                           = [UIColor blueColor].CGColor;
        _maxSliderButton.layer.borderWidth                           = 1;
        UIPanGestureRecognizer * maxSliderButtonPanGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMaxSliderButton:)];
        [_maxSliderButton addGestureRecognizer:maxSliderButtonPanGestureRecognizer];
    }
    return _maxSliderButton;
}

- (UIButton *)minButton
{
    if (!_minButton) {
        _minButton         = [UIButton buttonWithType:UIButtonTypeCustom];
        _minButton.enabled = NO;
        [_minButton setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
        _minButton.titleLabel.font       = FONT(15);
        _minButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _minButton;
}

- (UIButton *)maxButton
{
    if (!_maxButton) {
        _maxButton         = [UIButton buttonWithType:UIButtonTypeCustom];
        _maxButton.enabled = NO;
        [_maxButton setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
        _maxButton.titleLabel.font       = FONT(15);
        _maxButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _maxButton;
}

#pragma mark--- Private Method
- (void)createUI
{
    [self addSubview:self.minButton];
    [self addSubview:self.maxButton];
    [self addSubview:self.mainSliderLine];
    [self addSubview:self.minSliderLine];
    [self addSubview:self.maxSliderLine];

    [self addSubview:self.minSliderButton];
    [self addSubview:self.maxSliderButton];

    self.sliderStyle   = WYASliderStyleSingle;
    self.showNoteLabel = YES;
}

- (void)panMinSliderButton:(UIPanGestureRecognizer *)pgr
{
    CGPoint point = [pgr translationInView:self];
    static CGPoint center;
    if (pgr.state == UIGestureRecognizerStateBegan) {
        center = pgr.view.center;
    }
    pgr.view.center       = CGPointMake(center.x + point.x, center.y + point.y);
    pgr.view.cmam_centerY = self.cmam_height / 2;

    CGFloat aaa;
    if (self.showNoteLabel) {
        aaa = 2 * self.padding + self.minButton.cmam_width;
    } else {
        aaa = 5 * SizeAdapter;
    }
    if (self.sliderStyle == WYASliderStyleSingle) {
        if (pgr.view.cmam_right > self.mainSliderLine.cmam_right + self.minSliderButton.cmam_width / 2) {
            pgr.view.cmam_right = self.mainSliderLine.cmam_right + self.minSliderButton.cmam_width / 2;
        } else {
            if (pgr.view.cmam_centerX < aaa) {
                pgr.view.cmam_centerX = aaa;
            }
            //            if (pgr.view.cmam_centerX > self.cmam_width-aaa) {
            //                pgr.view.cmam_centerX = self.cmam_width-aaa;
            //            }
        }
        self.minSliderLine.frame = CGRectMake(self.minSliderLine.cmam_left, self.minSliderLine.cmam_top, pgr.view.cmam_centerX - self.minSliderLine.cmam_left, self.minSliderLine.cmam_height);
    } else if (self.sliderStyle == WYASliderStyleDouble) {
        if (pgr.view.cmam_right > self.maxSliderButton.cmam_left) {
            pgr.view.cmam_right = self.maxSliderButton.cmam_left;
        } else {
            if (pgr.view.cmam_centerX < aaa) {
                pgr.view.cmam_centerX = aaa;
            }
            if (pgr.view.cmam_centerX > self.cmam_width - aaa) {
                pgr.view.cmam_centerX = self.cmam_width - aaa;
            }
        }
        self.minSliderLine.frame = CGRectMake(self.minSliderLine.cmam_left, self.minSliderLine.cmam_top, pgr.view.cmam_centerX - self.minSliderLine.cmam_left, self.minSliderLine.cmam_height);
    }

    [self valueMinChange:pgr.view.cmam_right];
}

- (void)panMaxSliderButton:(UIPanGestureRecognizer *)pgr
{
    CGPoint point = [pgr translationInView:self];
    static CGPoint center;
    if (pgr.state == UIGestureRecognizerStateBegan) {
        center = pgr.view.center;
    }
    pgr.view.center       = CGPointMake(center.x + point.x, center.y + point.y);
    pgr.view.cmam_centerY = self.cmam_height / 2;
    CGFloat aaa;
    if (self.showNoteLabel == YES) {
        aaa = 2 * self.padding + self.minButton.cmam_width;
    } else {
        aaa = 5 * SizeAdapter;
    }
    if (pgr.view.cmam_left < self.minSliderButton.cmam_right) {
        pgr.view.cmam_left = self.minSliderButton.cmam_right;
    } else {
        if (pgr.view.cmam_centerX < aaa) {
            pgr.view.cmam_centerX = aaa;
        }
        if (pgr.view.cmam_centerX > self.cmam_width - aaa) {
            pgr.view.cmam_centerX = self.cmam_width - aaa;
        }
    }
    self.maxSliderLine.frame = CGRectMake(pgr.view.cmam_centerX, self.maxSliderLine.cmam_top, self.cmam_width - pgr.view.cmam_centerX - aaa, self.maxSliderLine.cmam_height);
    [self valueMaxChange:pgr.view.cmam_left];
}

- (void)valueMinChange:(CGFloat)num
{
    if (self.sliderStyle == WYASliderStyleSingle) {
        self.currentMaxValue = self.minSliderLine.cmam_width / self.mainSliderLine.cmam_width;
        if (self.delegate && [self.delegate respondsToSelector:@selector(wya_slider:MinValueChange:)]) {
            [self.delegate wya_slider:self MinValueChange:self.currentMaxValue];
        }
    } else if (self.sliderStyle == WYASliderStyleDouble) {
        self.currentMinValue = self.minSliderLine.cmam_width / self.mainSliderLine.cmam_width;
        if (self.delegate && [self.delegate respondsToSelector:@selector(wya_slider:MinValueChange:)]) {
            [self.delegate wya_slider:self MinValueChange:self.currentMinValue];
        }
    }
}

- (void)valueMaxChange:(CGFloat)num
{
    self.currentMaxValue = self.maxSliderLine.cmam_width / self.mainSliderLine.cmam_width;
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_slider:MaxValueChange:)]) {
        [self.delegate wya_slider:self MaxValueChange:self.currentMaxValue];
    }
}

#pragma mark--- Public Method
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
