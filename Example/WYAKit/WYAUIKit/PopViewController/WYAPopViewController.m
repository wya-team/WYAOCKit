//
//  WYAPopViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/16.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPopViewController.h"
#import "WYATestViewController.h"

@interface WYAPopViewController ()<UIPopoverPresentationControllerDelegate>

@end

@implementation WYAPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 88, 50, 50);
    [self.view addSubview:button];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundColor:[UIColor redColor]];
    [button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button1.frame = CGRectMake(self.view.frame.size.width-50, 88, 50, 50);
    [self.view addSubview:button1];
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setBackgroundColor:[UIColor redColor]];
    [button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button2.frame = CGRectMake(0, self.view.frame.size.height-50, 50, 50);
    [self.view addSubview:button2];
    
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setBackgroundColor:[UIColor redColor]];
    [button3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button3.frame = CGRectMake(self.view.frame.size.width-50, self.view.frame.size.height-50, 50, 50);
    [self.view addSubview:button3];
}

-(void)buttonClick:(UIButton *)button{
    WYATestViewController * test = [[WYATestViewController alloc]init];
    test.preferredContentSize = CGSizeMake(100, 100);
    test.modalPresentationStyle = UIModalPresentationPopover;
    
    UIPopoverPresentationController * popover = [test popoverPresentationController];
    popover.delegate = self;
    popover.permittedArrowDirections = UIPopoverArrowDirectionAny;//设置箭头位置
    popover.sourceView = button;//设置目标视图
    popover.sourceRect = button.bounds;//弹出视图显示位置
    popover.backgroundColor = [UIColor whiteColor];//设置弹窗背景颜色
    [self presentViewController:test animated:YES completion:nil];
    

}
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    
    return UIModalPresentationNone;
    
}

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController{
}

// Called on the delegate when the popover controller will dismiss the popover. Return NO to prevent the
// dismissal of the view.
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return YES;
}

// Called on the delegate when the user has taken action to dismiss the popover. This is not called when the popover is dimissed programatically.
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    
}

// -popoverPresentationController:willRepositionPopoverToRect:inView: is called on your delegate when the
// popover may require a different view or rectangle.
- (void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView  * __nonnull * __nonnull)view{
    
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
