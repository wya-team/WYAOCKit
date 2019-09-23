//
//  WYADatePicker.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/22.
//
#import "UIColor+Category.h"
#import "WYADatePicker.h"
#import "WYAPaginationView.h"
#import "WYAPickerManager.h"
static CGFloat pickerViewHeight = 220.0;
static CGFloat titleHeight      = 44.0;

@interface WYADatePicker () <WYAPaginationViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) WYAPaginationView * titleView;
@property (nonatomic, strong) UIView * line;
@property (nonatomic, strong) WYAPickerManager * datePickerManager;
@property (nonatomic, strong) UIPickerView * pickView;
@property (nonatomic, copy) NSString * resultString;
@property (nonatomic, strong) NSDate * nowDate;
@property (nonatomic, copy) NSString * yearString;
@property (nonatomic, copy) NSString * mouthString;
@property (nonatomic, copy) NSString * dayString;
@property (nonatomic, copy) NSString * hourString;
@property (nonatomic, copy) NSString * minuteString;
@property (nonatomic, copy) NSString * secondString;

@end

@implementation WYADatePicker

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) { [self createUI]; }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat titleView_X      = 0;
    CGFloat titleView_Y      = 0;
    CGFloat titleView_Width  = ScreenWidth;
    CGFloat titleView_Height = titleHeight;
    self.titleView.frame     = CGRectMake(titleView_X, titleView_Y, titleView_Width, titleView_Height);

    CGFloat line_X      = 0;
    CGFloat line_Y      = CGRectGetMaxY(self.titleView.frame);
    CGFloat line_Width  = ScreenWidth;
    CGFloat line_Height = 1;
    self.line.frame     = CGRectMake(line_X, line_Y, line_Width, line_Height);

    CGFloat pickView_X      = 0;
    CGFloat pickView_Y      = CGRectGetMaxY(self.line.frame);
    CGFloat pickView_Width  = ScreenWidth;
    CGFloat pickView_Height = self.pickerHeight;
    self.pickView.frame     = CGRectMake(pickView_X, pickView_Y, pickView_Width, pickView_Height);
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return [self componentsNumber];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self datePickerNumberOfRowsInComponent:component];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return [self datePickerItemWidthInComponent:component];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return self.pickerItemHeight ? self.pickerItemHeight : 44;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    UILabel * label = [[UILabel alloc] init];
    switch (self.datePickerStyle) {
        case WYADatePickerStyleDateHourMinuteSecond: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 7,
                                     self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text =
                    [NSString stringWithFormat:@"%@年", self.datePickerManager.yearArray[row]];
            } else if (component == 1) {
                label.text =
                    [NSString stringWithFormat:@"%@月", self.datePickerManager.monthArray[row]];
            } else if (component == 2) {
                label.text =
                    [NSString stringWithFormat:@"%@日", self.datePickerManager.dayArray[row]];
            } else if (component == 3) {
                label.text =
                    [NSString stringWithFormat:@"%@时", self.datePickerManager.hourArray[row]];
            } else if (component == 4) {
                label.text =
                    [NSString stringWithFormat:@"%@分", self.datePickerManager.minuteArray[row]];
            } else {
                label.text =
                    [NSString stringWithFormat:@"%@秒", self.datePickerManager.secondArray[row]];
            }

        } break;
        case WYADatePickerStyleYear: {
            label.frame = CGRectMake(0, 0, self.cmam_width, self.pickerItemHeight ? self.pickerItemHeight : 44);
            label.text = [NSString stringWithFormat:@"%@年", self.datePickerManager.yearArray[row]];
        } break;
        case WYADatePickerStyleMouth: {
            label.frame = CGRectMake(0, 0, self.cmam_width, self.pickerItemHeight ? self.pickerItemHeight : 44);
            label.text =
                [NSString stringWithFormat:@"%@月", self.datePickerManager.monthArray[row]];
        } break;
        case WYADatePickerStyleHour: {
            label.frame = CGRectMake(0, 0, self.cmam_width, self.pickerItemHeight ? self.pickerItemHeight : 44);
            label.text = [NSString stringWithFormat:@"%@时", self.datePickerManager.hourArray[row]];
        } break;
        case WYADatePickerStyleMinute: {
            label.frame = CGRectMake(0, 0, self.cmam_width, self.pickerItemHeight ? self.pickerItemHeight : 44);
            label.text =
                [NSString stringWithFormat:@"%@分", self.datePickerManager.minuteArray[row]];
        } break;
        case WYADatePickerStyleSecond: {
            label.frame = CGRectMake(0, 0, self.cmam_width, self.pickerItemHeight ? self.pickerItemHeight : 44);
            label.text =
                [NSString stringWithFormat:@"%@秒", self.datePickerManager.secondArray[row]];
        } break;
        case WYADatePickerStyleYearAndMonth: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 2, self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text =
                    [NSString stringWithFormat:@"%@年", self.datePickerManager.yearArray[row]];
            } else {
                label.text =
                    [NSString stringWithFormat:@"%@月", self.datePickerManager.monthArray[row]];
            }
        } break;
        case WYADatePickerStyleDate: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 3, self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text =
                    [NSString stringWithFormat:@"%@年", self.datePickerManager.yearArray[row]];
            } else if (component == 1) {
                label.text =
                    [NSString stringWithFormat:@"%@月", self.datePickerManager.monthArray[row]];
            } else {
                label.text =
                    [NSString stringWithFormat:@"%@日", self.datePickerManager.dayArray[row]];
            }
        } break;
        case WYADatePickerStyleDateHour: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 4,
                                     self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text =
                    [NSString stringWithFormat:@"%@年", self.datePickerManager.yearArray[row]];
            } else if (component == 1) {
                label.text =
                    [NSString stringWithFormat:@"%@月", self.datePickerManager.monthArray[row]];
            } else if (component == 2) {
                label.text =
                    [NSString stringWithFormat:@"%@日", self.datePickerManager.dayArray[row]];
            } else {
                label.text =
                    [NSString stringWithFormat:@"%@时", self.datePickerManager.hourArray[row]];
            }
        } break;
        case WYADatePickerStyleDateHourMinute: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 6,
                                     self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text =
                    [NSString stringWithFormat:@"%@年", self.datePickerManager.yearArray[row]];
            } else if (component == 1) {
                label.text =
                    [NSString stringWithFormat:@"%@月", self.datePickerManager.monthArray[row]];
            } else if (component == 2) {
                label.text =
                    [NSString stringWithFormat:@"%@日", self.datePickerManager.dayArray[row]];
            } else if (component == 3) {
                label.text =
                    [NSString stringWithFormat:@"%@时", self.datePickerManager.hourArray[row]];
            } else {
                label.text =
                    [NSString stringWithFormat:@"%@分", self.datePickerManager.minuteArray[row]];
            }

        } break;
        case WYADatePickerStyleMonthDay: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 2,
                                     self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text =
                    [NSString stringWithFormat:@"%@月", self.datePickerManager.monthArray[row]];
            } else if (component == 1) {
                label.text =
                    [NSString stringWithFormat:@"%@日", self.datePickerManager.dayArray[row]];
            }
        } break;
        case WYADatePickerStyleMonthDayHour: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 3,
                                     self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text =
                    [NSString stringWithFormat:@"%@月", self.datePickerManager.monthArray[row]];
            } else if (component == 1) {
                label.text =
                    [NSString stringWithFormat:@"%@日", self.datePickerManager.dayArray[row]];
            } else {
                label.text =
                    [NSString stringWithFormat:@"%@时", self.datePickerManager.hourArray[row]];
            }
        } break;
        case WYADatePickerStyleMonthDayHourMinute: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 4,
                                     self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text =
                    [NSString stringWithFormat:@"%@月", self.datePickerManager.monthArray[row]];
            } else if (component == 1) {
                label.text =
                    [NSString stringWithFormat:@"%@日", self.datePickerManager.dayArray[row]];
            } else if (component == 2) {
                label.text =
                    [NSString stringWithFormat:@"%@时", self.datePickerManager.hourArray[row]];
            } else {
                label.text =
                    [NSString stringWithFormat:@"%@分", self.datePickerManager.minuteArray[row]];
            }
        } break;
        case WYADatePickerStyleMonthDayHourMinuteSecond: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 5,
                                     self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text =
                    [NSString stringWithFormat:@"%@月", self.datePickerManager.monthArray[row]];
            } else if (component == 1) {
                label.text =
                    [NSString stringWithFormat:@"%@日", self.datePickerManager.dayArray[row]];
            } else if (component == 2) {
                label.text =
                    [NSString stringWithFormat:@"%@时", self.datePickerManager.hourArray[row]];
            } else if (component == 3) {
                label.text =
                    [NSString stringWithFormat:@"%@分", self.datePickerManager.minuteArray[row]];
            } else {
                label.text =
                    [NSString stringWithFormat:@"%@秒", self.datePickerManager.secondArray[row]];
            }
        } break;
        case WYADatePickerStyleTime: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 2,
                                     self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text =
                    [NSString stringWithFormat:@"%@时", self.datePickerManager.hourArray[row]];
            } else {
                label.text =
                    [NSString stringWithFormat:@"%@分", self.datePickerManager.minuteArray[row]];
            }
        } break;
        case WYADatePickerStyleTimeAndSecond: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 3,
                                     self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text =
                    [NSString stringWithFormat:@"%@时", self.datePickerManager.hourArray[row]];
            } else if (component == 1) {
                label.text =
                    [NSString stringWithFormat:@"%@分", self.datePickerManager.minuteArray[row]];
            } else {
                label.text =
                    [NSString stringWithFormat:@"%@秒", self.datePickerManager.secondArray[row]];
            }
        } break;
        case WYADatePickerStyleMinuteAndSecond: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 2,
                                     self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text =
                    [NSString stringWithFormat:@"%@分", self.datePickerManager.minuteArray[row]];
            } else {
                label.text =
                    [NSString stringWithFormat:@"%@秒", self.datePickerManager.secondArray[row]];
            }
        } break;
        default:
            break;
    }
    label.textColor     = self.pickerItemColor ? self.pickerItemColor : [UIColor blackColor];
    label.font          = self.pickerItemFont ? self.pickerItemFont : FONT(12);
    label.textAlignment = self.pickerItemAlignment == NSTextAlignmentCenter ? NSTextAlignmentCenter : self.pickerItemAlignment;
    return label;
}

