//
//  WYAChooseMenuModel.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAOptionMenuSecondLevelModel : NSObject
@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign)
BOOL enableCell;                           // YES为禁用状态,优先级比select高，如果设置为YES,则selct改变不会改变cell
@property (nonatomic, assign) BOOL select; //是否被选中
@end

@interface WYAOptionMenuModel : NSObject

@property (nonatomic, assign) BOOL select; //是否被选中
@property (nonatomic, copy) NSString * title;
@property (nonatomic, strong) NSArray<WYAOptionMenuSecondLevelModel *> * secondLevelModels;
@property (nonatomic, assign) CGFloat xOffset; // x轴偏移量
@property (nonatomic, strong) UIFont * titleFont;
@property (nonatomic, strong) UIColor * titleColor;
@property (nonatomic, strong) UIColor * normalColor;
@property (nonatomic, strong) UIColor * selectColor;
@property (nonatomic, strong) UIColor * lineColor;
@end

NS_ASSUME_NONNULL_END
