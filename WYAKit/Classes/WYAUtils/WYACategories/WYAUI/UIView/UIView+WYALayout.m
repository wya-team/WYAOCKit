//
//  UIView+WYALayout.m
//  WYA_Project
//
//  Created by 李俊恒 on 2018/4/8.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UIView+WYALayout.h"

@implementation UIView (WYALayout)
- (UIImage *)cmam_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIImage *)cmam_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates {
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self cmam_snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage * snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (NSData *)cmam_snapshotPDF {
    CGRect bounds              = self.bounds;
    NSMutableData * data       = [NSMutableData data];
    CGDataConsumerRef consumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
    CGContextRef context       = CGPDFContextCreate(consumer, &bounds, NULL);
    CGDataConsumerRelease(consumer);
    if (!context) return nil;
    CGPDFContextBeginPage(context, NULL);
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    [self.layer renderInContext:context];
    CGPDFContextEndPage(context);
    CGPDFContextClose(context);
    CGContextRelease(context);
    return data;
}

- (void)cmam_setLayerShadow:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.layer.shadowColor        = color.CGColor;
    self.layer.shadowOffset       = offset;
    self.layer.shadowRadius       = radius;
    self.layer.shadowOpacity      = 1;
    self.layer.shouldRasterize    = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)cmam_removeAllSubviews {
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) { [self.subviews.lastObject removeFromSuperview]; }
}

- (UIViewController *)cmam_viewController {
    for (UIView * view = self; view; view = view.superview) {
        UIResponder * nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (CGFloat)cmam_visibleAlpha {
    if ([self isKindOfClass:[UIWindow class]]) {
        if (self.hidden) return 0;
        return self.alpha;
    }
    if (!self.window) return 0;
    CGFloat alpha = 1;
    UIView * v    = self;
    while (v) {
        if (v.hidden) {
            alpha = 0;
            break;
        }
        alpha *= v.alpha;
        v = v.superview;
    }
    return alpha;
}

- (CGPoint)cmam_convertPoint:(CGPoint)point toViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertPoint:point toWindow:nil];
        } else {
            return [self convertPoint:point toView:nil];
        }
    }

    UIWindow * from = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    UIWindow * to   = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    if ((!from || !to) || (from == to)) return [self convertPoint:point toView:view];
    point = [self convertPoint:point toView:from];
    point = [to convertPoint:point fromWindow:from];
    point = [view convertPoint:point fromView:to];
    return point;
}

- (CGPoint)cmam_convertPoint:(CGPoint)point fromViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertPoint:point fromWindow:nil];
        } else {
            return [self convertPoint:point fromView:nil];
        }
    }

    UIWindow * from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    UIWindow * to   = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    if ((!from || !to) || (from == to)) return [self convertPoint:point fromView:view];
    point = [from convertPoint:point fromView:view];
    point = [to convertPoint:point fromWindow:from];
    point = [self convertPoint:point fromView:to];
    return point;
}

- (CGRect)cmam_convertRect:(CGRect)rect toViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertRect:rect toWindow:nil];
        } else {
            return [self convertRect:rect toView:nil];
        }
    }

    UIWindow * from = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    UIWindow * to   = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    if (!from || !to) return [self convertRect:rect toView:view];
    if (from == to) return [self convertRect:rect toView:view];
    rect = [self convertRect:rect toView:from];
    rect = [to convertRect:rect fromWindow:from];
    rect = [view convertRect:rect fromView:to];
    return rect;
}

- (CGRect)cmam_convertRect:(CGRect)rect fromViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertRect:rect fromWindow:nil];
        } else {
            return [self convertRect:rect fromView:nil];
        }
    }

    UIWindow * from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    UIWindow * to   = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    if ((!from || !to) || (from == to)) return [self convertRect:rect fromView:view];
    rect = [from convertRect:rect fromView:view];
    rect = [to convertRect:rect fromWindow:from];
    rect = [self convertRect:rect fromView:to];
    return rect;
}

- (CGFloat)cmam_left {
    return self.frame.origin.x;
}

- (void)setCmam_left:(CGFloat)x {
    CGRect frame   = self.frame;
    frame.origin.x = x;
    self.frame     = frame;
}

- (CGFloat)cmam_top {
    return self.frame.origin.y;
}

- (void)setCmam_top:(CGFloat)y {
    CGRect frame   = self.frame;
    frame.origin.y = y;
    self.frame     = frame;
}

- (CGFloat)cmam_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setCmam_right:(CGFloat)right {
    CGRect frame   = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame     = frame;
}

- (CGFloat)cmam_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setCmam_bottom:(CGFloat)bottom {
    CGRect frame   = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame     = frame;
}

