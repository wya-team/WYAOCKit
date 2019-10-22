//
//  WYAPickerView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/21.
//

#import "WYAPickerView.h"

#import "WYACustomPickerView.h"

#import "WYAPaginationView.h"

static CGFloat titleHeight = 44.0;

@interface WYAPickerView () <WYAPaginationViewDelegate, UIPickerViewDataSource,
                             UIPickerViewDelegate, WYACustomPickerViewDataSource,
                             WYACustomPickerViewDelegate>

@property (nonatomic, strong) WYAPaginationView * titleView;
@property (nonatomic, strong) UIView * line;
@property (nonatomic, strong) UIPickerView * pickView;
@property (nonatomic, strong) WYACustomPickerView * customPicker;
@property (nonatomic, copy) NSString * resultString;
@property (nonatomic, copy) NSString * resultValues; // 与resultString相同，以-为间隔

@property (nonatomic, strong) NSArray * provinces;
@property (nonatomic, strong) NSArray * citys;
@property (nonatomic, strong) NSArray * areas;

@property (nonatomic, assign) NSInteger one;
@property (nonatomic, assign) NSInteger two;
@property (nonatomic, assign) NSInteger three;

@end

@implementation WYAPickerView {
    NSString * a;
    NSString * b;
    NSString * c;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame style:WYAPickerViewColumnStyleSingle];
}

- (instancetype)initWithFrame:(CGRect)frame style:(WYAPickerViewColumnStyle)style
{
    self = [super initWithFrame:frame];
    if (self) {
        _pickerViewColumnStyle = style;
        [self createUI];
    }
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

#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    switch (self.pickerViewColumnStyle) {
        case WYAPickerViewColumnStyleSingle:
            return 1;
        case WYAPickerViewColumnStyleDouble:
            return 2;
        case WYAPickerViewColumnStyleThree:
            return 3;
        default:
            break;
    }
    return 0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (self.pickerViewColumnStyle) {
        case WYAPickerViewColumnStyleSingle:
            return self.dataArray.count;
        case WYAPickerViewColumnStyleDouble: {
            if (component == 0) {
                return self.provinces.count;
            } else {
                return self.citys.count;
            }
        }

        case WYAPickerViewColumnStyleThree: {
            if (component == 0) {
                return self.provinces.count;
            } else if (component == 1) {
                return self.citys.count;
            } else {
                return self.areas.count;
            }
        }
        default:
            return 0;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    switch (self.pickerViewColumnStyle) {
        case WYAPickerViewColumnStyleSingle:
            return self.cmam_width;
        case WYAPickerViewColumnStyleDouble:
            return self.cmam_width / 2;
        case WYAPickerViewColumnStyleThree:
            return self.cmam_width / 3;
        default:
            return 0;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return self.pickerItemHeight ? self.pickerItemHeight : 44;
}

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(nullable UIView *)view {
    UILabel * label = [[UILabel alloc] init];
    switch (self.pickerViewColumnStyle) {
        case WYAPickerViewColumnStyleSingle: {
            label.frame = CGRectMake(0, 0, self.cmam_width,
                                     self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (self.titleKeyWords) {
                label.text = self.dataArray[row][self.titleKeyWords];
            } else {
                label.text = self.dataArray[row];
            }
        }

        break;
        case WYAPickerViewColumnStyleDouble: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 2,
                                     self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                NSDictionary * dic = self.provinces[row];
                label.text         = dic[self.titleKeyWords];

            } else {
                NSDictionary * dic = self.citys[row];
                label.text         = dic[self.titleKeyWords];
            }
        }

        break;
        case WYAPickerViewColumnStyleThree: {
            label.frame = CGRectMake(0, 0, self.cmam_width / 3,
                                     self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                NSDictionary * dic = self.provinces[row];
                label.text         = dic[self.titleKeyWords];

            } else if (component == 1) {
                NSDictionary * dic = self.citys[row];
                label.text         = dic[self.titleKeyWords];

            } else {
                NSDictionary * dic = self.areas[row];
                label.text         = dic[self.titleKeyWords];
            }
        }

        break;
        default:
            break;
    }
    label.textColor     = self.pickerItemColor;
    label.font          = self.pickerItemFont;
    label.textAlignment = self.pickerItemAlignment;
    return label;
}

