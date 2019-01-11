//
//  WYAProgress.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/4.
//

#import "WYAProgressView.h"
#define WYACircleDegreeToRadian(d) ((d)*M_PI) / 180.0

@interface WYAProgressView () <CAAnimationDelegate>
@property (nonatomic, strong) CAShapeLayer * backLayer;
@property (nonatomic, strong) CAShapeLayer * progressLayer;

@property (nonatomic, assign) CGFloat radius;       //半径
@property (nonatomic, assign) CGFloat lastProgress; /**<上次进度 0-1 */
@property (nonatomic, strong) CAAnimation * lastPointAnimation;
//角度相关
@property (nonatomic, assign)
    CGFloat startAngle;                            /**<起点角度。角度从水平右侧开始为0，顺时针为增加角度。直接传度数 如-90 */
@property (nonatomic, assign) CGFloat reduceAngle; /**<减少的角度 直接传度数 如30*/
@property (nonatomic, assign) CGFloat duration;    /**<动画时长*/

@property (nonatomic, assign) BOOL increaseFromLast; /**<是否从上次数值开始动画，默认为NO*/
@property (nonatomic, strong) UIImageView * bgImageView;
@property (nonatomic, assign) WYAProgressViewStyle style;
@end

@implementation WYAProgressView

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self initialization];
//    }
//    return self;
//}
//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.style = WYAProgressViewStyleStraight;
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame progressViewStyle:(WYAProgressViewStyle)style {
    if (self = [super initWithFrame:frame]) {
        self.style = style;
        [self initialization];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.style == WYAProgressViewStyleStraight) {
        CGFloat bgImageView_X      = 0;
        CGFloat bgImageView_Y      = 0;
        CGFloat bgImageView_Width  = self.cmam_width * self.progress;
        CGFloat bgImageView_Height = self.cmam_height;
        self.bgImageView.frame =
            CGRectMake(bgImageView_X, bgImageView_Y, bgImageView_Width, bgImageView_Height);
    } else if (self.style == WYAProgressViewStyleCircle) {
        CGFloat bgImageView_X      = self.borderWidth;
        CGFloat bgImageView_Y      = self.borderWidth;
        CGFloat bgImageView_Width  = self.cmam_width - self.borderWidth * 2;
        CGFloat bgImageView_Height = self.cmam_width - self.borderWidth * 2;
        self.bgImageView.frame =
            CGRectMake(bgImageView_X, bgImageView_Y, bgImageView_Width, bgImageView_Height);

        self.bgImageView.layer.cornerRadius = (self.cmam_width - self.borderWidth * 2) / 2;
    }
}

#pragma mark - Private Method -
- (void)initialization {
    self.backgroundColor = [UIColor whiteColor];
    _trackTintColor      = [UIColor lightGrayColor];
    _progressTintColor   = [UIColor wya_hex:@"#108DE7"];
    if (self.style == WYAProgressViewStyleStraight) {
    } else if (self.style == WYAProgressViewStyleCircle) {
        _borderWidth = 5;                            //线宽默认为5
        _startAngle  = WYACircleDegreeToRadian(270); //圆起点位置
        _reduceAngle = WYACircleDegreeToRadian(0);   //整个圆缺少的角度
        _radius      = self.cmam_width / 2.0 - self.borderWidth / 2.0;
    }

    _duration = 1.5; //动画时长

    _lastProgress = 0;
    self.progress = 0;
    [self addSubview:self.bgImageView];
}

#pragma mark - Public Method -
- (void)wya_setProgress:(CGFloat)progress Animation:(BOOL)animation {
    if (animation) {
        [self startAnimation:progress];
    } else {
        self.progress = progress;
    }
}

#pragma mark - Getter -
- (CAShapeLayer *)backLayer {
    if (!_backLayer) {
        _backLayer             = [CAShapeLayer layer];
        _backLayer.frame       = CGRectMake(0, 0, self.cmam_width, self.cmam_width);
        _backLayer.fillColor   = [UIColor clearColor].CGColor; //填充色
        _backLayer.lineWidth   = self.borderWidth;
        _backLayer.strokeColor = _trackTintColor.CGColor;
        _backLayer.lineCap     = @"round";

        UIBezierPath * backCirclePath = [self getNewBezierPath];
        _backLayer.path               = backCirclePath.CGPath;
    }
    return _backLayer;
}

- (CAShapeLayer *)progressLayer {
    if (!_progressLayer) {
        _progressLayer       = [CAShapeLayer layer];
        _progressLayer.frame = CGRectMake(0, 0, self.cmam_width, self.cmam_width);

        _progressLayer.fillColor   = [UIColor clearColor].CGColor; //填充色
        _progressLayer.lineWidth   = self.borderWidth;
        _progressLayer.strokeColor = _progressTintColor.CGColor;
        _progressLayer.lineCap     = @"round";

        UIBezierPath * circlePath = [self getNewBezierPath];
        _progressLayer.path       = circlePath.CGPath;
        _progressLayer.strokeEnd  = 0.0;
    }
    return _progressLayer;
}

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
        if (self.style == WYAProgressViewStyleStraight) {
            _bgImageView.layer.masksToBounds = NO;
        } else if (self.style == WYAProgressViewStyleCircle) {
            _bgImageView.layer.masksToBounds = YES;
        }
    }
    return _bgImageView;
}

