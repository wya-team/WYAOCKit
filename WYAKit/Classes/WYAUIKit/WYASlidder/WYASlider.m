//
//  WYASlider.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import "WYASlider.h"

@interface WYASlider ()
@property (nonatomic, strong) UIButton * minButton;//显示较小的数button
@property (nonatomic, strong) UIButton * maxButton;//显示较大的数button
@property (nonatomic, strong) UIView * minSliderLine;
@property (nonatomic, strong) UIView * maxSliderLine;
@property (nonatomic, strong) UIView * mainSliderLine;
@property (nonatomic, assign) CGFloat  CurrentMinNum;
@property (nonatomic, assign) CGFloat  CurrentMaxNum;
@property (nonatomic, strong) UIButton * minSlider;//min 滑块
@property (nonatomic, strong) UIButton * maxSlider;//max 滑块
@property (nonatomic, assign) CGFloat  tatol;
@property (nonatomic, assign) CGFloat  padding;
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
        make.left.mas_equalTo(self.mas_left).with.offset(self.padding);
        make.size.mas_equalTo(CGSizeMake(40*SizeAdapter, 20*SizeAdapter));
    }];
    
    [self.maxButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(self.mas_right).with.offset(-self.padding);
        make.size.mas_equalTo(CGSizeMake(40*SizeAdapter, 20*SizeAdapter));
    }];
    
    [self.mainSliderLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        if (self.showNoteLabel) {
            make.left.mas_equalTo(self.minButton.mas_right).with.offset(self.padding);
            make.right.mas_equalTo(self.maxButton.mas_left).with.offset(-self.padding);
        }else{
            make.left.mas_equalTo(self.mas_left).with.offset(5*SizeAdapter);
            make.right.mas_equalTo(self.mas_right).with.offset(-5*SizeAdapter);
        }
        
        make.height.mas_equalTo(1*SizeAdapter);
    }];
    
    [self.minSliderLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mainSliderLine.mas_left);
        make.centerY.mas_equalTo(self.mainSliderLine.mas_centerY);
        make.height.mas_equalTo(1*SizeAdapter);
        make.width.mas_greaterThanOrEqualTo(0);
    }];
    
    [self.minSlider mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.minSliderLine.mas_centerY);
        make.centerX.mas_equalTo(self.minSliderLine.mas_right);
        make.size.mas_equalTo(CGSizeMake(20*SizeAdapter, 20*SizeAdapter));
    }];
    
    if (self.sliderStyle == WYASliderStyleDouble) {
        [self.maxSliderLine mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mainSliderLine.mas_right);
            make.centerY.mas_equalTo(self.mainSliderLine.mas_centerY);
            make.height.mas_equalTo(1*SizeAdapter);
            make.width.mas_greaterThanOrEqualTo(0);
        }];
        
        [self.maxSlider mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.maxSliderLine.mas_centerY);
            make.centerX.mas_equalTo(self.maxSliderLine.mas_left);
            make.size.mas_equalTo(CGSizeMake(20*SizeAdapter, 20*SizeAdapter));
        }];
    }
    
}

