//
//  WYAStepperCell.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/28.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAStepperView.h"
#define leftSpace 10
@interface WYAStepperView()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField  * stepperTextFiled;
@property (nonatomic, strong) UIButton * addButton;
@property (nonatomic, strong) UIButton * subtractButton;
@end
@implementation WYAStepperView

#pragma mark ======= Life Cycle
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.stepperTextFiled];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.stepperTextFiled.frame = self.frame;
    [self.stepperTextFiled wya_setLeftButtonWithView:self.subtractButton];
    [self.stepperTextFiled wya_setRightButtonWithView:self.addButton];
}
#pragma mark ======= setter
- (void)setLeftFrame:(CGRect)leftFrame{
    self.subtractButton.frame = CGRectMake(0, 0, leftFrame.size.width, leftFrame.size.height);
}
- (void)setRightFrame:(CGRect)rightFrame{
    self.addButton.frame = CGRectMake(0, 0, rightFrame.size.width, rightFrame.size.height);
}
- (void)setLeftImageNamed:(NSString *)leftImageNamed{
    
    [self.subtractButton setImage:[UIImage imageNamed:leftImageNamed] forState:UIControlStateNormal];

}
- (void)setRightImageNamed:(NSString *)rightImageNamed
{
    [self.addButton setImage:[UIImage imageNamed:rightImageNamed] forState:UIControlStateNormal];

}
#pragma mark ======= getter
- (UIButton *)subtractButton{
    if(!_subtractButton){
        _subtractButton = ({
            UIButton * object = [[UIButton alloc]init];
            [object addTarget:self action:@selector(subtractButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
       });
    }
    return _subtractButton;
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
            UIButton * object = [[UIButton alloc]init];
//            [object setImage:[UIImage imageNamed:@"add_able"] forState:UIControlStateNormal];
            [object addTarget:self action:@selector(addButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
       });
    }
    return _addButton;
}


#pragma mark ======= UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return NO;
}
#pragma mark ======= Action

- (void)subtractButtonPressed:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_stepperView:leftButtonPressed:)]) {
        [self.delegate wya_stepperView:self leftButtonPressed:sender];
    }
}
- (void)addButtonPressed:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_stepperView:rightButtonPressed:)]) {
        [self.delegate wya_stepperView:self rightButtonPressed:sender];
    }
}
@end
