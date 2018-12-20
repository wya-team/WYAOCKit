//
//  WYAIMGCodeViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAIMGCodeViewController.h"

@interface WYAIMGCodeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOne;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTwo;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewThree;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewFour;

@end

@implementation WYAIMGCodeViewController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
    vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/WYAIMGCode/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self wya_addRightNavBarButtonWithNormalImage:@[@"icon_help"] highlightedImg:@[]];

    self.navTitle = NSStringFromClass([self class]);
    
    self.imageViewOne.image = [WYAIMGCode wya_GenerateWithDefaultQRCodeData:@"二维码扫描结果" imageViewWidth:self.imageViewOne.frame.size.width];
    
    self.imageViewTwo.image = [WYAIMGCode wya_GenerateWithColorQRCodeData:@"二维码扫描结果" backgroundColor:[CIColor colorWithRed:155.0/255.0 green:133.0/255.0 blue:100.0/255.0] mainColor:[CIColor colorWithRed:200.0/255.0 green:210.0/255.0 blue:220.0/255.0]];
    
    self.imageViewThree.image = [WYAIMGCode wya_GenerateWithLogoQRCodeData:@"二维码扫描结果" logoImageName:@"correct" logoScaleToSuperView:0.3];
    
    self.imageViewFour.image = [WYAIMGCode wya_BarcodeImageWithContent:@"ssdsdsd" codeImageSize:CGSizeMake(self.imageViewFour.cmam_width, self.imageViewFour.cmam_height) red:100.0 green:150.0 blue:200.0];
    
    [self.imageViewOne wya_AddTapGesturesWithTapStyle:WYATapGesturesStyleSingle TapHandle:^(UITapGestureRecognizer * _Nonnull gesture) {
        NSLog(@"单击");
    }];

    [self.imageViewOne wya_AddTapGesturesWithTapStyle:WYATapGesturesStyleDouble TapHandle:^(UITapGestureRecognizer * _Nonnull gesture) {
        NSLog(@"双击");
    }];
    
    [self.imageViewOne wya_AddLongPressGestureWithDuration:2 Handle:^(UILongPressGestureRecognizer * _Nonnull gesture) {
        NSLog(@"长按");
    }];
    CGRect rect = self.imageViewTwo.frame;
    [self.imageViewTwo wya_AddPanGestureWithHandle:^(UIPanGestureRecognizer * _Nonnull gesture) {
        NSLog(@"平移");
        CGPoint point = [gesture locationInView:gesture.view];

        if (gesture.state == UIGestureRecognizerStateChanged) {
            gesture.view.frame = CGRectMake(point.x, rect.origin.y, rect.size.width, rect.size.height);
        }else if (gesture.state == UIGestureRecognizerStateEnded) {
            gesture.view.frame = rect;
        }
    }];
    
    [self.imageViewThree wya_AddSwipeGestureWithSwipeDirection:UISwipeGestureRecognizerDirectionRight SwipeHandle:^(UISwipeGestureRecognizer * _Nonnull gesture) {
        NSLog(@"轻扫");
    }];
    
    [self.imageViewOne wya_AddRotationGestureWithHandle:^(UIRotationGestureRecognizer * _Nonnull gesture) {
        if (gesture.state == UIGestureRecognizerStateChanged) {
            gesture.view.transform = CGAffineTransformMakeRotation(gesture.rotation);
        }else if (gesture.state == UIGestureRecognizerStateEnded) {
            gesture.view.transform = CGAffineTransformIdentity;
        }
    }];
    
    [self.imageViewThree wya_AddPinchGestureWithHandle:^(UIPinchGestureRecognizer * _Nonnull gesture) {
        if (gesture.state == UIGestureRecognizerStateChanged) {
            gesture.view.transform = CGAffineTransformMakeScale(gesture.scale, gesture.scale);
        }else if (gesture.state == UIGestureRecognizerStateEnded) {
            gesture.view.transform = CGAffineTransformIdentity;
        }
    }];
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
