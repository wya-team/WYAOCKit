//
//  WYAStepperCell.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/28.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYAStepperView;
NS_ASSUME_NONNULL_BEGIN
@protocol WYAStepperViewDelegate <NSObject>

@required

/**
 左侧按钮点击事件传递

 @param stepperView stepperView
 @param sender button
 */
- (void)wya_stepperView:(WYAStepperView *)stepperView leftButtonPressed:(UIButton *)sender;

/**
 右侧按钮点击事件传递

 @param stepperView stepperView
 @param sender button
 */
- (void)wya_stepperView:(WYAStepperView *)stepperView rightButtonPressed:(UIButton *)sender;

@end

@interface WYAStepperView : UIView
@property (nonatomic, weak) id<WYAStepperViewDelegate> delegate;
/// 按钮的frame不能为空
@property (nonatomic, assign, ) CGRect childFrame;

/// 图片名字从左到右顺序@[@"左侧图片名字",@"右侧图片名字"]
@property (nonatomic, strong, nonnull) NSArray * ImageNamedArray;

@property (nonatomic, strong) UITextField * stepperTextFiled;

@end

NS_ASSUME_NONNULL_END
