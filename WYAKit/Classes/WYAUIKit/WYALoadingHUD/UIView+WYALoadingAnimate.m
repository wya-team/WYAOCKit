//
//  UIView+WYALoadingAnimate.m
//  AFNetworking
//
//  Created by 李雪峰 on 2019/5/30.
//

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

#import "UIView+WYALoadingAnimate.h"
#import <CoreText/CoreText.h>
#import <objc/runtime.h>
static NSString * _timerName = @"WYALoadingAnimateTimerName";

@interface UIView (WYAAnimatePrivate)
@property (nonatomic, strong) CAShapeLayer * textBgPathLayer;//文字路径背景图层
@property (nonatomic, strong) CAShapeLayer * textPathLayer;//文字路径图层
@property (nonatomic, strong) NSMutableDictionary * timerContainer;//保证计时器不被释放
@end

@implementation UIView (WYAAnimatePrivate)

#pragma mark --------- runtime 动态添加属性
- (void)setTextPathLayer:(CALayer *)textPathLayer{
    
    objc_setAssociatedObject(self, @selector(textPathLayer), textPathLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (CALayer *)textPathLayer{
    
    return objc_getAssociatedObject(self, @selector(textPathLayer));
    
}

- (void)setTextBgPathLayer:(CALayer *)textBgPathLayer{
    
    objc_setAssociatedObject(self, @selector(textBgPathLayer), textBgPathLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (CALayer *)textBgPathLayer{
    
    return objc_getAssociatedObject(self, @selector(textBgPathLayer));
    
}

- (NSMutableDictionary *)timerContainer{
    
    return objc_getAssociatedObject(self, @selector(timerContainer));
    
}

- (void)setTimerContainer:(NSMutableDictionary *)timerContainer{
    
    objc_setAssociatedObject(self, @selector(timerContainer), timerContainer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

@end

@implementation UIView (WYALoadingAnimate)

- (void)drawWordAnimationWithText:(NSString *)text{
    
    [self drawWordAnimationWithSize:CGSizeMake(0, 0) text:text font:nil startColor:nil endColor:nil position:WYALoadingPositionCenter];
    
}

- (void)drawWordAnimationWithText:(NSString *)text
                         fontSize:(CGFloat)fontSize{
    
    [self drawWordAnimationWithSize:CGSizeMake(0, 0) text:text fontSize:fontSize position:WYALoadingPositionCenter];
    
}

- (void)drawWordAnimationWithSize:(CGSize)size text:(NSString *)text position:(WYALoadingPosition)position{
    
    [self drawWordAnimationWithSize:size text:text font:nil startColor:nil endColor:nil position:position];
    
}


- (void)drawWordAnimationWithSize:(CGSize)size text:(NSString *)text fontSize:(CGFloat)fontSize position:(WYALoadingPosition)position{
    
    [self drawWordAnimationWithSize:size text:text font:[UIFont fontWithName:@"Pusab" size:fontSize] startColor:nil endColor:nil position:position];
    
}

- (void)drawWordAnimationWithSize:(CGSize)size text:(NSString *)text fontSize:(CGFloat)fontSize position:(WYALoadingPosition)position startColor:(UIColor *)startColor endColor:(UIColor *)endColor{
    
    [self drawWordAnimationWithSize:size text:text font:[UIFont fontWithName:@"Pusab" size:fontSize] startColor:startColor endColor:endColor position:position];
    
}

- (void)drawWordAnimationWithSize:(CGSize)size text:(NSString *)text font:(UIFont *)font position:(WYALoadingPosition)position{
    
    [self drawWordAnimationWithSize:size text:text font:font startColor:nil endColor:nil position:position];
    
}


- (void)drawWordAnimationWithSize:(CGSize)size
                             Text:(NSString *)text
                             font:(UIFont *)font{
    
    [self drawWordAnimationWithSize:size text:text font:font startColor:nil endColor:nil position:WYALoadingPositionCenter];
    
}


- (void)drawWordAnimationWithSize:(CGSize)size
                             text:(NSString *)text
                             font:(UIFont *)font
                       startColor:(UIColor *)startColor
                         endColor:(UIColor *)endColor{
    
    [self drawWordAnimationWithSize:size text:text font:font startColor:startColor endColor:endColor position:WYALoadingPositionCenter];
    
}

- (void)drawWordAnimationWithSize:(CGSize)size
                             text:(NSString *)text
                             font:(UIFont *)font
                       startColor:(UIColor *)startColor
                         endColor:(UIColor *)endColor
                         position:(WYALoadingPosition)position{
    NSString * showText = text? : @"WYA";
    UIColor * showStartColor = startColor? : [UIColor colorWithWhite:0.85 alpha:1];
    UIColor * showEndColor = endColor? : [UIColor redColor];
    UIFont * showFont = font ?: [UIFont fontWithName:@"Pusab" size:40];
    if (showFont == nil){
        showFont = [UIFont systemFontOfSize:40];
    }
    CGSize showSize = CGSizeEqualToSize(size, CGSizeMake(0, 0)) ? [showText sizeWithAttributes:@{NSFontAttributeName:showFont}] : size;
    CGRect showFrame = [self getShowFrame:CGRectMake(0, 0, showSize.width, showSize.height) position:position];
    
    [self startTimerShowAnimateWithFrame:showFrame text:showText font:showFont startColor:showStartColor endColor:showEndColor];
    
}

- (void)startTimerShowAnimateWithFrame:(CGRect)frame
                                  text:(NSString *)text
                                  font:(UIFont *)font
                            startColor:(UIColor *)startColor
                              endColor:(UIColor *)endColor{
    
    if (self.timerContainer == nil) {
        self.timerContainer = [[NSMutableDictionary alloc] init];
    }
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = [self.timerContainer objectForKey:_timerName];
    if (!timer) {
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        [self.timerContainer setObject:timer forKey:_timerName];//强引用
    }
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), [WYALoadingHUD shareInstance].customDuration * NSEC_PER_SEC, 0);
    __weak typeof(self) weakSelf = self;
    __block BOOL isErasure = NO;
    dispatch_source_set_event_handler(timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf startDrawGraphWithFrame:frame text:text font:font startColor:startColor endColor:endColor isErasure:isErasure];
            isErasure = !isErasure;
        });
    });
    dispatch_resume(timer);
    
}


