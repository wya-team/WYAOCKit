//
//  WYAStepperController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/29.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAStepperController.h"
#import <WYAKit/WYAStepperView.h>
@interface WYAStepperController ()<WYAStepperViewDelegate>
@property (nonatomic, strong) WYAStepperView * ableStepperView;
@property (nonatomic, strong) WYAStepperView * disableAtepperView;
@end

@implementation WYAStepperController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"StepperView";
    [self.view addSubview:self.ableStepperView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.disableAtepperView];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (WYAStepperView *)ableStepperView{
    if(!_ableStepperView){
        _ableStepperView = ({
            WYAStepperView * object = [[WYAStepperView alloc]initWithFrame:CGRectMake(ScreenWidth *0.5, WYATopHeight + 20 , ScreenWidth*0.35, 40)];
            object.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
            object.layer.borderWidth = 0.5;
            object.childFrame = CGRectMake(0, 0, 30, 30);
            object.ImageNamedArray = @[@"sub_able", @"add_able"];
            object.delegate = self;
            object;
       });
    }
    return _ableStepperView;
}

- (WYAStepperView *)disableAtepperView{
    if(!_disableAtepperView){
        _disableAtepperView = ({
            WYAStepperView * object = [[WYAStepperView alloc]initWithFrame:CGRectMake(10, WYATopHeight + 20 + 40, ScreenWidth*0.35, 40)];
            object.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
            object.layer.borderWidth = 0.5;
            object.childFrame = CGRectMake(0, 0, 30, 30);
            object.ImageNamedArray = @[@"sub_disable", @"add_disable"];
            object.delegate = self;
            object;
       });
    }
    return _disableAtepperView;
}
#pragma mark ======= delegate
- (void)wya_stepperView:(WYAStepperView *)stepperView leftButtonPressed:(UIButton *)sender{
    NSInteger value = [stepperView.stepperTextFiled.text integerValue];
    if (value > 0) {
        value -= 1 ;
        stepperView.stepperTextFiled.text = [NSString stringWithFormat:@"%ld",value];
    }
}
- (void)wya_stepperView:(WYAStepperView *)stepperView rightButtonPressed:(UIButton *)sender{
    NSInteger value = [stepperView.stepperTextFiled.text integerValue];
    value += 1 ;
    stepperView.stepperTextFiled.text = [NSString stringWithFormat:@"%ld",value];
}
@end
