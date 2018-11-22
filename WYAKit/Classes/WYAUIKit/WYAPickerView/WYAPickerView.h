//
//  WYAPickerView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//typedef NS_ENUM(NSInteger, WYAPickerViewStyle) {
//    
//};

@protocol WYAPickerViewDelegate <NSObject>

@required
- (void)singleWithPickerView:(UIView *)pickerView ResultString:(NSString *)result;

@end

@interface WYAPickerView : UIView

@property (nonatomic, weak)   id <WYAPickerViewDelegate> delegate;


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

@property (nonatomic, strong) NSArray * dataSource;

@end

NS_ASSUME_NONNULL_END