#pragma mark UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    switch (self.pickerViewColumnStyle) {
        case WYAPickerViewColumnStyleSingle:
            if (self.titleKeyWords) {
                a = self.dataArray[row][self.titleKeyWords];
            } else {
                a = self.dataArray[row];
            }
            _one              = row;
            self.resultString = a;
            break;
        case WYAPickerViewColumnStyleDouble: {
            if (component == 0) {
                NSDictionary * dic = self.provinces[row];
                self.citys         = dic[self.arrayKeyWords];
                a                  = dic[self.titleKeyWords];
                [pickerView reloadComponent:1];
                [pickerView selectRow:0 inComponent:1 animated:YES];

                NSDictionary * cityDic = [self.citys firstObject];
                b                      = cityDic[self.titleKeyWords];
                _one                   = row;
                _two                   = 0;

            } else {
                if (a == nil) {
                    NSInteger firstRow = [self.pickView selectedRowInComponent:0];
                    NSDictionary * dic = self.provinces[firstRow];
                    a                  = dic[self.titleKeyWords];
                    _one = firstRow;
                }
                NSDictionary * dic = self.citys[row];
                b                  = dic[self.titleKeyWords];
                _two               = row;
            }
        } break;
        case WYAPickerViewColumnStyleThree: {
            if (component == 0) {
                NSDictionary * dic = self.provinces[row];
                self.citys         = dic[self.arrayKeyWords];
                a                  = dic[self.titleKeyWords];
                [pickerView reloadComponent:1];
                [pickerView selectRow:0 inComponent:1 animated:YES];

                NSDictionary * cityDic = [self.citys firstObject];
                self.areas             = cityDic[self.arrayKeyWords];
                b                      = cityDic[self.titleKeyWords];
                [pickerView reloadComponent:2];
                [pickerView selectRow:0 inComponent:2 animated:YES];

                NSDictionary * areaDic = [self.areas firstObject];
                c                      = areaDic[self.titleKeyWords];
                _one                   = row;
                _two                   = 0;
                _three                 = 0;

            } else if (component == 1) {
                if (a == nil) {
                    NSInteger firstRow = [self.pickView selectedRowInComponent:0];
                    NSDictionary * dic = self.provinces[firstRow];
                    a                  = dic[self.titleKeyWords];
                    _one = firstRow;
                }
                NSDictionary * dic = self.citys[row];
                self.areas         = dic[self.arrayKeyWords];
                b                  = dic[self.titleKeyWords];
                [pickerView reloadComponent:2];
                [pickerView selectRow:0 inComponent:2 animated:YES];

                NSDictionary * areaDic = [self.areas firstObject];
                c                      = areaDic[self.titleKeyWords];
                _two                   = row;
                _three                 = 0;

            } else {
                if (a == nil && b == nil) {

                    NSInteger firstRow = [self.pickView selectedRowInComponent:0];
                    NSDictionary * dic = self.provinces[firstRow];
                    a                  = dic[self.titleKeyWords];
                    NSArray * arr = dic[self.arrayKeyWords];
                    _one = firstRow;

                    NSInteger secondRow = [self.pickView selectedRowInComponent:1];
                    NSDictionary * nextDic = arr[secondRow];
                    b = nextDic[self.titleKeyWords];
                    _two = secondRow;
                }
                NSDictionary * areaDic = self.areas[row];
                c                      = areaDic[self.titleKeyWords];
                _three                 = row;
            }
        } break;
        default:
            break;
    }

    if (a.length > 0 && b.length > 0 && c.length > 0) {
        self.resultString = [NSString stringWithFormat:@"%@-%@-%@", a, b, c];
        if (self.paramWords) {
            self.resultValues = [NSString stringWithFormat:@"%@-%@-%@", self.provinces[_one][self.paramWords], self.citys[_two][self.paramWords], self.areas[_three][self.paramWords]];
        }
    } else if (a.length > 0 && b.length > 0) {
        self.resultString = [NSString stringWithFormat:@"%@-%@", a, b];
        if (self.paramWords) {
            self.resultValues = [NSString stringWithFormat:@"%@-%@", self.provinces[_one][self.paramWords], self.citys[_two][self.paramWords]];
        }
    } else if (a.length > 0) {
        self.resultString = a;
        if (self.paramWords) {
            self.resultValues = self.provinces[_one][self.paramWords];
        }
    }
    NSLog(@"string==%@", self.resultString);
    if (self.autoTitleChange) {
        [self.titleView wya_SetTitleLabelWithText:self.resultString
                                        TextColor:[UIColor blackColor]
                                         TextFont:15];
    }
}

