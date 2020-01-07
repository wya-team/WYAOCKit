//
//  UIImage+WYAQRCode.m
//  WYAKit
//
//  Created by 李世航 on 2019/6/3.
//

#import "UIImage+WYAQRCode.h"

@implementation UIImage (WYAQRCode)
/**
 *  生成一张普通的二维码
 *
 *  @param data    传入你要生成二维码的数据
 *  @param imageViewWidth    图片的宽度
 */
+ (UIImage *)wya_GenerateWithDefaultQRCodeData:(NSString *)data
                                imageViewWidth:(CGFloat)imageViewWidth
{
    // 1、创建滤镜对象
    CIFilter * filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];

    // 恢复滤镜的默认属性
    [filter setDefaults];

    // 2、设置数据
    NSString * info = data;
    // 将字符串转换成
    NSData * infoData = [info dataUsingEncoding:NSUTF8StringEncoding];

    // 通过KVC设置滤镜inputMessage数据
    [filter setValue:infoData forKeyPath:@"inputMessage"];

    // 3、获得滤镜输出的图像
    CIImage * outputImage = [filter outputImage];

    return [self wya_CreateNonInterpolatedUIImageFormCIImage:outputImage withSize:imageViewWidth];
}

/** 根据CIImage生成指定大小的UIImage */
+ (UIImage *)wya_CreateNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size / CGRectGetWidth(extent), size / CGRectGetHeight(extent));

    // 1.创建bitmap;
    size_t width       = CGRectGetWidth(extent) * scale;
    size_t height      = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef =
    CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext * context    = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);

    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

/**
 *  生成一张带有logo的二维码
 *
 *  @param data    传入你要生成二维码的数据
 *  @param logoImageName    logo的image名
 *  @param logoScaleToSuperView
 * logo相对于父视图的缩放比（取值范围：0-1，0，代表不显示，1，代表与父视图大小相同）
 */
+ (UIImage *)wya_GenerateWithLogoQRCodeData:(NSString *)data
                                  logoImage:(UIImage * _Nullable)logoImage
                              logoImageName:(NSString * _Nullable)logoImageName
                       logoScaleToSuperView:(CGFloat)logoScaleToSuperView
{
    // 1、创建滤镜对象
    CIFilter * filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];

    // 恢复滤镜的默认属性
    [filter setDefaults];

    // 2、设置数据
    NSString * string_data = data;
    // 将字符串转换成 NSdata (虽然二维码本质上是字符串, 但是这里需要转换, 不转换就崩溃)
    NSData * qrImageData = [string_data dataUsingEncoding:NSUTF8StringEncoding];

    // 设置过滤器的输入值, KVC赋值
    [filter setValue:qrImageData forKey:@"inputMessage"];

    // 3、获得滤镜输出的图像
    CIImage * outputImage = [filter outputImage];

    // 图片小于(27,27),我们需要放大
    outputImage = [outputImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];

    // 4、将CIImage类型转成UIImage类型
    UIImage * start_image = [UIImage imageWithCIImage:outputImage];

    // - - - - - - - - - - - - - - - - 添加中间小图标 - - - - - - - - - - - - - - - -
    // 5、开启绘图, 获取图形上下文 (上下文的大小, 就是二维码的大小)
    UIGraphicsBeginImageContext(start_image.size);

    // 把二维码图片画上去 (这里是以图形上下文, 左上角为(0,0)点
    [start_image drawInRect:CGRectMake(0, 0, start_image.size.width, start_image.size.height)];

    // 再把小图片画上去
    UIImage * icon_image;
    if (logoImage) {
        icon_image = logoImage;
    } else {
        icon_image = [UIImage imageNamed:logoImageName];
    }
    CGFloat icon_imageW       = start_image.size.width * logoScaleToSuperView;
    CGFloat icon_imageH       = start_image.size.height * logoScaleToSuperView;
    CGFloat icon_imageX       = (start_image.size.width - icon_imageW) * 0.5;
    CGFloat icon_imageY       = (start_image.size.height - icon_imageH) * 0.5;

    [icon_image drawInRect:CGRectMake(icon_imageX, icon_imageY, icon_imageW, icon_imageH)];

    // 6、获取当前画得的这张图片
    UIImage * final_image = UIGraphicsGetImageFromCurrentImageContext();

    // 7、关闭图形上下文
    UIGraphicsEndImageContext();

    return final_image;
}

/**
 *  生成一张彩色的二维码
 *
 *  @param data    传入你要生成二维码的数据
 *  @param backgroundColor    背景色
 *  @param mainColor    主颜色
 */
