//
//  WYADrawerViewController.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYADrawerViewController : UIViewController

- (instancetype)initWithCenterViewController:(UIViewController * _Nonnull)centerViewController
                          LeftViewController:(UIViewController * _Nullable)leftViewController
                         RightViewController:(UIViewController * _Nullable)rightViewController;

/**
 左侧视图控制器移动
 */
-(void)wya_leftViewControllerMove;

/**
 右侧视图控制器移动
 */
-(void)wya_rightViewControllerMove;
@end

@interface WYAContainerView : UIView

@end

NS_ASSUME_NONNULL_END
