

#import "WYACameraRecordProcessView.h"

@interface WYACameraRecordProcessView()

@property (nonatomic, assign) CGPoint cicleCenter;
@property (nonatomic, assign) CGFloat cicleRadius;
@end

@implementation WYACameraRecordProcessView
- (instancetype)initWithCenter:(CGPoint )center radius:(CGFloat)radius
{
  if(self = [super init])
  {
      self.cicleCenter = center;
      self.cicleRadius = radius;
      self.backgroundColor = [UIColor clearColor];
  }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
     //获取上下文
    CGContextRef context =  UIGraphicsGetCurrentContext();
    CGPoint center = self.cicleCenter;  //设置圆心位置
    CGFloat radius = self.cicleRadius;  //设置半径
    CGFloat startA = -M_PI_2;  //圆起点位置
    CGFloat endA = -M_PI_2 + M_PI * 2*self.progress;  //圆终点位置
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    CGContextSetLineWidth(context, lineWith*0.5); //设置线条宽度
    [[UIColor greenColor] setStroke]; //设置描边颜色
    CGContextAddPath(context, path.CGPath); //把路径添加到上下文
    CGContextStrokePath(context);  //渲染
    
}
@end
