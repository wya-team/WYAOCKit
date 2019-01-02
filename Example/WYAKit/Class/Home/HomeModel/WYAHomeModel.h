//
//  WYAHomeModel.h
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/17.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAHomeItemModel : NSObject
@property (nonatomic, copy) NSString * rowName;
@property (nonatomic, copy) NSString * className;
@end

@interface WYAHomeModel : NSObject
@property (nonatomic, assign) BOOL select;
@property (nonatomic, copy) NSString * sectionName;
@property (nonatomic, strong) NSArray<WYAHomeItemModel *> * rows;

+ (NSArray *)allModel;

@end

NS_ASSUME_NONNULL_END
