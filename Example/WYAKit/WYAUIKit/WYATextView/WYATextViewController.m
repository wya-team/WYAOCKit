//
//  WYATextViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYATextViewController.h"


@interface WYATextViewController ()

@end

@implementation WYATextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    WYATextView * textView = [[WYATextView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    [textView wya_PlaceHoldString:@"占位文字" PlaceHoldColor:[UIColor grayColor] PlaceHoldFont:15.f];
    textView.textViewWordsCount = 1000;
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.borderWidth = 0.5;
    [self.view addSubview:textView];
    
    WYATextView * textView1 = [[WYATextView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 100)];
    [textView1 wya_PlaceHoldString:@"占位文字" PlaceHoldColor:[UIColor grayColor] PlaceHoldFont:15.f];
    textView1.textViewWordsCount = 100;
    textView1.title = @"哈哈";
    textView1.layer.borderColor = [UIColor grayColor].CGColor;
    textView1.layer.borderWidth = 0.5;
    [self.view addSubview:textView1];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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