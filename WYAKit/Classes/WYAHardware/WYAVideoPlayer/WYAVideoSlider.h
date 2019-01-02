//
//  WYAVideoSlider.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WYAVideoSliderDelegate <NSObject>

- (void)wya_SliderStartRun;

- (void)wya_SliderRunningWithValue:(CGFloat)value;

- (void)wya_SliderEndRun;

@end

@interface WYAVideoSliderButton : UIButton

@end

@interface WYAVideoSlider : UIView
@property (nonatomic, weak) id<WYAVideoSliderDelegate> delegate;

@property (nonatomic, assign) CGFloat value; //滑杆进度
@property (nonatomic, assign) CGFloat bufferValue;
@property (nonatomic, assign, readonly) BOOL isFastForward; //是否快进，否则就是快退
@end

NS_ASSUME_NONNULL_END
