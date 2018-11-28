//
//  WYAHomeViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/26.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAHomeViewController.h"
#define leftSpace 10
@interface WYAHomeViewController ()
@property (nonatomic, strong) UILabel * TitleLabel;
@property (nonatomic, strong) UITextField  * stepperTextFiled;
@property (nonatomic, strong) UIButton * addButton;
@property (nonatomic, strong) UIButton * subtractButton;
@end

@implementation WYAHomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"center.view.willAppear");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"center.view.willDisAppear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}


#pragma mark ======= getter
- (UILabel *)TitleLabel{
    if(!_TitleLabel){
        _TitleLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object.frame = CGRectMake(leftSpace, WYATopHeight, 100, 20);
            object.text = @"Stepper";
            
            object;
       });
    }
    return _TitleLabel;
}

- (UITextField *)stepperTextFiled{
    if(!_stepperTextFiled){
        _stepperTextFiled = ({
            UITextField * object = [[UITextField alloc]init];
            object;
       });
    }
    return _stepperTextFiled;
}

- (UIButton *)addButton{
    if(!_addButton){
        _addButton = ({
            UIButton * object = [[UIButton alloc]init];
            object;
       });
    }
    return _addButton;
}

- (UIButton *)subtractButton{
    if(!_subtractButton){
        _subtractButton = ({
            UIButton * object = [[UIButton alloc]init];
            object;
       });
    }
    return _subtractButton;
}
@end
