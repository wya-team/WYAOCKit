//
//  WYAPickerView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WYAPickerViewStyle) {
    WYAPickerViewStyleSystem,
    WYAPickerViewStyleCustom,
};

typedef NS_ENUM(NSInteger, WYAPickerViewColumnStyle) {
    WYAPickerViewColumnStyleSingle,
    WYAPickerViewColumnStyleDouble,
    WYAPickerViewColumnStyleThree,
};

@protocol WYAPickerViewDelegate <NSObject>

@required

/**
 返回选择结果

 @param pickerView self
 @param result 返回结果为字符串用@"-"隔开
 */
- (void)wya_ChooseWithPickerView:(UIView *)pickerView ResultString:(NSString *)result;

@end

@interface WYAPickerView : UIView

@property (nonatomic, weak)   id <WYAPickerViewDelegate> delegate;
@property (nonatomic, weak) UIViewController * viewController;

/**
 pickerView样式（暂不提供使用）
 */
@property (nonatomic, assign) WYAPickerViewStyle  pickerViewStyle;

/**
 pickerView列样式
 */
@property (nonatomic, assign) WYAPickerViewColumnStyle  pickerViewColumnStyle;
/**
 设置pickerView整体字体颜色
 */
@property (nonatomic, strong) UIColor * pickerItemColor;

/**
 设置pickerView整体字体大小
 */
@property (nonatomic, strong) UIFont * pickerItemFont;

/**
 设置pickerView高度
 */
@property (nonatomic, assign) CGFloat    pickerHeight;

/**
 设置pickerView的Item高度
 */
@property (nonatomic, assign) CGFloat    pickerItemHeight;

/**
 标题关键字(需要先指定)
 */
@property (nonatomic, copy)   NSString * titleKeyWords;

/**
 array关键字(需要先指定)
 */
@property (nonatomic, copy)   NSString * arrayKeyWords;

/**
 数据源
 */
@property (nonatomic, strong) NSMutableArray * dataArray;


/**
 获取pickerView高度

 @return 高度
 */
-(CGFloat)wya_GetPickerViewHeight;

@end

NS_ASSUME_NONNULL_END
