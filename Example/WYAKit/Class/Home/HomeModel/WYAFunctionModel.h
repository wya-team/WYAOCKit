//
//  WYAFunctionModel.h
//  WYAKit_Example
//
//  Created by 李世航 on 2019/1/3.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class WYAFunctionModel;
typedef WYAFunctionModel * (^block)(NSString *);

@interface WYAFunctionModel : NSObject
@property (nonatomic, copy) block nameBlock;
@property (nonatomic, copy) block ageBlock;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * age;
- (void)setModel:(void (^)(WYAFunctionModel * model))m;
@end

NS_ASSUME_NONNULL_END
