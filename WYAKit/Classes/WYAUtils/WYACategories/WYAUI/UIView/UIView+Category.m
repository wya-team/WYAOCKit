//
//  UIView+Category.m
//  WYAKit
//
//  Created by 李世航 on 2019/6/22.
//

#import "UIView+Category.h"

@implementation UIView (Category)
- (void)wya_addSubViews:(NSArray *)subViews
{
    [subViews enumerateObjectsUsingBlock:^(UIView * view, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([view isKindOfClass:[UIView class]]) {
            [self addSubview:view];
        }
    }];
}

- (UIView * (^)(CGRect))setupFrame
{
    return ^UIView *(CGRect frame)
    {
        self.frame = frame;
        return self;
    };
}

- (UIView * (^)(CGPoint))setupCenter
{
    return ^UIView *(CGPoint point)
    {
        self.center = point;
        return self;
    };
}

- (UIView * (^)(CGRect))setupBounds
{
    return ^UIView *(CGRect frame)
    {
        self.bounds = frame;
        return self;
    };
}

- (UIView * (^)(NSInteger))setupTag
{
    return ^UIView *(NSInteger tag)
    {
        self.tag = tag;
        return self;
    };
}
@end
