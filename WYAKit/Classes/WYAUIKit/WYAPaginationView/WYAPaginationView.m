//
//  WYAPaginationView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/19.
//

#import "WYAPaginationView.h"

@interface WYAPaginationView ()

@end

@implementation WYAPaginationView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    [self addSubview:self.leftButton];
    [self addSubview:self.rightButton];
    [self addSubview:self.titleLabel];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.leftButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self.mas_left).with.offset(5*SizeAdapter);
        make.width.mas_equalTo(60*SizeAdapter);
    }];
    
    [self.rightButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.right.mas_equalTo(self.mas_right).with.offset(-5*SizeAdapter);
        make.width.mas_equalTo(60*SizeAdapter);
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self.leftButton.mas_right).with.offset(5*SizeAdapter);
        make.right.mas_equalTo(self.rightButton.mas_left).with.offset(-5*SizeAdapter);
    }];
}

#pragma mark --- Getter
-(UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setTitle:@"上一页" forState:UIControlStateNormal];
        [_leftButton setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
        [_leftButton setTitleColor:random(210, 210, 210, 1) forState:UIControlStateDisabled];
        _leftButton.titleLabel.font = FONT(13);
        [_leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.layer.borderColor = random(242, 242, 242, 1).CGColor;
        _leftButton.layer.borderWidth = 0.5;
        _leftButton.layer.cornerRadius = 4.f;
        _leftButton.layer.masksToBounds = YES;
        _leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_leftButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [_leftButton setBackgroundImage:[UIImage wya_createImageWithColor:random(251, 251, 253, 1)] forState:UIControlStateDisabled];
    }
    return _leftButton;
}

-(UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setTitle:@"下一页" forState:UIControlStateNormal];
        [_rightButton setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
        [_rightButton setTitleColor:random(210, 210, 210, 1) forState:UIControlStateDisabled];
        _rightButton.titleLabel.font = FONT(13);
        [_rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.layer.borderColor = random(242, 242, 242, 1).CGColor;
        _rightButton.layer.borderWidth = 0.5;
        _rightButton.layer.cornerRadius = 4.f;
        _rightButton.layer.masksToBounds = YES;
        _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_rightButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [_rightButton setBackgroundImage:[UIImage wya_createImageWithColor:random(251, 251, 253, 1)] forState:UIControlStateDisabled];
    }
    return _rightButton;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = random(51, 51, 51, 1);
        _titleLabel.text = @"0/10";
        _titleLabel.font = FONT(15);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

#pragma mark --- Private Method
-(void)leftButtonClick{
    if (self.wya_Delegate && [self.wya_Delegate respondsToSelector:@selector(wya_leftActionWithPaginationView:button:)]) {
        [self.wya_Delegate wya_leftActionWithPaginationView:self button:self.leftButton];
    }
}

-(void)rightButtonClick{
    if (self.wya_Delegate && [self.wya_Delegate respondsToSelector:@selector(wya_rightActionWithPaginationView:button:)]) {
        [self.wya_Delegate wya_rightActionWithPaginationView:self button:self.rightButton];
    }
}

#pragma mark --- Public Method
-(void)wya_SetLeftButtonWithTitle:(NSString *)title
                   TitleColor:(UIColor *)titleColor
                    TitleFont:(CGFloat)titleFont{
    [self.leftButton setTitle:title forState:UIControlStateNormal];
    [self.leftButton setTitleColor:titleColor forState:UIControlStateNormal];
    self.leftButton.titleLabel.font = FONT(titleFont);
}

-(void)wya_SetRightButtonWithTitle:(NSString *)title
                    TitleColor:(UIColor *)titleColor
                     TitleFont:(CGFloat)titleFont{
    [self.rightButton setTitle:title forState:UIControlStateNormal];
    [self.rightButton setTitleColor:titleColor forState:UIControlStateNormal];
    self.rightButton.titleLabel.font = FONT(titleFont);
}

-(void)wya_SetTitleLabelWithText:(NSString *)text
                   TextColor:(UIColor *)textColor
                    TextFont:(CGFloat)textFont{
    self.titleLabel.text = text;
    self.titleLabel.textColor = textColor;
    self.titleLabel.font = FONT(textFont);
}

@end
