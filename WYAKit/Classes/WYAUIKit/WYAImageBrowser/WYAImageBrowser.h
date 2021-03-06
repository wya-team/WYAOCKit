//
//  WYAImageBrowser.h
//
//
//  Created by lishihang.

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

typedef NS_ENUM(NSUInteger, WYAImageBrowserStyle) {
    WYAImageBrowserStylePageControl = 1, // 底部一个PageControl
    WYAImageBrowserStyleSimple      = 2 // 没有长按图片弹出的功能组件,顶部一个索引UILabel,底部一个保存图片按钮
};

/**
 *  pageControl的位置
 */
typedef NS_ENUM(NSUInteger, WYAImageBrowserPageControlAliment) {
    WYAImageBrowserPageControlAlimentRight  = 1,
    WYAImageBrowserPageControlAlimentCenter = 2,
    WYAImageBrowserPageControlAlimentLeft   = 3
};

/**
 *  pageControl的样式
 */
typedef NS_ENUM(NSUInteger, WYAImageBrowserPageControlStyle) {
    WYAImageBrowserPageControlStyleClassic = 1,
    WYAImageBrowserPageControlStyleNone    = 2

};

@class WYAImageBrowser, WYAAlertButton;

@protocol WYAImageBrowserDelegate <NSObject>
/**
 *  点击底部actionSheet回调,对于图片添加了长按手势的底部功能组件
 *
 *  @param browser 图片浏览器
 *  @param actionSheetindex   点击的actionSheet索引
 *  @param currentImageIndex    当前展示的图片索引
 */
- (void)photoBrowser:(WYAPhotoBrowser *)browser clickActionSheetIndex:(NSInteger)actionSheetindex currentImageIndex:(NSInteger)currentImageIndex;
@optional

@end

@protocol WYAImageBrowserDatasource <NSObject>

@optional

/**
 返回这个位置的占位图片 , 也可以是原图(如果不实现此方法,会默认使用placeholderImage)

 @param browser 浏览器
 @param index 位置索引
 @return image
 */
- (UIImage *)photoBrowser:(WYAImageBrowser *)browser placeholderImageForIndex:(NSInteger)index;

/**
 返回指定位置的高清图片URL

 @param browser 浏览器
 @param index 位置索引
 @return 返回高清大图索引
 */
- (NSURL *)photoBrowser:(WYAImageBrowser *)browser highQualityImageURLForIndex:(NSInteger)index;

/**
 返回指定位置的ALAsset对象,从其中获取图片

 @param browser 浏览器
 @param index 位置索引
 @return 返回高清大图索引
 */
- (ALAsset *)photoBrowser:(WYAImageBrowser *)browser assetForIndex:(NSInteger)index;

/**
 返回指定位置图片的UIImageView,用于做图片浏览器弹出放大和消失回缩动画等
 如果没有实现这个方法,没有回缩动画,如果传过来的view不正确,可能会影响回缩动画

 @param browser 浏览器
 @param index 位置索引
 @return 展示图片的UIImageView
 */
- (UIImageView *)photoBrowser:(WYAImageBrowser *)browser sourceImageViewForIndex:(NSInteger)index;

@end

typedef UIImage * (^PlaceHoldImageBlock)(WYAImageBrowser * browser, NSInteger index);
// 数组传递两个类型的一个数组，第一个示原图的URL，第二个是原图大小的字符串
typedef NSArray * (^HighQualityImageURLBlock)(WYAImageBrowser * browser, NSInteger index);
typedef ALAsset * (^AssetBlock)(WYAImageBrowser * browser, NSInteger index);
typedef UIImageView * (^SourceImageViewBlock)(WYAImageBrowser * browser, NSInteger index);
typedef void (^GoCameraBlock)(void);
@interface WYAImageBrowser : UIView

