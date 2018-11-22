//
//  WYAPickerView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/21.
//

#import "WYAPickerView.h"
#import "WYAPaginationView.h"

static CGFloat pickerViewHeight = 220.0;

static CGFloat titleHeight = 50.0;

@interface WYAPickerView ()
@property (nonatomic, strong) UIView * contentView;

@property (nonatomic, strong) WYAPaginationView * titleView;

@property (nonatomic, strong) UIPickerView * pickView;

@property (nonatomic, copy) NSString * resultString;
@end

@implementation WYAPickerView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
        
        
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
    
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.titleView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.contentView);
        make.height.mas_equalTo(titleHeight);
    }];
    
    [self.pickView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.titleView.mas_bottom);
        make.height.mas_equalTo(self.pickerHeight? self.pickerHeight : pickerViewHeight);
    }];
    
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
//    self.titleLabel.text = self.resultString;
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
//        self.titleLabel.text = self.resultString;
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

-(WYAPaginationView *)titleView{
    if (!_titleView) {
        _titleView = [[WYAPaginationView alloc]init];
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

#pragma mark --- Setter
-(void)setPickerHeight:(CGFloat)pickerHeight{
    _pickerHeight = pickerHeight;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
