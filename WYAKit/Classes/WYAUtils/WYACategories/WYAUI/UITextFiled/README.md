# UITextFiled
## 功能
- 设置占位文字颜色，设置左右视图文字或者图片,设置下划线样式，设置输入框文字颜色、背景色、字体大小。<font color="red">设置需要在textFiled的Frame已经确定，不支持Masonry</font>

## 方法

```objective-c
/**
 设置placeholder可以定制颜色字体大小

 @param placeholedr 占位文字
 @param color 颜色
 @param font 字体大小
 */
- (void)wya_setPlaceholedr:(NSString *)placeholedr color:(UIColor *)color font:(CGFloat)font;

/**
 设置左视图文字

 @param text 文字内容
 @param color 颜色
 @param font 字体大小
 */
- (void)wya_setLeftViewWithText:(NSString *)text textColor:(UIColor *)color font:(CGFloat)font;

/**
 设置左视图图片

 @param imageNamed 图片名字
 */
- (void)wya_setLeftViewImageWithImageNamed:(NSString *)imageNamed;
- (void)wya_setLeftButtonWithView:(UIButton *)button;
/**
 设置右视图图片

 @param imageNamed 图片名字
 */
- (void)wya_setRightViewImageWithImageNamed:(NSString *)imageNamed;

- (void)wya_setRightButtonWithView:(UIButton *)button;
/**
 设置下划线样式的textFiled

 @param color 下划线颜色
 */
- (void)wya_setTextFiledTypeStyleLineWithColor:(UIColor *)color;

/**
 设置用户名输入框

 @param color 输入框的文字颜色
 @param font 字体大小
 @param backGroundColor 背景色
 */
- (void)wya_setUserNameTextFiledTextColor:(UIColor *)color FontSize:(CGFloat)font backGroundColor:(UIColor *)backGroundColor;

/**
 设置密码输入框

 @param color 字体颜色
 @param font 字体大小
 @param backGroundColor 背景色
 */
- (void)wya_setPasswordTextFiledTextColor:(UIColor *)color FontSize:(CGFloat)font backGroundColor:(UIColor *)backGroundColor;
```

