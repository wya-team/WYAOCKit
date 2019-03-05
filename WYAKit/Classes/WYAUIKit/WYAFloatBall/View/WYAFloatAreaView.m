//
//  WYAFloatAreaView.m
//  AFNetworking
//
//  Created by 李俊恒 on 2019/2/28.
//

#import "WYAFloatAreaView.h"

@interface WYAFloatAreaView ()
@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign) CGFloat radius_0;
@property (nonatomic, assign) CGFloat radius_1;
@property (nonatomic, assign) CGFloat KCoef;
@end

@implementation WYAFloatAreaView
#pragma mark ======= LifeCircle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.8];
        self.title           = @"拖动到此 开启浮窗";
        self.radius_0        = 18;
        self.radius_1        = 10;
        self.KCoef           = 0.95;
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.radius_0 = self.highlight ? 20 : 18;
    self.radius_1 = self.highlight ? 12 : 10;
    self.KCoef    = self.highlight ? 1 : 0.95;

    CGFloat width  = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;

    UIBezierPath * maskPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width, width)
                                                             radius:width * self.KCoef
                                                         startAngle:M_PI
                                                           endAngle:M_PI * 1.5
                                                          clockwise:1];
    [maskPath addLineToPoint:CGPointMake(width, width)];
    CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame          = self.bounds;
    maskLayer.path           = maskPath.CGPath;
    self.layer.mask          = maskLayer;

    NSMutableParagraphStyle * textStyle = [[NSMutableParagraphStyle alloc] init];
    textStyle.alignment                 = NSTextAlignmentCenter;

    NSDictionary * attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:14], NSForegroundColorAttributeName : [UIColor whiteColor], NSParagraphStyleAttributeName : textStyle};

    [_title drawInRect:CGRectMake(0, height * 3 / 4, width, 20) withAttributes:attributes];

    UIBezierPath * ring0 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width / 2, height / 2) radius:_radius_0 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    ring0.lineWidth      = 3;
    [ring0 stroke];

    UIBezierPath * ring1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width / 2, height / 2) radius:_radius_1 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    ring1.lineWidth      = 3;
    [ring1 stroke];
}

#pragma mark ======= setter
- (void)setHighlight:(BOOL)highlight {
    _highlight = highlight;
    [self setNeedsDisplay];
    if (highlight) {
        UIImpactFeedbackGenerator * impactLight = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
        [impactLight impactOccurred];
    }
}
- (void)setStyle:(WYAFloatAreaViewStyle)style {
    _style = style;
    if (style == WYAFloatAreaViewStyle_default) {
        self.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.8];
        self.title           = self.highlight ? @"释放开启浮窗" : @"拖动到此 开启浮窗";
    } else if (style == WYAFloatAreaViewStyle_cancel) {
        self.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.8];
        self.title           = self.highlight ? @"释放关闭浮窗" : @"拖动到此 关闭浮窗";
    }
}
@end
