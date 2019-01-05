//
//  UIImage+WYAImage.h
//  QRCodeDemo
//
//  Created by 李世航 on 2018/6/13.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Catagory)

/**
 返回一张不超过屏幕尺寸的 image

 @param image 图片
 @return 图片
 */
+ (UIImage *)wya_ImageSizeWithScreenImage:(UIImage *)image;

/**
 裁剪图片

 @param frame 裁剪区域
 @param angle 裁剪角度
 @param circular 是否是圆形裁剪
 @return image
 */
- (nonnull UIImage *)wya_croppedImageWithFrame:(CGRect)frame angle:(NSInteger)angle circularClip:(BOOL)circular;

/**
 等比例缩放,size 是你要把图显示到 多大区域

 @param sourceImage 传入图片
 @param size 目标大小
 @return image
 */
+ (UIImage *)wya_ImageCompressFitSizeScale:(UIImage *)sourceImage targetSize:(CGSize)size;

@end

@interface UIImage (Source)

/**
 不对外使用
 
 @param imageName 图片名
 @param className 类名
 @return image
 */
+ (UIImage *)loadBundleImage:(NSString *)imageName ClassName:(NSString *)className;

/**
 将颜色转化为图片
 
 @param color UIColor对象
 @return Image对象
 */
+ (UIImage *)wya_createImageWithColor:(UIColor * _Nonnull)color;

/**
 根据url获取图片信息
 like this :{
 ColorModel = RGB;
 DPIHeight = 72;
 DPIWidth = 72;
 Depth = 8;
 PixelHeight = 795;
 PixelWidth = 1200;
 "{JFIF}" =     {
 DensityUnit = 1;
 JFIFVersion =         (
 1,
 0,
 1
 );
 XDensity = 72;
 YDensity = 72;
 };
 
 @param urlString url
 @return 信息
 */
+ (NSDictionary *)wya_imageInfoWithUrl:(NSString *)urlString;

/**
 加载SVG图片
 
 @param name 图片名
 @param size 大小
 @return image
 */
+ (UIImage *)wya_svgImageName:(NSString *)name size:(CGSize)size;

/**
 加载SVG图片

 @param name 图片名
 @param size 大小
 @param className NSStringFromClass(self.class)
 @return image
 */
+ (UIImage *)wya_svgImageName:(NSString *)name size:(CGSize)size ClassName:(NSString *)className;

/**
 获取视频第一帧图片

 @param path 视频url
 @return image
 */
+ (UIImage *)wya_getVideoPreViewImage:(NSURL *)path;

/// 返回一张可拉伸的图片
+ (UIImage *)wya_resizeImageNamed:(NSString *)name;

/**
 颜色生成图片是否需要切圆角

 @param color 颜色
 @param size 图片尺寸
 @param rate 圆角系数为0不切圆角
 @return 图片
 */
+ (UIImage *)wya_imageWithColor:(UIColor *)color size:(CGSize)size rate:(CGFloat)rate;

@end
