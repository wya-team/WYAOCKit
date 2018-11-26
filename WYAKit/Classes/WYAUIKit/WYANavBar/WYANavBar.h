//
//  WYANavBar.h
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/11/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYANavBar : UIView
/// 导航栏标题
@property (nonatomic, copy, nullable) NSString * title;
/// 自定义titleView
@property (nonatomic, strong, nullable) UIView * titleView;
/// 导航栏返回按钮
@property (nonatomic, strong, nullable) UIButton * backBarButton;
/// 左侧按钮容器
@property (nonatomic, strong, nullable) NSArray <UIButton *> * leftBarButtonItems;
/// 右侧按钮容器
@property (nonatomic, strong, nullable) NSArray <UIButton *> * rightBarButtonItems;

/// 左右视图多个按钮的间距，默认间距10
@property (nonatomic, assign) CGFloat  itemsSpace;
/// 是否显示底部线条,默认显示为YES
@property (nonatomic, assign) BOOL  isShowLine;
/// 背景图片
@property (nonatomic, strong) UIImage * backgroundImage;
@end
NS_ASSUME_NONNULL_END
