//
//  WYAPickerView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WYAPickerView;
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
- (void)wya_ChooseWithPickerView:(WYAPickerView *)pickerView ResultString:(NSString *)result;

/**
 返回所需key对应的值
 
 @param pickerView self
 @param result 返回结果为字符串用@"-"隔开
 */
- (void)wya_ChooseWithPickerView:(WYAPickerView *)pickerView ResultValues:(NSString *)result;

@end

@interface WYAPickerView : UIView

@property (nonatomic, weak) id<WYAPickerViewDelegate> delegate;

@property (nonatomic, strong) UIButton * backButton;
@property (nonatomic, strong) UIButton * sureButton;
@property (nonatomic, strong) UILabel * titleLabel;

/**
 是否自动改变title文字
 */
@property (nonatomic, assign) BOOL autoTitleChange;

/**
 pickerView样式（暂不提供使用）
 */
@property (nonatomic, assign) WYAPickerViewStyle pickerViewStyle;

/**
 pickerView列样式
 */
@property (nonatomic, assign) WYAPickerViewColumnStyle pickerViewColumnStyle;
/**
 设置pickerView整体字体颜色
 */
@property (nonatomic, strong) UIColor * pickerItemColor;

/**
 设置pickerView整体字体大小
 */
@property (nonatomic, strong) UIFont * pickerItemFont;

@property (nonatomic, assign) NSTextAlignment pickerItemAlignment;

/**
 设置pickerView高度
 */
@property (nonatomic, assign) CGFloat pickerHeight;

/**
 设置pickerView的Item高度
 */
@property (nonatomic, assign) CGFloat pickerItemHeight;

/**
 标题关键字(需要先指定)
 */
@property (nonatomic, copy) NSString * titleKeyWords;

/**
 array关键字(需要先指定)
 */
@property (nonatomic, copy) NSString * arrayKeyWords;

/**
 返回参数关键字(需要先指定)
 */
@property (nonatomic, copy) NSString * paramWords;

/**
 数据源
 */
@property (nonatomic, strong) NSMutableArray * dataArray;

/**
 获取pickerView高度

 @return 高度
 */
- (CGFloat)wya_GetPickerViewHeight;

@end

NS_ASSUME_NONNULL_END
