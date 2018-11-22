//
//  WYADatePicker.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/22.
//

#import "WYADatePicker.h"
#import "WYAPaginationView.h"

static CGFloat pickerViewHeight = 220.0;
static CGFloat titleHeight = 44.0;

@interface WYADatePicker ()<WYAPaginationViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) WYAPaginationView * titleView;
@property (nonatomic, strong) UIPickerView * pickView;
@property (nonatomic, copy) NSString * resultString;

@end

@implementation WYADatePicker

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

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.titleView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self);
        make.height.mas_equalTo(titleHeight);
    }];
    
    [self.pickView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.titleView.mas_bottom);
        make.height.mas_equalTo(self.pickerHeight? self.pickerHeight : pickerViewHeight);
    }];
    
}

#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    switch (self.datePickerStyle) {
        case WYADatePickerStyleDateHourMinuteSecond:
            return 6;
        default:
            return 0;
    }
    
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (self.datePickerStyle) {
        case WYADatePickerStyleDateHourMinuteSecond:
            return 1;
        default:
            return 0;
    }
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    switch (self.datePickerStyle) {
        case WYADatePickerStyleDateHourMinuteSecond:
            return self.cmam_width/6;
        default:
            return 0;
    }
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return self.pickerItemHeight? self.pickerItemHeight : 44;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
    UILabel * label = [[UILabel alloc]init];
    switch (self.datePickerStyle) {
        case WYADatePickerStyleDateHourMinuteSecond:
        {
            label.frame = CGRectMake(0, 0, self.cmam_width, self.pickerItemHeight ? self.pickerItemHeight : 44);
            label.text = @"";
            
        }
            break;
        default:
            break;
    }
//    label.textColor = self.pickerItemColor ? self.pickerItemColor : [UIColor blackColor];
//    label.font = self.pickerItemFont ? self.pickerItemFont : [UIFont systemFontOfSize:17];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

/*
 - (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
 
 return self.dataSource[row];
 }
 
 
 
 - (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED; // attributed title is favored if both methods are implemented
 
 
 */

#pragma mark UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
    switch (self.datePickerStyle) {
        case WYADatePickerStyleDateHourMinuteSecond:
            
            break;
        default:
            break;
    }
    
    
    NSLog(@"string==%@",self.resultString);
    [self.titleView wya_SetTitleLabelWithText:self.resultString TextColor:[UIColor blackColor] TextFont:15];
}

#pragma mark --- WYAPaginationViewDelegate
- (void)wya_LeftAction{
    if (self.viewController) {
        [self.viewController dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self removeFromSuperview];
    }
}

- (void)wya_RightAction{
//    if (self.wya_delegate && [self.delegate respondsToSelector:@selector(wya_ChooseWithPickerView:ResultString:)]) {
//        [self.delegate wya_ChooseWithPickerView:self ResultString:self.resultString];
//        if (self.viewController) {
//            [self.viewController dismissViewControllerAnimated:YES completion:nil];
//        }else{
//            [self removeFromSuperview];
//        }
//    }
}

#pragma mark --- Private Action
-(void)createUI{
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.titleView];
    [self addSubview:self.pickView];
}
#pragma mark --- Public Action

-(CGFloat)getPickerViewHeight{
    [self layoutIfNeeded];
    return self.titleView.cmam_height+self.pickView.cmam_height;
}


#pragma mark --- Getter
-(WYAPaginationView *)titleView{
    if (!_titleView) {
        _titleView = [[WYAPaginationView alloc]init];
        _titleView.backgroundColor = [UIColor whiteColor];
        _titleView.wya_Delegate = self;
        [_titleView wya_SetLeftButtonWithTitle:@"取消" TitleColor:[UIColor blueColor] TitleFont:15];
        [_titleView wya_SetRightButtonWithTitle:@"确定" TitleColor:[UIColor blueColor] TitleFont:15];
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

#pragma mark --- Setter
-(void)setDatePickerStyle:(WYADatePickerStyle)datePickerStyle{
    _datePickerStyle = datePickerStyle;
    [self.pickView reloadAllComponents];
}

-(void)setPickerHeight:(CGFloat)pickerHeight{
    _pickerHeight = pickerHeight;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

-(void)setPickerItemHeight:(CGFloat)pickerItemHeight{
    _pickerItemHeight = pickerItemHeight;
    [self.pickView reloadAllComponents];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