#pragma mark --- Setter
-(void)setSliderStyle:(WYASliderStyle)sliderStyle{
    _sliderStyle = sliderStyle;
    if (sliderStyle == WYASliderStyleSingle) {
        [self.maxSliderLine removeFromSuperview];
        [self.maxSlider removeFromSuperview];
        
    }else if (sliderStyle == WYASliderStyleDouble) {
        
    }
    [self layoutIfNeeded];
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

-(void)setMinText:(NSString *)minText{
    [self.minButton setTitle:minText forState:UIControlStateNormal];
}

-(void)setMaxText:(NSString *)maxText{
    [self.maxButton setTitle:maxText forState:UIControlStateNormal];
}

-(void)setMinImage:(UIImage *)minImage{
    [self.minButton setImage:minImage forState:UIControlStateNormal];
}

-(void)setMaxImage:(UIImage *)maxImage{
    [self.maxButton setImage:maxImage forState:UIControlStateNormal];
}

-(void)setShowNoteLabel:(BOOL)showNoteLabel{
    _showNoteLabel = showNoteLabel;
    if (showNoteLabel == NO) {
        self.minButton.hidden = YES;
        self.maxButton.hidden = YES;
        self.padding = 0;
    }
    [self layoutIfNeeded];
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
        _minSlider.layer.cornerRadius = 10*SizeAdapter;
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
        [_minButton setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
        _minButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _minButton;
}

-(UIButton *)maxButton{
    if (!_maxButton) {
        _maxButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _maxButton.enabled = NO;
        [_maxButton setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
        _maxButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _maxButton;
}

#pragma mark --- Private Method
- (void)createUI
{
    [self addSubview:self.minButton];
    [self addSubview:self.maxButton];
    [self addSubview:self.mainSliderLine];
    [self addSubview:self.minSliderLine];
    [self addSubview:self.maxSliderLine];
    
    [self addSubview:self.minSlider];
    [self addSubview:self.maxSlider];
    
    self.padding = 5*SizeAdapter;
    self.showNoteLabel = YES;
    
}

- (void)panMinSliderButton:(UIPanGestureRecognizer *)pgr
{
    CGPoint point = [pgr translationInView:self];
    static CGPoint center;
    if (pgr.state == UIGestureRecognizerStateBegan) {
        center = pgr.view.center;
    }
    pgr.view.center = CGPointMake(center.x + point.x, center.y + point.y);
    pgr.view.cmam_centerY = self.cmam_height/2;
    
    CGFloat aaa ;
    if (self.showNoteLabel) {
        aaa = 2*self.padding+self.minButton.cmam_width;
    }else{
        aaa = 5*SizeAdapter;
    }
    if (self.sliderStyle == WYASliderStyleSingle) {
        if (pgr.view.cmam_right > self.mainSliderLine.cmam_right+self.minSlider.cmam_width/2) {
            pgr.view.cmam_right = self.mainSliderLine.cmam_right+self.minSlider.cmam_width/2;
        }else{
            if (pgr.view.cmam_centerX < aaa) {
                pgr.view.cmam_centerX = aaa;
            }
//            if (pgr.view.cmam_centerX > self.cmam_width-aaa) {
//                pgr.view.cmam_centerX = self.cmam_width-aaa;
//            }
        }
        self.minSliderLine.frame = CGRectMake(self.minSliderLine.cmam_left, self.minSliderLine.cmam_top,  pgr.view.cmam_centerX-self.minSliderLine.cmam_left, self.minSliderLine.cmam_height);
    }else if ( self.sliderStyle == WYASliderStyleDouble) {
        if (pgr.view.cmam_right > self.maxSlider.cmam_left) {
            pgr.view.cmam_right = self.maxSlider.cmam_left;
        }else{
            if (pgr.view.cmam_centerX < aaa) {
                pgr.view.cmam_centerX = aaa;
            }
            if (pgr.view.cmam_centerX > self.cmam_width-aaa) {
                pgr.view.cmam_centerX = self.cmam_width-aaa;
            }
        }
        self.minSliderLine.frame = CGRectMake(self.minSliderLine.cmam_left, self.minSliderLine.cmam_top,  pgr.view.cmam_centerX-self.minSliderLine.cmam_left, self.minSliderLine.cmam_height);
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
    pgr.view.center = CGPointMake(center.x + point.x, center.y + point.y);
    pgr.view.cmam_centerY = self.cmam_height/2;
    CGFloat aaa;
    if (self.showNoteLabel == YES) {
        aaa = 2*self.padding+self.minButton.cmam_width;
    }else{
        aaa = 5*SizeAdapter;
    }
    if (pgr.view.cmam_left < self.minSlider.cmam_right) {
        pgr.view.cmam_left = self.minSlider.cmam_right;
    }else{
        if (pgr.view.cmam_centerX < aaa) {
            pgr.view.cmam_centerX = aaa;
        }
        if (pgr.view.cmam_centerX > self.cmam_width-aaa) {
            pgr.view.cmam_centerX = self.cmam_width-aaa;
        }
    }
    self.maxSliderLine.frame = CGRectMake(pgr.view.cmam_centerX, self.maxSliderLine.cmam_top, self.cmam_width-pgr.view.cmam_centerX-aaa, self.maxSliderLine.cmam_height);
    [self valueMaxChange:pgr.view.cmam_left];
}

- (void)valueMinChange:(CGFloat)num
{
//    NSString * string = [NSString stringWithFormat:@"%.2f", self.minSliderLine.cmam_width/self.mainSliderLine.cmam_width];
    
    if (self.sliderStyle == WYASliderStyleSingle) {
//        [self.maxButton setTitle:string forState:UIControlStateNormal];
        self.currentMaxValue = self.minSliderLine.cmam_width/self.mainSliderLine.cmam_width;
    }else if (self.sliderStyle == WYASliderStyleDouble) {
//        [self.minButton setTitle:string forState:UIControlStateNormal];
        self.currentMinValue = self.minSliderLine.cmam_width/self.mainSliderLine.cmam_width;
    }
    
}

- (void)valueMaxChange:(CGFloat)num
{
//    NSString * string = [NSString stringWithFormat:@"%.2f",self.maxSliderLine.cmam_width/self.mainSliderLine.cmam_width];
//    [self.maxButton setTitle:string forState:UIControlStateNormal];
    self.currentMaxValue = self.maxSliderLine.cmam_width/self.mainSliderLine.cmam_width;
    
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
