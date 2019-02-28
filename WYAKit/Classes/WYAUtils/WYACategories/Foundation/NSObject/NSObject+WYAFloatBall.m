//
//  NSObject+WYAFloatBall.m
//  AFNetworking
//
//  Created by 李俊恒 on 2019/2/28.
//

#import "NSObject+WYAFloatBall.h"

@implementation NSObject (WYAFloatBall)
- (UIViewController *)wya_floatBallCurrentViewController{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController *) vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *) vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        } else {
            break;
        }
    }
    return vc;
}

- (UITabBarController *)wya_floatBallCurrentTabBarController{
    return [self wya_floatBallCurrentViewController].tabBarController;
}

- (UINavigationController *)wya_floatBallCurrentNavigationController{
    return [self wya_floatBallCurrentViewController].navigationController;
}
@end
