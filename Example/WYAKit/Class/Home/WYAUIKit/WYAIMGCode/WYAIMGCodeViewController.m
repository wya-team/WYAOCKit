//
//  WYAIMGCodeViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAIMGCodeViewController.h"

@interface WYAIMGCodeViewController ()

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
    
    UITextField * textField = [[UITextField alloc]init];
    textField.placeholder = @"请输入要生成二维码的字符串";
    textField.backgroundColor = WHITECOLOR;
    [self.view addSubview:textField];
    CGFloat textField_X = 10;
    CGFloat textField_Y = WYATopHeight + 20*SizeAdapter;
    CGFloat textField_Width = ScreenWidth-20;
    CGFloat textField_Height = 40*SizeAdapter;
    textField.frame = CGRectMake(textField_X, textField_Y, textField_Width, textField_Height);
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"生成二维码" forState:UIControlStateNormal];
    [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    button.titleLabel.font = FONT(15);
    [button setBackgroundImage:[UIImage wya_createImageWithColor:BLUECOLOR] forState:UIControlStateNormal];
    button.bounds = CGRectMake(0, 0, 100*SizeAdapter, 40*SizeAdapter);
    [textField wya_setRightButtonWithView:button];
    
    UITextField * barTextField = [[UITextField alloc]init];
    barTextField.placeholder = @"请输入要生成条形码的字符串";
    barTextField.backgroundColor = WHITECOLOR;
    [self.view addSubview:barTextField];
    CGFloat barTextField_X = 10;
    CGFloat barTextField_Y = CGRectGetMaxY(textField.frame) + 10*SizeAdapter;
    CGFloat barTextField_Width = ScreenWidth-20;
    CGFloat barTextField_Height = 40*SizeAdapter;
    barTextField.frame = CGRectMake(barTextField_X, barTextField_Y, barTextField_Width, barTextField_Height);
    
    UIButton * barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [barButton setTitle:@"生成条形码" forState:UIControlStateNormal];
    [barButton setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    barButton.titleLabel.font = FONT(15);
    [barButton setBackgroundImage:[UIImage wya_createImageWithColor:BLUECOLOR] forState:UIControlStateNormal];
    barButton.bounds = CGRectMake(0, 0, 100*SizeAdapter, 40*SizeAdapter);
    [barTextField wya_setRightButtonWithView:barButton];
    
    UIImageView * imageV = [[UIImageView alloc]init];
    [self.view addSubview:imageV];
    CGFloat imageV_X = (ScreenWidth-100*SizeAdapter)/2;
    CGFloat imageV_Y = CGRectGetMaxY(barTextField.frame)+20*SizeAdapter;
    CGFloat imageV_Width = 100*SizeAdapter;
    CGFloat imageV_Height = 100*SizeAdapter;
    imageV.frame = CGRectMake(imageV_X, imageV_Y, imageV_Width, imageV_Height);
    
    
    [button addCallBackAction:^(UIButton *button) {
        [textField resignFirstResponder];
        imageV.image = [WYAIMGCode wya_GenerateWithDefaultQRCodeData:textField.text imageViewWidth:imageV.cmam_width];
    }];
    
    [barButton addCallBackAction:^(UIButton *button) {
        [barTextField resignFirstResponder];
        if (barTextField.text.length>0 && [barTextField.text wya_isOnlyChinese]) {
            [UIView wya_showBottomToastWithMessage:@"条形码不能有汉字"];
            return;
        }
        imageV.image = [WYAIMGCode wya_BarcodeImageWithContent:barTextField.text codeImageSize:barTextField.cmam_size red:100.0 green:150.0 blue:200.0];
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
