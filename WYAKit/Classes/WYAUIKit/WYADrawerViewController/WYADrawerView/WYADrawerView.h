//
//  WYADrawerView.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYADrawerView : UIView

/**
 左视图比例范围0~1，默认0.7
 */
@property (nonatomic, assign) CGFloat  leftRatio;

/**
 右视图比例范围0~1，默认0.7
 */
@property (nonatomic, assign) CGFloat  rightRatio;

/**
 初始化

 @param frame 位置
 @param leftView 左视图
 @param rightView 右视图
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame leftView:(UIView *)leftView rightView:(UIView *)rightView;

/**
 左视图移动
 */
- (void)wya_leftViewMove;

/**
 右视图移动
 */
- (void)wya_rightViewMove;

@end

NS_ASSUME_NONNULL_END
