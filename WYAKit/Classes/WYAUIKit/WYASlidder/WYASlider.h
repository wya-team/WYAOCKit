//
//  WYASlider.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WYASliderStyle) {
    WYASliderStyleSingle,//单向
    WYASliderStyleDouble,//双向
};

@interface WYASlider : UIView

@property (nonatomic, assign) WYASliderStyle  sliderStyle;

/**
 设置min进度条颜色
 */
@property (nonatomic,weak)UIColor *minTintColor;

/**
 设置max进度条颜色(当在WYASliderStyleSingle模式下该样式无效)
 */
@property (nonatomic,weak)UIColor *maxTintColor;

/**
 设置总进度条颜色
 */
@property (nonatomic,weak)UIColor *mainTintColor;

/**
 是否隐藏提示文字或图片
 */
@property (nonatomic, assign) BOOL  showNoteLabel;

/**
 设置最小值（当showNoteLabel==NO时无效）
 */
@property (nonatomic, copy)   NSString * minText;

/**
 设置最大值（当showNoteLabel==NO时无效）
 */
@property (nonatomic, copy)   NSString * maxText;

/**
 设置最小值（当showNoteLabel==NO时无效）
 */
@property (nonatomic, strong) UIImage * minImage;

/**
 设置最大值（当showNoteLabel==NO时无效）
 */
@property (nonatomic, strong) UIImage * maxImage;


/**
 当前最小值(当在WYASliderStyleSingle模式下该样式无效)
 */
@property (nonatomic,assign)CGFloat  currentMinValue;

/**
 当前最大值(当在WYASliderStyleSingle模式下显示当前移动的值0~1)
 */
@property (nonatomic,assign)CGFloat  currentMaxValue;

@end

NS_ASSUME_NONNULL_END
