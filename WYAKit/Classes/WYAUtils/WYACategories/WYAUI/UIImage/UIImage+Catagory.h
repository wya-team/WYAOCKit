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
 不对外使用

 @param imageName 图片名
 @param className 类名
 @return image
 */
+ (UIImage *)loadBundleImage:(NSString *)imageName ClassName:(NSString *)className;

+ (UIImage *)wya_ImageSizeWithScreenImage:(UIImage *)image;


/**
 将颜色转化为图片

 @param color UIColor对象
 @return Image对象
 */
+ (UIImage *)wya_createImageWithColor:(UIColor * _Nonnull)color;

@end
