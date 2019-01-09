//
//  WYAFunctionModel.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/1/3.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYAFunctionModel.h"

@implementation WYAFunctionModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        WeakSelf(weakSelf);
        self.nameBlock = ^WYAFunctionModel *(NSString * _Nonnull name)
        {
            weakSelf.name = name;
            return weakSelf;
        };
        self.ageBlock = ^WYAFunctionModel *(NSString * _Nonnull age)
        {
            weakSelf.age = age;
            return weakSelf;
        };
    }
    return self;
}

- (void)setModel:(void (^)(WYAFunctionModel *))m
{
    m(self);
}

@end
