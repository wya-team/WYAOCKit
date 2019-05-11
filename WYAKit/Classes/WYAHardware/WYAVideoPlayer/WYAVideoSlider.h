//
//  WYAVideoSlider.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WYAVideoSliderDelegate <NSObject>

/**
 滑动条开始运动
 */
- (void)wya_SliderStartRun;

/**
 滑动条数值改变

 @param value 数值
 */
- (void)wya_SliderRunningWithValue:(CGFloat)value;

/**
 滑动条结束
 */
- (void)wya_SliderEndRun;

@end

@interface WYAVideoSliderButton : UIButton

@end

@interface WYAVideoSlider : UIView
@property (nonatomic, weak) id<WYAVideoSliderDelegate> delegate;
/// 滑杆进度
@property (nonatomic, assign) CGFloat value;
/// 缓冲进度
@property (nonatomic, assign) CGFloat bufferValue;
/// 是否快进，否则就是快退
@property (nonatomic, assign, readonly) BOOL isFastForward;
@end

NS_ASSUME_NONNULL_END
