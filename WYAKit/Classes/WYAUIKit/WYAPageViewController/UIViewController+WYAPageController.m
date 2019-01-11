//
//  UIViewController+WYAPageController.m
//  FMDB
//
//  Created by 李俊恒 on 2018/11/14.
//

#import "UIViewController+WYAPageController.h"
#import "WYAPageController.h"

@implementation UIViewController (WYAPageController)
- (WYAPageController *)wya_PageController {
    UIViewController * parentViewController = self.parentViewController;
    while (parentViewController) {
        if ([parentViewController isKindOfClass:[WYAPageController class]]) {
            return (WYAPageController *)parentViewController;
        }
        parentViewController = parentViewController.parentViewController;
    }
    return nil;
}
@end
