//
//  WYAInteractive.m
//  WYASDProject
//
//  Created by 李世航 on 2018/10/23.
//  Copyright © 2018 WeiYiAn. All rights reserved.
//

#import "WYAInteractive.h"

@interface WYAInteractive ()
@property (nonatomic, strong) UIViewController *presentingVC;
@end

@implementation WYAInteractive

-(void)wireToViewController:(UIViewController *)viewController
{
    self.presentingVC = viewController;
    [self prepareGestureRecognizerInView:viewController.view];
}

- (void)prepareGestureRecognizerInView:(UIView*)view {
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}
- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    CGFloat progress = [gestureRecognizer translationInView:gestureRecognizer.view.superview].x / (self.presentingVC.view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));//把这个百分比限制在0~1之间
    NSLog(@"===%lf",progress);
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        self.interacting = YES;
        [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
    }else if (gestureRecognizer.state == UIGestureRecognizerStateChanged){
        if (self.interacting) {
            [self updateInteractiveTransition:progress];
        }
    }else if (gestureRecognizer.state == UIGestureRecognizerStateCancelled||gestureRecognizer.state==UIGestureRecognizerStateEnded){
        if (self.interacting) {
            if (progress>0.5) {
                [self finishInteractiveTransition];
            }else{
                [self cancelInteractiveTransition];
            }
            self.interacting = NO;
        }
    }
}

@end
