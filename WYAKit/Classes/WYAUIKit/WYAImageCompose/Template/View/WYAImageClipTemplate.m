//
//  WYAImageClipTemplate.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/12.
//

#import "WYAImageClipTemplate.h"
#import "WYAImageComposeView.h"

@interface WYAImageClipTemplate ()
@property (nonatomic, strong) NSArray * points;
@property (nonatomic, strong) WYAImageComposeView * composeView;
@property (nonatomic, strong) CAShapeLayer * animationLayer;
@end

@implementation WYAImageClipTemplate {
    NSMutableArray * _xArray;
    NSMutableArray * _yArray;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

        [self addSubview:self.composeView];

        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panClick:)];
        [self addGestureRecognizer:pan];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (_xArray && _yArray) {
        CGFloat minWidth        = [(NSNumber *)[_xArray valueForKeyPath:@"@min.floatValue"] floatValue];
        CGFloat maxWidth        = [(NSNumber *)[_xArray valueForKeyPath:@"@max.floatValue"] floatValue];
        CGFloat minHeight       = [(NSNumber *)[_yArray valueForKeyPath:@"@min.floatValue"] floatValue];
        CGFloat maxHeight       = [(NSNumber *)[_yArray valueForKeyPath:@"@max.floatValue"] floatValue];
        self.composeView.center = CGPointMake((maxWidth - minWidth) / 2 + minWidth, (maxHeight - minHeight) / 2 + minHeight);
        self.composeView.bounds = CGRectMake(0, 0, maxWidth - minWidth, maxHeight - minHeight);
    } else {
        self.composeView.frame = CGRectZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if ([self checkPointInSelfWithPoint:point]) {
        return YES;
    }
    return NO;
}

#pragma mark ======= Public Method
- (void)addCoverLayerWithPoints:(NSArray *)points isTemplatePath:(BOOL)isTemplatePath
{
    self.composeView.hidden = isTemplatePath;
    self.points             = points;

    UIBezierPath * path      = [UIBezierPath bezierPath];
    path.usesEvenOddFillRule = YES;
    for (NSInteger index = 0; index < points.count; index++) {
        NSDictionary * dic = points[index];
        if (index == 0) {
            [path moveToPoint:CGPointMake([dic[@"point_x"] floatValue], [dic[@"point_y"] floatValue])];
        } else {
            [path addLineToPoint:CGPointMake([dic[@"point_x"] floatValue], [dic[@"point_y"] floatValue])];
        }
    }

    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.path           = path.CGPath;
    shapeLayer.fillRule       = kCAFillRuleEvenOdd;
    if (isTemplatePath) {
        shapeLayer.lineWidth   = 5;
        shapeLayer.strokeColor = [UIColor blackColor].CGColor;
        shapeLayer.fillColor   = [UIColor whiteColor].CGColor; //其他颜色都可以，只要不是透明的
        [self.layer addSublayer:shapeLayer];

    } else {
        shapeLayer.fillColor = [UIColor whiteColor].CGColor; //其他颜色都可以，只要不是透明的
        self.layer.mask      = shapeLayer;

        // 绘制判断区域
        CGMutablePathRef pathRef = CGPathCreateMutable();
        for (NSInteger index = 0; index < points.count; index++) {
            NSDictionary * dic = points[index];
            if (index == 0) {
                CGPathMoveToPoint(pathRef, NULL, [dic[@"point_x"] floatValue], [dic[@"point_y"] floatValue]);
            } else {
                CGPathAddLineToPoint(pathRef, NULL, [dic[@"point_x"] floatValue], [dic[@"point_y"] floatValue]);
            }
        }
        CGPathCloseSubpath(pathRef);
        self.pathRef = pathRef;
    }
}