/*
 - (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
 forComponent:(NSInteger)component{

 }

 - (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView
 attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0)
 __TVOS_PROHIBITED; // attributed title is favored if both methods are implemented
 
 
 */

#pragma mark - UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (self.datePickerStyle) {
        case WYADatePickerStyleDateHourMinuteSecond: {
            if (component == 0) {
                self.datePickerManager.selectYear =
                    [self.datePickerManager.yearArray[row] integerValue];
                self.datePickerManager.selectMonth = [self.datePickerManager.monthArray[
                    [pickerView selectedRowInComponent:component + 1]] integerValue];
                [self.pickView reloadComponent:2];
                self.yearString = self.datePickerManager.yearArray[row];
            } else if (component == 1) {
                self.datePickerManager.selectYear = [self.datePickerManager.yearArray[
                    [pickerView selectedRowInComponent:component - 1]] integerValue];
                self.datePickerManager.selectMonth =
                    [self.datePickerManager.monthArray[row] integerValue];
                [self.pickView reloadComponent:2];
                self.mouthString = [NSString stringWithFormat:@"%02ld", [self.datePickerManager.monthArray[row] integerValue]];
            } else if (component == 2) {
                self.dayString = self.datePickerManager.dayArray[row];
            } else if (component == 3) {
                self.hourString = self.datePickerManager.hourArray[row];
            } else if (component == 4) {
                self.minuteString = self.datePickerManager.minuteArray[row];
            } else {
                self.secondString = self.datePickerManager.secondArray[row];
            }
            self.resultString =
                [NSString stringWithFormat:@"%@-%@-%@ %@:%@:%@", self.yearString, self.mouthString,
                                           self.dayString, self.hourString, self.minuteString,
                                           self.secondString];
            NSLog(@"string==%@", self.resultString);
        } break;
        case WYADatePickerStyleYear: {
            self.resultString = self.datePickerManager.yearArray[row];
        } break;
        case WYADatePickerStyleMouth: {
            self.resultString = [NSString stringWithFormat:@"%02ld", [self.datePickerManager.monthArray[row] integerValue]];
        } break;
        case WYADatePickerStyleHour: {
            self.resultString = self.datePickerManager.hourArray[row];
        } break;
        case WYADatePickerStyleMinute: {
            self.resultString = self.datePickerManager.minuteArray[row];
        } break;
        case WYADatePickerStyleSecond: {
            self.resultString = self.datePickerManager.secondArray[row];
        } break;
        case WYADatePickerStyleYearAndMonth: {
            if (component == 0) {
                self.yearString = self.datePickerManager.yearArray[row];
            } else {
                self.mouthString = [NSString stringWithFormat:@"%02ld", [self.datePickerManager.monthArray[row] integerValue]];
            }
            self.resultString =
                [NSString stringWithFormat:@"%@-%@", self.yearString, self.mouthString];
        } break;
        case WYADatePickerStyleDate: {
            if (component == 0) {
                self.datePickerManager.selectYear =
                    [self.datePickerManager.yearArray[row] integerValue];
                self.datePickerManager.selectMonth = [self.datePickerManager.monthArray[
                    [pickerView selectedRowInComponent:component + 1]] integerValue];
                [self.pickView reloadComponent:2];
                self.yearString = self.datePickerManager.yearArray[row];
            } else if (component == 1) {
                self.datePickerManager.selectYear = [self.datePickerManager.yearArray[
                    [pickerView selectedRowInComponent:component - 1]] integerValue];
                self.datePickerManager.selectMonth =
                    [self.datePickerManager.monthArray[row] integerValue];
                [self.pickView reloadComponent:2];
                self.mouthString = [NSString stringWithFormat:@"%02ld", [self.datePickerManager.monthArray[row] integerValue]];
            } else {
                self.dayString = [NSString stringWithFormat:@"%02ld", [self.datePickerManager.dayArray[row] integerValue]];
            }
            self.resultString = [NSString
                stringWithFormat:@"%@-%@-%@", self.yearString, self.mouthString, self.dayString];
        } break;
        case WYADatePickerStyleDateHour: {
            if (component == 0) {
                self.datePickerManager.selectYear =
                    [self.datePickerManager.yearArray[row] integerValue];
                self.datePickerManager.selectMonth = [self.datePickerManager.monthArray[
                    [pickerView selectedRowInComponent:component + 1]] integerValue];
                [self.pickView reloadComponent:2];
                self.yearString = self.datePickerManager.yearArray[row];
            } else if (component == 1) {
                self.datePickerManager.selectYear = [self.datePickerManager.yearArray[
                    [pickerView selectedRowInComponent:component - 1]] integerValue];
                self.datePickerManager.selectMonth =
                    [self.datePickerManager.monthArray[row] integerValue];
                [self.pickView reloadComponent:2];
                self.mouthString = [NSString stringWithFormat:@"%02ld", [self.datePickerManager.monthArray[row] integerValue]];
            } else if (component == 2) {
                self.dayString = self.datePickerManager.dayArray[row];
            } else {
                self.hourString = self.datePickerManager.hourArray[row];
            }
            self.resultString =
                [NSString stringWithFormat:@"%@-%@-%@ %@", self.yearString, self.mouthString,
                                           self.dayString, self.hourString];
        } break;
        case WYADatePickerStyleDateHourMinute: {
            if (component == 0) {
                self.datePickerManager.selectYear =
                    [self.datePickerManager.yearArray[row] integerValue];
                self.datePickerManager.selectMonth = [self.datePickerManager.monthArray[
                    [pickerView selectedRowInComponent:component + 1]] integerValue];
                [self.pickView reloadComponent:2];
                self.yearString = self.datePickerManager.yearArray[row];
            } else if (component == 1) {
                self.datePickerManager.selectYear = [self.datePickerManager.yearArray[
                    [pickerView selectedRowInComponent:component - 1]] integerValue];
                self.datePickerManager.selectMonth =
                    [self.datePickerManager.monthArray[row] integerValue];
                [self.pickView reloadComponent:2];
                self.mouthString = [NSString stringWithFormat:@"%02ld", [self.datePickerManager.monthArray[row] integerValue]];
            } else if (component == 2) {
                self.dayString = self.datePickerManager.dayArray[row];
            } else if (component == 3) {
                self.hourString = self.datePickerManager.hourArray[row];
            } else {
                self.minuteString = self.datePickerManager.minuteArray[row];
            }
            self.resultString =
                [NSString stringWithFormat:@"%@-%@-%@ %@:%@", self.yearString, self.mouthString,
                                           self.dayString, self.hourString, self.minuteString];
            NSLog(@"string==%@", self.resultString);
        } break;
        case WYADatePickerStyleMonthDay: {
            if (component == 0) {
                self.datePickerManager.selectMonth =
                    [self.datePickerManager.monthArray[row] integerValue];
                [self.pickView reloadComponent:1];
                self.mouthString = [NSString stringWithFormat:@"%02ld", [self.datePickerManager.monthArray[row] integerValue]];
            } else {
                self.dayString = [NSString stringWithFormat:@"%02ld", [self.datePickerManager.dayArray[row] integerValue]];
            }
            self.resultString =
                [NSString stringWithFormat:@"%@-%@", self.mouthString, self.dayString];
        } break;
        case WYADatePickerStyleMonthDayHour: {
            if (component == 0) {
                self.datePickerManager.selectMonth =
                    [self.datePickerManager.monthArray[row] integerValue];
                [self.pickView reloadComponent:1];
                self.mouthString = [NSString stringWithFormat:@"%02ld", [self.datePickerManager.monthArray[row] integerValue]];
            } else if (component == 1) {
                self.dayString = self.datePickerManager.dayArray[row];
            } else {
                self.hourString = self.datePickerManager.hourArray[row];
            }
            self.resultString = [NSString
                stringWithFormat:@"%@-%@ %@", self.mouthString, self.dayString, self.hourString];
        } break;
        case WYADatePickerStyleMonthDayHourMinute: {
            if (component == 0) {
                self.datePickerManager.selectMonth =
                    [self.datePickerManager.monthArray[row] integerValue];
                [self.pickView reloadComponent:1];
                self.mouthString = [NSString stringWithFormat:@"%02ld", [self.datePickerManager.monthArray[row] integerValue]];
            } else if (component == 1) {
                self.dayString = self.datePickerManager.dayArray[row];
            } else if (component == 2) {
                self.hourString = self.datePickerManager.hourArray[row];
            } else {
                self.minuteString = self.datePickerManager.minuteArray[row];
            }
            self.resultString =
                [NSString stringWithFormat:@"%@-%@ %@:%@", self.mouthString, self.dayString,
                                           self.hourString, self.minuteString];
        } break;
        case WYADatePickerStyleMonthDayHourMinuteSecond: {
            if (component == 0) {
                self.datePickerManager.selectMonth =
                    [self.datePickerManager.monthArray[row] integerValue];
                [self.pickView reloadComponent:1];
                self.mouthString = [NSString stringWithFormat:@"%02ld", [self.datePickerManager.monthArray[row] integerValue]];
            } else if (component == 1) {
                self.dayString = self.datePickerManager.dayArray[row];
            } else if (component == 2) {
                self.hourString = self.datePickerManager.hourArray[row];
            } else if (component == 3) {
                self.minuteString = self.datePickerManager.minuteArray[row];
            } else {
                self.secondString = self.datePickerManager.secondArray[row];
            }
            self.resultString =
                [NSString stringWithFormat:@"%@-%@ %@:%@:%@", self.mouthString, self.dayString,
                                           self.hourString, self.minuteString, self.secondString];
        } break;
        case WYADatePickerStyleTime: {
            if (component == 0) {
                self.hourString = self.datePickerManager.hourArray[row];
            } else if (component == 1) {
                self.minuteString = self.datePickerManager.minuteArray[row];
            }
            self.resultString =
                [NSString stringWithFormat:@"%@:%@", self.hourString, self.minuteString];
        } break;
        case WYADatePickerStyleTimeAndSecond: {
            if (component == 0) {
                self.hourString = self.datePickerManager.hourArray[row];
            } else if (component == 1) {
                self.minuteString = self.datePickerManager.minuteArray[row];
            } else {
                self.secondString = self.datePickerManager.secondArray[row];
            }
            self.resultString = [NSString stringWithFormat:@"%@:%@:%@", self.hourString,
                                                           self.minuteString, self.secondString];
        } break;
        case WYADatePickerStyleMinuteAndSecond: {
            if (component == 0) {
                self.minuteString = self.datePickerManager.minuteArray[row];
            } else {
                self.secondString = self.datePickerManager.secondArray[row];
            }
            self.resultString =
                [NSString stringWithFormat:@"%@:%@", self.minuteString, self.secondString];
        } break;
        default:
            break;
    }
    if (self.autoTitleChange) {
        [self.titleView wya_SetTitleLabelWithText:self.resultString
                                        TextColor:[UIColor blackColor]
                                         TextFont:15];
    }
}

