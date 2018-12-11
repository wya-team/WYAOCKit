# WYAIMGCode 生成二维码条形码

## 功能
生成二维码和条形码

##方法
* 生成普通的二维码

```Object-C
/**
 生成一张普通的二维码

 @param data 传入数据
 @param imageViewWidth 图片宽度
 @return 返回一张二维码图片
 */
+ (UIImage *)wya_GenerateWithDefaultQRCodeData:(NSString *)data
                                imageViewWidth:(CGFloat)imageViewWidth;
```
* 生成带图片的二维码

```Object-C
/**
 生成一张带有logo的二维码

 @param data 传入数据
 @param logoImageName 图片名
 @param logoScaleToSuperView 相对于父视图的缩放比取值范围0-1；0，不显示，1，代表与父视图大小相同(适当调整相应的比例，否则扫描不出结果)
 @return 返回一张二维码图片
 */
+ (UIImage *)wya_GenerateWithLogoQRCodeData:(NSString *)data
                              logoImageName:(NSString *)logoImageName
                       logoScaleToSuperView:(CGFloat)logoScaleToSuperView;
```
* 生成彩色的二维码

```Object-C
/**
 生成一张彩色的二维码

 @param data 传入数据
 @param backgroundColor 背景颜色
 @param mainColor 主色
 @return 返回一张二维码图片
 */
+ (UIImage *)wya_GenerateWithColorQRCodeData:(NSString *)data
                             backgroundColor:(CIColor *)backgroundColor
                                   mainColor:(CIColor *)mainColor;
```
* 生成条形码

```Object-C
/**
 生成条形码（原生只支持ios8.0以后）

 @param content 内容
 @param size 大小
 @param red 色值
 @param green 色值
 @param blue 色值
 @return 图片
 */
+ (UIImage *)wya_BarcodeImageWithContent:(NSString *)content
                           codeImageSize:(CGSize)size
                                     red:(CGFloat)red
                                   green:(CGFloat)green
                                    blue:(CGFloat)blue;
```


