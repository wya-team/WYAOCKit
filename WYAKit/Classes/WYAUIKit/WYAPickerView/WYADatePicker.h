//
//  WYADatePicker.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WYADatePickerStyle) {
    WYADatePickerStyleDateHourMinuteSecond,//年月日时分秒
    WYADatePickerStyleYear,//年
    WYADatePickerStyleMouth,//月
    WYADatePickerStyleHour,//时
    WYADatePickerStyleMinute,//分
    WYADatePickerStyleSecond,//秒
    WYADatePickerStyleYearAndMonth, //年月
    WYADatePickerStyleDate, //年月日
    WYADatePickerStyleDateHour, //年月日时
    WYADatePickerStyleDateHourMinute, //年月日时分
    WYADatePickerStyleMonthDay, //月日 (只有选择当前年份)
    WYADatePickerStyleMonthDayHour, //月日时 (只有选择当前年份)
    WYADatePickerStyleMonthDayHourMinute, //月日时分 (只有选择当前年份)
    WYADatePickerStyleMonthDayHourMinuteSecond, //月日时分秒 (只有选择当前年份)
    WYADatePickerStyleTime, //时分
    WYADatePickerStyleTimeAndSecond, //时分秒
    WYADatePickerStyleMinuteAndSecond, //分秒
};

@protocol WYADatePickerDelegate <NSObject>

-(void)wya_ChooseWithDatePicker:(UIView *)datePicker ResultString:(NSString *)result;

@end

@interface WYADatePicker : UIView

@property (nonatomic, weak) id<WYADatePickerDelegate> wya_delegate;
@property (nonatomic, assign) WYADatePickerStyle  datePickerStyle;
@property (nonatomic, weak) UIViewController * viewController;

/**
 设置pickerView高度
 */
@property (nonatomic, assign) CGFloat    pickerHeight;

/**
 设置pickerView的Item高度
 */
@property (nonatomic, assign) CGFloat    pickerItemHeight;

/**
 获取datePicker高度

 @return 高度
 */
-(CGFloat)getPickerViewHeight;

- (instancetype)initWithPickerHeight:(CGFloat)pickH;
@end

NS_ASSUME_NONNULL_END
