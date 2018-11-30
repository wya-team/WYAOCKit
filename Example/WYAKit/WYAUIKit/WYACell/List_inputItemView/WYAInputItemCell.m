//
//  WYAImputItemCell.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/29.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAInputItemCell.h"
#define leftSpace 10*SizeAdapter
@interface WYAInputItemCell()<UITextFieldDelegate>
@property (nonatomic, strong) UIButton * arrowButton;
@property (nonatomic, assign) BOOL  isShowArrow;
@property (nonatomic, copy) NSString * arrowImagNamed;
@end
@implementation WYAInputItemCell
#pragma mark ======= Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.textFiled];
        [self addSubview:self.leftButton];
        [self addSubview:self.rightButton];
        [self addSubview:self.arrowButton];
        self.arrowButton.hidden = YES;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.leftButton.cmam_left = leftSpace;
    self.leftButton.cmam_centerY = self.cmam_centerY;
    self.leftButton.cmam_size = CGSizeMake(80*SizeAdapter, 30*SizeAdapter);
    
    self.textFiled.cmam_left = self.leftButton.cmam_right + 5*SizeAdapter;
    self.textFiled.cmam_centerY = self.cmam_centerY;
    self.textFiled.cmam_size = CGSizeMake(200*SizeAdapter, 30*SizeAdapter);
    
    if (self.arrowImagNamed) {
        self.arrowButton.cmam_right = self.cmam_right-leftSpace;
        self.arrowButton.cmam_centerY = self.cmam_centerY;
        self.arrowButton.cmam_size = CGSizeMake(25*SizeAdapter, 25*SizeAdapter);

        self.rightButton.cmam_right = -self.arrowButton.cmam_left-5*SizeAdapter;
        self.rightButton.cmam_centerY = self.cmam_centerY;
        self.rightButton.cmam_size = CGSizeMake(100*SizeAdapter, 25*SizeAdapter);
    }else{
        self.rightButton.cmam_right = self.cmam_right-5*SizeAdapter;
        self.rightButton.cmam_centerY = self.cmam_centerY;
        self.rightButton.cmam_size = CGSizeMake(100*SizeAdapter, 25*SizeAdapter);
    }

    
    
}
#pragma mark ======= setter
- (void)setArrowImagNamed:(NSString *)arrowImagNamed{
    [self.arrowButton setImage:[UIImage imageNamed:arrowImagNamed] forState:UIControlStateNormal];
    [self layoutIfNeeded];
}
- (void)setDataArray:(NSArray *)dataArray{
    NSInteger type = [[dataArray lastObject] integerValue];
    switch (type) {
        case 0:
            {
                [self.leftButton setTitle:[dataArray wya_safeObjectAtIndex:0] forState:UIControlStateNormal];
                self.textFiled.text = [dataArray wya_safeObjectAtIndex:1];
                [self.rightButton setTitle:[dataArray wya_safeObjectAtIndex:2] forState:UIControlStateNormal];
            }
            break;
        case 1:
        {
            self.leftButton.titleLabel.text = [dataArray wya_safeObjectAtIndex:0];
            self.textFiled.text = [dataArray wya_safeObjectAtIndex:1];
            self.arrowImagNamed= [dataArray wya_safeObjectAtIndex:3];
        }
            break;
        case 2:
        {
            [self.leftButton setTitle:[dataArray wya_safeObjectAtIndex:0] forState:UIControlStateNormal];
            self.textFiled.text = [dataArray wya_safeObjectAtIndex:1];
            [self.rightButton setTitle:[dataArray wya_safeObjectAtIndex:2] forState:UIControlStateNormal];
            self.arrowImagNamed= [dataArray wya_safeObjectAtIndex:3];

        }
            break;
        case 3:
        {
            [self.leftButton setTitle:[dataArray wya_safeObjectAtIndex:0] forState:UIControlStateNormal];
            self.textFiled.text = [dataArray wya_safeObjectAtIndex:1];
        }
            break;
        default:
            break;
    }
}
#pragma mark ======= getter
- (UITextField *)textFiled{
    if(!_textFiled){
        _textFiled = ({
            UITextField * object = [[UITextField alloc]init];
//            object.backgroundColor = [UIColor redColor];
            object.textColor = [UIColor grayColor];
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
//            object.backgroundColor = [UIColor brownColor];

            object;
       });
    }
    return _leftButton;
}

- (UIButton *)arrowButton{
    if(!_arrowButton){
        _arrowButton = ({
            UIButton * object = [[UIButton alloc]init];
//            object.backgroundColor = [UIColor greenColor];
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
//            object.backgroundColor = [UIColor yellowColor];

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
#pragma mark ======= Event
- (void)rightButtonPressed:(UIButton *)sender{
    
}
- (void)arrowButtonPressed:(UIButton *)sender{
    
}
@end
