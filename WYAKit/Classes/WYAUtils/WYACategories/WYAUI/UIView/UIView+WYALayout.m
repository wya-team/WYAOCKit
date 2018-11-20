//
//  UIView+WYALayout.m
//  WYA_Project
//
//  Created by 李俊恒 on 2018/4/8.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UIView+WYALayout.h"

@implementation UIView (WYALayout)
- (UIImage *)wya_snapshotImage
{
    UIGraphicsBeginImageContextWithOptions (self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext ()];
    UIImage * snap = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return snap;
}

- (UIImage *)wya_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates
{
    if (![self respondsToSelector:@selector (drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self wya_snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions (self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage * snap = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return snap;
}

- (NSData *)wya_snapshotPDF
{
    CGRect bounds = self.bounds;
    NSMutableData * data = [NSMutableData data];
    CGDataConsumerRef consumer = CGDataConsumerCreateWithCFData ((__bridge CFMutableDataRef)data);
    CGContextRef context = CGPDFContextCreate (consumer, &bounds, NULL);
    CGDataConsumerRelease (consumer);
    if (!context) return nil;
    CGPDFContextBeginPage (context, NULL);
    CGContextTranslateCTM (context, 0, bounds.size.height);
    CGContextScaleCTM (context, 1.0, -1.0);
    [self.layer renderInContext:context];
    CGPDFContextEndPage (context);
    CGPDFContextClose (context);
    CGContextRelease (context);
    return data;
}

- (void)wya_setLayerShadow:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius
{
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = 1;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)wya_removeAllSubviews
{
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

- (UIViewController *)wya_viewController
{
    for (UIView * view = self; view; view = view.superview) {
        UIResponder * nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (CGFloat)wya_visibleAlpha
{
    if ([self isKindOfClass:[UIWindow class]]) {
        if (self.hidden) return 0;
        return self.alpha;
    }
    if (!self.window) return 0;
    CGFloat alpha = 1;
    UIView * v = self;
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

- (CGPoint)wya_convertPoint:(CGPoint)point toViewOrWindow:(UIView *)view
{
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertPoint:point toWindow:nil];
        } else {
            return [self convertPoint:point toView:nil];
        }
    }

    UIWindow * from = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    UIWindow * to = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    if ((!from || !to) || (from == to)) return [self convertPoint:point toView:view];
    point = [self convertPoint:point toView:from];
    point = [to convertPoint:point fromWindow:from];
    point = [view convertPoint:point fromView:to];
    return point;
}

- (CGPoint)wya_convertPoint:(CGPoint)point fromViewOrWindow:(UIView *)view
{
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertPoint:point fromWindow:nil];
        } else {
            return [self convertPoint:point fromView:nil];
        }
    }

    UIWindow * from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    UIWindow * to = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    if ((!from || !to) || (from == to)) return [self convertPoint:point fromView:view];
    point = [from convertPoint:point fromView:view];
    point = [to convertPoint:point fromWindow:from];
    point = [self convertPoint:point fromView:to];
    return point;
}

- (CGRect)wya_convertRect:(CGRect)rect toViewOrWindow:(UIView *)view
{
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertRect:rect toWindow:nil];
        } else {
            return [self convertRect:rect toView:nil];
        }
    }

    UIWindow * from = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    UIWindow * to = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    if (!from || !to) return [self convertRect:rect toView:view];
    if (from == to) return [self convertRect:rect toView:view];
    rect = [self convertRect:rect toView:from];
    rect = [to convertRect:rect fromWindow:from];
    rect = [view convertRect:rect fromView:to];
    return rect;
}

- (CGRect)wya_convertRect:(CGRect)rect fromViewOrWindow:(UIView *)view
{
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertRect:rect fromWindow:nil];
        } else {
            return [self convertRect:rect fromView:nil];
        }
    }

    UIWindow * from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    UIWindow * to = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    if ((!from || !to) || (from == to)) return [self convertRect:rect fromView:view];
    rect = [from convertRect:rect fromView:view];
    rect = [to convertRect:rect fromWindow:from];
    rect = [self convertRect:rect fromView:to];
    return rect;
}

- (CGFloat)wya_left
{
    return self.frame.origin.x;
}

- (void)setwya_left:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)wya_top
{
    return self.frame.origin.y;
}

- (void)setwya_top:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)wya_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setwya_right:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)wya_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setwya_bottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)wya_width
{
    return self.frame.size.width;
}

- (void)setwya_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)wya_height
{
    return self.frame.size.height;
}

- (void)setwya_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)wya_centerX
{
    return self.center.x;
}

- (void)setwya_centerX:(CGFloat)centerX
{
    self.center = CGPointMake (centerX, self.center.y);
}

- (CGFloat)wya_centerY
{
    return self.center.y;
}

- (void)setwya_centerY:(CGFloat)centerY
{
    self.center = CGPointMake (self.center.x, centerY);
}

- (CGPoint)wya_origin
{
    return self.frame.origin;
}

- (void)setwya_origin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)wya_size
{
    return self.frame.size;
}

- (void)setwya_size:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

+ (void)wya_showOscillatoryAnimationWithLayer:(CALayer * _Nullable)layer type:(WYAOscillatoryAnimationType)type
{
    NSNumber * animationScale1 = type == WYAOscillatoryAnimationToBigger ? @(1.15) : @(0.5);
    NSNumber * animationScale2 = type == WYAOscillatoryAnimationToBigger ? @(0.92) : @(1.15);

    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        [layer setValue:animationScale1 forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
            [layer setValue:animationScale2 forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                [layer setValue:@(1.0) forKeyPath:@"transform.scale"];
            } completion:nil];
        }];
    }];
}

#pragma mark - 设置部分圆角
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
{
    UIBezierPath * rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer * shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];

    self.layer.mask = shape;
}

/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect
{
    UIBezierPath * rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer * shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];

    self.layer.mask = shape;
}

@end
