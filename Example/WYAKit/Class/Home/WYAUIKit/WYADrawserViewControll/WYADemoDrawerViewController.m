//
//  WYADemoDrawerViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/24.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYADemoDrawerViewController.h"
#import "WYADemoDrawerLeftViewController.h"
#import "WYADemoDrawerRightViewController.h"

@interface WYADemoDrawerViewController ()
@property (nonatomic, strong) WYADrawerView * drawerView;
@property (nonatomic, strong) UIView * leftView;
@property (nonatomic, strong) UIView * rightView;
@property (nonatomic, strong) WYADemoDrawerLeftViewController * leftVC;
@property (nonatomic, strong) WYADemoDrawerRightViewController * rightVC;
@end

@implementation WYADemoDrawerViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    [self.view addSubview:self.drawerView];
    WeakSelf(weakSelf);
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"左侧视图" forState:UIControlStateNormal];
    [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    button.titleLabel.font = FONT(15);
    [button setBackgroundImage:[UIImage wya_createImageWithColor:BLUECOLOR] forState:UIControlStateNormal];
    [button addCallBackAction:^(UIButton *button) {
//        [weakSelf.drawerView wya_leftViewMove];
        [weakSelf cw_showDefaultDrawerViewController:weakSelf.leftVC];
        
    }];
    [self.view addSubview:button];
    
    CGFloat button_X = 50*SizeAdapter;
    CGFloat button_Y = WYATopHeight+20*SizeAdapter;
    CGFloat button_Width = 100*SizeAdapter;
    CGFloat button_Height = 44*SizeAdapter;
    button.frame = CGRectMake(button_X, button_Y, button_Width, button_Height);
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"右侧视图" forState:UIControlStateNormal];
    [button1 setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    button1.titleLabel.font = FONT(15);
    [button1 setBackgroundImage:[UIImage wya_createImageWithColor:BLUECOLOR] forState:UIControlStateNormal];
    [button1 addCallBackAction:^(UIButton *button) {
//        [weakSelf.drawerView wya_rightViewMove];
    }];
    [self.view addSubview:button1];
    
    CGFloat button1_X = CGRectGetMaxX(button.frame) + 50*SizeAdapter;
    CGFloat button1_Y = WYATopHeight+20*SizeAdapter;
    CGFloat button1_Width = 100*SizeAdapter;
    CGFloat button1_Height = 44*SizeAdapter;
    button1.frame = CGRectMake(button1_X, button1_Y, button1_Width, button1_Height);

    [self cw_registerShowIntractiveWithEdgeGesture:NO transitionDirectionAutoBlock:^(CWDrawerTransitionDirection direction) {
        if (direction == CWDrawerTransitionFromLeft) { // 左侧滑出
            [weakSelf cw_showDefaultDrawerViewController:weakSelf.leftVC];
        } else if (direction == CWDrawerTransitionFromRight) { // 右侧滑出
            CWLateralSlideConfiguration *conf = [CWLateralSlideConfiguration defaultConfiguration];
            conf.direction = CWDrawerTransitionFromRight; // 从右边滑出
            conf.finishPercent = 0.2f;
            conf.showAnimDuration = 0.2;
            conf.HiddenAnimDuration = 0.2;
            conf.maskAlpha = 0.1;
            
            [weakSelf cw_showDrawerViewController:self.rightVC animationType:CWDrawerAnimationTypeDefault configuration:conf];
        }
    }];
}

#pragma mark - Getter -
- (WYADrawerView *)drawerView{
    if(!_drawerView){
        _drawerView = ({
            WYADrawerView * object = [[WYADrawerView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight-WYATopHeight) leftView:self.leftView rightView:self.rightView];
            object;
        });
    }
    return _drawerView;
}


- (UIView *)leftView{
    if(!_leftView){
        _leftView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = REDCOLOR;
            object;
       });
    }
    return _leftView;
}

- (UIView *)rightView{
    if(!_rightView){
        _rightView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = BLUECOLOR;
            object;
       });
    }
    return _rightView;
}

- (WYADemoDrawerLeftViewController *)leftVC{
    if(!_leftVC){
        _leftVC = ({
            WYADemoDrawerLeftViewController * object = [[WYADemoDrawerLeftViewController alloc]init];
            object;
       });
    }
    return _leftVC;
}

- (WYADemoDrawerRightViewController *)rightVC{
    if(!_rightVC){
        _rightVC = ({
            WYADemoDrawerRightViewController * object = [[WYADemoDrawerRightViewController alloc]init];
            object;
       });
    }
    return _rightVC;
}
@end
