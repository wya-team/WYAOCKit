
#import <UIKit/UIKit.h>
#import "WYAAlertAction.h"
#import "WYAPopupHeader.h"

/** 灰色背景透明度 */
static const CGFloat as_backgroundAlpha = 0.4;

@class WYAPopupView;

@interface WYAAlertController : UIViewController

/** alert 视图 */
@property (nonnull, nonatomic, strong)UIView *alertView;

/**
 外部可以设置背景颜色，透明程度，和是否可以相应事件（默认可以响应，如果不需要响应请关闭button的enabled属性）
 */
@property (nonnull, nonatomic, strong)UIButton *backgroundButton;

/** present 转场风格 */
@property (nonatomic, assign)WYAPopupPresentStyle presentStyle;

/** dismiss 转场风格 */
@property (nonatomic, assign)WYAPopupDismissStyle dismissStyle;

@property (nonatomic, assign) WYAPopStyle    popStyle; //自定义弹出视图


/**
 添加 action

 @param action action
 */
- (void)wya_AddAction:(WYAAlertAction * _Nonnull)action;

/**
 *    直接添加一个数组的 action
 *
 *    @param actions 放有 action 的数组
 */
- (void)wya_AddActions:(NSArray<WYAAlertAction *> * _Nonnull)actions;


/**
 自定义转场初始化方法

 @param title 标题
 @param message 消息
 @param presentStyle 转场风格
 @param dismissStyle 转场风格
 @return alert控制器
 */
+ (_Nonnull instancetype)wya_AlertWithTitle:(NSString * _Nullable)title
                                    Message:(NSString * _Nullable)message
                               PresentStyle:(WYAPopupPresentStyle)presentStyle
                               DismissStyle:(WYAPopupDismissStyle)dismissStyle
                                   PopStyle:(WYAPopStyle)popStyle;

/**
 默认转场初始化方法

 @param title 标题
 @param message 消息
 @return alert控制器
 */
+ (_Nonnull instancetype)wya_AlertWithTitle:(NSString * _Nullable)title
                                    Message:(NSString * _Nullable)message
                                   PopStyle:(WYAPopStyle)popStyle;

/**
 alertSheetView初始化方法

 @param title 标题
 @param message 消息
 @return alert控制器
 */
+ (_Nonnull instancetype)wya_AlertSheetWithTitle:(NSString * _Nullable)title
                                         Message:(NSString * _Nullable)message
                                        PopStyle:(WYAPopStyle)popStyle;

/**
 自定义弹出视图（视图需使用bounds属性确定大小，事件，按钮需自行添加）

 @param view 自定义视图
 @return alert控制器
 */
+ (_Nonnull instancetype)wya_AlertWithCustomView:(UIView *)view
                                        PopStyle:(WYAPopStyle)popStyle;
@end
