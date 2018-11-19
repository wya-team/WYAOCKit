# WYATextView (文本输入框)
> 给TextView添加PalceHolder设置，添加占位文字、颜色、文字大小，添加标题字段，，高度随内容文字大小自动适应

### 使用方法,参照系统textView使用方法即可
设置placeholder

````
/**
 设置textView的PlaceHolder

 @param placeHoldString 文字
 @param placeHoldColor 颜色
 @param placeHoldFont 大小
 */
-(void)wya_PlaceHoldString:(NSString *)placeHoldString PlaceHoldColor:(UIColor *)placeHoldColor PlaceHoldFont:(CGFloat)placeHoldFont;
````
其他开放属性
````
@property (nonatomic, copy)   NSString * title;//标题
@property (nonatomic, assign) BOOL  showTitle; //default is YES
@property (nonatomic, assign) BOOL  showWordsCount; // default is YES
@property (nonatomic, assign) float  textViewMaxHeight;//最大高度
@property (nonatomic, assign) NSUInteger  textViewWordsCount;//最大字数
@property (nonatomic, readonly) UITextView * textView;
````

