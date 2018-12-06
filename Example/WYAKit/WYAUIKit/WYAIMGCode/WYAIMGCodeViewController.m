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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navTitle = NSStringFromClass([self class]);
    
    self.imageViewOne.image = [WYAIMGCode wya_GenerateWithDefaultQRCodeData:@"二维码扫描结果" imageViewWidth:self.imageViewOne.frame.size.width];
    
    self.imageViewTwo.image = [WYAIMGCode wya_GenerateWithColorQRCodeData:@"二维码扫描结果" backgroundColor:[CIColor colorWithRed:155.0/255.0 green:133.0/255.0 blue:100.0/255.0] mainColor:[CIColor colorWithRed:200.0/255.0 green:210.0/255.0 blue:220.0/255.0]];
    
    self.imageViewThree.image = [WYAIMGCode wya_GenerateWithLogoQRCodeData:@"二维码扫描结果" logoImageName:@"correct" logoScaleToSuperView:0.3];
    
    self.imageViewFour.image = [WYAIMGCode wya_BarcodeImageWithContent:@"二维码扫描结果" codeImageSize:CGSizeMake(self.imageViewFour.frame.size.width, self.imageViewFour.frame.size.height) red:100.0 green:150.0 blue:200.0];
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
