# UILabel

## 功能 
- 获取根据text动态获取宽、高，改变文字间距行间距等

## 方法
```objective-c
/**
 label文字顶部对齐
 */
- (void)alignTop;

/**
 label文字底部对齐
 */
- (void)alignBottom;

/**
 改变行间距
 
 @param space 间距
 @param labelText 文字
 */
- (void)changeLineSpaceForLabelWithSpace:(float)space text:(NSString *)labelText;

/**
 改变字间距
 
 @param space 间距
 */
- (void)changeWordSpaceForLabelWithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
- (void)changeSpaceForLabelWithLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

/**
 获得UILabel高度
 
 @param width 宽度
 @param title title
 @param font font
 @return 返回高度
 */
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font;

/**
 获得UILabel宽度
 
 @param title title
 @param font fon
 @return 返回宽度
 */
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
```

