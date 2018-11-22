//
//  WYAPickerView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/21.
//

#import "WYAPickerView.h"
#import "WYAPaginationView.h"

static CGFloat pickerViewHeight = 220.0;
static CGFloat titleHeight = 44.0;

@interface WYAPickerView ()<WYAPaginationViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) WYAPaginationView * titleView;
@property (nonatomic, strong) UIPickerView * pickView;
@property (nonatomic, copy) NSString * resultString;
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
    
    [self.pickView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.titleView.mas_bottom);
        make.height.mas_equalTo(self.pickerHeight? self.pickerHeight : pickerViewHeight);
    }];
    
}

#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    switch (self.pickerViewStyle) {
        case WYAPickerViewStyleSingle:
            return 1;
        case WYAPickerViewStyleDouble:
            return 2;
        case WYAPickerViewStyleThree:
            return 3;
        default:
            break;
    }
    return 0;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (self.pickerViewStyle) {
        case WYAPickerViewStyleSingle:
            return self.fristDataArray.count;
        case WYAPickerViewStyleDouble:
        {
            if (component == 0) {
                return self.fristDataArray.count;
            }else{
                NSArray * array = self.secondDataArray[[pickerView selectedRowInComponent:component]];
                return array.count;
            }
        }
            
        case WYAPickerViewStyleThree:
        {
            if (component == 0) {
                return self.fristDataArray.count;
            }else if (component == 1){
                NSInteger index = [pickerView selectedRowInComponent:component-1];
                NSArray * array = self.secondDataArray[index];
                return array.count;
            }else{
                NSInteger index = [pickerView selectedRowInComponent:component-2];
                NSInteger index1 = [pickerView selectedRowInComponent:component-1];
                NSArray * array = self.threeDataArray[index];
                NSArray * array1 = array[index1];
                return array1.count;
            }
        }
    }
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    switch (self.pickerViewStyle) {
        case WYAPickerViewStyleSingle:
            return self.cmam_width;
        case WYAPickerViewStyleDouble:
            return self.cmam_width/2;
        case WYAPickerViewStyleThree:
            return self.cmam_width/3;
        default:
            return 0;
    }
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return self.pickerItemHeight? self.pickerItemHeight : 44;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
    UILabel * label = [[UILabel alloc]init];
    switch (self.pickerViewStyle) {
        case WYAPickerViewStyleSingle:
        {
            label.frame = CGRectMake(0, 0, self.cmam_width, self.pickerItemHeight ? self.pickerItemHeight : 44);
            label.text = self.fristDataArray[row];
           
        }
            
            break;
        case WYAPickerViewStyleDouble:
        {
            label.frame = CGRectMake(0, 0, self.cmam_width/2, self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text = self.fristDataArray[row];
              
            }else{
                NSInteger index = [pickerView selectedRowInComponent:component-1];
                NSArray * arr = self.secondDataArray[index];
                label.text = arr[row];
               
            }
        }
            
            break;
        case WYAPickerViewStyleThree:
        {
            label.frame = CGRectMake(0, 0, self.cmam_width/3, self.pickerItemHeight ? self.pickerItemHeight : 44);
            if (component == 0) {
                label.text = self.fristDataArray[row];
                
            }else if (component == 1) {
                NSInteger index = [pickerView selectedRowInComponent:component-1];
                NSArray * arr = self.secondDataArray[index];
                label.text = arr[row];
                
            }else{
                NSInteger index = [pickerView selectedRowInComponent:component-2];
                NSArray * arr = self.threeDataArray[index];
                NSInteger index1 = [pickerView selectedRowInComponent:component-1];
                NSArray * arr1 = arr[index1];
                label.text = arr1[row];
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
    
    
    switch (self.pickerViewStyle) {
        case WYAPickerViewStyleSingle:
            a = self.fristDataArray[row];
            self.resultString = a;
            break;
        case WYAPickerViewStyleDouble:
        {
            if (component == 0) {
                NSInteger index = [pickerView selectedRowInComponent:component];
                a = self.fristDataArray[index];
                
                NSArray * arr = self.secondDataArray[index];
                b = arr[0];
                
                [pickerView reloadComponent:1];
                [pickerView selectRow:0 inComponent:1 animated:YES];
            }else{
                NSArray * arr = self.secondDataArray[[pickerView selectedRowInComponent:component-1]];
                b = arr[row];
                
            }
        }
            break;
        case WYAPickerViewStyleThree:
        {
            if (component == 0) {
                NSInteger index = [pickerView selectedRowInComponent:component];
                a = self.fristDataArray[index];
                
                NSArray * arr = self.secondDataArray[index];
                b = arr[0];
                [pickerView reloadComponent:1];
                [pickerView selectRow:0 inComponent:1 animated:YES];
                
                NSArray * arr1 = self.threeDataArray[index];
                NSArray * arr2 = arr1[0];
                c = arr2[0];
                [pickerView reloadComponent:2];
                [pickerView selectRow:0 inComponent:2 animated:YES];
                
            }else if (component == 1){
                NSInteger index = [pickerView selectedRowInComponent:component-1];
                NSArray * arr = self.secondDataArray[index];
                b = arr[row];
                
                NSArray * arr1 = self.threeDataArray[index];
                NSArray * arr2 = arr1[row];
                c = arr2[0];
                [pickerView reloadComponent:2];
                [pickerView selectRow:0 inComponent:2 animated:YES];
            }else {
                NSInteger index = [pickerView selectedRowInComponent:component-2];
                NSInteger index1 = [pickerView selectedRowInComponent:component-1];
                
                NSArray * arr = self.threeDataArray[index];
                NSArray * arr1 = arr[index1];
                c = arr1[row];
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
-(void)setPickerViewStyle:(WYAPickerViewStyle)pickerViewStyle{
    _pickerViewStyle = pickerViewStyle;
    [self.pickView reloadAllComponents];
}

-(void)setFristDataArray:(NSMutableArray *)fristDataArray{
    _fristDataArray = fristDataArray;
    if (fristDataArray) {
        [self.pickView reloadAllComponents];
        
        self.resultString = [fristDataArray firstObject];
        
        [self.titleView wya_SetTitleLabelWithText:self.resultString TextColor:[UIColor blackColor] TextFont:15];
    }
}

-(void)setSecondDataArray:(NSMutableArray *)secondDataArray{
    _secondDataArray = secondDataArray;
    if (secondDataArray) {
        [self.pickView reloadAllComponents];
        NSString * string = [self.fristDataArray firstObject];
        NSArray * arr = [secondDataArray firstObject];
        NSString * string1 = [arr firstObject];
        self.resultString = [NSString stringWithFormat:@"%@-%@",string,string1];
        
        [self.titleView wya_SetTitleLabelWithText:self.resultString TextColor:[UIColor blackColor] TextFont:15];
    }
}

-(void)setThreeDataArray:(NSMutableArray *)threeDataArray{
    _threeDataArray = threeDataArray;
    if (threeDataArray) {
        [self.pickView reloadAllComponents];
        NSString * string = [self.fristDataArray firstObject];
        NSArray * arr = [self.secondDataArray firstObject];
        NSString * string1 = [arr firstObject];
        NSArray * arr0 = [threeDataArray firstObject];
        NSArray * arr1 = [arr0 firstObject];
        NSString * string2 = [arr1 firstObject];
        self.resultString = [NSString stringWithFormat:@"%@-%@-%@",string,string1,string2];
        
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
