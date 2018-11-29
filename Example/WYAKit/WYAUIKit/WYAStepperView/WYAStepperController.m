//
//  WYAStepperController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/29.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAStepperController.h"
#import <WYAKit/WYAStepperView.h>
@interface WYAStepperController ()
@property (nonatomic, strong) WYAStepperView * ableStepperView;
@property (nonatomic, strong) WYAStepperView * disableAtepperView;
@end

@implementation WYAStepperController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"StepperView";
    [self.view addSubview:self.ableStepperView];
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
            WYAStepperView * object = [[WYAStepperView alloc]initWithFrame:CGRectMake(ScreenWidth *0.5, WYATopHeight, ScreenWidth*0.5, 40)];
            object.layer.borderColor = [UIColor greenColor].CGColor;
            object.layer.borderWidth = 0.5;
            object.leftFrame = CGRectMake(0, 0, 36, 36);
            object.rightFrame = CGRectMake(0, 0, 36, 36);
            object.leftImageNamed = @"sub_able";
            object.rightImageNamed = @"add_able";
            object;
       });
    }
    return _ableStepperView;
}

- (WYAStepperView *)disableAtepperView{
    if(!_disableAtepperView){
        _disableAtepperView = ({
            WYAStepperView * object = [[WYAStepperView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth*0.5, 40)];
            object.layer.borderColor = [UIColor greenColor].CGColor;
            object.layer.borderWidth = 0.5;
            object.leftFrame = CGRectMake(0, 0, 36, 36);
            object.rightFrame = CGRectMake(0, 0, 36, 36);
            object.leftImageNamed = @"sub_disable";
            object.rightImageNamed = @"add_disable";
            object;
       });
    }
    return _disableAtepperView;
}

@end