//计时器开始启动绘画事件,原理说明：初始化背景图层，不要动画，后续交错有动画地覆盖有色图层与背景图层（注意：同一时刻最多保留两个图层），当前实现方案是为了防止之前来回播放动画中间的闪烁
- (void)startDrawGraphWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font startColor:(UIColor *)startColor endColor:(UIColor *)endColor isErasure:(BOOL)isErasure{
    
    if ([WYALoadingHUD shareInstance].animateDirection == WYALoadingGraphDirectionEndToEnd) {
        
        // 创建文字路径
        UIBezierPath *path = [self getBezierPathWithText:text font:font];
        NSString * keyPath = @"strokeEnd";
        
        //移除最先的一个图层（共三个图层，同时显示在视图上仅允许有两个图层），并在新加图层上添加动画效果
        if (!isErasure){
            if (self.textPathLayer) {
                [self.textPathLayer removeFromSuperlayer];
                self.textPathLayer = nil;
            }
            self.textPathLayer = [self getShapeLayerWithFrame:frame color:endColor path:path font:font];
            if (!self.textBgPathLayer) {
                self.textBgPathLayer = [self getShapeLayerWithFrame:frame color:startColor path:path font:font];
            }
            [self.layer addSublayer:self.textBgPathLayer];
            [self.layer addSublayer:self.textPathLayer];
        }else{
            keyPath = @"strokeStart";
            if (self.textBgPathLayer) {
                [self.textBgPathLayer removeFromSuperlayer];
                self.textBgPathLayer = nil;
            }
            // 创建文字路径背景路径图层
            self.textBgPathLayer = [self getShapeLayerWithFrame:frame color:startColor path:path font:font];
            if (!self.textPathLayer) {
                self.textPathLayer = [self getShapeLayerWithFrame:frame color:endColor path:path font:font];
            }
            [self.layer addSublayer:self.textPathLayer];
            [self.layer addSublayer:self.textBgPathLayer];//注意图层添加顺序
        }
        //绘图动画
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:keyPath];
        pathAnimation.duration = [WYALoadingHUD shareInstance].customDuration;
        pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        pathAnimation.removedOnCompletion = YES;
        
        if (isErasure) {
            //擦除动画
            pathAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
            pathAnimation.toValue = [NSNumber numberWithFloat:0.0f];
            [self.textBgPathLayer addAnimation:pathAnimation forKey:keyPath];
        }else{
            [self.textPathLayer addAnimation:pathAnimation forKey:keyPath];
        }
    }
    else
    {
        // 创建文字路径
        UIBezierPath *path = [self getBezierPathWithText:text font:font];
        
        if (!self.textBgPathLayer) {
            self.textBgPathLayer = [self getShapeLayerWithFrame:frame color:startColor path:path font:font];
            [self.layer addSublayer:self.textBgPathLayer];//注意图层添加顺序
        }
        
        if (self.textPathLayer) {
            [self.textPathLayer removeFromSuperlayer];
            self.textPathLayer = nil;
        }
        
        //在添加1-0动画的时候，会先闪烁一下当前动画(刚要结束的这个动画)最后的效果图
        UIColor *testColor = [UIColor blackColor];
        if (isErasure) {
            endColor = testColor;
        }
        
        self.textPathLayer = [self getShapeLayerWithFrame:frame color:endColor path:path font:font];
        
        NSString * keyPath = @"strokeEnd";
        
        //绘图动画
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:keyPath];
        pathAnimation.duration = [WYALoadingHUD shareInstance].customDuration;
        pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        pathAnimation.removedOnCompletion = YES;
        pathAnimation.delegate = self;
        [self.textPathLayer addAnimation:pathAnimation forKey:@"keyPath"];
        [self.layer addSublayer:self.textPathLayer];
    }
    
}

