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
    [self.stepperTextFiled wya_setLeftViewWithView:self.subtractButton];
    [self.stepperTextFiled wya_setRightButtonWithView:self.addButton];
}
#pragma mark ======= setter
- (void)setChildFrame:(CGRect)childFrame{
    self.subtractButton.frame = CGRectMake(0, 0, childFrame.size.width, childFrame.size.height);
    self.addButton.frame = CGRectMake(0, 0, childFrame.size.width, childFrame.size.height);
    [self layoutIfNeeded];
}
- (void)setImageNamedArray:(NSArray *)ImageNamedArray{
    
    [self.subtractButton setImage:[UIImage imageNamed:[ImageNamedArray wya_safeObjectAtIndex:0]] forState:UIControlStateNormal];
    [self.addButton setImage:[UIImage imageNamed:[ImageNamedArray wya_safeObjectAtIndex:1]] forState:UIControlStateNormal];

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
            UITextField * object = [[UITextField alloc]initWithFrame:CGRectMake(5, 5, self.frame.size.width-10, self.frame.size.height-10)];
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