#pragma mark--- WYACustomPickerViewDataSource
#pragma mark--- WYACustomPickerViewDelegate

#pragma mark--- WYAPaginationViewDelegate
- (void)wya_leftActionWithPaginationView:(UIView *)view button:(UIButton *)button {
    if (self.cmam_parentController) {
        [self.cmam_parentController dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self removeFromSuperview];
    }
}

- (void)wya_rightActionWithPaginationView:(UIView *)view button:(UIButton *)button {

    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(wya_ChooseWithPickerView:ResultString:)]) {
        [self.delegate wya_ChooseWithPickerView:self ResultString:self.resultString];
    }
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(wya_ChooseWithPickerView:ResultValues:)]) {
        [self.delegate wya_ChooseWithPickerView:self ResultValues:self.resultValues];
    }

    if (self.cmam_parentController) {
        [self.cmam_parentController dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self removeFromSuperview];
    }
}

#pragma mark--- Private Action
- (void)createUI {
    self.backgroundColor = [UIColor whiteColor];

    [self addSubview:self.titleView];
    [self addSubview:self.line];
    [self addSubview:self.pickView];
    //    [self addSubview:self.customPicker];

    self.pickerViewStyle     = WYAPickerViewStyleSystem;
    self.pickerHeight        = 220;
    self.autoTitleChange     = YES;
    self.pickerItemAlignment = NSTextAlignmentCenter;
    self.pickerItemColor     = [UIColor blackColor];
    self.pickerItemFont      = FONT(17);
}
#pragma mark--- Public Action

- (CGFloat)wya_GetPickerViewHeight {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    if (self.pickerViewStyle == WYAPickerViewStyleSystem) {
        return self.titleView.cmam_height + self.pickView.cmam_height + 1;
    } else {
        return self.titleView.cmam_height + self.customPicker.cmam_height + 1;
    }
}

#pragma mark--- Getter
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
        _pickView.delegate        = self;
        _pickView.backgroundColor = [UIColor whiteColor];
    }
    return _pickView;
}

