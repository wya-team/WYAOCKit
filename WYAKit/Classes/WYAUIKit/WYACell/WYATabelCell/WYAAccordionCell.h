//
//  WYAAccordionCell.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/27.
//

#import "WYATableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WYAAccordionCell : WYATableViewCell

@property (nonatomic, strong) UITextField * titleTextField;
@property (nonatomic, strong) UIButton * downButton;

@property (nonatomic, strong, nullable) NSMutableArray<UIView *> * views;//要添加的子视图
@property (nonatomic, strong) NSMutableArray * viewHeights;//子视图高度

@property (nonatomic, copy)   void(^buttonClick)(UIButton * button);

+(CGFloat)wya_cellHeight:(NSMutableArray *)viewHeightArray;

@end

NS_ASSUME_NONNULL_END
