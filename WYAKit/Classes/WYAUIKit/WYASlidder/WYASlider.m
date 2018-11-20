//
//  WYASlider.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import "WYASlider.h"

@interface WYASlider ()
@property (nonatomic, strong) UIView * minSliderLine;
@property (nonatomic, strong) UIView * maxSliderLine;
@property (nonatomic, strong) UIView * mainSliderLine;
@property (nonatomic, assign) CGFloat  CurrentMinNum;
@property (nonatomic, assign) CGFloat  CurrentMaxNum;
@property (nonatomic, strong) UIButton * minSlider;//min 滑块
@property (nonatomic, strong) UIButton * maxSlider;//max 滑块

@property (nonatomic, assign) CGFloat  constOffY;
@property (nonatomic, assign) CGFloat  tatol;
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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.minButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self.mas_left);
        make.size.mas_equalTo(CGSizeMake(30*SizeAdapter, 20*SizeAdapter));
    }];
    
    [self.maxButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(self.mas_right);
        make.size.mas_equalTo(CGSizeMake(30*SizeAdapter, 20*SizeAdapter));
    }];
    
    [self.mainSliderLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self.minButton.mas_right).with.offset(5*SizeAdapter);
        make.right.mas_equalTo(self.maxButton.mas_left).with.offset(-5*SizeAdapter);
        make.height.mas_equalTo(1*SizeAdapter);
    }];
    
    [self.minSliderLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mainSliderLine.mas_left);
        make.centerY.mas_equalTo(self.mainSliderLine.mas_centerY);
        make.height.mas_equalTo(1*SizeAdapter);
        make.width.mas_greaterThanOrEqualTo(0);
    }];
    
    [self.maxSliderLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mainSliderLine.mas_right);
        make.centerY.mas_equalTo(self.mainSliderLine.mas_centerY);
        make.height.mas_equalTo(1*SizeAdapter);
        make.width.mas_greaterThanOrEqualTo(0);
    }];
    
    [self.minSlider mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.minSliderLine.mas_centerY);
        make.centerX.mas_equalTo(self.minSliderLine.mas_right);
        make.size.mas_equalTo(CGSizeMake(20*SizeAdapter, 20*SizeAdapter));
    }];
    
    [self.maxSlider mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.maxSliderLine.mas_centerY);
        make.centerX.mas_equalTo(self.maxSliderLine.mas_left);
        make.size.mas_equalTo(CGSizeMake(20*SizeAdapter, 20*SizeAdapter));
    }];
}

#pragma mark --- Setter
-(void)setMinNum:(CGFloat)minNum
{
//    _minNum = minNum;
//    _tatol = (_maxNum - _minNum)/(self.width - 40.0f);
//    if (_tatol < 0) {
//        _tatol = -_tatol;
//    }
//
//    _minLabel.text = [NSString stringWithFormat:@"%.3f%@",minNum,_unit];
//    _currentMinValue = minNum;
}

-(void)setMaxNum:(CGFloat)maxNum
{
//    _maxNum = maxNum;
//    _tatol = (_maxNum - _minNum)/(self.width - 40.0f);
//    if (_tatol < 0) {
//        _tatol = -_tatol;
//    }
//    _maxLabel.text = [NSString stringWithFormat:@"%.3f%@",maxNum,_unit];
//    _currentMaxValue = maxNum;
}



-(void)setMinTintColor:(UIColor *)minTintColor
{
    _minTintColor = minTintColor;
    self.minSliderLine.backgroundColor = minTintColor;
}

-(void)setMaxTintColor:(UIColor *)maxTintColor
{
    _maxTintColor = maxTintColor;
    self.maxSliderLine.backgroundColor = maxTintColor;
}

-(void)setMainTintColor:(UIColor *)mainTintColor
{
    _mainTintColor = mainTintColor;
    self.mainSliderLine.backgroundColor = mainTintColor;
}

#pragma mark --- Getter
-(UIView *)minSliderLine{
    if (!_minSliderLine) {
        _minSliderLine = [[UIView alloc]init];
        _minSliderLine.backgroundColor = [UIColor redColor];
    }
    return _minSliderLine;
}

-(UIView *)maxSliderLine{
    if (!_maxSliderLine) {
        _maxSliderLine = [[UIView alloc]init];
        _maxSliderLine.backgroundColor = [UIColor blueColor];
    }
    return _maxSliderLine;
}

-(UIView *)mainSliderLine{
    if (!_mainSliderLine) {
        _mainSliderLine = [[UIView alloc]init];
        _mainSliderLine.backgroundColor = [UIColor darkGrayColor];
    }
    return _mainSliderLine;
}

