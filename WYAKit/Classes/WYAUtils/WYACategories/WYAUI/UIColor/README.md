# UIColor

## 功能
- 可以直接输入RGB值生成UIColor,或者RGBA，也可以输入十六进制String生成等。

## 方法

```objective-c
/**
 *  Create a color from a HEX string.
 *  It supports the following type:
 *  - #RGB
 *  - #ARGB
 *  - #RRGGBB
 *  - #AARRGGBB
 *
 *  @param hexString NSString
 *
 *  @return Returns the UIColor instance
 */
+ (UIColor *)wya_hex:(NSString *)hexString;

/**
 *  通过0xffffff的16进制数字创建颜色
 *
 *  @param aRGB 0xffffff
 *
 *  @return UIColor
 */
+ (UIColor *)wya_colorWithRGB:(NSUInteger)aRGB;

/**
 调节颜色的明亮度
 
 @param color 颜色
 @param delta 明亮度
 @return color
 */
+ (UIColor *)wya_colorRGBonvertToHSB:(UIColor *)color withBrighnessDelta:(CGFloat)delta;

/**
 调整颜色的透明度
 
 @param color 颜色
 @param delta 透明度
 @return color
 */
+ (UIColor *)wya_colorRGBonvertToHSB:(UIColor *)color withAlphaDelta:(CGFloat)delta;

/**
 *  功能:通过RGB创建颜色
 *
 *  @param red <CGFloat> <范围:0~255.0>
 *  @param green <CGFloat> <范围:0~255.0>
 *  @param blue <CGFloat> <范围:0~255.0>
 *
 *  @return UIColor
 *
 *  example: rgb(173.0,23.0,11.0)
 */
UIColor * wya_rgb (CGFloat red, CGFloat green, CGFloat blue);

/**
 *  功能:通过RGB以及alpha创建颜色
 *
 *  @param red <CGFloat> <范围:0~255.0>
 *  @param green <CGFloat> <范围:0~255.0>
 *  @param blue <CGFloat> <范围:0~255.0>
 *  @param alpha <CGFloat> <范围:0~1.0>
 *
 *  @return UIColor
 *
 *  example: rgbA(173.0,23.0,11.0,0.5)
 */
UIColor * wya_rgbA (CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);
```


