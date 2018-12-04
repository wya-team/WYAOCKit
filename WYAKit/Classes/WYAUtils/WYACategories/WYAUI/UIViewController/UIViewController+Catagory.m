//
//  UIViewController+Catagory.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/4.
//

#import "UIViewController+Catagory.h"

@implementation UIViewController (Catagory)

+ (void)load {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector= @selector(wya_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class,originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class,swizzledSelector);
        method_exchangeImplementations(originalMethod,swizzledMethod);
        
    });
}

- (void)wya_viewWillAppear:(BOOL)animated {
    
    [self wya_viewWillAppear:animated];
    UIScrollView *scrollView = nil;
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]]) {
            scrollView = (UIScrollView *)view;
            break;
        }
    }
    if (!self.automaticallyAdjustsScrollViewInsets) {
        if (@available(iOS 11.0, *)) {
            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    else {
        if (@available(iOS 11.0, *)) {
            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
        }
    }
}

- (void)wya_setAutomaticallyAdjustsScrollViewInsets:(BOOL)automaticallyAdjustsScrollViewInsets {
    
    [self wya_setAutomaticallyAdjustsScrollViewInsets:automaticallyAdjustsScrollViewInsets];
    
}
@end
