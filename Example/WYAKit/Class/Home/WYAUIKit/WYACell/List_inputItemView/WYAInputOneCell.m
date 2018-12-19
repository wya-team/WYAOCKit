//
//  WYAInputOneCell.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAInputOneCell.h"
#define leftSpace 10*SizeAdapter
@interface WYAInputOneCell()<UITextFieldDelegate>
@property (nonatomic, copy) NSString * width;
@end
@implementation WYAInputOneCell
#pragma mark ======= Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.textFiled];
        [self.contentView addSubview:self.leftButton];
        [self.contentView addSubview:self.rightButton];
        self.isEditor = YES;
        self.width = @"100";
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(leftSpace);
        make.top.equalTo(self.mas_top).offset(leftSpace);
        make.size.mas_equalTo(CGSizeMake(80*SizeAdapter, 20*SizeAdapter));
    }];
    [self.textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftButton.mas_right).offset(5*SizeAdapter);
        make.top.equalTo(self.mas_top).offset(leftSpace);
        make.size.mas_equalTo(CGSizeMake(200*SizeAdapter, 20*SizeAdapter));
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-leftSpace);
        make.top.equalTo(self.mas_top).offset(leftSpace);
        make.size.mas_equalTo(CGSizeMake([self.width floatValue],20*SizeAdapter));
    }];
 
}
#pragma mark ======= setter

- (void)setModel:(WYAInputItemModel *)model{
    [self.leftButton setTitle:model.titleString forState:UIControlStateNormal];
    self.textFiled.placeholder = model.TextFiledText;
    if ([model.type isEqualToString:@"0"]) {
        [self.rightButton setTitle:model.instructionsString forState:UIControlStateNormal];
    }else if([model.type isEqualToString:@"1"]){
        self.width = @"20";
        [self.rightButton setImage:[UIImage imageNamed:model.imageNamed] forState:UIControlStateNormal];
    }
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
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_inputOneCell:textFiledChangeingValue:)]) {
        [self.delegate wya_inputOneCell:self textFiledChangeingValue:textField.text];
    }
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_inputOneCell:textFiledDidEndEditing:)]) {
        [self.delegate wya_inputOneCell:self textFiledDidEndEditing:textField.text];
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_inputOneCell:textFiledShouldReturn:)]) {
        [self.delegate wya_inputOneCell:self textFiledShouldReturn:textField.text];
    }
    return YES;
}
#pragma mark ======= Event
- (void)rightButtonPressed:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_inputOneCell:rightButtonDidSelected:)]) {
        [self.delegate wya_inputOneCell:self rightButtonDidSelected:sender];
    }
}
@end
