//
//  UIImage+WYAImage.m
//  QRCodeDemo
//
//  Created by 李世航 on 2018/6/13.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UIImage+Catagory.h"
#import <ImageIO/ImageIO.h>

@implementation UIImage (WYAImage)

+(UIImage *)loadBundleImage:(NSString *)imageName ClassName:(NSString *)className{
    NSString *bundlePath = [[NSBundle bundleForClass:NSClassFromString(className)].resourcePath
                            stringByAppendingPathComponent:@"/WYAKit.bundle"];
    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
    UIImage *image = [UIImage imageNamed:imageName
                                inBundle:resource_bundle
           compatibleWithTraitCollection:nil];
    return image;
}

+ (UIImage *)wya_ImageSizeWithScreenImage:(UIImage *)image {
    
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    if (imageWidth <= ScreenWidth && imageHeight <= ScreenHeight) {
        return image;
    }
    
    CGFloat max = MAX(imageWidth, imageHeight);
    CGFloat scale = max / (ScreenHeight * 2.0);
    
    CGSize size = CGSizeMake(imageWidth / scale, imageHeight / scale);
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)wya_createImageWithColor:(UIColor * _Nonnull)color{
   
    CGRect rect = CGRectMake(0.0f,0.0f,1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage * tempImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tempImage;
}

+(NSDictionary *)wya_imageInfoWithUrl:(NSString *)urlString{
    NSURL * url = [NSURL URLWithString:urlString];
    CGImageSourceRef source = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    NSDictionary* imageHeader = (__bridge NSDictionary*) CGImageSourceCopyPropertiesAtIndex(source, 0, NULL);
    NSLog(@"Image header %@",imageHeader);
    return imageHeader;
}

-(UIImage *)wya_imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = size.width;
    CGFloat targetHeight = size.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if(CGSizeEqualToSize(imageSize, size) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
             if(widthFactor > heightFactor){
                     scaleFactor = widthFactor;
                 }
             else{
                     scaleFactor = heightFactor;
                 }
             scaledWidth = width * scaleFactor;
             scaledHeight = height * scaleFactor;
            if(widthFactor > heightFactor){
                     thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
                 }else if(widthFactor < heightFactor){
                         thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
                     }
         }
    UIGraphicsBeginImageContext(size);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
   thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
     [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
     if(newImage == nil){
             NSLog(@"scale image fail");
         }
     UIGraphicsEndImageContext();
    return newImage;
}
//指定宽度按比例缩放
-(UIImage *)wya_imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth{
       UIImage *newImage = nil;
       CGSize imageSize = sourceImage.size;
       CGFloat width = imageSize.width;
       CGFloat height = imageSize.height;
       CGFloat targetWidth = defineWidth;
       CGFloat targetHeight = height / (width / targetWidth);
       CGSize size = CGSizeMake(targetWidth, targetHeight);
       CGFloat scaleFactor = 0.0;
       CGFloat scaledWidth = targetWidth;
       CGFloat scaledHeight = targetHeight;
       CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
       if(CGSizeEqualToSize(imageSize, size) == NO){
               CGFloat widthFactor = targetWidth / width;
               CGFloat heightFactor = targetHeight / height;
               if(widthFactor > heightFactor){
                       scaleFactor = widthFactor;
                   }
               else{
                       scaleFactor = heightFactor;
                   }
               scaledWidth = width * scaleFactor;
               scaledHeight = height * scaleFactor;
               if(widthFactor > heightFactor){
                       thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
                   }else if(widthFactor < heightFactor){
                           thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
                       }
           }
       UIGraphicsBeginImageContext(size);
       CGRect thumbnailRect = CGRectZero;
       thumbnailRect.origin = thumbnailPoint;
       thumbnailRect.size.width = scaledWidth;
       thumbnailRect.size.height = scaledHeight;
       [sourceImage drawInRect:thumbnailRect];
       newImage = UIGraphicsGetImageFromCurrentImageContext();
       if(newImage == nil){
               NSLog(@"scale image fail");
           }
       UIGraphicsEndImageContext();
       return newImage;
}

@end