#pragma mark - WYAPaginationViewDelegate
- (void)wya_leftActionWithPaginationView:(UIView *)view button:(UIButton *)button {
    if (self.cmam_viewController) {
        [self.cmam_viewController dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self removeFromSuperview];
    }
}

- (void)wya_rightActionWithPaginationView:(UIView *)view button:(UIButton *)button {

    if (self.wya_delegate &&
        [self.wya_delegate respondsToSelector:@selector(wya_ChooseWithDatePicker:ResultString:)]) {
        [self.wya_delegate wya_ChooseWithDatePicker:self ResultString:self.resultString];
    }
    if (self.cmam_viewController) {
        [self.cmam_viewController dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self removeFromSuperview];
    }
}

#pragma mark - Private Action
- (void)createUI {
    self.backgroundColor = [UIColor whiteColor];
    self.autoTitleChange = YES;
    [self addSubview:self.titleView];
    [self addSubview:self.line];
    [self addSubview:self.pickView];

    self.pickerItemAlignment = NSTextAlignmentCenter;
    self.pickerItemColor     = [UIColor blackColor];
    self.pickerItemFont      = FONT(17);
}

- (NSInteger)componentsNumber {
    switch (self.datePickerStyle) {
        case WYADatePickerStyleDateHourMinuteSecond:    return 6;
        case WYADatePickerStyleYear:
        case WYADatePickerStyleMouth:
        case WYADatePickerStyleHour:
        case WYADatePickerStyleMinute:
        case WYADatePickerStyleSecond:                  return 1;
        case WYADatePickerStyleYearAndMonth:            return 2;
        case WYADatePickerStyleDate:                    return 3;
        case WYADatePickerStyleDateHour:                return 4;
        case WYADatePickerStyleDateHourMinute:          return 2;
        case WYADatePickerStyleMonthDayHour:            return 3;
        case WYADatePickerStyleMonthDayHourMinute:      return 4;
        case WYADatePickerStyleMonthDayHourMinuteSecond:return 5;
        case WYADatePickerStyleTime:                    return 2;
        case WYADatePickerStyleTimeAndSecond:           return 3;
        case WYADatePickerStyleMinuteAndSecond:         return 2;
        default:                                        return 0;
    }
}