//隐藏loading
- (void)hideWYALoading{
    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    [self cancelTimer];
    
}

//停止计时器
- (void)cancelTimer{
    
    dispatch_source_t timer = [self.timerContainer objectForKey:_timerName];
    if (!timer) {
        return;
    }
    
    [self.timerContainer removeObjectForKey:_timerName];
    dispatch_source_cancel(timer);
    
}


#pragma mark ------- 工具方法
//创建文字路径图层
- (CAShapeLayer *)getShapeLayerWithFrame:(CGRect)frame color:(UIColor *)color path:(UIBezierPath *)path font:(UIFont *)font{
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.frame = frame;
    layer.bounds = CGPathGetBoundingBox(path.CGPath);
    layer.geometryFlipped = NO;
    layer.path = path.CGPath;
    layer.strokeColor = color.CGColor;
    layer.fillColor = nil;
    layer.lineWidth = font.capHeight/18.0;
    layer.lineJoin = kCALineJoinRound;
    return layer;
    
}

//获取动画最终展示的Frame
- (CGRect)getShowFrame:(CGRect)frame position:(WYALoadingPosition)position{
    
    //动画位置
    WYALoadingPosition showPosition = position? : [WYALoadingHUD shareInstance].position;
    CGRect showFrame = frame;
    
    CGFloat boundsCenterX = self.bounds.size.width/2;
    CGFloat boundsCenterY = self.bounds.size.height/2;
    
    //设置frame
    switch (showPosition) {
        case WYALoadingPositionCenter:
            showFrame.origin.x = boundsCenterX - showFrame.size.width/2;
            showFrame.origin.y = boundsCenterY - showFrame.size.height/2;
            break;
        case WYALoadingPositionTop:
            showFrame.origin.x = boundsCenterX - showFrame.size.width/2;
            showFrame.origin.y = 0;
            break;
        case WYALoadingPositionBottom:
            showFrame.origin.x = boundsCenterX - showFrame.size.width/2;
            showFrame.origin.y = self.frame.size.height - showFrame.size.height;
            break;
        case WYALoadingPositionLeft:
            showFrame.origin.x = 0;
            showFrame.origin.y = boundsCenterY - showFrame.size.height/2;
            break;
        case WYALoadingPositionRight:
            showFrame.origin.x = self.frame.size.width - showFrame.size.width;
            showFrame.origin.y = boundsCenterY - showFrame.size.height/2;
            break;
        case WYALoadingPositionTopLeft:
            showFrame.origin.x = 0;
            showFrame.origin.y = 0;
            break;
        case WYALoadingPositionTopRight:
            showFrame.origin.x = self.frame.size.width - showFrame.size.width;
            showFrame.origin.y = 0;
            break;
        case WYALoadingPositionBottomLeft:
            showFrame.origin.x = 0;
            showFrame.origin.y = self.frame.size.height - showFrame.size.height;
            break;
        case WYALoadingPositionBottomRight:
            showFrame.origin.x = self.frame.size.width - showFrame.size.width;
            showFrame.origin.y = self.frame.size.height - showFrame.size.height;
            break;
            
        default:
            break;
    }
    
    return showFrame;
    
}


//取文字贝塞尔曲线路径
- (UIBezierPath *)getBezierPathWithText:(NSString *)text font:(UIFont *)font{
    
    CTFontRef ctFont = CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize, NULL);
    if (!ctFont) return nil;
    NSDictionary *attrs = @{ (__bridge id)kCTFontAttributeName:(__bridge id)ctFont };
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:text attributes:attrs];
    CFRelease(ctFont);
    
    CTLineRef line = CTLineCreateWithAttributedString((__bridge CFTypeRef)attrString);
    if (!line) return nil;
    
    //创造可变path
    CGMutablePathRef cgPath = CGPathCreateMutable();
    CFArrayRef runs = CTLineGetGlyphRuns(line);
    for (CFIndex iRun = 0, iRunMax = CFArrayGetCount(runs); iRun < iRunMax; iRun++) {
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runs, iRun);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        for (CFIndex iGlyph = 0, iGlyphMax = CTRunGetGlyphCount(run); iGlyph < iGlyphMax; iGlyph++) {
            CFRange glyphRange = CFRangeMake(iGlyph, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, glyphRange, &glyph);
            CTRunGetPositions(run, glyphRange, &position);
            
            CGPathRef glyphPath = CTFontCreatePathForGlyph(runFont, glyph, NULL);
            if (glyphPath) {
                CGAffineTransform transform = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(cgPath, &transform, glyphPath);
                CGPathRelease(glyphPath);
            }
        }
    }
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:cgPath];
    CGRect boundingBox = CGPathGetPathBoundingBox(cgPath);
    CFRelease(cgPath);
    CFRelease(line);
    
    [path applyTransform:CGAffineTransformMakeScale(1.0, -1.0)];
    [path applyTransform:CGAffineTransformMakeTranslation(0.0, boundingBox.size.height)];
    
    return path;
    
}

@end
