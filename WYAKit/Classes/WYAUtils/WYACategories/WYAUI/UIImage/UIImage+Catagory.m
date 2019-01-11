//
//  UIImage+WYAImage.m
//  QRCodeDemo
//
//  Created by 李世航 on 2018/6/13.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UIImage+Catagory.h"
#import <AVFoundation/AVFoundation.h>
#import <ImageIO/ImageIO.h>

@implementation UIImage (Catagory)

+ (UIImage *)wya_ImageSizeWithScreenImage:(UIImage *)image {
    CGFloat imageWidth  = image.size.width;
    CGFloat imageHeight = image.size.height;

    if (imageWidth <= ScreenWidth && imageHeight <= ScreenHeight) { return image; }

    CGFloat max   = MAX(imageWidth, imageHeight);
    CGFloat scale = max / (ScreenHeight * 2.0);

    CGSize size = CGSizeMake(imageWidth / scale, imageHeight / scale);
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}

- (BOOL)hasAlpha {
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(self.CGImage);
    return (alphaInfo == kCGImageAlphaFirst || alphaInfo == kCGImageAlphaLast ||
            alphaInfo == kCGImageAlphaPremultipliedFirst ||
            alphaInfo == kCGImageAlphaPremultipliedLast);
}

- (UIImage *)wya_croppedImageWithFrame:(CGRect)frame
                                 angle:(NSInteger)angle
                          circularClip:(BOOL)circular {
    UIImage * croppedImage = nil;
    UIGraphicsBeginImageContextWithOptions(frame.size, ![self hasAlpha] && !circular, self.scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();

        if (circular) {
            CGContextAddEllipseInRect(context, (CGRect){CGPointZero, frame.size});
            CGContextClip(context);
        }

        // To conserve memory in not needing to completely re-render the image re-rotated,
        // map the image to a view and then use Core Animation to manipulate its rotation
        if (angle != 0) {
            UIImageView * imageView             = [[UIImageView alloc] initWithImage:self];
            imageView.layer.minificationFilter  = kCAFilterNearest;
            imageView.layer.magnificationFilter = kCAFilterNearest;
            imageView.transform =
                CGAffineTransformRotate(CGAffineTransformIdentity, angle * (M_PI / 180.0f));
            CGRect rotatedRect = CGRectApplyAffineTransform(imageView.bounds, imageView.transform);
            UIView * containerView =
                [[UIView alloc] initWithFrame:(CGRect){CGPointZero, rotatedRect.size}];
            [containerView addSubview:imageView];
            imageView.center = containerView.center;
            CGContextTranslateCTM(context, -frame.origin.x, -frame.origin.y);
            [containerView.layer renderInContext:context];
        } else {
            CGContextTranslateCTM(context, -frame.origin.x, -frame.origin.y);
            [self drawAtPoint:CGPointZero];
        }

        croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return [UIImage imageWithCGImage:croppedImage.CGImage
                               scale:self.scale
                         orientation:UIImageOrientationUp];
}

+ (UIImage *)wya_ImageCompressFitSizeScale:(UIImage *)sourceImage targetSize:(CGSize)size {
    UIImage * newImage     = nil;
    CGSize imageSize       = sourceImage.size;
    CGFloat width          = imageSize.width;
    CGFloat height         = imageSize.height;
    CGFloat targetWidth    = size.width;
    CGFloat targetHeight   = size.height;
    CGFloat scaleFactor    = 0.0;
    CGFloat scaledWidth    = targetWidth;
    CGFloat scaledHeight   = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);

    if (CGSizeEqualToSize(imageSize, size) == NO) {
        CGFloat widthFactor  = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;

        if (widthFactor > heightFactor) {
            scaleFactor = widthFactor;

        } else {
            scaleFactor = heightFactor;
        }
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;

        if (widthFactor > heightFactor) {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        } else if (widthFactor < heightFactor) {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }

    UIGraphicsBeginImageContext(size);

    CGRect thumbnailRect      = CGRectZero;
    thumbnailRect.origin      = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;

    [sourceImage drawInRect:thumbnailRect];

    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if (newImage == nil) { NSLog(@"scale image fail"); }

    UIGraphicsEndImageContext();
    return newImage;
}

@end

@implementation UIImage (Source)

+ (UIImage *)loadBundleImage:(NSString *)imageName ClassName:(NSString *)className {
    NSString * bundlePath = [[NSBundle bundleForClass:NSClassFromString(className)]
                                 .resourcePath stringByAppendingPathComponent:@"/WYAKit.bundle"];
    NSBundle * resource_bundle = [NSBundle bundleWithPath:bundlePath];
    UIImage * image =
        [UIImage imageNamed:imageName
                                 inBundle:resource_bundle
            compatibleWithTraitCollection:nil];
    return image;
}

+ (UIImage *)wya_createImageWithColor:(UIColor * _Nonnull)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);

    CGContextFillRect(context, rect);

    UIImage * tempImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tempImage;
}

