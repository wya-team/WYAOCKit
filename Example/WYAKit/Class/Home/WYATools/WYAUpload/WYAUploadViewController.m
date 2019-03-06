//
//  WYAUploadViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/3/5.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYAUploadViewController.h"
#import <WYAKit/WYAUploader.h>
@interface WYAUploadViewController ()

@end

@implementation WYAUploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIButton *  object = [[UIButton alloc]initWithFrame:CGRectMake( 50, 100, 100, 100)];
    [object setTitle:@"上传图片" forState:UIControlStateNormal];
    [object setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

    object.titleLabel.font = [UIFont systemFontOfSize:17];
    [object addTarget:self action:@selector(uploadImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:object];

}

- (void)uploadImage{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"aaa" ofType:@"png"];
    UIImage * image = [[UIImage alloc]initWithContentsOfFile:path];
    WYAUploader * upload = [WYAUploader sharedUpload];
    [upload wya_uploadFileWithUrl:@"https://oa2.ruishan666.com/_cms/api/image/get-oss-info.json"  beforeParamsCallback:^NSDictionary * _Nonnull{
        return @{
                 @"uploadType":@"image",
                 @"image":image,
                 @"imageName":@"aaa.png",
                 };
    } afterCallback:^(CGFloat progress, NSDictionary * _Nonnull resultDic, NSError * _Nonnull error) {
        NSLog(@"progress==%f",progress);
        NSLog(@"resultDic==%@",resultDic);
        NSLog(@"error==%@",[error localizedDescription]);
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
