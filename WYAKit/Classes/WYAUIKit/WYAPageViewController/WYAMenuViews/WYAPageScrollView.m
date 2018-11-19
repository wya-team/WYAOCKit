//
//  WYAPageScrollView.m
//  FMDB
//
//  Created by 李俊恒 on 2018/11/14.
//

#import "WYAPageScrollView.h"

@implementation WYAPageScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
    #pragma mark ======= UITableViewCell删除手势
    if ([NSStringFromClass(otherGestureRecognizer.view.class) isEqualToString:@"UITableViewWrapperView"]&&[otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        return YES;
    }
    return NO;
}

@end
