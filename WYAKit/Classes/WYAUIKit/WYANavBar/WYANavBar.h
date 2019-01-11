//
//  WYANavBar.h
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/11/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol WYANavBarDelegate <NSObject>

@optional

/// 返回按钮点击事件
- (void)wya_goBackPressed:(UIButton *)sender;
/// 自定义左侧按钮点击事件
- (void)wya_leftBarButtonItemPressed:(UIButton *)sender;
/// 自定义右侧按钮点击事件
- (void)wya_rightBarButtonItemPressed:(UIButton *)sender;
@end

@interface WYANavBar : UIView
/// 给分页控制器使用当menuView需要显示在导航栏上使用
@property (nonatomic, strong) UIView * pageItemView;
/**
 设置导航栏标题字体颜色 默认黑色
 */
@property (nonatomic, strong) UIColor * navTitleColor;

/**
 标题字体大小
 */
@property (nonatomic, assign) CGFloat navTitleFont;

/**
 返回按钮标题字体大小
 */
@property (nonatomic, assign) CGFloat leftBarButtonItemTitleFont;

/**
 右侧标题字体大小

 */
@property (nonatomic, assign) CGFloat rightBarButtonItemTitleFont;

/// 是否显示底部线条,默认显示为YES
@property (nonatomic, assign) BOOL isShowLine;
/// 背景图片
@property (nonatomic, strong) UIImage * backgroundImage;
/**
 导航栏标题
 */
@property (nonatomic, copy) NSString * navTitle;

@property (nonatomic, assign) CGFloat space;

@property (nonatomic, weak) id<WYANavBarDelegate> delegate;

/**
 当需要右侧设置两个按钮时候有图片和文字不同类型时候可以给该属性复制
 */
@property (nonatomic, strong) NSArray<UIButton *> * rightButtons;

/**
 当需要左侧设置两个按钮时候有图片和文字不同类型时候可以给该属性复制
 */
@property (nonatomic, strong) NSArray<UIButton *> * leftButtons;

#pragma mark ======= createRightButton
/**
 创建多个导航右侧文字按钮默认黑色标题颜色字号默认16，如需设置字体大小可以设置rightBarButtonItemTitleFont

 @param normalTitles 需要显示的标题
 */
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *> * _Nonnull)normalTitles;

/**
 创建多个导航右侧文字按钮，标题颜色自定义两种状态

 @param normalTitles titles
 @param normalColors normalColor
 @param highlightedColors highlightedColors
 */
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles
                                    normalColor:(NSArray<UIColor *> * _Nonnull)normalColors
                               highlightedColor:(NSArray<UIColor *> * _Nonnull)highlightedColors;

/**
 创建多个图片类型的右侧导航栏按钮

 @param normalImages normalImages 必传项
 @param highlightedImgs highlightedImgs 可以为nil
 */
- (void)wya_addRightNavBarButtonWithNormalImage:(NSArray<NSString *> * _Nonnull)normalImages
                                 highlightedImg:(NSArray<NSString *> *)highlightedImgs;

#pragma mark ======= createLeftButton
/**
 创建多个导航左侧文字按钮默认黑色标题颜色字号默认16，如需设置字体大小可以设置rightBarButtonItemTitleFont

 @param normalTitles 需要显示的标题
 */
- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *> * _Nonnull)normalTitles;

/**
 创建多个导航左侧文字按钮，标题颜色自定义两种状态

 @param normalTitles titles
 @param normalColors normalColor
 @param highlightedColors highlightedColors
 */
- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles
                                   normalColor:(NSArray<UIColor *> * _Nonnull)normalColors
                              highlightedColor:(NSArray<UIColor *> * _Nonnull)highlightedColors;

/**
 创建多个图片类型的左侧导航栏按钮

 @param normalImages normalImages 必传项
 @param highlightedImgs highlightedImgs 可以为nil
 */
- (void)wya_addLeftNavBarButtonWithNormalImage:(NSArray<NSString *> * _Nonnull)normalImages
                                highlightedImg:(NSArray<NSString *> *)highlightedImgs;

- (void)wya_goBackButtonWithTitle:(NSString *)title
                      normalColor:(UIColor * _Nullable)normalColor
                 highlightedColor:(UIColor * _Nullable)highlightedColor;

- (void)wya_goBackButtonWithImage:(NSString *)imageNamed;

/**
 SDK自定义导航返回按钮

 @param image 返回图片
 */
- (void)wya_customGobackWithImage:(UIImage *)image;
@end
NS_ASSUME_NONNULL_END
