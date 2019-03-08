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

+ (id)allocWithZone:(struct _NSZone *)zone {
    static WYAKitInstance * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance              = [super allocWithZone:zone];
        instance.bannerConfig = [[WYABannerConfig alloc] init];
    });
    return instance;
}

+ (instancetype)sharedInstance {
    return [[self alloc] init];
}

-(WYAUploadModel *)uploadModel{
    if (!_uploadModel) {
        _uploadModel = [[WYAUploadModel alloc]init];
        _uploadModel.uploadUrl = @"https://oa2.ruishan666.com/_cms/api/image/get-oss-info.json";
        _uploadModel.uploadBefore = ^NSDictionary *{
            return nil;
        };
        _uploadModel.uploadAfter = nil;
    }

    return _uploadModel;
}

@end

@implementation WYABannerConfig

- (void)setAutoScroll:(BOOL)autoScroll {
    _autoScroll    = autoScroll;
    NSString * str = [NSString stringWithFormat:@"%d", autoScroll];
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:BANNERAUTOSCROLL];
}

@end
