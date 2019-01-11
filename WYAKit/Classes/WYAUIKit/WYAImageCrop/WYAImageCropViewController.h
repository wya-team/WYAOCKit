//
//  WYAImageCropViewController.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/3.
//

#import <UIKit/UIKit.h>

#import "WYAImageCrop.h"
#import "WYAImageCropToolBar.h"
#import "WYAImageCropView.h"

@class WYAImageCropViewController;

@protocol WYAImageCropViewControllerDelegate <NSObject>
@optional

/**
 提供当前裁剪的矩形

 @param cropViewController self
 @param cropRect 矩形大小
 @param angle 角度
 */
- (void)cropViewController:(nonnull WYAImageCropViewController *)cropViewController
        didCropImageToRect:(CGRect)cropRect
                     angle:(NSInteger)angle;

/**
 获取裁剪后的图片

 @param cropViewController self
 @param image image
 @param cropRect 裁剪的image坐标
 @param angle 角度
 */
- (void)cropViewController:(nonnull WYAImageCropViewController *)cropViewController
            didCropToImage:(nonnull UIImage *)image
                  withRect:(CGRect)cropRect
                     angle:(NSInteger)angle;

/**
 获取圆形模板裁剪的图片

 @param cropViewController self
 @param image image
 @param cropRect 裁剪的image坐标
 @param angle 角度
 */
- (void)cropViewController:(nonnull WYAImageCropViewController *)cropViewController
    didCropToCircularImage:(nonnull UIImage *)image
                  withRect:(CGRect)cropRect
                     angle:(NSInteger)angle;

/**
 完成时调用

 @param cropViewController self
 @param cancelled YES
 */
- (void)cropViewController:(nonnull WYAImageCropViewController *)cropViewController
        didFinishCancelled:(BOOL)cancelled;

@end

@interface WYAImageCropViewController : UIViewController

@property (nullable, nonatomic, weak) id<WYAImageCropViewControllerDelegate> delegate;

/**
 原始图片
 */
@property (nonnull, nonatomic, readonly) UIImage * image;

@property (nonnull, nonatomic, strong, readonly) WYAImageCropView * cropView;
@property (nonnull, nonatomic, strong, readonly) WYAImageCropToolBar * toolbar;
@property (nonatomic, readonly) WYACropViewCroppingStyle croppingStyle;

@property (nullable, nonatomic, strong) void (^onDidFinishCancelled)(BOOL isFinished);
@property (nullable, nonatomic, strong) void (^onDidCropImageToRect)
    (CGRect cropRect, NSInteger angle);
@property (nullable, nonatomic, strong) void (^onDidCropToRect)
    (UIImage * _Nonnull image, CGRect cropRect, NSInteger angle);

/**
 圆形裁剪器时提供的图片
 */
@property (nullable, nonatomic, strong) void (^onDidCropToCircleImage)
    (UIImage * _Nonnull image, CGRect cropRect, NSInteger angle);

/**
 初始化

 @param image 要裁剪的图片
 @return self
 */
- (nonnull instancetype)initWithImage:(nonnull UIImage *)image;

/**
 初始化

 @param style 裁剪器样式
 @param image 要裁剪的图片
 @return self
 */
- (nonnull instancetype)initWithCroppingStyle:(WYACropViewCroppingStyle)style
                                        image:(nonnull UIImage *)image;

@end

///**
// 自定义淡入动画
//
// @param viewController 起始控制器
// @param fromView 起始视图
// @param fromFrame 起始坐标
// @param setup 设置
// @param completion 完成之后状态
// */
//- (void)presentAnimatedFromParentViewController:(nonnull UIViewController *)viewController
// fromView:(nullable UIView *)fromView
// fromFrame:(CGRect)fromFrame
// setup:(nullable void (^)(void))setup
// completion:(nullable void (^)(void))completion;
//
//
///**
// 自定义淡入动画
//
// @param viewController 起始控制器
// @param image image
// @param fromView 起始视图
// @param fromFrame 起始坐标
// @param angle 角度
// @param toFrame 结束位置
// @param setup 设置
// @param completion 完成之后状态
// */
//- (void)presentAnimatedFromParentViewController:(nonnull UIViewController *)viewController
// fromImage:(nullable UIImage *)image
// fromView:(nullable UIView *)fromView
// fromFrame:(CGRect)fromFrame
// angle:(NSInteger)angle
// toImageFrame:(CGRect)toFrame
// setup:(nullable void (^)(void))setup
// completion:(nullable void (^)(void))completion;
//
//
///**
// 自定义淡出状态
//
// @param viewController 起始控制器
// @param toView 结束视图
// @param frame 结束位置
// @param setup 设置
// @param completion 完成之后状态
// */
//- (void)dismissAnimatedFromParentViewController:(nonnull UIViewController *)viewController
// toView:(nullable UIView *)toView
// toFrame:(CGRect)frame
// setup:(nullable void (^)(void))setup
// completion:(nullable void (^)(void))completion;
//
//
///**
// 自定义淡出状态
//
// @param viewController 起始控制器
// @param image image
// @param toView 结束视图
// @param frame 结束位置
// @param setup 设置
// @param completion 完成之后状态
// */
//- (void)dismissAnimatedFromParentViewController:(nonnull UIViewController *)viewController
// withCroppedImage:(nullable UIImage *)image
// toView:(nullable UIView *)toView
// toFrame:(CGRect)frame
// setup:(nullable void (^)(void))setup
// completion:(nullable void (^)(void))completion;
