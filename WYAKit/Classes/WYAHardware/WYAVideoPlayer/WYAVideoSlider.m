//
//  WYAVideoSlider.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/5.
//

#import "WYAVideoSlider.h"

static CGFloat sliderHeight = 3;
static CGFloat sliderSpace  = 10;

@implementation WYAVideoSliderButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect bounds = self.bounds;
    // 扩大点击区域
    bounds = CGRectInset(bounds, -20, -20);
    // 若点击的点在新的bounds里面。就返回yes
    return CGRectContainsPoint(bounds, point);
}

@end

@interface WYAVideoSlider ()
@property (nonatomic, strong) UIView * bgProgressView;
@property (nonatomic, strong) UIView * bufferProgressView;
@property (nonatomic, strong) UIView * sliderProgressView;
@property (nonatomic, strong) WYAVideoSliderButton * sliderButton;
@end

@implementation WYAVideoSlider {
    CGFloat buttonOffset; //记录按钮的偏移量
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.bgProgressView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self.mas_left).with.offset(sliderSpace);
        make.right.mas_equalTo(self.mas_right).with.offset(-sliderSpace);
        make.height.mas_equalTo(sliderHeight);
    }];

    [self.bufferProgressView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self.bgProgressView.mas_left);
        make.width.mas_equalTo(self.bgProgressView.mas_width).multipliedBy(self.bufferValue);
        make.height.mas_equalTo(sliderHeight);
    }];

    [self.sliderProgressView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self.bgProgressView.mas_left);
        make.width.mas_equalTo(self.bgProgressView.mas_width).multipliedBy(self.value);
        make.height.mas_equalTo(sliderHeight);
    }];

    [self.sliderButton mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.centerX.mas_equalTo(self.bgProgressView.mas_left)
        .with.offset(self.value * self.bgProgressView.cmam_width);
        make.size.mas_equalTo(CGSizeMake(20 * SizeAdapter, 20 * SizeAdapter));
    }];
}

#pragma mark - Private Method -
- (void)setupUI
{
    [self addSubview:self.bgProgressView];
    [self addSubview:self.bufferProgressView];
    [self addSubview:self.sliderProgressView];
    [self addSubview:self.sliderButton];

    UIPanGestureRecognizer * pan =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(panClick:)];
    [self.sliderButton addGestureRecognizer:pan];
    _isFastForward = NO;
}

- (void)panClick:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        [self sliderButtonStartRun];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [self sliderButtonEndRun];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        [self sliderButtonRunningWithPoint:[gestureRecognizer locationInView:self]];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateCancelled ||
               gestureRecognizer.state == UIGestureRecognizerStateFailed) {
    }
}

- (void)sliderButtonStartRun
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_SliderStartRun)]) {
        [self.delegate wya_SliderStartRun];
    }

    [UIView animateWithDuration:0.2
                     animations:^{
                         self.sliderButton.transform = CGAffineTransformMakeScale(1.2, 1.2);
                     }];
}

- (void)sliderButtonEndRun
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_SliderEndRun)]) {
        [self.delegate wya_SliderEndRun];
    }

    [UIView animateWithDuration:0.2
                     animations:^{ self.sliderButton.transform = CGAffineTransformIdentity; }];
}

- (void)sliderButtonRunningWithPoint:(CGPoint)point
{
    CGFloat value = (point.x - sliderSpace) / self.bgProgressView.cmam_width;
    value         = value >= 1.0 ? 1.0 : value <= 0.0 ? 0.0 : value;
    if (self.value == value) return;
    [self setValue:value];
    if (value > buttonOffset) {
        _isFastForward = YES;
    } else {
        _isFastForward = NO;
    }
    buttonOffset = value;
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(wya_SliderRunningWithValue:)]) {
        [self.delegate wya_SliderRunningWithValue:value];
    }
}

#pragma mark - Setter -
- (void)setValue:(CGFloat)value
{
    _value = value;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setBufferValue:(CGFloat)bufferValue
{
    _bufferValue = bufferValue;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark - Getter -
- (UIView *)bgProgressView
{
    if (!_bgProgressView) {
        _bgProgressView                 = [[UIView alloc] init];
        _bgProgressView.backgroundColor = [UIColor grayColor];
    }
    return _bgProgressView;
}

- (UIView *)bufferProgressView
{
    if (!_bufferProgressView) {
        _bufferProgressView                 = [[UIView alloc] init];
        _bufferProgressView.backgroundColor = [UIColor whiteColor];
    }
    return _bufferProgressView;
}

- (UIView *)sliderProgressView
{
    if (!_sliderProgressView) {
        _sliderProgressView                 = [[UIView alloc] init];
        _sliderProgressView.backgroundColor = [UIColor redColor];
    }
    return _sliderProgressView;
}

- (WYAVideoSliderButton *)sliderButton
{
    if (!_sliderButton) {
        _sliderButton = [WYAVideoSliderButton buttonWithType:UIButtonTypeCustom];
        [_sliderButton
        setImage:[UIImage loadBundleImage:@"yuan" ClassName:NSStringFromClass(self.class)]
        forState:UIControlStateNormal];
    }
    return _sliderButton;
}

@end
