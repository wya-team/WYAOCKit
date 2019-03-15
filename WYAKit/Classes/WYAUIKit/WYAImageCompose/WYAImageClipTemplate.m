//
//  WYAImageClipTemplate.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/12.
//

#import "WYAImageClipTemplate.h"

@interface WYAImageClipTemplate ()
@property(nonatomic, strong) NSArray * points;
@end

@implementation WYAImageClipTemplate

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    if ([self checkPointInSelfWithPoint:point]) {
        NSLog(@"是");
        return YES;
    }
    NSLog(@"否");
    return NO;
}

#pragma mark ======= Public Method
- (void)addCoverLayerWithPoints:(NSArray *)points isTemplatePath:(BOOL)isTemplatePath{

    self.points = points;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.usesEvenOddFillRule = YES;
    for (NSInteger index = 0; index < points.count; index++) {
        NSDictionary * dic = points[index];
        if (index == 0) {
            [path moveToPoint:CGPointMake([dic[@"point_x"] floatValue], [dic[@"point_y"] floatValue])];
        }else{
            [path addLineToPoint:CGPointMake([dic[@"point_x"] floatValue], [dic[@"point_y"] floatValue])];
        }
    }

    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillRule = kCAFillRuleEvenOdd;
    if (isTemplatePath) {
        shapeLayer.lineWidth = 5;
        shapeLayer.strokeColor = [UIColor blackColor].CGColor;
        shapeLayer.fillColor = [UIColor whiteColor].CGColor;  //其他颜色都可以，只要不是透明的
        [self.layer addSublayer:shapeLayer];
    }else{
        shapeLayer.fillColor = [UIColor whiteColor].CGColor;  //其他颜色都可以，只要不是透明的
        self.layer.mask = shapeLayer;
    }

    //    CGFloat width = 200;
    //    CGFloat point_x = self.cmam_width/4;
    //    UIBezierPath *path = [UIBezierPath bezierPath];
    //    path.usesEvenOddFillRule = YES;
    //    [path moveToPoint:CGPointMake(point_x, point_x)];
    //    [path addLineToPoint:CGPointMake(point_x + width/2, point_x + width)];
    //    [path addLineToPoint:CGPointMake(point_x + width, point_x)];
    //    [path addLineToPoint:CGPointMake(point_x, point_x)];
    //
    //
    //    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    //    shapeLayer.path = path.CGPath;
    //    shapeLayer.fillColor = [UIColor whiteColor].CGColor;  //其他颜色都可以，只要不是透明的
    //    shapeLayer.fillRule = kCAFillRuleEvenOdd;
    //    self.layer.mask = shapeLayer;

}

- (void)wya_templateAnimationWithView:(UIView *)view point:(CGPoint)point{
//    NSLog(@"移动中");
    BOOL contains = [self checkPointInSelfWithPoint:point];
    NSLog(@"contains==%d",contains);
    NSLog(@"point==%@",NSStringFromCGPoint(point));
    if (self != view && contains) {
        NSLog(@"是这个视图");
    }
}

#pragma mark ======= Private Method
- (BOOL)checkPointInSelfWithPoint:(CGPoint)point{
    CGMutablePathRef pathRef = CGPathCreateMutable();
    for (NSInteger index = 0; index < self.points.count; index++) {
        NSDictionary * dic = self.points[index];
        if (index == 0) {
            CGPathMoveToPoint(pathRef, NULL, [dic[@"point_x"] floatValue], [dic[@"point_y"] floatValue]);
        }else{
            CGPathAddLineToPoint(pathRef, NULL, [dic[@"point_x"] floatValue], [dic[@"point_y"] floatValue]);
        }
    }
    CGPathCloseSubpath(pathRef);

    if (CGPathContainsPoint(pathRef, NULL, point, NO)) {
        return YES;
    }
    return NO;
}

#pragma mark ======= Getter
- (NSArray *)templatePoints{
    return [self.points copy];
}

@end
