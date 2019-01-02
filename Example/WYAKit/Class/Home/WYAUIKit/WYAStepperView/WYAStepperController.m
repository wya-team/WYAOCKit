//
//  WYAStepperController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/29.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAStepperController.h"
#import <WYAKit/WYAStepperView.h>

@interface WYAStepperController () <WYAStepperViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) WYAStepperView * ableStepperView;
@property (nonatomic, strong) WYAStepperView * disableAtepperView;
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation WYAStepperController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
    vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/WYAStepperView/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];

    self.navTitle = @"StepperView";
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (WYAStepperView *)ableStepperView
{
    if (!_ableStepperView) {
        _ableStepperView = ({
            WYAStepperView * object = [[WYAStepperView alloc] initWithFrame:CGRectMake(ScreenWidth - 100 * SizeAdapter, 0, 100 * SizeAdapter, 40 * SizeAdapter)];
            object.childFrame       = CGRectMake(0, 0, 30 * SizeAdapter, 30 * SizeAdapter);
            object.ImageNamedArray  = @[ @"icon_stepper_minus", @"icon_stepper_plus" ];
            object.delegate         = self;
            object;
        });
    }
    return _ableStepperView;
}

- (WYAStepperView *)disableAtepperView
{
    if (!_disableAtepperView) {
        _disableAtepperView = ({
            WYAStepperView * object       = [[WYAStepperView alloc] initWithFrame:CGRectMake(ScreenWidth - 100 * SizeAdapter, 0, 100 * SizeAdapter, 40 * SizeAdapter)];
            object.childFrame             = CGRectMake(0, 0, 30 * SizeAdapter, 30 * SizeAdapter);
            object.ImageNamedArray        = @[ @"icon_stepper_minus_normal", @"icon_stepper_normal" ];
            object.delegate               = self;
            object.tintColor              = WHITECOLOR;
            object.userInteractionEnabled = NO;
            object.alpha                  = 0.5;
            object;
        });
    }
    return _disableAtepperView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = ({
            UITableView * object   = [[UITableView alloc] initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight)];
            object.delegate        = self;
            object.dataSource      = self;
            object.backgroundColor = [UIColor wya_hex:@"#FFFFFF"];
            object.tableFooterView = [[UIView alloc] init];
            object;
        });
    }
    return _tableView;
}

#pragma mark ======= delegate
- (void)wya_stepperView:(WYAStepperView *)stepperView leftButtonPressed:(UIButton *)sender
{
    NSInteger value = [stepperView.stepperTextFiled.text integerValue];
    if (value > 0) {
        value -= 1;
        stepperView.stepperTextFiled.text = [NSString stringWithFormat:@"%ld", value];
    }
}
- (void)wya_stepperView:(WYAStepperView *)stepperView rightButtonPressed:(UIButton *)sender
{
    NSInteger value = [stepperView.stepperTextFiled.text integerValue];
    value += 1;
    stepperView.stepperTextFiled.text = [NSString stringWithFormat:@"%ld", value];
}
#pragma mark ======= UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.textLabel.text    = @"Show number value";
        [cell.contentView addSubview:self.ableStepperView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.textLabel.text    = @"Disabled";
        cell.selectionStyle    = UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview:self.disableAtepperView];
        return cell;
    }
}
#pragma mark ======= UITableViewDelegate

@end
