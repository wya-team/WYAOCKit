//
//  WYAToastViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAToastViewController.h"

@interface WYAToastViewController ()

@end

@implementation WYAToastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navTitle = @"UIView+WYAToast";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}
- (IBAction)buttonActionCenter:(id)sender {
    
    [UIView wya_ShowCenterToastWithMessage:@"中心提示框"];
    
}
- (IBAction)buttonActionBottom:(id)sender {
    [UIView wya_ShowBottomToastWithMessage:@"底部提示框"];
    
}

- (IBAction)buttonToast:(id)sender {
    [UIView wya_ToastWithMessage:@"正在加载" ImageString:@"ink" imageType:WYAToastImageTypeGIF SourceInWYAKitBundle:NO AutoDismiss:YES];
}
- (IBAction)buttonToastAutoDismiss:(id)sender {
    [UIView wya_ToastWithMessage:@"正在加载" ImageString:@"ink" imageType:WYAToastImageTypeGIF SourceInWYAKitBundle:NO AutoDismiss:NO];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView wya_DismissToast];
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