/// pagecontrol 样式，默认为WYAImageBrowserPageControlStyleClassic样式
@property (nonatomic, assign) WYAImageBrowserPageControlStyle pageControlStyle;
/// 分页控件位置 , 默认为WYAImageBrowserPageControlAlimentCenter
@property (nonatomic, assign) WYAImageBrowserPageControlAliment pageControlAliment;
/// 占位图片回调
@property (nonatomic, copy) PlaceHoldImageBlock placeHoldImageBlock;
/// 高清图片回调
@property (nonatomic, copy) HighQualityImageURLBlock highQualityImageURLBlock;
/// 图片资源回调
@property (nonatomic, copy) AssetBlock assetBlock;
/// 图片展示的父视图
@property (nonatomic, copy) SourceImageViewBlock sourceImageViewBlock;
@property (nonatomic, weak) id<WYAImageBrowserDatasource> datasource;
@property (nonatomic, weak) id<WYAImageBrowserDelegate> delegate;
/// 图片浏览器样式
@property (nonatomic, assign) WYAImageBrowserStyle browserStyle;
/// 占位图片,可选(默认是一张灰色的100*100像素图片),当没有实现数据源中placeholderImageForIndex方法时,默认会使用这个占位图片
@property (nonatomic, strong) UIImage * placeholderImage UI_APPEARANCE_SELECTOR;

/// 是否在只有一张图时隐藏pagecontrol，默认为YES
@property (nonatomic) BOOL hidesForSinglePage UI_APPEARANCE_SELECTOR;
/// 当前分页控件小圆标颜色
@property (nonatomic, strong) UIColor * currentPageDotColor UI_APPEARANCE_SELECTOR;
/// 其他分页控件小圆标颜色
@property (nonatomic, strong) UIColor * pageDotColor UI_APPEARANCE_SELECTOR;
/// 当前分页控件小圆标图片
@property (nonatomic, strong) UIImage * currentPageDotImage UI_APPEARANCE_SELECTOR;
/// 其他分页控件小圆标图片
@property (nonatomic, strong) UIImage * pageDotImage UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIButton * goCameraButton;
@property (nonatomic, copy) GoCameraBlock goCameraBlock;
/**
 快速创建并进入图片浏览器 , 同时传入数据源对象

 @param currentImageIndex 开始展示的图片索引
 @param imageCount 图片数量
 @param datasource 数据源
 @param placeHoldimageBlock 占位图回调
 @param highQualityImageBlock 高清图回调
 @param assetBlock 资源图回调
 @param sourceImageViewBlock 承载图回调
 @return self
 */
+ (instancetype)showImageBrowserWithCurrentImageIndex:(NSInteger)currentImageIndex
                                           imageCount:(NSUInteger)imageCount
                                                style:(WYAImageBrowserStyle)style
                                           datasource:(id<WYAImageBrowserDatasource>)datasource
                                  placeHoldImageBlock:(PlaceHoldImageBlock)placeHoldimageBlock
                             HighQualityImageURLBlock:(HighQualityImageURLBlock)highQualityImageBlock
                                           AssetBlock:(AssetBlock)assetBlock
                                 SourceImageViewBlock:(SourceImageViewBlock)sourceImageViewBlock;

/**
 一行代码展示 (在某些使用场景,不需要做很复杂的操作,例如不需要长按弹出actionSheet,从而不需要实现数据源方法和代理方法,那么可以选择这个方法,直接传数据源数组进来,框架内部做处理)

 @param images 图片数据源数组(数组内部可以是UIImage/NSURL网络图片地址/ALAsset,但只能是其中一种)
 @param currentImageIndex 展示第几张,从0开始
 @return self
 */
+ (instancetype)showImageBrowserWithImages:(NSArray *)images currentImageIndex:(NSInteger)currentImageIndex;

- (void)addAlertSheetButton:(WYAAlertButton *)button;

/**
 *  保存当前展示的图片
 */
- (void)saveCurrentShowImage;

/**
 *  进入图片浏览器
 */
- (void)show;

/**
 *  退出
 */
- (void)dismiss;

@end
