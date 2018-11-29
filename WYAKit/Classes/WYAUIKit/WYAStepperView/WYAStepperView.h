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
/// 左视图按钮的frame
@property (nonatomic, assign) CGRect  leftFrame;
/// 右侧视图按钮的frame
@property (nonatomic, assign) CGRect  rightFrame;
/// 图片名字
@property (nonatomic, copy) NSString * leftImageNamed;
/// 图片名字
@property (nonatomic, copy) NSString * rightImageNamed;
@end

NS_ASSUME_NONNULL_END
