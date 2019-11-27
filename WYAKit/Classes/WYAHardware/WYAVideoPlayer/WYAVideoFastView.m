//
//  WYAVideoFastView.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/7.
//

#import "WYAVideoFastView.h"

@interface WYAVideoFastView ()

@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UILabel * progressLabel;
@property (nonatomic, strong) UIProgressView * progressView;

@end

@implementation WYAVideoFastView
#pragma mark - LifeCircle -
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.progressLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY).with.offset(10 * SizeAdapter);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(20 * SizeAdapter);
    }];

    [self.imageView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(self.progressLabel.mas_top).with.offset(-10 * SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(40 * SizeAdapter, 20 * SizeAdapter));
    }];

    [self.progressView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.progressLabel.mas_bottom).with.offset(10 * SizeAdapter);
        make.left.mas_equalTo(self.mas_left).with.offset(10 * SizeAdapter);
        make.right.mas_equalTo(self.mas_right).with.offset(-10 * SizeAdapter);
        make.height.mas_equalTo(5 * SizeAdapter);
    }];
}

#pragma mark - Private Method -
- (void)setup
{
    self.backgroundColor = [UIColor blackColor];
    [self addSubview:self.imageView];
    [self addSubview:self.progressLabel];
    [self addSubview:self.progressView];
}

#pragma mark - Setter -
- (void)setIsSpeed:(BOOL)isSpeed
{
    if (isSpeed) {
        //快进
        self.imageView.image =
        [UIImage loadBundleImage:@"icon_quick-retreat"
                       ClassName:NSStringFromClass(self.class)];
    } else {
        self.imageView.image =
        [UIImage loadBundleImage:@"icon_fast-forward"
                       ClassName:NSStringFromClass(self.class)];
    }
}

- (void)setText:(NSString *)text
{
    self.progressLabel.text = text;
    NSArray * array         = [text componentsSeparatedByString:@"/"];
    NSMutableAttributedString * textAttributed =
    [[NSMutableAttributedString alloc] initWithString:text];
    [textAttributed addAttribute:NSForegroundColorAttributeName
                           value:[UIColor redColor]
                           range:[text rangeOfString:[array firstObject]]];
    self.progressLabel.attributedText = textAttributed;
}

- (void)setNumber:(CGFloat)number
{
    self.progressView.progress = number;
}

#pragma mark - Getter -
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = ({
            UIImageView * object = [[UIImageView alloc] init];
            object.contentMode   = UIViewContentModeScaleAspectFit;
            object;
        });
    }
    return _imageView;
}

- (UILabel *)progressLabel
{
    if (!_progressLabel) {
        _progressLabel = ({
            UILabel * object     = [[UILabel alloc] init];
            object.textColor     = [UIColor whiteColor];
            object.font          = FONT(15);
            object.textAlignment = NSTextAlignmentCenter;
            object;
        });
    }
    return _progressLabel;
}

- (UIProgressView *)progressView
{
    if (!_progressView) {
        _progressView = ({
            UIProgressView * object  = [[UIProgressView alloc] init];
            object.trackTintColor    = [UIColor grayColor];
            object.progressTintColor = [UIColor redColor];
            object;
        });
    }
    return _progressView;
}

@end
