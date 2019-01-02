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

@end

@interface WYAArrowBackgroundColorConfig : NSObject

/**
 十六进制字符串方式修改颜色
 
 @param colorString 颜色默认为白色
 */
+ (void)wya_arrowBackgroundColorString:(NSString *)colorString;

/**
 UIColor方式修改箭头颜色

 @param arrowColor 箭头颜色 默认白色
 */
+ (void)wya_arrowBackgroundColor:(UIColor *)arrowColor;
@end
NS_ASSUME_NONNULL_END