- (NSInteger)datePickerNumberOfRowsInComponent:(NSInteger)component {
    switch (self.datePickerStyle) {
        case WYADatePickerStyleDateHourMinuteSecond: {
            if (component == 0) {
                return self.datePickerManager.yearArray.count;
            } else if (component == 1) {
                return self.datePickerManager.monthArray.count;
            } else if (component == 2) {
                return self.datePickerManager.dayArray.count;
            } else if (component == 3) {
                return self.datePickerManager.hourArray.count;
            } else if (component == 4) {
                return self.datePickerManager.minuteArray.count;
            } else {
                return self.datePickerManager.secondArray.count;
            }
        }
        case WYADatePickerStyleYear:
            return self.datePickerManager.yearArray.count;
        case WYADatePickerStyleMouth:
            return self.datePickerManager.monthArray.count;
        case WYADatePickerStyleHour:
            return self.datePickerManager.hourArray.count;
        case WYADatePickerStyleMinute:
            return self.datePickerManager.minuteArray.count;
        case WYADatePickerStyleSecond:
            return self.datePickerManager.secondArray.count;
        case WYADatePickerStyleYearAndMonth: {
            if (component == 0) {
                return self.datePickerManager.yearArray.count;
            } else {
                return self.datePickerManager.monthArray.count;
            }
        }
        case WYADatePickerStyleDate: {
            if (component == 0) {
                return self.datePickerManager.yearArray.count;
            } else if (component == 1) {
                return self.datePickerManager.monthArray.count;
            } else {
                return self.datePickerManager.dayArray.count;
            }
        }
        case WYADatePickerStyleDateHour: {
            if (component == 0) {
                return self.datePickerManager.yearArray.count;
            } else if (component == 1) {
                return self.datePickerManager.monthArray.count;
            } else if (component == 2) {
                return self.datePickerManager.dayArray.count;
            } else {
                return self.datePickerManager.hourArray.count;
            }
        }
        case WYADatePickerStyleDateHourMinute: {
            if (component == 0) {
                return self.datePickerManager.yearArray.count;
            } else if (component == 1) {
                return self.datePickerManager.monthArray.count;
            } else if (component == 2) {
                return self.datePickerManager.dayArray.count;
            } else if (component == 3) {
                return self.datePickerManager.hourArray.count;
            } else {
                return self.datePickerManager.minuteArray.count;
            }
        }
        case WYADatePickerStyleMonthDay: {
            if (component == 0) {
                return self.datePickerManager.monthArray.count;
            } else {
                return self.datePickerManager.dayArray.count;
            }
        }
        case WYADatePickerStyleMonthDayHour: {
            if (component == 0) {
                return self.datePickerManager.monthArray.count;
            } else if (component == 1) {
                return self.datePickerManager.dayArray.count;
            } else {
                return self.datePickerManager.hourArray.count;
            }
        }
        case WYADatePickerStyleMonthDayHourMinute: {
            if (component == 0) {
                return self.datePickerManager.monthArray.count;
            } else if (component == 1) {
                return self.datePickerManager.dayArray.count;
            } else if (component == 2) {
                return self.datePickerManager.hourArray.count;
            } else {
                return self.datePickerManager.minuteArray.count;
            }
        }
        case WYADatePickerStyleMonthDayHourMinuteSecond: {
            if (component == 0) {
                return self.datePickerManager.monthArray.count;
            } else if (component == 1) {
                return self.datePickerManager.dayArray.count;
            } else if (component == 2) {
                return self.datePickerManager.hourArray.count;
            } else if (component == 3) {
                return self.datePickerManager.minuteArray.count;
            } else {
                return self.datePickerManager.secondArray.count;
            }
        }
        case WYADatePickerStyleTime: {
            if (component == 0) {
                return self.datePickerManager.hourArray.count;
            } else if (component == 1) {
                return self.datePickerManager.minuteArray.count;
            }
        }
        case WYADatePickerStyleTimeAndSecond: {
            if (component == 0) {
                return self.datePickerManager.hourArray.count;
            } else if (component == 1) {
                return self.datePickerManager.minuteArray.count;
            } else {
                return self.datePickerManager.secondArray.count;
            }
        }
        case WYADatePickerStyleMinuteAndSecond: {
            if (component == 0) {
                return self.datePickerManager.minuteArray.count;
            } else {
                return self.datePickerManager.secondArray.count;
            }
        }
        default:
            return 0;
    }
}

