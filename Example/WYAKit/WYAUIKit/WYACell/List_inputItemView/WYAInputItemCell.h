//
//  WYAImputItemCell.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/29.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAInputItemCell : UITableViewCell
@property (nonatomic, strong) UITextField * textFiled;
@property (nonatomic, strong) UIButton * leftButton;
@property (nonatomic, strong) UIButton * rightButton;
@property (nonatomic, strong) NSArray * dataArray;
/// 默认为NO不可编辑状态
@property (nonatomic, assign) BOOL  isEditor;
@end

NS_ASSUME_NONNULL_END
