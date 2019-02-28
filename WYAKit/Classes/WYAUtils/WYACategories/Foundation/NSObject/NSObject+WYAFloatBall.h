//
//  NSObject+WYAFloatBall.h
//  AFNetworking
//
//  Created by 李俊恒 on 2019/2/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WYAFloatBall)

/**
 获取UIViewController

 @return 返回当前的VC
 */
- (UIViewController *)wya_floatBallCurrentViewController;

/**
 获取当前的TabarController

 @return TabBarVC
 */
- (UITabBarController *)wya_floatBallCurrentTabBarController;

/**
 获取当前的导航控制器

 @return 当前的NavigationController
 */
- (UINavigationController *)wya_floatBallCurrentNavigationController;
@end

NS_ASSUME_NONNULL_END
