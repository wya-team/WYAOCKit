# UIButton

## 功能
- 添加点击事件Block形式、扩大按钮上下左右的点击区域、设置image与title的位置

## 方法

```objective-c

/**
 *  扩大 UIButton 的點擊範圍
 *  控制上下左右的延長範圍
 *
 *  @param top    顶部
 *  @param right  右边
 *  @param bottom 底部
 *  @param left   左边
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

/**
 设置图片在右，需先指定button.frame
 
 @param space 间距
 */
- (void)setImageLoctionRightWithSpace:(CGFloat)space;

/**
 设置图片在上，需先指定button.frame
 
 @param space 间距
 */
- (void)setImageLocationTopWithSpace:(CGFloat)space;

/**
 设置图片在下，需先指定button.frame
 
 @param space 间距
 */
- (void)setImageLocationBottomWithSpace:(CGFloat)space;


- (void)addCallBackAction:(ButtonActionCallBack)action
         forControlEvents:(UIControlEvents)controlEvents;

- (void)addCallBackAction:(ButtonActionCallBack)action;
/**
设置背景色

@param color 颜色
@param state state
*/
- (void)wya_setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state;
```

