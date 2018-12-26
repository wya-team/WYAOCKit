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
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
    vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUtils/WYACategories/WYAUI/UIView/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navTitle = @"UIView+WYAToast";
    [self wya_addRightNavBarButtonWithNormalImage:@[@"icon_help"] highlightedImg:@[]];

    self.view.backgroundColor = random(245, 245, 249, 1);
    [self configUI];
}

- (void)configUI{
    UILabel * label = [[UILabel alloc]init];
    label.text = @"基本";
    label.textColor = random(51, 51, 51, 1);
    label.font = FONT(15);
    [self.view addSubview:label];
    CGFloat label_X = 10;
    CGFloat label_Y = WYATopHeight+20*SizeAdapter;
    CGFloat label_Width = ScreenWidth-20;
    CGFloat label_Height = 30*SizeAdapter;
    label.frame = CGRectMake(label_X, label_Y, label_Width, label_Height);
    
    UIButton * centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [centerButton setTitle:@"文字(中心位置)" forState:UIControlStateNormal];
    [centerButton setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    centerButton.titleLabel.font = FONT(15);
    [centerButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [centerButton addCallBackAction:^(UIButton *button) {
        [UIView wya_showCenterToastWithMessage:@"中心提示框"];
    }];
    [self.view addSubview:centerButton];
    CGFloat centerButton_X = 20*SizeAdapter;
    CGFloat centerButton_Y = CGRectGetMaxY(label.frame)+20*SizeAdapter;
    CGFloat centerButton_Width = ScreenWidth-40*SizeAdapter;
    CGFloat centerButton_Height = 44*SizeAdapter;
    centerButton.frame = CGRectMake(centerButton_X, centerButton_Y, centerButton_Width, centerButton_Height);
    
    UIButton * bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [bottomButton setTitle:@"文字(底部位置)" forState:UIControlStateNormal];
    [bottomButton setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    bottomButton.titleLabel.font = FONT(15);
    [bottomButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [bottomButton addCallBackAction:^(UIButton *button) {
        [UIView wya_showBottomToastWithMessage:@"底部提示框"];
    }];
    [self.view addSubview:bottomButton];
    CGFloat bottomButton_X = 20*SizeAdapter;
    CGFloat bottomButton_Y = CGRectGetMaxY(centerButton.frame)+10*SizeAdapter;
    CGFloat bottomButton_Width = ScreenWidth-40*SizeAdapter;
    CGFloat bottomButton_Height = 44*SizeAdapter;
    bottomButton.frame = CGRectMake(bottomButton_X, bottomButton_Y, bottomButton_Width, bottomButton_Height);
    
    UIButton * customIconButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [customIconButton setTitle:@"自定义图标" forState:UIControlStateNormal];
    [customIconButton setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    customIconButton.titleLabel.font = FONT(15);
    [customIconButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [customIconButton addCallBackAction:^(UIButton *button) {
        [UIView wya_showToastImage:@"icon_refresh" autoRotation:NO ImageType:WYAToastImageTypePNG sourceInWYAKitBundle:NO autoDismiss:YES];
    }];
    [self.view addSubview:customIconButton];
    CGFloat customIconButton_X = 20*SizeAdapter;
    CGFloat customIconButton_Y = CGRectGetMaxY(bottomButton.frame)+10*SizeAdapter;
    CGFloat customIconButton_Width = ScreenWidth-40*SizeAdapter;
    CGFloat customIconButton_Height = 44*SizeAdapter;
    customIconButton.frame = CGRectMake(customIconButton_X, customIconButton_Y, customIconButton_Width, customIconButton_Height);
    
    UIButton * successIconButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [successIconButton setTitle:@"成功" forState:UIControlStateNormal];
    [successIconButton setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    successIconButton.titleLabel.font = FONT(15);
    [successIconButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [successIconButton addCallBackAction:^(UIButton *button) {
        [UIView wya_successToastWithMessage:@"成功"];
    }];
    [self.view addSubview:successIconButton];
    CGFloat successIconButton_X = 20*SizeAdapter;
    CGFloat successIconButton_Y = CGRectGetMaxY(customIconButton.frame)+10*SizeAdapter;
    CGFloat successIconButton_Width = ScreenWidth-40*SizeAdapter;
    CGFloat successIconButton_Height = 44*SizeAdapter;
    successIconButton.frame = CGRectMake(successIconButton_X, successIconButton_Y, successIconButton_Width, successIconButton_Height);
    
    UIButton * failIconButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [failIconButton setTitle:@"失败" forState:UIControlStateNormal];
    [failIconButton setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    failIconButton.titleLabel.font = FONT(15);
    [failIconButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [failIconButton addCallBackAction:^(UIButton *button) {
        [UIView wya_failToastWithMessage:@"失败"];
    }];
    [self.view addSubview:failIconButton];
    CGFloat failIconButton_X = 20*SizeAdapter;
    CGFloat failIconButton_Y = CGRectGetMaxY(successIconButton.frame)+10*SizeAdapter;
    CGFloat failIconButton_Width = ScreenWidth-40*SizeAdapter;
    CGFloat failIconButton_Height = 44*SizeAdapter;
    failIconButton.frame = CGRectMake(failIconButton_X, failIconButton_Y, failIconButton_Width, failIconButton_Height);
    
    UIButton * netFailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [netFailButton setTitle:@"网络失败" forState:UIControlStateNormal];
    [netFailButton setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    netFailButton.titleLabel.font = FONT(15);
    [netFailButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [netFailButton addCallBackAction:^(UIButton *button) {
        [UIView wya_warningToastWithMessage:@"网络失败"];
    }];
    [self.view addSubview:netFailButton];
    CGFloat netFailButton_X = 20*SizeAdapter;
    CGFloat netFailButton_Y = CGRectGetMaxY(failIconButton.frame)+10*SizeAdapter;
    CGFloat netFailButton_Width = ScreenWidth-40*SizeAdapter;
    CGFloat netFailButton_Height = 44*SizeAdapter;
    netFailButton.frame = CGRectMake(netFailButton_X, netFailButton_Y, netFailButton_Width, netFailButton_Height);
    
    UIButton * loadingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loadingButton setTitle:@"loading" forState:UIControlStateNormal];
    [loadingButton setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    loadingButton.titleLabel.font = FONT(15);
    [loadingButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [loadingButton addCallBackAction:^(UIButton *button) {
        [UIView wya_toastWithMessage:@"正在加载" imageString:@"spin_white" autoRotation:YES imageType:WYAToastImageTypeSVG sourceInWYAKitBundle:YES autoDismiss:NO];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView wya_dismissToast];
        });
    }];
    [self.view addSubview:loadingButton];
    CGFloat loadingButton_X = 20*SizeAdapter;
    CGFloat loadingButton_Y = CGRectGetMaxY(netFailButton.frame)+10*SizeAdapter;
    CGFloat loadingButton_Width = ScreenWidth-40*SizeAdapter;
    CGFloat loadingButton_Height = 44*SizeAdapter;
    loadingButton.frame = CGRectMake(loadingButton_X, loadingButton_Y, loadingButton_Width, loadingButton_Height);
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
