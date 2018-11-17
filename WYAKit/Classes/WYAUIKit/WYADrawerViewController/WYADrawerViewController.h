//
//  WYADrawerViewController.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYADrawerViewController : UIViewController

- (instancetype)initWithCenterViewController:(UIViewController *)centerViewController
                          LeftViewController:(UIViewController *)leftViewController
                         RightViewController:(UIViewController *)rightViewController;

-(void)leftViewControllerMove;
-(void)rightViewControllerMove;
@end

@interface WYAContainerView : UIView

@end

NS_ASSUME_NONNULL_END
