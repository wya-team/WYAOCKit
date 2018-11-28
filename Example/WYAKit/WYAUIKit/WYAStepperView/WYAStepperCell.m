//
//  WYAStepperCell.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/28.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAStepperCell.h"
#define leftSpace 10
@interface WYAStepperCell()<UITextFieldDelegate>
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UITextField  * stepperTextFiled;
@property (nonatomic, strong) UIButton * addButton;
@property (nonatomic, strong) UIButton * subtractButton;
@property (nonatomic, strong) UISwitch * isAble;
@end
@implementation WYAStepperCell

#pragma mark ======= Life Cycle
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.stepperTextFiled];
        [self.contentView addSubview:self.isAble];

    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(leftSpace);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(100);
    }];
    [self.isAble mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-leftSpace);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(50);
    }];
    self.stepperTextFiled.cmam_left = leftSpace;
    self.stepperTextFiled.cmam_top = 40;
    self.stepperTextFiled.cmam_size = CGSizeMake(100, 50);
    
    [self.stepperTextFiled wya_setLeftButtonWithView:self.subtractButton];
    [self.stepperTextFiled wya_setRightButtonWithView:self.addButton];
}
#pragma mark ======= private methods

#pragma mark ======= getter
- (UIButton *)subtractButton{
    if(!_subtractButton){
        _subtractButton = ({
            UIButton * object = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 36, 36)];
            [object setImage:[UIImage imageNamed:@"sub_able"] forState:UIControlStateNormal];
            [object addTarget:self action:@selector(subtractButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
       });
    }
    return _subtractButton;
}

- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object.text = @"stepperView";
            object.textColor = [UIColor blackColor];
            object.font = FONT(16);
            object;
        });
    }
    return _titleLabel;
}

- (UITextField *)stepperTextFiled{
    if(!_stepperTextFiled){
        _stepperTextFiled = ({
            UITextField * object = [[UITextField alloc]init];
            object.text = @"0";
            object.textColor = [UIColor blackColor];
            object.textAlignment = NSTextAlignmentCenter;
            object.delegate = self;
            object;
       });
    }
    return _stepperTextFiled;
}

- (UIButton *)addButton{
    if(!_addButton){
        _addButton = ({
            UIButton * object = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 36, 36)];
            [object setImage:[UIImage imageNamed:@"add_able"] forState:UIControlStateNormal];
            [object addTarget:self action:@selector(addButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
       });
    }
    return _addButton;
}

- (UISwitch *)isAble{
    if(!_isAble){
        _isAble = ({
            UISwitch * object = [[UISwitch alloc]init];
            [object setOn:YES];
            [object addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
            object;
        });
    }
    return _isAble;
}

#pragma mark ======= Action
-(void)switchAction:(UISwitch *)sender
{
    if (sender.isOn) {
        // able
        [self.subtractButton setImage:[UIImage imageNamed:@"sub_able"] forState:UIControlStateNormal];
        [self.addButton setImage:[UIImage imageNamed:@"add_able"] forState:UIControlStateNormal];
    }else {
        // disable
        [self.subtractButton setImage:[UIImage imageNamed:@"sub_disable"] forState:UIControlStateNormal];
        [self.addButton setImage:[UIImage imageNamed:@"add_disable"] forState:UIControlStateNormal];

    }
}

- (void)subtractButtonPressed:(UIButton *)sender{
    NSInteger value = [self.stepperTextFiled.text integerValue];
    if ( value > 0) {
        value = value - 1;
        self.stepperTextFiled.text = [NSString stringWithFormat:@"%ld",value];
    }
}
- (void)addButtonPressed:(UIButton *)sender{
    NSInteger value = [self.stepperTextFiled.text integerValue];
    value = value + 1;
    self.stepperTextFiled.text = [NSString stringWithFormat:@"%ld",value];
}
@end
