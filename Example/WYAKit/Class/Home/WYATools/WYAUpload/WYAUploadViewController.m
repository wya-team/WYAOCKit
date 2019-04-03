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
    NSString * path1 = [[NSBundle mainBundle] pathForResource:@"bbb" ofType:@"png"];
    UIImage * image1 = [[UIImage alloc]initWithContentsOfFile:path1];
    WYAUploader * uploader = [WYAUploader sharedUpload];
    WYAUploadModel * model = [[WYAUploadModel alloc]init];
    model.uploadUrl = @"https://oa2.ruishan666.com/_cms/api/image/get-oss-info.json";
    model.uploadBefore = ^NSDictionary *{
        return nil;
    };
    model.uploadAfter = ^(BOOL isfinish, NSMutableArray * _Nonnull resultArray) {
        NSLog(@"finis=%d,result==%@",isfinish,resultArray);
    };
    model.sync = YES;
    model.fileType = WYAUploadImageTypePNG;
    model.imageType = WYAUploadImageTypePNG;
    model.imageArray = @[image, image];
    uploader.uploadModel = model;
    [uploader wya_uploadFile];
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
