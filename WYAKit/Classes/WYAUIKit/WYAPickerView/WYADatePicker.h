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
    /* 关于前置时间
     *  例如selectDate传入时间格式为2019-09-30，但选择的日期模式为<月日>,则前置时间为2019，在设置最大和最小的年份时应该把年份设置为和selectDate的年份保持一致
     */
    WYADatePickerStyleDateHourMinuteSecond,     //年月日时分秒
    WYADatePickerStyleYear,                     //年 
    WYADatePickerStyleMouth,                    //月 (必须和selectDate前置时间一致)
    WYADatePickerStyleHour,                     //时 (必须和selectDate前置时间一致)
    WYADatePickerStyleMinute,                   //分 (必须和selectDate前置时间一致)
    WYADatePickerStyleSecond,                   //秒 (必须和selectDate前置时间一致)
    WYADatePickerStyleYearAndMonth,             //年月
    WYADatePickerStyleDate,                     //年月日
    WYADatePickerStyleDateHour,                 //年月日时
    WYADatePickerStyleDateHourMinute,           //年月日时分
    WYADatePickerStyleMonthDay,                 //月日 (必须和selectDate前置时间一致)
    WYADatePickerStyleMonthDayHour,             //月日时 (必须和selectDate前置时间一致)
    WYADatePickerStyleMonthDayHourMinute,       //月日时分 (必须和selectDate前置时间一致)
    WYADatePickerStyleMonthDayHourMinuteSecond, //月日时分秒 (必须和selectDate前置时间一致)
    WYADatePickerStyleTime,                     //时分 (必须和selectDate前置时间一致)
    WYADatePickerStyleTimeAndSecond,            //时分秒 (必须和selectDate前置时间一致)
    WYADatePickerStyleMinuteAndSecond,          //分秒 (必须和selectDate前置时间一致)
};

@protocol WYADatePickerDelegate <NSObject>

@required
- (NSDate *)wya_MinDateWithDatePicker:(WYADatePicker *)datePicker style:(WYADatePickerStyle)style;
- (NSDate *)wya_MaxDateWithDatePicker:(WYADatePicker *)datePicker style:(WYADatePickerStyle)style;

@optional
- (void)wya_ChooseWithDatePicker:(WYADatePicker *)datePicker ResultString:(NSString *)result;

@end

@interface WYADatePicker : UIView

@property (nonatomic, weak) id<WYADatePickerDelegate> wya_delegate;
/// 添加默认选中时间（不传则默认选中当前时间）,选中时间必须在最大和最小时间范围之内
@property (nonatomic, strong) NSDate * selectDate;
/// 样式
@property (nonatomic, assign, readonly) WYADatePickerStyle datePickerStyle;

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

- (instancetype)initWithFrame:(CGRect)frame style:(WYADatePickerStyle)style;

/**
 获取datePicker高度

 @return 高度
 */
- (CGFloat)getPickerViewHeight;
@end

NS_ASSUME_NONNULL_END
