//
//  UINavigationController+WYAVideo.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/14.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "UINavigationController+WYAVideo.h"

@implementation UINavigationController (WYAVideo)

- (BOOL)shouldAutorotate
{
    return [self.topViewController shouldAutorotate];
}

// Which screen directions are supported
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}

// The default screen direction (the current ViewController must be represented by a modal
// UIViewController (which is not valid with modal navigation) to call this method).
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}

- (UIViewController *)childViewControllerForStatusBarHidden
{
    return self.topViewController;
}

@end
