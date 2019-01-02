//
//  WYAInputOneCell.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAInputItemModel.h"
#import <UIKit/UIKit.h>
@class WYAInputOneCell;
NS_ASSUME_NONNULL_BEGIN
@protocol WYAInputOneCellDelegate <NSObject>

- (void)wya_inputOneCell:(WYAInputOneCell *)cell textFiledChangeingValue:(NSString *)text;
- (void)wya_inputOneCell:(WYAInputOneCell *)cell textFiledDidEndEditing:(NSString *)text;
- (void)wya_inputOneCell:(WYAInputOneCell *)cell textFiledShouldReturn:(NSString *)text;

- (void)wya_inputOneCell:(WYAInputOneCell *)cell rightButtonDidSelected:(UIButton *)sender;

@end

@interface WYAInputOneCell : UITableViewCell
@property (nonatomic, weak) id<WYAInputOneCellDelegate> delegate;
@property (nonatomic, strong) UITextField * textFiled;
@property (nonatomic, strong) UIButton * leftButton;
@property (nonatomic, strong) UIButton * rightButton;
@property (nonatomic, strong) WYAInputItemModel * model;
/// 默认为NO不可编辑状态
@property (nonatomic, assign) BOOL isEditor;
@end

NS_ASSUME_NONNULL_END