- (CGFloat)datePickerItemWidthInComponent:(NSInteger)component {
    switch (self.datePickerStyle) {
        case WYADatePickerStyleDateHourMinuteSecond:    return self.cmam_width / 7;
        case WYADatePickerStyleYear:
        case WYADatePickerStyleMouth:
        case WYADatePickerStyleHour:
        case WYADatePickerStyleMinute:
        case WYADatePickerStyleSecond:                  return self.cmam_width;
        case WYADatePickerStyleYearAndMonth:            return self.cmam_width / 2;
        case WYADatePickerStyleDate:                    return self.cmam_width / 3;
        case WYADatePickerStyleDateHour:                return self.cmam_width / 4;
        case WYADatePickerStyleDateHourMinute:          return self.cmam_width / 6;
        case WYADatePickerStyleMonthDay:                return self.cmam_width / 2;
        case WYADatePickerStyleMonthDayHour:            return self.cmam_width / 3;
        case WYADatePickerStyleMonthDayHourMinute:      return self.cmam_width / 4;
        case WYADatePickerStyleMonthDayHourMinuteSecond:return self.cmam_width / 6;
        case WYADatePickerStyleTime:                    return self.cmam_width / 2;
        case WYADatePickerStyleTimeAndSecond:           return self.cmam_width / 3;
        case WYADatePickerStyleMinuteAndSecond:         return self.cmam_width / 2;
        default:                                        return 0;
    }
}

