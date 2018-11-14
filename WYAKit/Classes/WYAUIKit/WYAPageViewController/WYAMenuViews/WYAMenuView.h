//
//  WYAMenuView.h
//  FMDB
//
//  Created by 李俊恒 on 2018/11/14.
//

#import <UIKit/UIKit.h>
#import "WYAMenuItem.h"
#import "WYAProgressView.h"

#define WYAUNDEFINED_VALUE -1

@class WYAMenuView;
// 标题栏的样式
typedef NS_ENUM(NSUInteger, WYAMenuViewStyle) {
    WYAMenuViewStyleDefault,        // 默认
    WYAMenuViewStyleLine,           // 带下划线（若要选中字体大小不变，设置选中合肥选中大小一样即可）
    WYAMenuViewStyleTriangle,       // 三角形(progressHeight 为三角形的高，progressWidths为底边长)
    WYAMenuViewStyleFlood,          // 涌入效果（填充）
    WYAMenuViewStyleFloodHollow,    // 涌入效果（空心的）
    WYAMenuViewStyleSegmented,      // 涌入带边框的，类似网易新闻选项卡
};


/**
 关于布局格式的样式
 */
typedef NS_ENUM(NSUInteger,WYAMenuViewLayoutMode) {
    WYAMenuViewLayoutModeScatter,   // 默认的布局模式，item会均匀的分布在屏幕上，成分散状
    WYAMenuViewLayoutModeLeft,      // Item紧靠屏幕左侧
    WYAMenuViewLayoutModeRight,     // Item紧靠屏幕右侧
    WYAMenuViewLayoutModeCenter,    // Item紧挨且居中分布
};
NS_ASSUME_NONNULL_BEGIN

@protocol WYAMenuViewDelegate <NSObject>

@optional

/**
 选中某个Item

 @param menu 选中的menuView
 @param index 被选中的Index
 @return YES/NO
 */
- (BOOL)wya_menuView:(WYAMenuView *)menu shouldSelectedIndex:(NSInteger)index;

/**
 被选中的index

 @param menu menuView
 @param index 被选中的index
 @param currentIndex 当前的index
 */
- (void)wya_menuView:(WYAMenuView *)menu didSelectedIndex:(NSInteger)index currentINdex:(NSInteger)currentIndex;

/**
 设置menuView宽度

 @param menu menuView
 @param index 选中的index
 @return 返回视图宽度
 */
- (CGFloat)wya_menuView:(WYAMenuView *)menu widthForItemAtIndex:(NSInteger)index;

/**
 返回间隔距离

 @param menu menuView
 @param index index
 @return margin
 */
- (CGFloat)wya_menuView:(WYAMenuView *)menu itemMarginAtIndex:(NSInteger)index;

/**
 标题的文字title

 @param menu menuView
 @param state 选中未选中
 @param index index
 @return 字体大小
 */
- (CGFloat)wya_menuView:(WYAMenuView *)menu titleSizeForState:(WYAMenuItemState)state atIndex:(NSInteger)index;

/**
 返回颜色

 @param menu menuView
 @param state 选中未选中
 @param index index
 @return 返回颜色
 */
- (UIColor *)wya_menuView:(WYAMenuView *)menu titleColorForState:(WYAMenuItemState)state atIndex:(NSInteger)index;

/**
 获取当前的index下的item

 @param menu menuView
 @param menItem item
 @param index index
 */
- (void)wya_menuView:(WYAMenuView *)menu didLayoutItemFrame:(WYAMenuItem *)menItem atIndex:(NSInteger)index;
@end

@protocol WYAMenuViewDataSource <NSObject>

@required

/**
 获取标题数量

 @param menu menuView
 @return 返回一个数值来确定标题个数
 */
- (NSInteger)wya_numberOfTitlesInMenuView:(WYAMenuView *)menu;

/**
 每一个item的标题文字

 @param menu menuView
 @param index index
 @return 返回文字
 */
- (NSString *)wya_menuView:(WYAMenuView *)menu titleAtIndex:(NSInteger)index;
@optional

/**
 用于定制WYAMenuItem,可以传出initialMenuItem 进行修改定制，也可以返回自己创建的子类，需要注意的士m，此时的item的frame是不确定的，所以请不要根据此时的frame做计算。如果需要根据frame修改，请使用代理

 @param meun 当前的menuView，frame不确定哦
 @param initialMenuItem 初始化完成的menuItem
 @param index item所属的位置
 */
- (WYAMenuItem *)wya_menuView:(WYAMenuView *)meun initialMenuItem:(WYAMenuItem *)initialMenuItem atIndex:(NSInteger)index;
@end

@interface WYAMenuView : UIView
@property (nonatomic, strong) NSArray * progressWidths;
@property (nonatomic, weak) WYAProgressView * progressView;
@property (nonatomic, assign) CGFloat  progressHeight;
@property (nonatomic, assign) WYAMenuViewStyle  style;
@property (nonatomic, assign) WYAMenuViewLayoutMode  layoutMode;
@property (nonatomic, assign) CGFloat  contentMargin;
@property (nonatomic, strong) UIColor * lineColor;
@property (nonatomic, assign) CGFloat  progressViewBottomSpace;

@property (nonatomic, weak) id<WYAMenuViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
