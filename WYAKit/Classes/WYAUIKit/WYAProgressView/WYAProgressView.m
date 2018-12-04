//
//  WYAProgress.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/4.
//

#import "WYAProgressView.h"

const NSString * ProgressFrame = @"ProgressFrame";
const NSString * ProgressCenter = @"ProgressCenter";
const NSString * ProgressBounds = @"ProgressBounds";

@interface WYAProgressView ()
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) CAShapeLayer * outLayer;
@property (nonatomic, strong) CAShapeLayer * progressLayer;
@end

@implementation WYAProgressView

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
    self.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.layer.masksToBounds = YES;
    
    self.imageView = [[UIImageView alloc]init];
    self.imageView.backgroundColor = [UIColor whiteColor];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.imageView];
    self.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    self.outLayer = [CAShapeLayer layer];
    self.outLayer.fillColor =  [UIColor clearColor].CGColor;
    self.outLayer.lineCap = kCALineCapRound;
    [self.layer addSublayer:self.outLayer];
    
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.lineCap = kCALineCapRound;
    [self.layer addSublayer:self.progressLayer];
    
    [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew context:nil];
    
    self.trackTintColor = [UIColor grayColor];
    self.progressTintColor = [UIColor redColor];
    self.borderWidth = 5;
    self.progress = 0;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"frame"] || [keyPath isEqualToString:@"center"] || [keyPath isEqualToString:@"bounds"]) {
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - Public Method -
-(void)wya_setProgress:(CGFloat)progress Animation:(BOOL)animation{
    if (animation) {
        [CATransaction begin];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
        [CATransaction setAnimationDuration:0.5];
        if (progress>1) {
            self.progress = 1;
        }else{
            self.progress = progress;
        }
        
        [CATransaction commit];
    }else {
        self.progress = progress;
    }
}

#pragma mark - Setter -
-(void)setBackGroundImage:(UIImage *)backGroundImage{
    _backGroundImage = backGroundImage;
    if (backGroundImage) {
        self.imageView.image = backGroundImage;
    }
}
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
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    self.progressLayer.strokeEnd = progress;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
