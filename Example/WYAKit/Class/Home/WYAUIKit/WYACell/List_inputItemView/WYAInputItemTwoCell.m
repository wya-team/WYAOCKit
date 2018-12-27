//
//  WYAImputItemCell.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/29.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAInputItemTwoCell.h"
#define leftSpace 10*SizeAdapter
@interface WYAInputItemTwoCell()<UITextFieldDelegate>
@property (nonatomic, strong) UIButton * arrowButton;
@end
@implementation WYAInputItemTwoCell
#pragma mark ======= Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.textFiled];
        [self addSubview:self.leftButton];
        [self addSubview:self.rightButton];
        [self addSubview:self.arrowButton];
        self.isEditor = YES;
    }
    return self;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textFiled resignFirstResponder];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(leftSpace);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(80*SizeAdapter, 20*SizeAdapter));
    }];
    [self.textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftButton.mas_right).offset(5*SizeAdapter);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(200*SizeAdapter, 20*SizeAdapter));
    }];
    
    [self.arrowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-leftSpace);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(15*SizeAdapter,15*SizeAdapter));
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.arrowButton.mas_left).offset(-5*SizeAdapter);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(80*SizeAdapter,20*SizeAdapter));
    }];
}
#pragma mark ======= setter

- (void)setModel:(WYAInputItemModel *)model{
    [self.leftButton setTitle:model.titleString forState:UIControlStateNormal];
    self.textFiled.placeholder = model.TextFiledText;
    [self.rightButton setTitle:model.instructionsString forState:UIControlStateNormal];
    [self.arrowButton setImage:[UIImage imageNamed:model.imageNamed] forState:UIControlStateNormal];
    [self layoutIfNeeded];
}
#pragma mark ======= getter
- (UITextField *)textFiled{
    if(!_textFiled){
        _textFiled = ({
            UITextField * object = [[UITextField alloc]init];
            object.textColor = [UIColor blackColor];
            object.font = FONT(14);
            object.delegate = self;
            object.returnKeyType = UIReturnKeyDone;
            object;
       });
    }
    return _textFiled;
}

- (UIButton *)leftButton{
    if(!_leftButton){
        _leftButton = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            object.titleLabel.font = FONT(14);
            object.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            object;
       });
    }
    return _leftButton;
}

- (UIButton *)arrowButton{
    if(!_arrowButton){
        _arrowButton = ({
            UIButton * object = [[UIButton alloc]init];
            [object addTarget:self action:@selector(arrowButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _arrowButton;
}
- (UIButton *)rightButton{
    if(!_rightButton){
        _rightButton = ({
            UIButton * object = [[UIButton alloc]init];
            object.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            [object setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            object.titleLabel.font = FONT(14);
            [object addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
       });
    }
    return _rightButton;
}
#pragma mark ======= UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return _isEditor;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_inputItemTwoCell:textFiledChangeingValue:)]) {
        [self.delegate wya_inputItemTwoCell:self textFiledChangeingValue:textField.text];
    }
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.textFiled resignFirstResponder];

    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_inputItemTwoCell:textFiledDidEndEditing:)]) {
        [self.delegate wya_inputItemTwoCell:self textFiledDidEndEditing:textField.text];
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textFiled resignFirstResponder];
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_inputItemTwoCell:textFiledShouldReturn:)]) {
        [self.delegate wya_inputItemTwoCell:self textFiledShouldReturn:textField.text];
    }
    return YES;
}
#pragma mark ======= Event
- (void)rightButtonPressed:(UIButton *)sender{
    [self.textFiled resignFirstResponder];

    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_inputItemTwoCell:rightButtonDidSelected:)]) {
        [self.delegate wya_inputItemTwoCell:self rightButtonDidSelected:sender];
    }
}
- (void)arrowButtonPressed:(UIButton *)sender{
    [self.textFiled resignFirstResponder];

    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_inputItemTwoCell:imageButtonDidSelected:)]) {
        [self.delegate wya_inputItemTwoCell:self imageButtonDidSelected:sender];
    }
}
@end
