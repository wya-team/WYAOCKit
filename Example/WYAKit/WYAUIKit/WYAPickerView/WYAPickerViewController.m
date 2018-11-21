//
//  WYAUIPickerViewViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPickerViewController.h"
#import <WYAKit/WYAPickerView.h>
@interface WYAPickerViewController ()

@end

@implementation WYAPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)buttonClick:(id)sender {
    WYAPickerView * pickerView = [[WYAPickerView alloc]init];
    pickerView.delegate = self;
    pickerView.cancelButtonColor = [UIColor redColor];
    pickerView.sureButtonColor = [UIColor redColor];
    pickerView.pickerHeight = 150;
    pickerView.dataSource = @[@"haha",@"hehe"];
    [pickerView show];
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
