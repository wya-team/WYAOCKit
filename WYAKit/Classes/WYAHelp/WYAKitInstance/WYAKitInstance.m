//
//  WYAKitConfig.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/15.
//

#import "WYAKitInstance.h"
#import <WYAKit/WYABannerView.h>
#import <objc/message.h>
#import <objc/runtime.h>

@implementation WYAKitInstance

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static WYAKitInstance * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance              = [super allocWithZone:zone];
        instance.bannerConfig = [[WYABannerConfig alloc] init];
    });
    return instance;
}

+ (instancetype)sharedInstance
{
    return [[self alloc] init];
}
@end

@implementation WYABannerConfig

- (void)setAutoScroll:(BOOL)autoScroll
{
    _autoScroll    = autoScroll;
    NSString * str = [NSString stringWithFormat:@"%d", autoScroll];
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:BANNERAUTOSCROLL];
}

@end