#pragma mark - Public Action
- (CGFloat)getPickerViewHeight {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    return self.titleView.cmam_height + self.pickView.cmam_height + 1;
}

#pragma mark - Setter
- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self.pickView reloadAllComponents];
}
- (void)setDatePickerStyle:(WYADatePickerStyle)datePickerStyle {
    _datePickerStyle              = datePickerStyle;
    WYAPickerManager * datePicker = [[WYAPickerManager alloc] init];
    datePicker.selectDate         = self.selectDate;
    self.datePickerManager        = datePicker;
    [self.pickView reloadAllComponents];
}

- (void)setAutoTitleChange:(BOOL)autoTitleChange {
    _autoTitleChange = autoTitleChange;
    [self.pickView reloadAllComponents];
}

- (void)setPickerItemFont:(UIFont *)pickerItemFont {
    _pickerItemFont = pickerItemFont;
    [self.pickView reloadAllComponents];
}

- (void)setPickerItemColor:(UIColor *)pickerItemColor {
    _pickerItemColor = pickerItemColor;
    [self.pickView reloadAllComponents];
}

- (void)setPickerItemAlignment:(NSTextAlignment)pickerItemAlignment {
    _pickerItemAlignment = pickerItemAlignment;
    [self.pickView reloadAllComponents];
}

