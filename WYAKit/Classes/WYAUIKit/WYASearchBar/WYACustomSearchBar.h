//
//  WYACustomSearchBar.h
//  AFNetworking
//
//  Created by 李俊恒 on 2018/12/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYACustomSearchBar : UISearchBar 

/**
 背景色默认白色
 */
@property (nonatomic, strong) UIColor * customBgColor;

/**
 切圆角的系数，默认为8
 */
@property (nonatomic, assign) CGFloat  roundRate;

/**
 默认灰色
 */
@property (nonatomic, strong) UIColor * placeholderColor;

/**
 默认10
 */
@property (nonatomic, assign) CGFloat  placeholderFont;

/**
 占位文字，必须赋值，用来代替系统的placeholder
 */
@property (nonatomic, copy) NSString * placeholderString;

/**
 点击搜索状态
 */
- (void)wya_searchButtonClickedState;

/**
 取消按钮点击
 */
- (void)wya_cancleButtonClickedState;

/**
 编辑状态
 */
- (void)wya_shouldBeginEditingState;

/**
 点击屏幕任意地方
 */
- (void)wya_touchesBeganState;

@end

NS_ASSUME_NONNULL_END
