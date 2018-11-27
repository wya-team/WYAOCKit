//
//  WYABaseViewController.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/27.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYABaseViewController : UIViewController
/**
 导航栏标题
 
 */
@property (nonatomic, copy) NSString * navTitle;

/**
 设置导航栏标题字体颜色 默认黑色
 */
@property (nonatomic, strong) UIColor * navTitleColor;

/**
 标题字体大小
 */
@property (nonatomic, assign) CGFloat  navTitleFont;

/**
 返回按钮标题字体大小
 */
@property (nonatomic, assign) CGFloat  leftBarButtonItemTitleFont;

/**
 右侧标题字体大小
 
 */
@property (nonatomic, assign) CGFloat  rightBarButtonItemTitleFont;

/**
 导航栏是否展示横线 默认显示YES
 
 */
@property (nonatomic, assign) BOOL  isShowNavLine;

/**
 导航栏背景色 默认白色
 
 */
@property (nonatomic, strong) UIColor * navBackGroundColor;

/**
 导航栏背景图片名字
 
 */
@property (nonatomic, copy) NSString * navBackGroundImageNamed;

/**
 用于创建多个右侧按钮时调整按钮之间的间距，在创建之前先赋值，然后再创建按钮顺序不要搞错了默认为0，一般情况下建议不设置
 示例：
 self.itemsSpace = 10;
 [self createNavigationItemsRightBarButtonWithNormalImg:@[@"img1",@"img2"] highlightedImg:nil];
 */
@property (nonatomic, assign) CGFloat  itemsSpace;
#pragma mark ======= Create RightBarButton
/**
 创建多个导航右侧文字按钮默认黑色标题颜色字号默认16，如需设置字体大小可以设置rightBarButtonItemTitleFont
 
 @param normalTitles 需要显示的标题
 */
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *>* _Nonnull)normalTitles;

/**
 创建多个导航右侧文字按钮，标题颜色自定义两种状态
 
 @param normalTitles titles
 @param normalColors normalColor
 @param highlightedColors highlightedColors
 */
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles
                                    normalColor:(NSArray<UIColor *> * _Nonnull)normalColors
                               highlightedColor:(NSArray<UIColor *>* _Nonnull)highlightedColors;


/**
 创建多个图片类型的右侧导航栏按钮
 
 @param normalImages normalImages 必传项
 @param highlightedImgs highlightedImgs 可以为nil
 */
- (void)wya_addRightNavBarButtonWithNormalImage:(NSArray<NSString *>* _Nonnull)normalImages
                                 highlightedImg:(NSArray<NSString *> *)highlightedImgs;


#pragma mark ======= createLeftButton
/**
 创建多个导航左侧文字按钮默认黑色标题颜色字号默认16，如需设置字体大小可以设置rightBarButtonItemTitleFont
 
 @param normalTitles 需要显示的标题
 */
- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *>* _Nonnull)normalTitles;

/**
 创建多个导航左侧文字按钮，标题颜色自定义两种状态
 
 @param normalTitles titles
 @param normalColors normalColor
 @param highlightedColors highlightedColors
 */
- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles
                                   normalColor:(NSArray<UIColor *> * _Nonnull)normalColors
                              highlightedColor:(NSArray<UIColor *>* _Nonnull)highlightedColors;


/**
 创建多个图片类型的左侧导航栏按钮
 
 @param normalImages normalImages 必传项
 @param highlightedImgs highlightedImgs 可以为nil
 */
- (void)wya_addLeftNavBarButtonWithNormalImage:(NSArray<NSString *>* _Nonnull)normalImages
                                highlightedImg:(NSArray<NSString *> *)highlightedImgs;


/// 自定义左侧按钮点击事件
- (void)wya_customLeftBarButtonItemPressed:(UIButton *)sender;
/// 自定义右侧按钮点击事件
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender;
- (void)wya_goBack;
@end

NS_ASSUME_NONNULL_END
