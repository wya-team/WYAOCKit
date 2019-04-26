//
//  WYANoticeBar.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, WYANoticeBarScrollDirection) {
    WYANoticeBarScrollDirectionLeft,   // 向左移动
    WYANoticeBarScrollDirectionTop,    // 向上移动
    WYANoticeBarScrollDirectionBottom, // 向下移动
};

@interface WYANoticeBar : UIView

/// 是否显示左侧按钮（显示的是图片或者文字）
@property (nonatomic, assign) BOOL showNoticeButton;
/// 是否显示右侧按钮（显示的是图片或者文字）
@property (nonatomic, assign) BOOL showRightButton;
/// 显示的文字(WYANoticeBarScrollDirectionLeft模式下设置使用),最后设置
@property (nonatomic, copy) NSString * showText;
/// 显示的文字颜色
@property (nonatomic, strong) UIColor * showTextColor;
/// 显示的文字大小
@property (nonatomic, assign) CGFloat showTextFont;
/// 左侧要显示的图片
@property (nonatomic, strong) UIImage * noticeButtonImage;
/// 右侧要显示的图片
@property (nonatomic, strong) UIImage * rightButtonImage;
/// 背景颜色
@property (nonatomic, strong) UIColor * noticeBackgroundColor;
/// 类型为WYANoticeBarScrollDirectionTop、WYANoticeBarScrollDirectionBottom显示的文字需要使用数组传入，最后设置
@property (nonatomic, strong) NSArray * textArray;
/// 左侧按钮点击事件
@property (nonatomic, copy) void (^leftButtonHandle)(void);
/// 右侧按钮点击事件
@property (nonatomic, copy) void (^rightButtonHandle)(void);

/**
 初始化

 @param frame frame
 @param scrollDirection 移动方向
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame
              scrollDirection:(WYANoticeBarScrollDirection)scrollDirection;

/**
 开始动画
 */
- (void)wya_start;

/**
 结束动画
 */
- (void)wya_stop;
@end

NS_ASSUME_NONNULL_END
