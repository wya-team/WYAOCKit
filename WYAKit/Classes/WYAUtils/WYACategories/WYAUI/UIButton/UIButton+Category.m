//
//  UIButton+Category.m
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UIButton+Category.h"
#import <objc/runtime.h>

const NSString * debounceTimeKey = @"UIButton+wya_debounceTime";
const NSString * endTimeKey = @"UIButton+wya_endTime";

@implementation UIButton (Category)

- (void)addCallBackAction:(ButtonActionCallBack)action
         forControlEvents:(UIControlEvents)controlEvents {
    objc_setAssociatedObject(self, @selector(addCallBackAction:forControlEvents:), action,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(blockActionTouched:) forControlEvents:controlEvents];
}

- (void)addCallBackAction:(ButtonActionCallBack)action {
    [self addCallBackAction:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)blockActionTouched:(UIButton *)btn {
    ButtonActionCallBack block =
        objc_getAssociatedObject(self, @selector(addCallBackAction:forControlEvents:));
    if (block) { block(btn); }
}

- (void)wya_setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage wya_createImageWithColor:color] forState:state];
}

- (void)wya_gifImageWithSource:(NSArray<NSString *> *)source {
    NSMutableArray * array = [NSMutableArray array];
    for (NSString * imageName in source) {
        UIImage * image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    self.imageView.animationImages      = array;
    self.imageView.animationRepeatCount = MAXFLOAT;
    self.imageView.animationDuration    = source.count / 60;
    [self.imageView startAnimating];
}

- (void)setDebounceTime:(double)debounceTime{
    self.endTime = NSDate.date.timeIntervalSince1970 + debounceTime;
    objc_setAssociatedObject(self, &debounceTimeKey, @(debounceTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (double)debounceTime{
    return [objc_getAssociatedObject(self, &debounceTimeKey) doubleValue];
}

- (void)setEndTime:(double)endTime{
    objc_setAssociatedObject(self, &endTimeKey, @(endTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (double)endTime{
    return [objc_getAssociatedObject(self, &endTimeKey) doubleValue];
}

+ (void)load{
    SEL sysSEL = @selector(sendAction:to:forEvent:);
    Method systemMethod = class_getInstanceMethod(self, sysSEL);
    
    SEL customSEL = @selector(wya_sendAction:to:forEvent:);
    Method customMethod = class_getInstanceMethod(self, customSEL);
    
    method_exchangeImplementations(systemMethod, customMethod);
}

// 替换系统方法
- (void)wya_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    if (self.debounceTime == 0) {
        [self wya_sendAction:action to:target forEvent:event];
    }
    else if (NSDate.date.timeIntervalSince1970 - self.debounceTime > self.endTime){
        [self wya_sendAction:action to:target forEvent:event];
        self.endTime = NSDate.date.timeIntervalSince1970 + self.debounceTime;
    }
    
}

@end

@implementation UIButton (EnlargeTouchArea)

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

- (void)setEnlargeEdgeWithTop:(CGFloat)top
                        right:(CGFloat)right
                       bottom:(CGFloat)bottom
                         left:(CGFloat)left {
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect {
    NSNumber * topEdge    = objc_getAssociatedObject(self, &topNameKey);
    NSNumber * rightEdge  = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber * bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber * leftEdge   = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    } else {
        return self.bounds;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) { return [super hitTest:point withEvent:event]; }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

- (void)wya_setButtonImageLoctionRightWithSpace:(CGFloat)space {
    [self.superview layoutIfNeeded];
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;

    CGFloat labelWidth = 0.0;

    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
    }

    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;

    imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + space, 0, -labelWidth - space);
    labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith - space, 0, imageWith + space);

    [self setTitleEdgeInsets:labelEdgeInsets];
    [self setImageEdgeInsets:imageEdgeInsets];
}

- (void)wya_setButtonImageLocationTopWithSpace:(CGFloat)space {
    [self.superview layoutIfNeeded];
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith   = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;

    CGFloat labelWidth  = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth  = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth  = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }

    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;

    imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - space, 0, 0, -labelWidth);
    labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight - space, 0);

    [self setTitleEdgeInsets:labelEdgeInsets];
    [self setImageEdgeInsets:imageEdgeInsets];
}

- (void)wya_setButtonImageLocationBottomWithSpace:(CGFloat)space {
    [self.superview layoutIfNeeded];
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith   = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;

    CGFloat labelWidth  = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth  = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth  = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }

    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;

    imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight - space, -labelWidth);
    labelEdgeInsets = UIEdgeInsetsMake(-imageHeight - space, -imageWith, 0, 0);

    [self setTitleEdgeInsets:labelEdgeInsets];
    [self setImageEdgeInsets:imageEdgeInsets];
}

@end
