//
//  WYAInputItemCell.m
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/11/29.
//

#import "WYAInputItemCell.h"

@interface WYAInputItemCell()<UITextFieldDelegate>
/// 输入框
@property (nonatomic, strong) UITextField * inputTextFiled;
// 输入框leftView
@property (nonatomic, strong) UIButton * leftButton;
// 输入框rightView
@property (nonatomic, strong) UIButton * rightButton;
// 图片按钮
@property (nonatomic, strong) UIButton * arrowButton;
@end
@implementation WYAInputItemCell
#pragma mark ======= Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.inputTextFiledEnable = YES;
        [self.contentView addSubview:self.inputTextFiled];
        
    }
    return  self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.inputTextFiled.cmam_left = 10*SizeAdapter;
    self.inputTextFiled.cmam_centerY = self.contentView.cmam_centerY;
    CGFloat width = self.arrowImageNamed ? (ScreenWidth - 20*SizeAdapter - 35*SizeAdapter) : (ScreenWidth - 20*SizeAdapter);
    self.inputTextFiled.cmam_size = CGSizeMake(width, 25*SizeAdapter);
    
    [self.inputTextFiled wya_setLeftButtonWithView:self.leftButton];
    [self.inputTextFiled wya_setRightButtonWithView:self.rightButton];
    
    if (self.arrowImageNamed) {
        self.arrowButton.cmam_centerY = self.contentView.cmam_centerY;
        self.arrowButton.cmam_right = -10*SizeAdapter;
        self.arrowButton.cmam_size = CGSizeMake(35*SizeAdapter, 35*SizeAdapter);
    }
}
#pragma mark ======= setter
- (void)setInputTextFiledEnable:(BOOL)inputTextFiledEnable{
    _inputTextFiledEnable = inputTextFiledEnable;
}
- (void)setArrowImageNamed:(NSString *)arrowImageNamed{
    _arrowImageNamed = arrowImageNamed;
    [self.arrowButton setImage:[UIImage imageNamed:arrowImageNamed] forState:UIControlStateNormal];
    [self.contentView addSubview:self.arrowButton];
}

- (void)setTextChildStringArray:(NSArray *)textChildStringArray{
    _textChildStringArray = textChildStringArray;
    CGFloat width = [[textChildStringArray wya_safeObjectAtIndex:0] wya_widthWithFontSize:14 height:25];
    self.leftButton.frame = CGRectMake(0, 0, width, 25*SizeAdapter);
    [self.leftButton setTitle:[textChildStringArray wya_safeObjectAtIndex:0] forState:UIControlStateNormal];
    if (_textChildStringArray.count == 2) {
        CGFloat width = [[textChildStringArray wya_safeObjectAtIndex:1] wya_widthWithFontSize:14 height:25];
        self.rightButton.frame = CGRectMake(0, 0, width, 25*SizeAdapter);
        [self.rightButton setTitle:[textChildStringArray wya_safeObjectAtIndex:1] forState:UIControlStateNormal];
    }
    [self layoutIfNeeded];
}

- (void)setRightTitleColor:(UIColor *)rightTitleColor{
    [self.rightButton setTitleColor:rightTitleColor forState:UIControlStateNormal];
}
- (void)setPlaceholderString:(NSString *)placeholderString{
    self.inputTextFiled.placeholder = placeholderString;
}
#pragma mark ======= getter
- (UITextField *)inputTextFiled{
    if(!_inputTextFiled){
        _inputTextFiled = ({
            UITextField * object = [[UITextField alloc]init];
            object;
       });
    }
    return _inputTextFiled;
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
            object.titleLabel.font = FONT(14);
            [object setTitleColor:[UIColor groupTableViewBackgroundColor] forState:UIControlStateNormal];
            [object addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
       });
    }
    return _rightButton;
}

- (UIButton *)leftButton{
    if(!_leftButton){
        _leftButton = ({
            UIButton * object = [[UIButton alloc]init];
            object.titleLabel.font = FONT(14);
            [object setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            object;
       });
    }
    return _leftButton;
}
#pragma mark ======= UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (self.inputTextFiledEnable) {
        return NO;
    }
    return YES;
}


#pragma mark ======= Action
- (void)rightButtonPressed:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_inputItemCell:rightButtonPressed:)]) {
        [self.delegate wya_inputItemCell:self rightButtonPressed:sender];
    }
}
- (void)arrowButtonPressed:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_inputItemCell:arrowImagePressed:)]) {
        [self.delegate wya_inputItemCell:self arrowImagePressed:sender];
    }
}
@end