- (WYACustomPickerView *)customPicker {
    if (!_customPicker) {
        _customPicker                = [[WYACustomPickerView alloc] init];
        _customPicker.wya_dataSource = self;
        _customPicker.wya_delegate   = self;
    }
    return _customPicker;
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

#pragma mark--- Setter
- (void)setAutoTitleChange:(BOOL)autoTitleChange {
    _autoTitleChange = autoTitleChange;
    [self.pickView reloadAllComponents];
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    if (dataArray) {
        if (self.pickerViewColumnStyle == WYAPickerViewColumnStyleSingle) {
            self.provinces         = dataArray;
            if (self.selectValues) {
                [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSDictionary * dic = (NSDictionary *)obj;
                    if ([dic[self.titleKeyWords] isEqual:self.selectValues.firstObject]) {
                        self.resultValues = dic[self.paramWords];
                        [self.pickView reloadComponent:0];
                        [self.pickView selectRow:idx inComponent:0 animated:YES];
                        *stop = YES;
                    }
                }];
                self.resultString = [NSString stringWithFormat:@"%@",self.selectValues.firstObject];

            } else {
                NSDictionary * dic = [self.dataArray firstObject];
                self.resultString = dic[self.titleKeyWords];
                self.resultValues = dic[self.paramWords];
            }

        } else if (self.pickerViewColumnStyle == WYAPickerViewColumnStyleDouble) {
            self.provinces         = dataArray;
            if (self.selectValues) {
                __block id paramsOne;
                __block id paramsTwo;
                [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSDictionary * dic = (NSDictionary *)obj;
                    if ([dic[self.titleKeyWords] isEqual:self.selectValues.firstObject]) {
                        [self.pickView reloadAllComponents];
                        [self.pickView selectRow:idx inComponent:0 animated:YES];
                        NSDictionary * dic = dataArray[idx];
                        self.citys = dic[self.arrayKeyWords];
                        paramsOne = dic[self.paramWords];
                        *stop = YES;
                    }
                }];
                [self.citys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSDictionary * dic = (NSDictionary *)obj;
                    if ([dic[self.titleKeyWords] isEqual:self.selectValues.lastObject]) {
                        paramsTwo = dic[self.paramWords];
                        [self.pickView reloadAllComponents];
                        [self.pickView selectRow:idx inComponent:1 animated:YES];
                        *stop = YES;
                    }
                }];
                self.resultString = [self.selectValues componentsJoinedByString:@"-"];
                self.resultValues = [NSString stringWithFormat:@"%@-%@",paramsOne,paramsTwo];
            } else {
                NSDictionary * dic     = [self.provinces firstObject];
                NSString * str         = dic[self.titleKeyWords];
                a                      = str;
                NSString * paramsOne = dic[self.paramWords];
                self.citys             = dic[self.arrayKeyWords];
                NSDictionary * cityDic = [self.citys firstObject];
                NSString * str1        = cityDic[self.titleKeyWords];
                NSString * paramsTwo = cityDic[self.paramWords];
                b                      = str1;
                self.resultString      = [NSString stringWithFormat:@"%@-%@", str, str1];
                self.resultValues = [NSString stringWithFormat:@"%@-%@",paramsOne,paramsTwo];
            }

        } else {
            self.provinces = dataArray;
            if (self.selectValues) {
                __block id paramsOne;
                __block id paramsTwo;
                __block id paramsThree;
                [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSDictionary * dic = (NSDictionary *)obj;
                    if ([dic[self.titleKeyWords] isEqual:self.selectValues.firstObject]) {
                        [self.pickView reloadAllComponents];
                        [self.pickView selectRow:idx inComponent:0 animated:YES];
                        NSDictionary * dic = dataArray[idx];
                        self.citys = dic[self.arrayKeyWords];
                        paramsOne = dic[self.paramWords];
                        *stop = YES;
                    }
                }];
                [self.citys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSDictionary * dic = (NSDictionary *)obj;
                    if ([dic[self.titleKeyWords] isEqual:self.selectValues[1]]) {
                        [self.pickView reloadAllComponents];
                        [self.pickView selectRow:idx inComponent:1 animated:YES];
                        self.areas = self.citys[idx][self.arrayKeyWords];
                        paramsTwo = dic[self.paramWords];
                        *stop = YES;
                    }
                }];
                [self.areas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSDictionary * dic = (NSDictionary *)obj;
                    if ([dic[self.titleKeyWords] isEqual:self.selectValues[2]]) {
                        [self.pickView reloadAllComponents];
                        [self.pickView selectRow:idx inComponent:2 animated:YES];
                        paramsThree = dic[self.paramWords];
                        *stop = YES;
                    }
                }];
                self.resultString = [self.selectValues componentsJoinedByString:@"-"];
                self.resultValues = [NSString stringWithFormat:@"%@-%@-%@",paramsOne,paramsTwo,paramsThree];
            } else {


                NSDictionary * dic     = [self.provinces firstObject];
                NSString * str         = dic[self.titleKeyWords];
                NSString * paramsOne = dic[self.paramWords];
                a                      = str;
                self.citys             = dic[self.arrayKeyWords];
                NSDictionary * cityDic = [self.citys firstObject];
                NSString * str1        = cityDic[self.titleKeyWords];
                NSString * paramsTwo = cityDic[self.paramWords];
                b                      = str1;
                self.areas             = cityDic[self.arrayKeyWords];
                NSDictionary * areaDic = [self.areas firstObject];
                NSString * str2        = areaDic[self.titleKeyWords];
                NSString * paramsThree = areaDic[self.paramWords];
                c                      = str2;
                self.resultString      = [NSString stringWithFormat:@"%@-%@-%@", a, b, c];
                self.resultValues = [NSString stringWithFormat:@"%@-%@-%@",paramsOne,paramsTwo,paramsThree];
            }

        }
        if (self.autoTitleChange) {
            [self.titleView wya_SetTitleLabelWithText:self.resultString
                                            TextColor:[UIColor blackColor]
                                             TextFont:15];
        }
    }
}

- (void)setPickerHeight:(CGFloat)pickerHeight {
    _pickerHeight = pickerHeight;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setPickerItemHeight:(CGFloat)pickerItemHeight {
    _pickerItemHeight = pickerItemHeight;
    [self.pickView reloadAllComponents];
}

- (void)setPickerItemColor:(UIColor *)pickerItemColor {
    _pickerItemColor = pickerItemColor;
    [self.pickView reloadAllComponents];
}

- (void)setPickerItemFont:(UIFont *)pickerItemFont {
    _pickerItemFont = pickerItemFont;
    [self.pickView reloadAllComponents];
}

- (void)setPickerItemAlignment:(NSTextAlignment)pickerItemAlignment {
    _pickerItemAlignment = pickerItemAlignment;
    [self.pickView reloadAllComponents];
}

@end
