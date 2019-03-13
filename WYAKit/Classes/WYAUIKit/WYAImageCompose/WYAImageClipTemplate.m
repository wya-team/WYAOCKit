//
//  WYAImageClipTemplate.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/12.
//

#import "WYAImageClipTemplate.h"

@implementation WYAImageClipTemplate

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)addCoverLayerWithPoints:(NSArray *)points isTemplatePath:(BOOL)isTemplatePath{

    UIBezierPath *path = [UIBezierPath bezierPath];
    path.usesEvenOddFillRule = YES;
    for (NSInteger index = 0; index<points.count; index++) {
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


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

}


@end
