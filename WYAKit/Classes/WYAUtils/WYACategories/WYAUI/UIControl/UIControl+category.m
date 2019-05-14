//
//  UIControl+category.m
//  AFNetworking
//
//  Created by 李雪峰 on 2019/5/14.
//

#import "UIControl+category.h"
#import <objc/runtime.h>

const NSString * debounceTimeKey = @"UIButton+wya_debounceTime";
const NSString * endTimeKey = @"UIButton+wya_endTime";
@implementation UIControl (category)

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
