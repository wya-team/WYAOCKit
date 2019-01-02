//
//  WYAImputItemCell.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/29.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAInputItemModel.h"
#import <UIKit/UIKit.h>
@class WYAInputItemTwoCell;
NS_ASSUME_NONNULL_BEGIN
@protocol WYAInputItemTwoCellDelegate <NSObject>
@optional
- (void)wya_inputItemTwoCell:(WYAInputItemTwoCell *)cell textFiledChangeingValue:(NSString *)text;
- (void)wya_inputItemTwoCell:(WYAInputItemTwoCell *)cell textFiledDidEndEditing:(NSString *)text;
- (void)wya_inputItemTwoCell:(WYAInputItemTwoCell *)cell textFiledShouldReturn:(NSString *)text;

- (void)wya_inputItemTwoCell:(WYAInputItemTwoCell *)cell rightButtonDidSelected:(UIButton *)sender;
- (void)wya_inputItemTwoCell:(WYAInputItemTwoCell *)cell imageButtonDidSelected:(UIButton *)sender;
@end

@interface WYAInputItemTwoCell : UITableViewCell
@property (nonatomic, weak) id<WYAInputItemTwoCellDelegate> delegate;
@property (nonatomic, strong) UITextField * textFiled;
@property (nonatomic, strong) UIButton * leftButton;
@property (nonatomic, strong) UIButton * rightButton;
@property (nonatomic, strong) WYAInputItemModel * model;
/// 默认为NO不可编辑状态
@property (nonatomic, assign) BOOL isEditor;
@end

NS_ASSUME_NONNULL_END
