//
//  WYAInteractive.h
//  WYASDProject
//
//  Created by 李世航 on 2018/10/23.
//  Copyright © 2018 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAInteractive : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) BOOL interacting;

- (void)wireToViewController:(UIViewController*)viewController;
@end

NS_ASSUME_NONNULL_END
