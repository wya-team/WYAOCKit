//
//  WYAStepperCell.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/28.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAStepperCell.h"
#define leftSpace 10
@interface WYAStepperCell()
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UITextField  * stepperTextFiled;
@property (nonatomic, strong) UIButton * addButton;
@property (nonatomic, strong) UIButton * subtractButton;
@end
@implementation WYAStepperCell

#pragma mark ======= Life Cycle
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.stepperTextFiled];
        [self setUp];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(leftSpace);
        make.right.equalTo(self.contentView.mas_right).offset(-leftSpace);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.height.mas_equalTo(20);
    }];
    
}
#pragma mark ======= private methods
- (void)setUp{
    self.titleLabel.text = @"stepperView";
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = FONT(16);
    
    
}
#pragma mark ======= getter
- (UIButton *)subtractButton{
    if(!_subtractButton){
        _subtractButton = ({
            UIButton * object = [[UIButton alloc]init];
            object;
       });
    }
    return _subtractButton;
}

- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object;
        });
    }
    return _titleLabel;
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


@end
