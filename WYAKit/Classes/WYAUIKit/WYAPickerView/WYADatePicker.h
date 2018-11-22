//
//  WYADatePicker.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WYAPickerManager;

typedef NS_ENUM(NSInteger, WYADatePickerStyle) {
    WYADatePickerStyleDateHourMinuteSecond,//年月日时分秒
    
};

@protocol WYADatePickerDelegate <NSObject>



@end

@interface WYADatePicker : UIView

@property (nonatomic, weak) id<WYADatePickerDelegate> wya_delegate;
@property (nonatomic, assign) WYADatePickerStyle  datePickerStyle;
@property (nonatomic, weak) UIViewController * viewController;
@property (nonatomic, strong) WYAPickerManager * datePickerManager;
/**
 设置pickerView高度
 */
@property (nonatomic, assign) CGFloat    pickerHeight;

/**
 设置pickerView的Item高度
 */
@property (nonatomic, assign) CGFloat    pickerItemHeight;

-(CGFloat)getPickerViewHeight;
@end

NS_ASSUME_NONNULL_END
