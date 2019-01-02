//
//  UIView+Gestures.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/11.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WYATapGesturesStyle) {
    WYATapGesturesStyleSingle,
    WYATapGesturesStyleDouble,
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Gestures)

/**
 添加点击手势

 @param tapStyle 点击类型
 @param handle 回调
 */
- (void)wya_AddTapGesturesWithTapStyle:(WYATapGesturesStyle)tapStyle TapHandle:(void (^)(UITapGestureRecognizer * gesture))handle;

/**
 添加长按手势

 @param duration 长按时间
 @param handle 回调
 */
- (void)wya_AddLongPressGestureWithDuration:(NSTimeInterval)duration Handle:(void (^)(UILongPressGestureRecognizer * gesture))handle;

/**
 添加平移手势

 @param handle 回调
 */
- (void)wya_AddPanGestureWithHandle:(void (^)(UIPanGestureRecognizer * gesture))handle;

/**
 添加轻扫手势

 @param direction 方向
 @param handle 回调
 */
- (void)wya_AddSwipeGestureWithSwipeDirection:(UISwipeGestureRecognizerDirection)direction SwipeHandle:(void (^)(UISwipeGestureRecognizer * gesture))handle;

/**
 添加旋转手势

 @param handle 回调
 */
- (void)wya_AddRotationGestureWithHandle:(void (^)(UIRotationGestureRecognizer * gesture))handle;

/**
 添加捏合手势

 @param handle 回调
 */
- (void)wya_AddPinchGestureWithHandle:(void (^)(UIPinchGestureRecognizer * gesture))handle;
@end

NS_ASSUME_NONNULL_END