- (CGFloat)cmam_width {
    return self.frame.size.width;
}

- (void)setCmam_width:(CGFloat)width {
    CGRect frame     = self.frame;
    frame.size.width = width;
    self.frame       = frame;
}

- (CGFloat)cmam_height {
    return self.frame.size.height;
}

- (void)setCmam_height:(CGFloat)height {
    CGRect frame      = self.frame;
    frame.size.height = height;
    self.frame        = frame;
}

- (CGFloat)cmam_centerX {
    return self.center.x;
}

- (void)setCmam_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)cmam_centerY {
    return self.center.y;
}

- (void)setCmam_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)cmam_origin {
    return self.frame.origin;
}

- (void)setCmam_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame   = frame;
}

- (CGSize)cmam_size {
    return self.frame.size;
}

- (void)setCmam_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size   = size;
    self.frame   = frame;
}

+ (void)cmam_showOscillatoryAnimationWithLayer:(CALayer * _Nullable)layer
                                          type:(CMAMOscillatoryAnimationType)type {
    NSNumber * animationScale1 = type == CMAMOscillatoryAnimationToBigger ? @(1.15) : @(0.5);
    NSNumber * animationScale2 = type == CMAMOscillatoryAnimationToBigger ? @(0.92) : @(1.15);

    [UIView animateWithDuration:0.15
        delay:0
        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut
        animations:^{ [layer setValue:animationScale1 forKeyPath:@"transform.scale"]; }
        completion:^(BOOL finished) {
            [UIView animateWithDuration:0.15
                delay:0
                options:UIViewAnimationOptionBeginFromCurrentState |
                        UIViewAnimationOptionCurveEaseInOut
                animations:^{ [layer setValue:animationScale2 forKeyPath:@"transform.scale"]; }
                completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.1
                                          delay:0
                                        options:UIViewAnimationOptionBeginFromCurrentState |
                                                UIViewAnimationOptionCurveEaseInOut
                                     animations:^{
                                         [layer setValue:@(1.0) forKeyPath:@"transform.scale"];
                                     }
                                     completion:nil];
                }];
        }];
}

#pragma mark - 设置部分圆角
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight |
 * UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners withRadii:(CGSize)radii {
    UIBezierPath * rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:radii];
    CAShapeLayer * shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];

    self.layer.mask = shape;
}

/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight |
 * UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners withRadii:(CGSize)radii viewRect:(CGRect)rect {
    UIBezierPath * rounded =
        [UIBezierPath bezierPathWithRoundedRect:rect
                              byRoundingCorners:corners
                                    cornerRadii:radii];
    CAShapeLayer * shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];

    self.layer.mask = shape;
}

//1.提供一个UIView的分类方法，这个方法通过响应者链条获取view所在的控制器
- (UIViewController *)cmam_parentController

{
    UIResponder * responder = [self nextResponder];
    while (responder) {

        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

//2.通过控制器的布局视图可以获取到控制器实例对象(modal的展现方式需要取到控制器的根视图)
+ (UIViewController *)cmam_currentViewController {

    UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;

    // modal展现方式的底层视图不同

    // 取到第一层时，取到的是UITransitionView，通过这个view拿不到控制器
    UIView * firstView    = [keyWindow.subviews firstObject];
    UIView * secondView   = [firstView.subviews firstObject];
    UIViewController * vc = [secondView cmam_parentController];

    if ([vc isKindOfClass:[UITabBarController class]]) {

        UITabBarController * tab = (UITabBarController *)vc;

        if ([tab.selectedViewController isKindOfClass:[UINavigationController class]]) {

            UINavigationController * nav = (UINavigationController *)tab.selectedViewController;

            return [nav.viewControllers lastObject];

        } else {

            return tab.selectedViewController;
        }

    } else if ([vc isKindOfClass:[UINavigationController class]]) {

        UINavigationController * nav = (UINavigationController *)vc;

        return [nav.viewControllers lastObject];

    } else {

        return vc;
    }

    return nil;
}

- (UIViewController *)getCurrentVC

{

    UIViewController * result = nil;

    UIWindow * window = [[UIApplication sharedApplication] keyWindow];

    if (window.windowLevel != UIWindowLevelNormal) {

        NSArray * windows = [[UIApplication sharedApplication] windows];

        for (UIWindow * tmpWin in windows) {

            if (tmpWin.windowLevel == UIWindowLevelNormal)

            {

                window = tmpWin;

                break;
            }
        }
    }

    UIView * frontView = [[window subviews] objectAtIndex:0];

    id nextResponder = [frontView nextResponder];

    if ([nextResponder isKindOfClass:[UIViewController class]])

        result = nextResponder;

    else

        result = window.rootViewController;

    return result;
}

@end
