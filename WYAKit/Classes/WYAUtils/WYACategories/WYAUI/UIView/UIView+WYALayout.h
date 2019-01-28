//
//  UIView+WYALayout.h
//  WYA_Project
//
//  Created by 李俊恒 on 2018/4/8.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WYALayout)
typedef enum : NSUInteger {
    CMAMOscillatoryAnimationToBigger,
    CMAMOscillatoryAnimationToSmaller,
} CMAMOscillatoryAnimationType;
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

/**
 Returns the view's view controller (may be nil).
 */
@property (nullable, nonatomic, readonly) UIViewController * cmam_viewController;

/**
 Returns the visible alpha on screen, taking into account superview and window.
 */
@property (nonatomic, readonly) CGFloat cmam_visibleAlpha;

/**
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
 @param view The view or window that is the target of the conversion operation. If view is nil, this
 method instead converts to window base coordinates.
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

@property (nonatomic) CGFloat cmam_left;    ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat cmam_top;     ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat cmam_right;   ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat cmam_bottom;  ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat cmam_width;   ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat cmam_height;  ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat cmam_centerX; ///< Shortcut for center.x
@property (nonatomic) CGFloat cmam_centerY; ///< Shortcut for center.y
@property (nonatomic) CGPoint cmam_origin;  ///< Shortcut for frame.origin.
@property (nonatomic) CGSize cmam_size;     ///< Shortcut for frame.size.

+ (void)cmam_showOscillatoryAnimationWithLayer:(CALayer * _Nullable)layer
                                          type:(CMAMOscillatoryAnimationType)type;

#pragma mark - 设置部分圆角
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight |
 * UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners withRadii:(CGSize)radii;
/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight |
 * UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners withRadii:(CGSize)radii viewRect:(CGRect)rect;


/**
 获取view所在的控制器

 @return 返回view所在的控制器
 */
- (UIViewController *)cmam_parentController;


/**
 获取view所在的控制器

 @return 返回view所在的控制器
 */
+ (UIViewController *)cmam_currentViewConrtoller;

@end