+ (UIImage *)wya_GenerateWithColorQRCodeData:(NSString *)data
                             backgroundColor:(CIColor *)backgroundColor
                                   mainColor:(CIColor *)mainColor
{
    // 1、创建滤镜对象
    CIFilter * filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];

    // 恢复滤镜的默认属性
    [filter setDefaults];

    // 2、设置数据
    NSString * string_data = data;
    // 将字符串转换成 NSdata (虽然二维码本质上是字符串, 但是这里需要转换, 不转换就崩溃)
    NSData * qrImageData = [string_data dataUsingEncoding:NSUTF8StringEncoding];

    // 设置过滤器的输入值, KVC赋值
    [filter setValue:qrImageData forKey:@"inputMessage"];

    // 3、获得滤镜输出的图像
    CIImage * outputImage = [filter outputImage];

    // 图片小于(27,27),我们需要放大
    outputImage = [outputImage imageByApplyingTransform:CGAffineTransformMakeScale(9, 9)];

    // 4、创建彩色过滤器(彩色的用的不多)
    CIFilter * color_filter = [CIFilter filterWithName:@"CIFalseColor"];

    // 设置默认值
    [color_filter setDefaults];

    // 5、KVC 给私有属性赋值
    [color_filter setValue:outputImage forKey:@"inputImage"];

    // 6、需要使用 CIColor
    [color_filter setValue:backgroundColor forKey:@"inputColor0"];
    [color_filter setValue:mainColor forKey:@"inputColor1"];

    // 7、设置输出
    CIImage * colorImage = [color_filter outputImage];

    return [UIImage imageWithCIImage:colorImage];
}

#pragma mark - 生成条形码
+ (UIImage *)wya_BarcodeImageWithContent:(NSString *)content
                           codeImageSize:(CGSize)size
                                     red:(CGFloat)red
                                   green:(CGFloat)green
                                    blue:(CGFloat)blue
{
    UIImage * image               = [self wya_BarcodeImageWithContent:content codeImageSize:size];
    int imageWidth                = image.size.width;
    int imageHeight               = image.size.height;
    size_t bytesPerRow            = imageWidth * 4;
    uint32_t * rgbImageBuf        = (uint32_t *)malloc(bytesPerRow * imageHeight);
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGContextRef context =
    CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpaceRef,
                          kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    //遍历像素, 改变像素点颜色
    int pixelNum       = imageWidth * imageHeight;
    uint32_t * pCurPtr = rgbImageBuf;
    for (int i = 0; i < pixelNum; i++, pCurPtr++) {
        if ((*pCurPtr & 0xFFFFFF00) < 0x99999900) {
            uint8_t * ptr = (uint8_t *)pCurPtr;
            ptr[3]        = red * 255;
            ptr[2]        = green * 255;
            ptr[1]        = blue * 255;
        } else {
            uint8_t * ptr = (uint8_t *)pCurPtr;
            ptr[0]        = 0;
        }
    }
    //取出图片
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(
    NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpaceRef,
                                        kCGImageAlphaLast | kCGBitmapByteOrder32Little,
                                        dataProvider, NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    UIImage * resultImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpaceRef);

    return resultImage;
}

//改变条形码尺寸大小
+ (UIImage *)wya_BarcodeImageWithContent:(NSString *)content codeImageSize:(CGSize)size
{
    CIImage * image     = [self wya_BarcodeImageWithContent:content];
    CGRect integralRect = CGRectIntegral(image.extent);
    CGFloat scale =
    MIN(size.width / CGRectGetWidth(integralRect), size.height / CGRectGetHeight(integralRect));

    size_t width                  = CGRectGetWidth(integralRect) * scale;
    size_t height                 = CGRectGetHeight(integralRect) * scale;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef        = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpaceRef,
                                                   (CGBitmapInfo)kCGImageAlphaNone);
    CIContext * context    = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:integralRect];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, integralRect, bitmapImage);

    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

//生成最原始的条形码
+ (CIImage *)wya_BarcodeImageWithContent:(NSString *)content
{
    CIFilter * qrFilter  = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    NSData * contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
    [qrFilter setValue:contentData forKey:@"inputMessage"];
    [qrFilter setValue:@(0.00) forKey:@"inputQuietSpace"];
    CIImage * image = qrFilter.outputImage;
    return image;
}

void ProviderReleaseData(void * info, const void * data, size_t size)
{
    free((void *)data);
}
@end
