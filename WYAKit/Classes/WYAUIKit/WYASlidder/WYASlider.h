//
//  WYASlider.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WYASlideStyle) {
    WYASlideStyleSingle,//单向
    WYASlideStyleDouble,//双向
};

@interface WYASlider : UIView

/**
 设置最小值
 */
@property (nonatomic,assign)CGFloat minNum;

/**
 设置最大值
 */
@property (nonatomic,assign)CGFloat maxNum;

/**
 设置min 颜色
 */
@property (nonatomic,weak)UIColor *minTintColor;

/**
 设置max 颜色
 */
@property (nonatomic,weak)UIColor *maxTintColor;

/**
 设置 中间 颜色
 */
@property (nonatomic,weak)UIColor *mainTintColor;

@property (nonatomic, strong) UIButton * minButton;//显示较小的数button
@property (nonatomic, strong) UIButton * maxButton;//显示较大的数button

/**
 当前最小值
 */
@property (nonatomic,assign)CGFloat  currentMinValue;

/**
 当前最大值
 */
@property (nonatomic,assign)CGFloat  currentMaxValue;



@end

NS_ASSUME_NONNULL_END