#pragma mark - Setter -
- (void)setStartAngle:(CGFloat)startAngle {
    if (_startAngle != WYACircleDegreeToRadian(startAngle)) {
        _startAngle = WYACircleDegreeToRadian(startAngle);

        //如果已经创建了相关layer则重新创建
        if (_backLayer) {
            UIBezierPath * backCirclePath = [self getNewBezierPath];
            _backLayer.path               = backCirclePath.CGPath;
        }

        if (_progressLayer) {
            UIBezierPath * circlePath = [self getNewBezierPath];
            _progressLayer.path       = circlePath.CGPath;
            _progressLayer.strokeEnd  = 0.0;
        }
    }
}

- (void)setReduceAngle:(CGFloat)reduceAngle {
    if (_reduceAngle != WYACircleDegreeToRadian(reduceAngle)) {
        if (reduceAngle >= 360) { return; }
        _reduceAngle = WYACircleDegreeToRadian(reduceAngle);

        if (_backLayer) {
            UIBezierPath * backCirclePath = [self getNewBezierPath];
            _backLayer.path               = backCirclePath.CGPath;
        }

        if (_progressLayer) {
            UIBezierPath * circlePath = [self getNewBezierPath];
            _progressLayer.path       = circlePath.CGPath;
            _progressLayer.strokeEnd  = 0.0;
        }
    }
}

- (void)setBackGroundImage:(UIImage *)backGroundImage {
    if (backGroundImage) { self.bgImageView.image = backGroundImage; }
}

- (void)setTrackTintColor:(UIColor *)trackTintColor {
    if (_trackTintColor != trackTintColor) {
        _trackTintColor = trackTintColor;
        if (self.style == WYAProgressViewStyleStraight) {
            self.backgroundColor = _trackTintColor;
        } else if (self.style == WYAProgressViewStyleCircle) {
            if (_backLayer) { _backLayer.strokeColor = _trackTintColor.CGColor; }
        }
    }
}

- (void)setProgressTintColor:(UIColor *)progressTintColor {
    if (_progressTintColor != progressTintColor) {
        _progressTintColor = progressTintColor;
        if (self.style == WYAProgressViewStyleStraight) {
            self.bgImageView.backgroundColor = _progressTintColor;
        } else if (self.style == WYAProgressViewStyleCircle) {
            if (_progressLayer) { _progressLayer.strokeColor = _progressTintColor.CGColor; }
        }
    }
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    if (_borderWidth != borderWidth) {
        _borderWidth = borderWidth;

        _radius = self.cmam_width / 2.0 - _borderWidth / 2.0;

        //设置线宽之后会导致radius改变，因此需要修改使用过strokeWidth和radius的属性
        if (_backLayer) {
            _backLayer.lineWidth          = _borderWidth;
            UIBezierPath * backCirclePath = [self getNewBezierPath];
            _backLayer.path               = backCirclePath.CGPath;
        }

        if (_progressLayer) {
            _progressLayer.lineWidth  = _borderWidth;
            UIBezierPath * circlePath = [self getNewBezierPath];
            _progressLayer.path       = circlePath.CGPath;
            _progressLayer.strokeEnd  = 0.0;
        }
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    if (_progress < 0) { _progress = 0; }
    if (_progress > 1) { _progress = 1; }

    if (self.style == WYAProgressViewStyleCircle) {
        //准备好显示
        if (!self.backLayer.superlayer) { [self.layer addSublayer:self.backLayer]; }

        if (!self.progressLayer.superlayer) { [self.layer addSublayer:self.progressLayer]; }
        self.progressLayer.strokeEnd = _progress;
    } else if (self.style == WYAProgressViewStyleStraight) {
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}

- (void)startAnimation:(CGFloat)prog {
    //线条动画
    CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration           = _duration;
    pathAnimation.timingFunction =
        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.fromValue           = [NSNumber numberWithFloat:_lastProgress];
    pathAnimation.toValue             = [NSNumber numberWithFloat:prog];
    pathAnimation.fillMode            = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    [self.progressLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];

    _lastProgress = prog;
}

//刷新最新路径
- (UIBezierPath *)getNewBezierPath {
    if (self.style == WYAProgressViewStyleStraight) {
        return [UIBezierPath bezierPath];
    } else if (self.style == WYAProgressViewStyleCircle) {
        return [UIBezierPath
            bezierPathWithArcCenter:CGPointMake(self.cmam_width / 2.0, self.cmam_width / 2.0)
                             radius:_radius
                         startAngle:_startAngle
                           endAngle:(2 * M_PI - _reduceAngle + _startAngle)
                          clockwise:YES];
    } else {
        return nil;
    }
}

@end