-(UIButton *)minSlider{
    if (!_minSlider) {
        _minSlider = [UIButton buttonWithType:UIButtonTypeCustom];
        _minSlider.backgroundColor = [UIColor whiteColor];
        _minSlider.showsTouchWhenHighlighted = YES;
        _minSlider.layer.cornerRadius = 10.f;
        _minSlider.layer.masksToBounds = YES;
        _minSlider.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _minSlider.layer.borderWidth = 0.5;
        UIPanGestureRecognizer *minSliderButtonPanGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panMinSliderButton:)];
        [_minSlider addGestureRecognizer:minSliderButtonPanGestureRecognizer];
    }
    return _minSlider;
}

-(UIButton *)maxSlider{
    if (!_maxSlider) {
        _maxSlider = [UIButton buttonWithType:UIButtonTypeCustom];
        _maxSlider.backgroundColor = [UIColor whiteColor];
        _maxSlider.showsTouchWhenHighlighted = YES;
        _maxSlider.layer.cornerRadius = 10.f;
        _maxSlider.layer.masksToBounds = YES;
        _maxSlider.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _maxSlider.layer.borderWidth = 0.5;
        UIPanGestureRecognizer *maxSliderButtonPanGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panMaxSliderButton:)];
        [_maxSlider addGestureRecognizer:maxSliderButtonPanGestureRecognizer];
    }
    return _maxSlider;
}

-(UIButton *)minButton{
    if (!_minButton) {
        _minButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _minButton.enabled = NO;
    }
    return _minButton;
}

-(UIButton *)maxButton{
    if (!_maxButton) {
        _maxButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _maxButton.enabled = NO;
    }
    return _maxButton;
}

#pragma mark --- Private Method
- (void)createUI
{
    self.minNum = 0.0;
    self.maxNum = 0.0;
    
    [self addSubview:self.minButton];
    [self addSubview:self.maxButton];
    [self addSubview:self.mainSliderLine];
    [self addSubview:self.minSliderLine];
    [self addSubview:self.maxSliderLine];
    
    [self addSubview:self.minSlider];
    [self addSubview:self.maxSlider];
    
    self.constOffY = self.wya_centerY;
    
    
}

- (void)panMinSliderButton:(UIPanGestureRecognizer *)pgr
{
    CGPoint point = [pgr translationInView:self];
    static CGPoint center;
    if (pgr.state == UIGestureRecognizerStateBegan) {
        center = pgr.view.center;
    }
    pgr.view.center = CGPointMake(center.x + point.x, center.y + point.y);
    pgr.view.wya_centerY = self.constOffY;
    
    if (pgr.view.wya_right > self.maxSlider.wya_left) {
        pgr.view.wya_right = self.maxSlider.wya_left;
    }else{
        if (pgr.view.wya_centerX < 10) {
            pgr.view.wya_centerX = 10;
        }
        if (pgr.view.wya_centerX > self.wya_width-10) {
            pgr.view.wya_centerX = self.wya_width-10;
        }
    }
    self.minSliderLine.frame = CGRectMake(self.minSliderLine.wya_left, self.minSliderLine.wya_top,  pgr.view.wya_centerX-self.minSliderLine.wya_left, self.minSliderLine.wya_height);
    [self valueMinChange:pgr.view.wya_right];
}

- (void)panMaxSliderButton:(UIPanGestureRecognizer *)pgr
{
    CGPoint point = [pgr translationInView:self];
    static CGPoint center;
    if (pgr.state == UIGestureRecognizerStateBegan) {
        center = pgr.view.center;
    }
    pgr.view.center = CGPointMake(center.x + point.x, center.y + point.y);
    pgr.view.wya_centerY = self.constOffY;
    
    if (pgr.view.wya_left < self.minSlider.wya_right) {
        pgr.view.wya_left = self.minSlider.wya_right;
    }else{
        if (pgr.view.wya_centerX < 10) {
            pgr.view.wya_centerX = 10;
        }
        if (pgr.view.wya_centerX > self.wya_width-10) {
            pgr.view.wya_centerX = self.wya_width-10;
        }
    }
    self.maxSliderLine.frame = CGRectMake(pgr.view.wya_centerX, self.maxSliderLine.wya_top, self.wya_width-pgr.view.wya_centerX-10, self.maxSliderLine.wya_height);
    [self valueMaxChange:pgr.view.wya_left];
}

- (void)valueMinChange:(CGFloat)num
{
    
    [self.minButton setTitle:[NSString stringWithFormat:@"%.f",self.minNum + (self.tatol * (num-20.0))] forState:UIControlStateNormal];
    self.currentMinValue = self.minNum + (self.tatol * (num-20.0));
}

- (void)valueMaxChange:(CGFloat)num
{
    [self.maxButton setTitle:[NSString stringWithFormat:@"%.f",self.minNum +(self.tatol * (num-20.0))] forState:UIControlStateNormal];
    self.currentMaxValue = _minNum +(self.tatol * (num-20.0));
    
}



#pragma mark --- Public Method
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
