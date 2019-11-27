//
//  WYAPopViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/16.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPopViewController.h"
#import "WYAIMGCodeViewController.h"
#import "WYATestViewController.h"

@interface WYAPopViewController () <UIPopoverPresentationControllerDelegate>

@end

@implementation WYAPopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"list" ] highlightedImg:@[]];

    UILabel * label       = [[UILabel alloc] init];
    label.text            = @"点击右上角显示气泡组件(之后需要自定义)";
    label.textColor       = random(51, 51, 51, 1);
    label.font            = FONT(15);
    label.textAlignment   = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    CGFloat label_X      = 10;
    CGFloat label_Y      = WYATopHeight + 20 * SizeAdapter;
    CGFloat label_Width  = ScreenWidth - 20;
    CGFloat label_Height = 44 * SizeAdapter;
    label.frame          = CGRectMake(label_X, label_Y, label_Width, label_Height);
}

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    WYATestViewController * test       = [[WYATestViewController alloc] init];
    test.preferredContentSize          = CGSizeMake(120 * SizeAdapter, 132 * SizeAdapter);
    test.modalPresentationStyle        = UIModalPresentationPopover;
    __block WYATestViewController * vc = test;
    test.popCallback                   = ^(NSIndexPath * _Nonnull indexPath) {
        [vc dismissViewControllerAnimated:YES completion:nil];
        if (indexPath.row == 0) {
            WYAQRCodeViewController * qr = [[WYAQRCodeViewController alloc] init];
            qr.scanReault =
            ^(NSString * reault) { [UIView wya_showCenterToastWithMessage:reault]; };
            [self presentViewController:qr animated:YES completion:nil];
        } else if (indexPath.row == 1) {
            WYAIMGCodeViewController * imgCode = [[WYAIMGCodeViewController alloc] init];
            [self.navigationController pushViewController:imgCode animated:YES];
        } else {
            WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
            vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/"
                           @"WYAUIKit/WYAPopoverBackgroundView/README.md";
            [self.navigationController pushViewController:vc animated:YES];
        }

    };
    UIPopoverPresentationController * popover = [test popoverPresentationController];
    popover.delegate                          = self;
    popover.permittedArrowDirections          = UIPopoverArrowDirectionUp; //设置箭头位置
    popover.sourceView                        = sender;                    //设置目标视图
    popover.sourceRect                        = sender.bounds;             //弹出视图显示位置
    popover.backgroundColor                   = [UIColor whiteColor];      //设置弹窗背景颜色
    popover.popoverBackgroundViewClass        = [WYACustomPopoverBackgroundView class];

    [self presentViewController:test
                       animated:YES
                     completion:^{

                     }];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:
(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}

- (void)prepareForPopoverPresentation:
(UIPopoverPresentationController *)popoverPresentationController
{
}

// Called on the delegate when the popover controller will dismiss the popover. Return NO to prevent
// the
// dismissal of the view.
- (BOOL)popoverPresentationControllerShouldDismissPopover:
(UIPopoverPresentationController *)popoverPresentationController
{
    return YES;
}

// Called on the delegate when the user has taken action to dismiss the popover. This is not called
// when the popover is dimissed programatically.
- (void)popoverPresentationControllerDidDismissPopover:
(UIPopoverPresentationController *)popoverPresentationController
{
}

// -popoverPresentationController:willRepositionPopoverToRect:inView: is called on your delegate
// when the
// popover may require a different view or rectangle.
- (void)popoverPresentationController:
        (UIPopoverPresentationController *)popoverPresentationController
          willRepositionPopoverToRect:(inout CGRect *)rect
                               inView:(inout UIView * __nonnull * __nonnull)view
{
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before
navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
