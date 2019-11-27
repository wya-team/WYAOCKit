//
//  WYALoadingHUD.h
//  AFNetworking
//
//  Created by 李雪峰 on 2019/5/30.
//

//  说明：WYALoadingHUD自身属于遮罩层，承载loading动画有一个容器

#define LoadingBlueColor [UIColor colorWithRed:28 / 255.0 green:168 / 255.0 blue:248 / 255.0 alpha:1]
#define LoadingGrayColor [UIColor colorWithRed:194 / 255.0 green:194 / 255.0 blue:194 / 255.0 alpha:1]

#import <UIKit/UIKit.h>
// 获取设备的物理高度
#define WYALoadingScreenWidth [UIScreen mainScreen].bounds.size.width
// 获取设备的物理宽度
#define WYALoadingScreenHeight [UIScreen mainScreen].bounds.size.height
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WYALoadingBackgroundStyle) {
    WYALoadingBackgroundStyleDark,  //深色背景，默认样式
    WYALoadingBackgroundStyleLight, //白色背景
    WYALoadingBackgroundStyleNone   //无背景
};

// 设置WYAloading样式，默认样式或自定义动画样式
typedef NS_ENUM(NSInteger, WYALoadingGraphAnimateStyle) {
    WYALoadingGraphAnimateStyleCircle,    //普通转圈
    WYALoadingGraphAnimateStyleIndicator, //菊花样式
    WYALoadingGraphAnimateStyleWordPath   //文字绘制动画
};

// 针对文字绘制动画，绘制方向
typedef NS_ENUM(NSInteger, WYALoadingGraphDirection) {
    WYALoadingGraphDirectionEndToEnd,    //首尾相连
    WYALoadingGraphDirectionBegainHeader //每次从头开始
};

// 动画效果位于视图位置，默认居中，如果没有设置frame则为占满填充方式
typedef NS_ENUM(NSInteger, WYALoadingPosition) {
    WYALoadingPositionCenter, // 按照设置frame大小设置并居中
    WYALoadingPositionTop,    // 居上，水平居中
    WYALoadingPositionBottom,
    WYALoadingPositionLeft,
    WYALoadingPositionRight,
    WYALoadingPositionTopLeft,
    WYALoadingPositionTopRight,
    WYALoadingPositionBottomLeft,
    WYALoadingPositionBottomRight
};

@interface WYALoadingHUD : UIView
@property (nonatomic, assign) WYALoadingBackgroundStyle themeStyle;      // 背景主体样式
@property (nonatomic, assign) WYALoadingGraphAnimateStyle animateStyle;  // 转圈or绘制文字or菊花
@property (nonatomic, assign) WYALoadingGraphDirection animateDirection; // 绘制动画方向，针对文字绘制动画
@property (nonatomic, assign) WYALoadingPosition position;               // 动画图案布局位置

@property (nonatomic, assign) CGSize containerSize;        // loading容器尺寸，默认（100，100）
@property (nonatomic, assign) float containerCornerRadius; // loading容器圆角，默认 5

@property (nonatomic, assign) float indicatorWidth;    // 菊花宽度
@property (nonatomic, assign) float circleWidth;       // 转圈宽度
@property (nonatomic, strong) UIColor * circleBgColor; // 转圈背景颜色
@property (nonatomic, strong) UIColor * circleColor;   // 转圈颜色
@property (nonatomic, assign) float customDuration;    // 自定义文字描边动画持续时长
@property (nonatomic, assign) float circleDuration;    // 转一圈时长
@property (nonatomic, assign) CGFloat bgAlpha;         // 背景不透明度，默认0.2

+ (WYALoadingHUD *)shareInstance;

// 默认加在keyWindow上,注意show和hide成对使用
+ (void)show;

+ (void)showInView:(UIView *)view;

// 从父视图移除
+ (void)hide;

// 显示微一案专属loading
+ (void)showWYALoading;

// 显示微一案专属loading
+ (void)showWYALoadingInView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
