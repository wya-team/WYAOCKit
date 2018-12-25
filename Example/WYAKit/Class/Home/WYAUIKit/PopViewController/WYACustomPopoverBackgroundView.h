//
//  WYACustomPopoverBackgroundView.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/25.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYACustomPopoverBackgroundView : UIPopoverBackgroundView
//用于绘制箭头，如果不绘制，将没有箭头
@property (nonatomic, strong) UIImageView *arrowImageView;
@end

NS_ASSUME_NONNULL_END
