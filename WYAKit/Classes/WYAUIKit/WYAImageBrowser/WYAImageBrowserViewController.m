//
//  WYAImageBrowserViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/27.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAImageBrowserViewController.h"
#import "WYAImageBrowser.h"
#import "WYAStyle.h"
#import "WYAPopupDismissAnimator.h"
#import "WYAPopupPresentAnimator.h"
@interface WYAImageBrowserViewController ()<UIViewControllerTransitioningDelegate,UIGestureRecognizerDelegate>
@property(nonatomic, strong) UITapGestureRecognizer * tap;
@property(nonatomic, strong) WYAImageBrowser * imageBrowser;
@end

@implementation WYAImageBrowserViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitioningDelegate  = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    NSLog(@"1");
    self.imageBrowser.selectIndex = self.selectIndex;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"2");
    self.imageBrowser = [[WYAImageBrowser alloc]
        initWithFrame:self.view.frame];
    self.imageBrowser.images = self.array;
    [self.view addSubview:self.imageBrowser];
}

#pragma mark - UIViewControllerTransitioningDelegate
/** 返回Present动画 */
- (id<UIViewControllerAnimatedTransitioning>)
animationControllerForPresentedController:(UIViewController *)presented
presentingController:(UIViewController *)presenting
sourceController:(UIViewController *)source {
    WYAPopupPresentAnimator * animator = [[WYAPopupPresentAnimator alloc] init];
    animator.presentStyle              = WYAPopupPresentStyleFoucs;
    return animator;
}

/** 返回Dismiss动画 */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:
(UIViewController *)dismissed {
    WYAPopupDismissAnimator * animator = [[WYAPopupDismissAnimator alloc] init];
    animator.dismissStyle              = WYAPopupDismissStyleOutofFocus;
    return animator;
}


@end
