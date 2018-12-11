# UIImage

## 功能
- 颜色转图片、根据Url获取image信息、制作Pod库引用内容资源等

## 方法

```Object-C

/**
 不对外使用

 @param imageName 图片名
 @param className 类名
 @return image
 */
+ (UIImage *)loadBundleImage:(NSString *)imageName ClassName:(NSString *)className;

/**
 返回一张不超过屏幕尺寸的 image

 @param image 图片
 @return 图片
 */
+ (UIImage *)wya_ImageSizeWithScreenImage:(UIImage *)image;


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

- (nonnull UIImage *)croppedImageWithFrame:(CGRect)frame angle:(NSInteger)angle circularClip:(BOOL)circular;
```


