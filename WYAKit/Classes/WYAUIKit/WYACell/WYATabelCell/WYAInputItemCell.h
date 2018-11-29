//
//  WYAInputItemCell.h
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/11/29.
//

#import <UIKit/UIKit.h>
@class WYAInputItemCell;
NS_ASSUME_NONNULL_BEGIN
@protocol WYAInputItemCellDelegate <NSObject>

@optional

/**
 编辑完毕

 @param cell cell
 @param content 输入框的内容
 */
- (void)wya_inputItemCell:(WYAInputItemCell *)cell textFiledEditorEnd:(NSString *)content;

/**
 编辑中

 @param cell cell
 @param content 输入框的内容
 */
- (void)wya_inputItemCell:(WYAInputItemCell *)cell textFiledtextChangeing:(NSString *)content;
/**
 右侧按钮点击事件

 @param cell cell
 @param sender sender
 */
- (void)wya_inputItemCell:(WYAInputItemCell *)cell rightButtonPressed:(UIButton *)sender;

/**
 右侧箭头按钮点击事件

 @param cell cell
 @param sender arrowButton
 */
- (void)wya_inputItemCell:(WYAInputItemCell *)cell arrowImagePressed:(UIButton *)sender;
@end
@interface WYAInputItemCell : UITableViewCell
@property (nonatomic, weak) id<WYAInputItemCellDelegate> delegate;
/// 占位文字
@property (nonatomic, copy) NSString * placeholderString;
/// 是否可以输入
@property (nonatomic, assign) BOOL inputTextFiledEnable;
/// textView左右视图的文字@[左视图，右视图];右视图文字可以不传
@property (nonatomic, strong) NSArray * textChildStringArray;

/// 右侧文字颜色 默认灰色
@property (nonatomic, strong) UIColor * rightTitleColor;
/// 需要显示图片如果需要展示要第一个设置该属性
@property (nonatomic, copy) NSString * arrowImageNamed;

@end

NS_ASSUME_NONNULL_END
