//
//  UIView+WYAToast.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WYAToastImageType) {
    WYAToastImageTypePNG,
    WYAToastImageTypeJPEG,
    WYAToastImageTypeSVG,
    WYAToastImageTypeGIF,
};

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

/**
 图片加文字的提示框

 @param message 信息
 @param imageString 图片名
 @param imageType 图片类型
 @param isSource 是否是WYAKit库的图片
 @param autoDismiss 是否需要自动消失
 */
+ (void)wya_ToastWithMessage:(NSString *)message
                 ImageString:(NSString *)imageString
                   imageType:(WYAToastImageType)imageType
        SourceInWYAKitBundle:(BOOL)isSource
                 AutoDismiss:(BOOL)autoDismiss;

/**
 请和wya_ToastWithMessage配合使用
 */
+(void)wya_DismissToast;
@end

NS_ASSUME_NONNULL_END
