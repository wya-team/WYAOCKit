//
//  WYAPickerView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/21.
//

#import "WYAPickerView.h"
#import "WYAPaginationView.h"
#import "WYACustomPickerView.h"


static CGFloat titleHeight = 44.0;

@interface WYAPickerView ()<WYAPaginationViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, WYACustomPickerViewDataSource, WYACustomPickerViewDelegate>

@property (nonatomic, strong) WYAPaginationView * titleView;

@property (nonatomic, strong) UIPickerView * pickView;
@property (nonatomic, strong) WYACustomPickerView * customPicker;
@property (nonatomic, copy) NSString * resultString;

@property (nonatomic, strong) NSArray * provinces;
@property (nonatomic, strong) NSArray * citys;
@property (nonatomic, strong) NSArray * areas;

@end

@implementation WYAPickerView
{
    NSString * a; NSString * b; NSString * c;
}
-(instancetype)init{
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
    
    
    if (self.pickerViewStyle == WYAPickerViewStyleCustom) {
        [self.customPicker mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.top.mas_equalTo(self.titleView.mas_bottom);
            make.height.mas_equalTo(self.pickerHeight);
        }];
    }else{
        [self.pickView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.top.mas_equalTo(self.titleView.mas_bottom);
            make.height.mas_equalTo(self.pickerHeight);
        }];
    }
}

#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
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


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (self.pickerViewColumnStyle) {
        case WYAPickerViewColumnStyleSingle:
            return self.dataArray.count;
        case WYAPickerViewColumnStyleDouble:
        {
            if (component == 0) {
                return self.provinces.count;
            }else{
                return self.citys.count;
            }
        }
            
        case WYAPickerViewColumnStyleThree:
        {
            if (component == 0) {
                return self.provinces.count;
            }else if (component == 1){
                return self.citys.count;
            }else{
                return self.areas.count;
            }
        }
        default: return 0;
    }
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    switch (self.pickerViewColumnStyle) {
        case WYAPickerViewColumnStyleSingle: return self.cmam_width;
        case WYAPickerViewColumnStyleDouble: return self.cmam_width/2;
        case WYAPickerViewColumnStyleThree:  return self.cmam_width/3;
        default: return 0;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return self.pickerItemHeight? self.pickerItemHeight : 44;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
    UILabel * label = [[UILabel alloc]init];
    switch (self.pickerViewColumnStyle) {
        case WYAPickerViewColumnStyleSingle:
        {
            label.frame = CGRectMake(0, 0, self.cmam_width, self.pickerItemHeight ? self.pickerItemHeight : 44);
            label.text = self.dataArray[row];
           
        }
            
            break;
        case WYAPickerViewColumnStyleDouble:
        {
            label.frame = CGRectMake(0, 0, self.cmam_width/2, self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                NSDictionary * dic = self.provinces[row];
                label.text = dic[self.titleKeyWords];
              
            }else{
                NSDictionary * dic = self.citys[row];
                label.text = dic[self.titleKeyWords];
            }
        }
            
            break;
        case WYAPickerViewColumnStyleThree:
        {
            label.frame = CGRectMake(0, 0, self.cmam_width/3, self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                NSDictionary * dic = self.provinces[row];
                label.text = dic[self.titleKeyWords];
                
            }else if (component == 1) {
                NSDictionary * dic = self.citys[row];
                label.text = dic[self.titleKeyWords];
                
            }else{
                NSDictionary * dic = self.areas[row];
                label.text = dic[self.titleKeyWords];
            }
        }
            
            break;
        default:
            break;
    }
    label.textColor = self.pickerItemColor ? self.pickerItemColor : [UIColor blackColor];
    label.font = self.pickerItemFont ? self.pickerItemFont : [UIFont systemFontOfSize:17];
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
    
    switch (self.pickerViewColumnStyle) {
        case WYAPickerViewColumnStyleSingle:
            a = self.dataArray[row];
            self.resultString = a;
            break;
        case WYAPickerViewColumnStyleDouble:
        {
            if (component == 0) {
                
                NSDictionary * dic = self.provinces[row];
                self.citys = dic[self.arrayKeyWords];
                a = dic[self.titleKeyWords];
                [pickerView reloadComponent:1];
                [pickerView selectRow:0 inComponent:1 animated:YES];
                
                NSDictionary * cityDic = [self.citys firstObject];
                b = cityDic[self.titleKeyWords];
                
            }else{
                
                NSDictionary * dic = self.citys[row];
                b = dic[self.titleKeyWords];
                
            }
        }
            break;
        case WYAPickerViewColumnStyleThree:
        {
            if (component == 0) {
                
                NSDictionary * dic = self.provinces[row];
                self.citys = dic[self.arrayKeyWords];
                a = dic[self.titleKeyWords];
                [pickerView reloadComponent:1];
                [pickerView selectRow:0 inComponent:1 animated:YES];
                
                NSDictionary * cityDic = [self.citys firstObject];
                self.areas = cityDic[self.arrayKeyWords];
                b = cityDic[self.titleKeyWords];
                [pickerView reloadComponent:2];
                [pickerView selectRow:0 inComponent:2 animated:YES];
                
                NSDictionary * areaDic = [self.areas firstObject];
                c = areaDic[self.titleKeyWords];

            }else if (component == 1){
                NSDictionary * dic = self.citys[row];
                self.areas = dic[self.arrayKeyWords];
                b = dic[self.titleKeyWords];
                [pickerView reloadComponent:2];
                [pickerView selectRow:0 inComponent:2 animated:YES];
                
                NSDictionary * areaDic = [self.areas firstObject];
                c = areaDic[self.titleKeyWords];
            }else {
                NSDictionary * areaDic = self.areas[row];
                c = areaDic[self.titleKeyWords];
            }
        }
            break;
        default:
            break;
    }
    
    if (a.length>0 && b.length>0 && c.length>0) {
        self.resultString = [NSString stringWithFormat:@"%@-%@-%@",a,b,c];
    }else if (a.length>0 && b.length>0) {
        self.resultString = [NSString stringWithFormat:@"%@-%@",a,b];
    }else if (a.length>0) {
        self.resultString = a;
    }
    NSLog(@"string==%@",self.resultString);
    [self.titleView wya_SetTitleLabelWithText:self.resultString TextColor:[UIColor blackColor] TextFont:15];
}

