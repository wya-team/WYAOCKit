//
//  WYAInputItemCell.h
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/11/29.
//

#import <UIKit/UIKit.h>
@class WYAInputItemCell;
NS_ASSUME_NONNULL_BEGIN
@protocol WYAInputItemCell <NSObject>

@optional

/**
 编辑完毕

 @param cell cell
 @param content 输入框的内容
 */
- (void)wya_inputItemCell:(WYAInputItemCell *)cell textFiledEditorEnd:(NSString *)content;

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
/// 占位文字
@property (nonatomic, copy) NSString * placeholderString;
/// 是否可以输入
@property (nonatomic, assign) BOOL inputTextFiledEnable;
/// 左侧文字
@property (nonatomic, copy) NSString * leftTitleString;
/// 右侧文字
@property (nonatomic, copy) NSString * rightTitleString;
/// 需要显示图片
@property (nonatomic, copy) NSString * arrowImageNamed;

@end

NS_ASSUME_NONNULL_END
