//
//  WYAKitConfig.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/15.
//

#import "WYAKitInstance.h"

@implementation WYAKitInstance

+ (id)allocWithZone:(struct _NSZone *)zone{
    static WYAKitInstance * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

+ (instancetype)sharedInstance{
    return [[self alloc] init];
}
@end