#pragma mark --- WYACustomPickerViewDataSource
#pragma mark --- WYACustomPickerViewDelegate


#pragma mark --- WYAPaginationViewDelegate
- (void)wya_LeftAction{
    if (self.viewController) {
        [self.viewController dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self removeFromSuperview];
    }
}

- (void)wya_RightAction{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_ChooseWithPickerView:ResultString:)]) {
        [self.delegate wya_ChooseWithPickerView:self ResultString:self.resultString];
        if (self.viewController) {
            [self.viewController dismissViewControllerAnimated:YES completion:nil];
        }else{
            [self removeFromSuperview];
        }
    }
}

#pragma mark --- Private Action
-(void)createUI{
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.titleView];
    [self addSubview:self.pickView];
//    [self addSubview:self.customPicker];
    
    self.pickerViewStyle = WYAPickerViewStyleSystem;
    self.pickerHeight = 220;
}
#pragma mark --- Public Action

-(CGFloat)wya_GetPickerViewHeight{
    [self setNeedsLayout];
    [self layoutIfNeeded];
    if (self.pickerViewStyle == WYAPickerViewStyleSystem) {
        return self.titleView.cmam_height+self.pickView.cmam_height;
    }else{
        return self.titleView.cmam_height+self.customPicker.cmam_height;
    }
}


#pragma mark --- Getter
-(WYAPaginationView *)titleView{
    if (!_titleView) {
        _titleView = [[WYAPaginationView alloc]init];
        _titleView.backgroundColor = [UIColor whiteColor];
        _titleView.wya_Delegate = self;
        [_titleView wya_SetLeftButtonWithTitle:@"取消" TitleColor:[UIColor wya_hex:@"#FF352D"] TitleFont:15];
        [_titleView wya_SetRightButtonWithTitle:@"确定" TitleColor:[UIColor wya_hex:@"#108DE7"] TitleFont:15];
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

-(WYACustomPickerView *)customPicker{
    if (!_customPicker) {
        _customPicker = [[WYACustomPickerView alloc]init];
        _customPicker.wya_dataSource = self;
        _customPicker.wya_delegate = self;
    }
    return _customPicker;
}

#pragma mark --- Setter
-(void)setPickerViewStyle:(WYAPickerViewStyle)pickerViewStyle{
    _pickerViewStyle = pickerViewStyle;
    
//    if (pickerViewStyle == WYAPickerViewStyleSystem) {
//        self.customPicker.hidden = YES;
//        self.pickView.hidden = NO;
//    }else{
//        self.pickView.hidden = YES;
//        self.customPicker.hidden = NO;
//    }
//    [self setNeedsLayout];
//    [self layoutIfNeeded];
}
-(void)setPickerViewColumnStyle:(WYAPickerViewColumnStyle)pickerViewColumnStyle{
    _pickerViewColumnStyle = pickerViewColumnStyle;
    [self.pickView reloadAllComponents];
}

-(void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray = dataArray;
    if (dataArray) {
        if (self.pickerViewColumnStyle == WYAPickerViewColumnStyleSingle) {
            self.resultString = [self.dataArray firstObject];
        }else if (self.pickerViewColumnStyle == WYAPickerViewColumnStyleDouble) {
            self.provinces = dataArray;
            NSDictionary * dic = [self.provinces firstObject];
            NSString * str = dic[self.titleKeyWords];
            a = str;
            self.citys = dic[self.arrayKeyWords];
            NSDictionary * cityDic = [self.citys firstObject];
            NSString * str1 = cityDic[self.titleKeyWords];
            b = str1;
            self.resultString = [NSString stringWithFormat:@"%@-%@",str,str1];
        }else {
            self.provinces = dataArray;
            
            NSDictionary * dic = [self.provinces firstObject];
            NSString * str = dic[self.titleKeyWords];
            a = str;
            self.citys = dic[self.arrayKeyWords];
            NSDictionary * cityDic = [self.citys firstObject];
            NSString * str1 = cityDic[self.titleKeyWords];
            b = str1;
            self.areas = cityDic[self.arrayKeyWords];
            NSDictionary * areaDic = [self.areas firstObject];
            NSString * str2 = areaDic[self.titleKeyWords];
            c = str2;
            self.resultString = [NSString stringWithFormat:@"%@-%@-%@",a,b,c];
        }
        [self.titleView wya_SetTitleLabelWithText:self.resultString TextColor:[UIColor blackColor] TextFont:15];
    }
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

-(void)setPickerItemColor:(UIColor *)pickerItemColor{
    _pickerItemColor = pickerItemColor;
    [self.pickView reloadAllComponents];
}

-(void)setPickerItemFont:(UIFont *)pickerItemFont{
    _pickerItemFont = pickerItemFont;
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