+ (NSDictionary *)wya_imageInfoWithUrl:(NSString *)urlString {
    NSURL * url             = [NSURL URLWithString:urlString];
    CGImageSourceRef source = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    NSDictionary * imageHeader =
        (__bridge NSDictionary *)CGImageSourceCopyPropertiesAtIndex(source, 0, NULL);
    NSLog(@"Image header %@", imageHeader);
    return imageHeader;
}

+ (UIImage *)wya_svgImageName:(NSString *)name size:(CGSize)size {
    SVGKImage * image = [SVGKImage imageNamed:name];
    image.size        = size;
    return image.UIImage;
}

+ (UIImage *)wya_svgImageName:(NSString *)name size:(CGSize)size ClassName:(NSString *)className {
    NSString * bundlePath = [[NSBundle bundleForClass:NSClassFromString(className)]
                                 .resourcePath stringByAppendingPathComponent:@"/WYAKit.bundle"];
    NSBundle * resource_bundle = [NSBundle bundleWithPath:bundlePath];
    SVGKImage * image          = [SVGKImage imageNamed:name inBundle:resource_bundle];
    image.size                 = size;
    return image.UIImage;
}

// 获取视频第一帧
+ (UIImage *)wya_getVideoPreViewImage:(NSURL *)path {
    AVURLAsset * asset                      = [[AVURLAsset alloc] initWithURL:path options:nil];
    AVAssetImageGenerator * assetGen        = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetGen.appliesPreferredTrackTransform = YES;
    CMTime time                             = CMTimeMakeWithSeconds(0.0, 600);
    NSError * error                         = nil;
    CMTime actualTime;
    CGImageRef image     = [assetGen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage * videoImage = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return videoImage;
}

+ (UIImage *)wya_imageWithColor:(UIColor *)color size:(CGSize)size rate:(CGFloat)rate {
    CGFloat imageW = size.width;
    CGFloat imageH = size.height;
    // 1.开启基于位图的图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0.0);

    if (rate != 0) {
        UIBezierPath * path =
            [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, imageW, imageH)
                                       cornerRadius:rate];
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextAddPath(ctx, path.CGPath);
        CGContextClip(ctx);
    }

    // 2.画一个color颜色的矩形框
    [color set];
    UIRectFill(CGRectMake(0, 0, imageW, imageH));

    // 3.拿到图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();

    // 4.关闭上下文
    UIGraphicsEndImageContext();

    return image;
}

/// 返回一张可以拉伸的图片
+ (UIImage *)wya_resizeImageNamed:(NSString *)name {
    UIImage * normal = [UIImage imageNamed:name];
    CGFloat width    = normal.size.width * 0.5;
    CGFloat height   = normal.size.height * 0.5;
    normal           = [normal resizableImageWithCapInsets:UIEdgeInsetsMake(height, width, height, width)
                                    resizingMode:UIImageResizingModeTile];
    return normal;
}

@end
