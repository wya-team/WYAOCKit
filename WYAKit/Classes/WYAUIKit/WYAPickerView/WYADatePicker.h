//
//  WYADatePicker.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WYADatePicker;
typedef NS_ENUM(NSInteger, WYADatePickerStyle) {
    WYADatePickerStyleDateHourMinuteSecond,     //年月日时分秒
    WYADatePickerStyleYear,                     //年
    WYADatePickerStyleMouth,                    //月
    WYADatePickerStyleHour,                     //时
    WYADatePickerStyleMinute,                   //分
    WYADatePickerStyleSecond,                   //秒
    WYADatePickerStyleYearAndMonth,             //年月
    WYADatePickerStyleDate,                     //年月日
    WYADatePickerStyleDateHour,                 //年月日时
    WYADatePickerStyleDateHourMinute,           //年月日时分
    WYADatePickerStyleMonthDay,                 //月日 (只有选择当前年份)
    WYADatePickerStyleMonthDayHour,             //月日时 (只有选择当前年份)
    WYADatePickerStyleMonthDayHourMinute,       //月日时分 (只有选择当前年份)
    WYADatePickerStyleMonthDayHourMinuteSecond, //月日时分秒 (只有选择当前年份)
    WYADatePickerStyleTime,                     //时分
    WYADatePickerStyleTimeAndSecond,            //时分秒
    WYADatePickerStyleMinuteAndSecond,          //分秒
};

@protocol WYADatePickerDelegate <NSObject>

- (void)wya_ChooseWithDatePicker:(WYADatePicker *)datePicker ResultString:(NSString *)result;

@end

@interface WYADatePicker : UIView

@property (nonatomic, weak) id<WYADatePickerDelegate> wya_delegate;
/// 添加默认选中时间（不传则默认选中当前时间）
@property (nonatomic, strong) NSDate * selectDate;
/// 样式
@property (nonatomic, assign) WYADatePickerStyle datePickerStyle;

@property (nonatomic, strong) UIButton * backButton;
@property (nonatomic, strong) UIButton * sureButton;
@property (nonatomic, strong) UILabel * titleLabel;
/// 是否自动改变title文字
@property (nonatomic, assign) BOOL autoTitleChange;
/// 设置pickerView整体字体颜色
@property (nonatomic, strong) UIColor * pickerItemColor UI_APPEARANCE_SELECTOR;
/// 设置pickerView整体字体大小
@property (nonatomic, strong) UIFont * pickerItemFont UI_APPEARANCE_SELECTOR;
/// 设置pickerView整体字体排列方式
@property (nonatomic, assign) NSTextAlignment pickerItemAlignment UI_APPEARANCE_SELECTOR;
/// 设置pickerView高度
@property (nonatomic, assign) CGFloat pickerHeight UI_APPEARANCE_SELECTOR;
/// 设置pickerView的Item高度
@property (nonatomic, assign) CGFloat pickerItemHeight UI_APPEARANCE_SELECTOR;

/**
 获取datePicker高度

 @return 高度
 */
- (CGFloat)getPickerViewHeight;

- (instancetype)initWithPickerHeight:(CGFloat)pickH;
@end

NS_ASSUME_NONNULL_END
