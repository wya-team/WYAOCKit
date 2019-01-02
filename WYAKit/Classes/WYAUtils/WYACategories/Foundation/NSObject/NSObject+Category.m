//
//  NSObject+Category.m
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/4.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSObject+Category.h"

@interface NSObject ()

/** 定时器 */
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation NSObject (Category)
static char associatedObjectNamesKey;

- (void)setTimer:(dispatch_source_t)timer
{
    objc_setAssociatedObject(self, @selector(timer), timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (dispatch_source_t)timer
{
    return objc_getAssociatedObject(self, @selector(timer));
}

- (void)wya_countDownTime:(NSUInteger)time countDownBlock:(TYNCountDownBlock)countDownBlock outTimeBlock:(TYNFinishBlock)finishBlock
{
    __block NSUInteger second = time;

    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));

    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1.0f * NSEC_PER_SEC, 1.0f * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^{

        dispatch_sync(dispatch_get_main_queue(), ^{
            if (countDownBlock != nil) {
                countDownBlock(second);
            }
        });

        if ((second--) == 0) {
            dispatch_cancel(self.timer);
            self.timer = nil;
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (finishBlock != nil) {
                    finishBlock();
                }
            });
        }
    });

    dispatch_resume(self.timer);
}
- (void)setAssociatedObjectNames:(NSMutableArray *)associatedObjectNames
{
    objc_setAssociatedObject(self, &associatedObjectNamesKey, associatedObjectNames, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)associatedObjectNames
{
    NSMutableArray * array = objc_getAssociatedObject(self, &associatedObjectNamesKey);
    if (!array) {
        array = [NSMutableArray array];
        [self setAssociatedObjectNames:array];
    }
    return array;
}

- (void)objc_setAssociatedObject:(NSString *)propertyName value:(id)value policy:(objc_AssociationPolicy)policy
{
    objc_setAssociatedObject(self, (__bridge objc_objectptr_t)propertyName, value, policy);
    [self.associatedObjectNames addObject:propertyName];
}

- (id)objc_getAssociatedObject:(NSString *)propertyName
{
    return objc_getAssociatedObject(self, (__bridge objc_objectptr_t)propertyName);
}

- (void)objc_removeAssociatedObjects
{
    [self.associatedObjectNames removeAllObjects];
    objc_removeAssociatedObjects(self);
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"setValue %@ forUndefinedKey %@", value, key);
}

- (void)setNilValueForKey:(NSString *)key
{
    NSLog(@"setNilValue forKey %@", key);
}

/**
 * 获取对象的所有属性,包括父类的。可以一直遍历到JSONModel层。如果不是继承JSONMOdel,最上层为NSObject
 *
 *    @return Properties数组
 */
- (NSArray *)getProperties
{
    NSMutableArray * props = [NSMutableArray array];
    unsigned int outCount, i;
    Class targetClass = [self class];
    while (targetClass != [NSObject class]) {
        objc_property_t * properties = class_copyPropertyList(targetClass, &outCount);
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            const char * char_f      = property_getName(property);
            NSString * propertyName  = [NSString stringWithUTF8String:char_f];
            [props addObject:propertyName];
        }
        free(properties);
        targetClass = [targetClass superclass];
    }
    return props;
}

/* 获取对象的所有方法 */
- (void)printMothList
{
    unsigned int mothCout_f = 0;
    Method * mothList_f     = class_copyMethodList([self class], &mothCout_f);
    for (int i = 0; i < mothCout_f; i++) {
        Method temp_f = mothList_f[i];
        //        IMP imp_f = method_getImplementation(temp_f);
        SEL name_f            = method_getName(temp_f);
        const char * name_s   = sel_getName(name_f);
        int arguments         = method_getNumberOfArguments(temp_f);
        const char * encoding = method_getTypeEncoding(temp_f);

        NSLog(@"方法名：%@,参数个数：%d,编码方式：%@", [NSString stringWithUTF8String:name_s], arguments, [NSString stringWithUTF8String:encoding]);
    }

    free(mothList_f);
}

