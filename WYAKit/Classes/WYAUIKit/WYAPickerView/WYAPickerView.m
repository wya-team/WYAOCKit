//
//  WYAPickerView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/21.
//

#import "WYAPickerView.h"

static CGFloat pickerViewHeight = 220.0;

static CGFloat titleHeight = 50.0;

@interface WYAPickerView ()
@property (nonatomic, strong) UIView * contentView;

@property (nonatomic, strong) UIView * titleView;

@property (nonatomic, strong) UIPickerView * pickView;

@property (nonatomic, strong) UIButton * cancelButton;

@property (nonatomic, strong) UIButton * sureButton;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, copy) NSString * resultString;
@end

@implementation WYAPickerView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
        
        [self.titleView addSubview:self.cancelButton];
        [self.titleView addSubview:self.sureButton];
        [self.titleView addSubview:self.titleLabel];
        [self.contentView addSubview:self.titleView];
        [self.contentView addSubview:self.pickView];
        [self addSubview:self.contentView];
        
        [Window addSubview:self];
        [Window bringSubviewToFront:self];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    
    self.contentView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, titleHeight+(self.pickerHeight>titleHeight? self.pickerHeight:pickerViewHeight));
    self.titleView.frame = CGRectMake(0, 0, ScreenWidth, titleHeight);
    
    self.cancelButton.frame = CGRectMake(5, (titleHeight-30)/2, 40, 30);
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.cancelButton.frame)+10, (titleHeight-30)/2, ScreenWidth-CGRectGetMaxX(self.cancelButton.frame)-30-40, 30);
    self.sureButton.frame = CGRectMake(ScreenWidth-45, (titleHeight-30)/2, 40, 30);
    
    
    self.pickView.frame = CGRectMake(0, titleHeight, ScreenWidth, self.pickerHeight? self.pickerHeight:pickerViewHeight);
}

#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.dataSource.count;
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    
    return ScreenWidth;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return self.pickerItemHeight? self.pickerItemHeight : 44;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, self.pickerItemHeight ? self.pickerItemHeight : 44)];
    label.textColor = self.pickerItemColor ? self.pickerItemColor : [UIColor blackColor];
    label.font = self.pickerItemFont ? self.pickerItemFont : [UIFont systemFontOfSize:17];
    label.text = self.dataSource[row];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

#pragma mark UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.resultString = self.dataSource[row];
    self.titleLabel.text = self.resultString;
}

#pragma mark Private Action
- (void)cancelClick{
    [UIView animateWithDuration:0.5 animations:^{
        self.contentView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, self.pickView.frame.size.height+self.titleView.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)sureClick{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(singleWithPickerView:ResultString:)]) {
        [self.delegate singleWithPickerView:self ResultString:self.resultString];
        [self cancelClick];
    }
}
#pragma mark Public Action
- (void)show{
    if (self.resultString == nil) {
        self.resultString = [self.dataSource firstObject];
        self.titleLabel.text = self.resultString;
    }
    [self layoutIfNeeded];
    [self.pickView reloadAllComponents];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.contentView.frame = CGRectMake(0, ScreenHeight-self.pickView.frame.size.height-self.titleView.frame.size.height, ScreenWidth, self.pickView.frame.size.height+self.titleView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.dataSource[row];
}

/*
 
 - (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED; // attributed title is favored if both methods are implemented
 
 
 */

-(UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
    }
    return _contentView;
}

-(UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc]init];
        _titleView.backgroundColor = [UIColor whiteColor];
    }
    return _titleView;
}

-(UIPickerView *)pickView{
    if (!_pickView) {
        _pickView = [[UIPickerView alloc]init];
        _pickView.delegate = self;
        _pickView.backgroundColor = [UIColor whiteColor];
    }
    return _pickView;
}

-(UIButton *)cancelButton{
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
        //        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:15];
        //        _cancelButton.layer.borderWidth = 0.5;
        //        _cancelButton.layer.borderColor = [UIColor blackColor].CGColor;
        //        _cancelButton.layer.cornerRadius = 4;
        //        _cancelButton.layer.masksToBounds = YES;
    }
    return _cancelButton;
}

-(UIButton *)sureButton{
    if (!_sureButton) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sureButton addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
        //        _sureButton.titleLabel.font = [UIFont systemFontOfSize:15];
        //        _sureButton.layer.borderWidth = 0.5;
        //        _sureButton.layer.borderColor = [UIColor blackColor].CGColor;
        //        _sureButton.layer.cornerRadius = 4;
        //        _sureButton.layer.masksToBounds = YES;
    }
    return _sureButton;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

#pragma mark Set
- (void)setCancelButtonColor:(UIColor *)cancelButtonColor{
    if (cancelButtonColor) {
        [self.cancelButton setTitleColor:cancelButtonColor forState:UIControlStateNormal];
    }
}

-(void)setCancelButtonFont:(UIFont *)cancelButtonFont{
    if (cancelButtonFont) {
        self.cancelButton.titleLabel.font = cancelButtonFont;
    }
}

-(void)setSureButtonColor:(UIColor *)sureButtonColor{
    if (sureButtonColor) {
        [self.sureButton setTitleColor:sureButtonColor forState:UIControlStateNormal];
    }
}

-(void)setSureButtonFont:(UIFont *)sureButtonFont{
    if (sureButtonFont) {
        self.sureButton.titleLabel.font = sureButtonFont;
    }
}

-(void)setTitleColor:(UIColor *)titleColor{
    if (titleColor) {
        self.titleLabel.textColor = titleColor;
    }
}

- (void)setTitleFont:(UIFont *)titleFont{
    if (titleFont) {
        self.titleLabel.font = titleFont;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
