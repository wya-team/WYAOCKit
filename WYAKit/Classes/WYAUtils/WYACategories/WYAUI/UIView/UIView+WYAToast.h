//
//  UIView+WYAToast.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WYAToast)

/**
 位于底部的toast提示框

 @param message 信息
 */
+ (void)wya_ShowBottomToastWithMessage:(NSString *)message;

/**
 位于屏幕中心的提示框

 @param message 信息
 */
+ (void)wya_ShowCenterToastWithMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
