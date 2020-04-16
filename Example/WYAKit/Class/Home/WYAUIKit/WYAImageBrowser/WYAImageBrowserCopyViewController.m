//
//  WYAImageBrowserCopyViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/3/8.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYAImageBrowserCopyViewController.h"
#import <WYAKit/WYAImageBrowser.h>

@interface WYAImageBrowserCopyViewController ()

@end

@implementation WYAImageBrowserCopyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIImageView * imageView          = [[UIImageView alloc] init];
    imageView.center                 = self.view.center;
    imageView.bounds                 = CGRectMake(0, 0, 100, 100);
    imageView.image                  = [UIImage imageNamed:@"2"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];

    [imageView wya_AddTapGesturesWithTapStyle:WYATapGesturesStyleSingle
                                    TapHandle:^(UITapGestureRecognizer * _Nonnull gesture) {
        WYAImageBrowser * imageBrowser = [WYAImageBrowser showImageBrowserWithCurrentImageIndex:0 imageCount:1 style:WYAImageBrowserStyleSimple datasource:nil placeHoldImageBlock:^UIImage *(WYAImageBrowser *browser, NSInteger index) {
            return imageView.image;
        } HighQualityImageURLBlock:nil AssetBlock:nil SourceImageViewBlock:^UIImageView *(WYAImageBrowser *browser, NSInteger index) {
            return imageView;
        }];
        WYAAlertButton * alertButton = [[WYAAlertButton alloc] initWithTitle:@"保存"
                                                                   titleFont:FONT(15)
                                                                  titleColor:[UIColor redColor]
                                                                       image:nil
                                                             backgroundImage:nil
                                                                  clickBlock:^(WYAAlertButton * _Nonnull button){

                                                                  }];
        //        WYAAlertButton * deleteButton = [[WYAAlertButton alloc]initWithTitle:@"删除" titleFont:FONT(15) titleColor:[UIColor blackColor] image:nil backgroundImage:nil clickBlock:^(WYAAlertButton * _Nonnull button) {
        //
        //        }];
        [imageBrowser addAlertSheetButton:alertButton];
        //        [imageBrowser addAlertSheetButton:deleteButton];
        imageBrowser.hidesForSinglePage = NO;
        imageBrowser.browserStyle       = WYAImageBrowserStyleSimple;

    }];

    self.view.backgroundColor = [UIColor redColor];
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