- (void)setDatePickerManager:(WYAPickerManager *)datePickerManager {
    _datePickerManager = datePickerManager;

    NSLog(@"年==%ld,月==%ld,日==%ld，时==%ld，分==%ld，秒==%ld",
          datePickerManager.selectComponents.year, datePickerManager.selectComponents.month,
          datePickerManager.selectComponents.day, datePickerManager.selectComponents.hour,
          datePickerManager.selectComponents.minute, datePickerManager.selectComponents.second);
    switch (self.datePickerStyle) {
        case WYADatePickerStyleDateHourMinuteSecond: {
            [self.pickView selectRow:datePickerManager.selectComponents.year - 1
                         inComponent:0
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.month - 1
                         inComponent:1
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.day - 1
                         inComponent:2
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.hour
                         inComponent:3
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.minute
                         inComponent:4
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.second
                         inComponent:5
                            animated:YES];
            self.yearString   = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.year];
            self.mouthString  = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.month];
            self.dayString    = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.day];
            self.hourString   = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.hour];
            self.minuteString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.minute];
            self.secondString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.second];
            self.resultString =
                [NSString stringWithFormat:@"%@-%@-%@ %@:%@:%@", self.yearString, self.mouthString,
                                           self.dayString, self.hourString, self.minuteString,
                                           self.secondString];
        } break;
        case WYADatePickerStyleYear: {
            [self.pickView selectRow:datePickerManager.selectComponents.year - 1
                         inComponent:0
                            animated:YES];
            self.resultString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.year];
        } break;
        case WYADatePickerStyleMouth: {
            [self.pickView selectRow:datePickerManager.selectComponents.month - 1
                         inComponent:0
                            animated:YES];
            self.resultString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.month];
        } break;
        case WYADatePickerStyleHour: {
            [self.pickView selectRow:datePickerManager.selectComponents.hour
                         inComponent:0
                            animated:YES];
            self.resultString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.hour];
        } break;
        case WYADatePickerStyleMinute: {
            [self.pickView selectRow:datePickerManager.selectComponents.minute
                         inComponent:0
                            animated:YES];
            self.resultString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.minute];
        } break;
        case WYADatePickerStyleSecond: {
            [self.pickView selectRow:datePickerManager.selectComponents.second
                         inComponent:0
                            animated:YES];
            self.resultString = [@(datePickerManager.selectComponents.second) stringValue];
        } break;
        case WYADatePickerStyleYearAndMonth: {
            [self.pickView selectRow:datePickerManager.selectComponents.year - 1
                         inComponent:0
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.month - 1
                         inComponent:1
                            animated:YES];
            self.yearString  = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.year];
            self.mouthString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.month];
            self.resultString =
                [NSString stringWithFormat:@"%@-%@", self.yearString, self.mouthString];
        } break;
        case WYADatePickerStyleDate: {
            [self.pickView selectRow:datePickerManager.selectComponents.year - 1
                         inComponent:0
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.month - 1
                         inComponent:1
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.day - 1
                         inComponent:2
                            animated:YES];
            self.yearString   = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.year];
            self.mouthString  = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.month];
            self.dayString    = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.day];
            self.resultString = [NSString
                stringWithFormat:@"%@-%@-%@", self.yearString, self.mouthString, self.dayString];
        } break;
        case WYADatePickerStyleDateHour: {
            [self.pickView selectRow:datePickerManager.selectComponents.year - 1
                         inComponent:0
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.month - 1
                         inComponent:1
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.day - 1
                         inComponent:2
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.hour
                         inComponent:3
                            animated:YES];
            self.yearString  = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.year];
            self.mouthString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.month];
            self.dayString   = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.day];
            self.hourString  = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.hour];
            self.resultString =
                [NSString stringWithFormat:@"%@-%@-%@ %@", self.yearString, self.mouthString,
                                           self.dayString, self.hourString];
        } break;
        case WYADatePickerStyleDateHourMinute: {
            [self.pickView selectRow:datePickerManager.selectComponents.year - 1
                         inComponent:0
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.month - 1
                         inComponent:1
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.day - 1
                         inComponent:2
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.hour
                         inComponent:3
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.minute
                         inComponent:4
                            animated:YES];
            self.yearString   = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.year];
            self.mouthString  = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.month];
            self.dayString    = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.day];
            self.hourString   = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.hour];
            self.minuteString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.minute];
            self.resultString =
                [NSString stringWithFormat:@"%@-%@-%@ %@:%@", self.yearString, self.mouthString,
                                           self.dayString, self.hourString, self.minuteString];
        } break;
        case WYADatePickerStyleMonthDay: {
            [self.pickView selectRow:datePickerManager.selectComponents.month - 1
                         inComponent:0
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.day - 1
                         inComponent:1
                            animated:YES];
            self.mouthString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.month];
            self.dayString   = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.day];
            self.resultString =
                [NSString stringWithFormat:@"%@-%@", self.mouthString, self.dayString];
        } break;
        case WYADatePickerStyleMonthDayHour: {
            [self.pickView selectRow:datePickerManager.selectComponents.month - 1
                         inComponent:0
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.day - 1
                         inComponent:1
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.hour
                         inComponent:2
                            animated:YES];
            self.mouthString  = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.month];
            self.dayString    = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.day];
            self.hourString   = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.hour];
            self.resultString = [NSString
                stringWithFormat:@"%@-%@ %@", self.mouthString, self.dayString, self.hourString];
        } break;
        case WYADatePickerStyleMonthDayHourMinute: {
            [self.pickView selectRow:datePickerManager.selectComponents.month - 1
                         inComponent:0
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.day - 1
                         inComponent:1
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.hour
                         inComponent:2
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.minute
                         inComponent:3
                            animated:YES];
            self.mouthString  = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.month];
            self.dayString    = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.day];
            self.hourString   = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.hour];
            self.minuteString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.minute];
            self.resultString =
                [NSString stringWithFormat:@"%@-%@ %@:%@", self.mouthString, self.dayString,
                                           self.hourString, self.minuteString];
        } break;
        case WYADatePickerStyleMonthDayHourMinuteSecond: {
            [self.pickView selectRow:datePickerManager.selectComponents.month - 1
                         inComponent:0
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.day - 1
                         inComponent:1
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.hour
                         inComponent:2
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.minute
                         inComponent:3
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.second
                         inComponent:4
                            animated:YES];
            self.mouthString  = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.month];
            self.dayString    = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.day];
            self.hourString   = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.hour];
            self.minuteString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.minute];
            self.secondString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.second];
            self.resultString =
                [NSString stringWithFormat:@"%@-%@ %@:%@:%@", self.mouthString, self.dayString,
                                           self.hourString, self.minuteString, self.secondString];
        } break;
        case WYADatePickerStyleTime: {
            [self.pickView selectRow:datePickerManager.selectComponents.hour
                         inComponent:0
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.minute
                         inComponent:1
                            animated:YES];
            self.hourString   = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.hour];
            self.minuteString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.minute];
            self.resultString =
                [NSString stringWithFormat:@"%@:%@", self.hourString, self.minuteString];
        } break;
        case WYADatePickerStyleTimeAndSecond: {
            [self.pickView selectRow:datePickerManager.selectComponents.hour
                         inComponent:0
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.minute
                         inComponent:1
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.second
                         inComponent:2
                            animated:YES];
            self.hourString   = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.hour];
            self.minuteString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.minute];
            self.secondString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.second];
            self.resultString = [NSString stringWithFormat:@"%@:%@:%@", self.hourString,
                                                           self.minuteString, self.secondString];
        } break;
        case WYADatePickerStyleMinuteAndSecond: {
            [self.pickView selectRow:datePickerManager.selectComponents.minute
                         inComponent:0
                            animated:YES];
            [self.pickView selectRow:datePickerManager.selectComponents.second
                         inComponent:1
                            animated:YES];
            self.minuteString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.minute];
            self.secondString = [NSString stringWithFormat:@"%02ld", datePickerManager.selectComponents.second];
            self.resultString =
                [NSString stringWithFormat:@"%@:%@", self.minuteString, self.secondString];
        } break;
        default:
            break;
    }
    if (self.autoTitleChange) {
        [self.titleView wya_SetTitleLabelWithText:self.resultString
                                        TextColor:[UIColor blackColor]
                                         TextFont:15];
    }

