//
//  WYAProgress.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/4.
//

#import "WYAProgress.h"

@interface WYAProgress ()
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) CAShapeLayer * outLayer;
@property (nonatomic, strong) CAShapeLayer * progressLayer;
@end

@implementation WYAProgress

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
    self.layer.cornerRadius = self.cmam_height/2;
    self.layer.masksToBounds = YES;
    self.imageView.frame = self.bounds;
    
    CGRect rect = {self.borderWidth / 2, self.borderWidth / 2,
        self.frame.size.width - self.borderWidth, self.frame.size.height - self.borderWidth};
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    self.outLayer.path = path.CGPath;
    self.progressLayer.path = path.CGPath;
}

#pragma mark - Private Method -
- (void)createUI{
    self.backgroundColor = [UIColor clearColor];
    
    self.imageView = [[UIImageView alloc]init];
    self.imageView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.imageView];
    
    self.outLayer = [CAShapeLayer layer];
    self.outLayer.fillColor =  [UIColor clearColor].CGColor;
    self.outLayer.lineCap = kCALineCapRound;
    [self.layer addSublayer:self.outLayer];
    
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.lineCap = kCALineCapRound;
    [self.layer addSublayer:self.progressLayer];
    
    self.trackTintColor = [UIColor grayColor];
    self.progressTintColor = [UIColor redColor];
    self.borderWidth = 5;
}

#pragma mark - Setter -
-(void)setTrackTintColor:(UIColor *)trackTintColor{
    _trackTintColor = trackTintColor;
    if (trackTintColor) {
        self.outLayer.strokeColor = trackTintColor.CGColor;
    }
}

-(void)setProgressTintColor:(UIColor *)progressTintColor{
    _progressTintColor = progressTintColor;
    if (progressTintColor) {
        self.progressLayer.strokeColor = progressTintColor.CGColor;
    }
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    self.outLayer.lineWidth = borderWidth;
    self.progressLayer.lineWidth = borderWidth;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
