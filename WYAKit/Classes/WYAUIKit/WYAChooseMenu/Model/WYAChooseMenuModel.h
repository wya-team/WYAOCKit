//
//  WYAChooseMenuModel.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAChooseMenuSecondLevelModel : NSObject
@property (nonatomic, copy)   NSString * title;
@property (nonatomic, assign) BOOL  enableCell;//YES为禁用状态,优先级比select高，如果设置为YES,则selct改变不会改变cell
@property (nonatomic, assign) BOOL  select;//是否被选中
@end

@interface WYAChooseMenuModel : NSObject

@property (nonatomic, assign) BOOL  select;//是否被选中
@property (nonatomic, copy)   NSString * title;
@property (nonatomic, strong) NSArray <WYAChooseMenuSecondLevelModel *> * secondLevelModels;
@end

NS_ASSUME_NONNULL_END