//    [self.pickView reloadAllComponents];
}

- (void)setPickerHeight:(CGFloat)pickerHeight {
    _pickerHeight = pickerHeight;
}

- (void)setPickerItemHeight:(CGFloat)pickerItemHeight {
    _pickerItemHeight = pickerItemHeight;
    [self.pickView reloadAllComponents];
}

#pragma mark - Getter
- (WYAPaginationView *)titleView {
    if (!_titleView) {
        _titleView                 = [[WYAPaginationView alloc] init];
        _titleView.backgroundColor = [UIColor whiteColor];
        _titleView.wya_Delegate    = self;
        [_titleView wya_SetLeftButtonWithTitle:@"取消"
                                    TitleColor:[UIColor wya_hex:@"#108DE7"]
                                     TitleFont:15];
        [_titleView wya_SetRightButtonWithTitle:@"确定"
                                     TitleColor:[UIColor wya_hex:@"#108DE7"]
                                      TitleFont:15];
        [_titleView.leftButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor colorWithRed:234.0 / 255.0 green:234.0 / 255.0 blue:234.0 / 255.0 alpha:1]] forState:UIControlStateHighlighted];
        [_titleView.rightButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor colorWithRed:234.0 / 255.0 green:234.0 / 255.0 blue:234.0 / 255.0 alpha:1]] forState:UIControlStateHighlighted];

        _titleView.leftButton.layer.borderWidth  = 0;
        _titleView.rightButton.layer.borderWidth = 0;
    }
    return _titleView;
}

- (UIView *)line {
    if (!_line) {
        _line = ({
            UIView * object        = [[UIView alloc] init];
            object.backgroundColor = random(241, 241, 241, 1);
            object;
        });
    }
    return _line;
}

- (UIPickerView *)pickView {
    if (!_pickView) {
        _pickView                 = [[UIPickerView alloc] init];
        _pickView.dataSource      = self;
        _pickView.delegate        = self;
        _pickView.backgroundColor = [UIColor whiteColor];
    }
    return _pickView;
}

- (UIButton *)backButton {
    return self.titleView.leftButton;
}

- (UIButton *)sureButton {
    return self.titleView.rightButton;
}

- (UILabel *)titleLabel {
    return self.titleView.titleLabel;
}

@end