+ (NSString *)wya_version
{
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * app_Version        = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

+ (NSInteger)wya_build
{
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * app_build          = [infoDictionary objectForKey:@"CFBundleVersion"];
    return [app_build integerValue];
}

+ (NSString *)wya_identifier
{
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * bundleIdentifier   = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    return bundleIdentifier;
}

+ (NSString *)wya_currentLanguage
{
    return [[NSLocale preferredLanguages] firstObject];
}

+ (NSString *)wya_deviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

    if ([deviceModel isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (GSM)";
    if ([deviceModel isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (GSM)";
    if ([deviceModel isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([deviceModel isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([deviceModel isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceModel isEqualToString:@"iPhone9,1"]) return @"国行、日版、港行iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,2"]) return @"港行、国行iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone9,3"]) return @"美版、台版iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,4"]) return @"美版、台版iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,1"]) return @"iPhone_8";
    if ([deviceModel isEqualToString:@"iPhone10,4"]) return @"iPhone_8";
    if ([deviceModel isEqualToString:@"iPhone10,2"]) return @"iPhone_8_Plus";
    if ([deviceModel isEqualToString:@"iPhone10,5"]) return @"iPhone_8_Plus";
    if ([deviceModel isEqualToString:@"iPhone10,3"]) return @"iPhone_X";
    if ([deviceModel isEqualToString:@"iPhone10,6"]) return @"iPhone_X";
    if ([deviceModel isEqualToString:@"iPhone11,2"]) return @"iPhone_X";
    if ([deviceModel isEqualToString:@"iPhone11,4"]) return @"iPhone_Xs_Max";
    if ([deviceModel isEqualToString:@"iPhone11,6"]) return @"iPhone_Xs_Max";
    if ([deviceModel isEqualToString:@"iPhone11,8"]) return @"iPhone_XR";

    if ([deviceModel isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    if ([deviceModel isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    if ([deviceModel isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    if ([deviceModel isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    if ([deviceModel isEqualToString:@"iPod5,1"]) return @"iPod Touch (5 Gen)";
    if ([deviceModel isEqualToString:@"iPad1,1"]) return @"iPad";
    if ([deviceModel isEqualToString:@"iPad1,2"]) return @"iPad 3G";
    if ([deviceModel isEqualToString:@"iPad2,1"]) return @"iPad 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,3"]) return @"iPad 2 (CDMA)";
    if ([deviceModel isEqualToString:@"iPad2,4"]) return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,5"]) return @"iPad Mini (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,6"]) return @"iPad Mini";
    if ([deviceModel isEqualToString:@"iPad2,7"]) return @"iPad Mini (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,1"]) return @"iPad 3 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,2"]) return @"iPad 3 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if ([deviceModel isEqualToString:@"iPad3,4"]) return @"iPad 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,5"]) return @"iPad 4";
    if ([deviceModel isEqualToString:@"iPad3,6"]) return @"iPad 4 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad4,1"]) return @"iPad Air (WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,2"]) return @"iPad Air (Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,4"]) return @"iPad Mini 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,5"]) return @"iPad Mini 2 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,6"]) return @"iPad Mini 2";
    if ([deviceModel isEqualToString:@"iPad4,7"]) return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,8"]) return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,9"]) return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad5,1"]) return @"iPad Mini 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad5,2"]) return @"iPad Mini 4 (LTE)";
    if ([deviceModel isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad6,3"]) return @"iPad Pro 9.7";
    if ([deviceModel isEqualToString:@"iPad6,4"]) return @"iPad Pro 9.7";
    if ([deviceModel isEqualToString:@"iPad6,7"]) return @"iPad Pro 12.9";
    if ([deviceModel isEqualToString:@"iPad6,8"]) return @"iPad Pro 12.9";
    if ([deviceModel isEqualToString:@"iPad7,1"]) return @"iPad Pro 12.9";
    if ([deviceModel isEqualToString:@"iPad7,2"]) return @"iPad Pro 12.9";
    if ([deviceModel isEqualToString:@"iPad7,3"]) return @"iPad Pro 10.5";
    if ([deviceModel isEqualToString:@"iPad7,4"]) return @"iPad Pro 10.5";

    if ([deviceModel isEqualToString:@"AppleTV2,1"]) return @"Apple TV 2";
    if ([deviceModel isEqualToString:@"AppleTV3,1"]) return @"Apple TV 3";
    if ([deviceModel isEqualToString:@"AppleTV3,2"]) return @"Apple TV 3";
    if ([deviceModel isEqualToString:@"AppleTV5,3"]) return @"Apple TV 4";

    if ([deviceModel isEqualToString:@"i386"]) return @"Simulator";
    if ([deviceModel isEqualToString:@"x86_64"]) return @"Simulator";

    return deviceModel;
}

@end
