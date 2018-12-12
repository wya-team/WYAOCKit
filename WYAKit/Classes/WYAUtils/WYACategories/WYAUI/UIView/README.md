# UIView
## 功能

- 便捷frame布局、toast提示等

## UIView+WYALayout

#### 属性

 属性 | 说明 | 类型 | 默认值
 --- | --- | --- | ---
cmam_left|视图左侧|CGFloat|-
cmam_top|视图顶部|CGFloat|-
cmam_right|视图右侧|CGFloat|-
cmam_bottom|视图底部|CGFloat|-
cmam_width|视图宽度|CGFloat|-
cmam_height|视图高度|CGFloat|-
cmam_centerX|X轴中心点|CGFloat|-cmam_centerY|Y轴中心点|CGFloat|-
cmam_origin|x\y坐标点|CGPoint|-
cmam_size|W\H宽高尺寸|CGSize|-
cmam_viewController|father控制器|UIViewController|-
cmam_visibleAlpha|返回屏幕上可见的alpha|CGFloat|-

#### 方法

```Object-C
/**
 Create a snapshot image of the complete view hierarchy.
 */
- (nullable UIImage *)cmam_snapshotImage;

/**
 Create a snapshot image of the complete view hierarchy.
 @discussion It's faster than "snapshotImage", but may cause screen updates.
 See -[UIView drawViewHierarchyInRect:afterScreenUpdates:] for more information.
 */
- (nullable UIImage *)cmam_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

/**
 Create a snapshot PDF of the complete view hierarchy.
 */
- (nullable NSData *)cmam_snapshotPDF;

/**
 Shortcut to set the view.layer's shadow
 
 @param color  Shadow Color
 @param offset Shadow offset
 @param radius Shadow radius
 */
- (void)cmam_setLayerShadow:(nullable UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius;

/**
 Remove all subviews.
 
 @warning Never call this method inside your view's drawRect: method.
 */
- (void)cmam_removeAllSubviews;
- /**
 Converts a point from the receiver's coordinate system to that of the specified view or window.
 
 @param point A point specified in the local coordinate system (bounds) of the receiver.
 @param view  The view or window into whose coordinate system point is to be converted.
 If view is nil, this method instead converts to window base coordinates.
 @return The point converted to the coordinate system of view.
 */
- (CGPoint)cmam_convertPoint:(CGPoint)point toViewOrWindow:(nullable UIView *)view;

/**
 Converts a point from the coordinate system of a given view or window to that of the receiver.
 
 @param point A point specified in the local coordinate system (bounds) of view.
 @param view  The view or window with point in its coordinate system.
 If view is nil, this method instead converts from window base coordinates.
 @return The point converted to the local coordinate system (bounds) of the receiver.
 */
- (CGPoint)cmam_convertPoint:(CGPoint)point fromViewOrWindow:(nullable UIView *)view;

/**
 Converts a rectangle from the receiver's coordinate system to that of another view or window.
 
 @param rect A rectangle specified in the local coordinate system (bounds) of the receiver.
 @param view The view or window that is the target of the conversion operation. If view is nil, this method instead converts to window base coordinates.
 @return The converted rectangle.
 */
- (CGRect)cmam_convertRect:(CGRect)rect toViewOrWindow:(nullable UIView *)view;

/**
 Converts a rectangle from the coordinate system of another view or window to that of the receiver.
 
 @param rect A rectangle specified in the local coordinate system (bounds) of view.
 @param view The view or window with rect in its coordinate system.
 If view is nil, this method instead converts from window base coordinates.
 @return The converted rectangle.
 */
- (CGRect)cmam_convertRect:(CGRect)rect fromViewOrWindow:(nullable UIView *)view;
+ (void)cmam_showOscillatoryAnimationWithLayer:(CALayer * _Nullable)layer type:(CMAMOscillatoryAnimationType)type;

#pragma mark - 设置部分圆角
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;
/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;
```
 
## UIView+WYAToast 

#### 方法
```Object-C
/**
 位于底部的toast提示框

 @param message 信息
 */
+ (void)wya_ShowBottomToastWithMessage:(NSString *)message;

/**
 位于屏幕中心的提示框

 @param message 信息
 */
+ (void)wya_ShowCenterToastWithMessage:(NSString *)message;

/**
 图片加文字的提示框

 @param message 信息
 @param imageString 图片名
 @param imageType 图片类型
 @param isSource 是否是WYAKit库的图片
 @param autoDismiss 是否需要自动消失
 */
+ (void)wya_ToastWithMessage:(NSString *)message
                 ImageString:(NSString *)imageString
                   imageType:(WYAToastImageType)imageType
        SourceInWYAKitBundle:(BOOL)isSource
                 AutoDismiss:(BOOL)autoDismiss;

/**
 请和wya_ToastWithMessage配合使用
 */
+(void)wya_DismissToast;
```