- (void)wya_templateAddAnimationPath
{
    UIBezierPath * path      = [UIBezierPath bezierPath];
    path.usesEvenOddFillRule = YES;
    for (NSInteger index = 0; index < self.points.count; index++) {
        NSDictionary * dic = self.points[index];
        if (index == 0) {
            [path moveToPoint:CGPointMake([dic[@"point_x"] floatValue], [dic[@"point_y"] floatValue])];
        } else {
            [path addLineToPoint:CGPointMake([dic[@"point_x"] floatValue], [dic[@"point_y"] floatValue])];
        }
    }

    self.animationLayer = [CAShapeLayer layer];

    [self.animationLayer setFillColor:[UIColor clearColor].CGColor];

    //  设置虚线颜色为
    [self.animationLayer setStrokeColor:[UIColor redColor].CGColor];

    //  设置虚线宽度
    [self.animationLayer setLineWidth:5];
    [self.animationLayer setLineJoin:kCALineJoinRound];

    //  设置线宽，线间距
    [self.animationLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:20], [NSNumber numberWithInt:10], nil]];

    self.animationLayer.path = path.CGPath;

    //  把绘制好的虚线添加上来
    [self.layer addSublayer:self.animationLayer];

    CABasicAnimation * dashAnimation = [CABasicAnimation animationWithKeyPath:@"lineDashPhase"];
    [dashAnimation setFromValue:[NSNumber numberWithFloat:0.0f]];
    [dashAnimation setToValue:[NSNumber numberWithFloat:300.f]];
    [dashAnimation setDuration:4.f];
    dashAnimation.cumulative = YES;
    [dashAnimation setRepeatCount:MAXFLOAT];
    dashAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.animationLayer addAnimation:dashAnimation forKey:@"linePhase"];
    self.haveAnimationShapeLayer = YES;
}

- (void)wya_templateRemoveAnimationPath
{
    if (self.animationLayer) {
        [self.animationLayer removeAnimationForKey:@"linePhase"];
        [self.animationLayer removeFromSuperlayer];
        self.animationLayer          = nil;
        self.haveAnimationShapeLayer = NO;
    }
}

#pragma mark ======= Private Method
- (void)panClick:(UIPanGestureRecognizer *)gesture
{
    WYAImageClipTemplate * piece = (WYAImageClipTemplate *)[gesture view];
    CGPoint point                = [gesture locationInView:piece];
    if ([gesture state] == UIGestureRecognizerStateBegan || [gesture state] == UIGestureRecognizerStateChanged) {
        if (self.panClick) {
            self.panClick(point, self, YES);
        }
        CGPoint translation = [gesture translationInView:piece];
        //        NSLog(@"translation==%@",NSStringFromCGPoint(translation));
        self.composeView.center = CGPointMake(self.composeView.center.x + translation.x, self.composeView.center.y + translation.y);

        [gesture setTranslation:CGPointZero inView:piece];
    } else {
        if (self.panClick) {
            self.panClick(point, self, NO);
        }
        if (self.resetImageFrame) {
            self.composeView.frame = self.bounds;
        }
    }
}

- (BOOL)checkPointInSelfWithPoint:(CGPoint)point
{
    CGMutablePathRef pathRef = CGPathCreateMutable();
    for (NSInteger index = 0; index < self.points.count; index++) {
        NSDictionary * dic = self.points[index];
        if (index == 0) {
            CGPathMoveToPoint(pathRef, NULL, [dic[@"point_x"] floatValue], [dic[@"point_y"] floatValue]);
        } else {
            CGPathAddLineToPoint(pathRef, NULL, [dic[@"point_x"] floatValue], [dic[@"point_y"] floatValue]);
        }
    }
    CGPathCloseSubpath(pathRef);

    if (CGPathContainsPoint(pathRef, NULL, point, NO)) {
        return YES;
    }
    return NO;
}

- (void)findMinWidth
{
}

- (void)findMaxWidth
{
}

#pragma mark ======= Setter
- (void)setImage:(UIImage *)image
{
    _image = image;
    if (image) {
        self.composeView.image = image;
    }
}

- (void)setPoints:(NSArray *)points
{
    _points = points;
    _xArray = [NSMutableArray array];
    _yArray = [NSMutableArray array];
    for (NSDictionary * dic in points) {
        [_xArray addObject:dic[@"point_x"]];
        [_yArray addObject:dic[@"point_y"]];
    }
}

#pragma mark ======= Getter
- (NSArray *)templatePoints
{
    return [self.points copy];
}

- (WYAImageComposeView *)composeView
{
    if (!_composeView) {
        _composeView = ({
            WYAImageComposeView * object = [[WYAImageComposeView alloc] init];
            object;
        });
    }
    return _composeView;
}

@end
