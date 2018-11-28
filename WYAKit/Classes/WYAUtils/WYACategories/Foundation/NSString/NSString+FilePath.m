//
//  NSString+FilePath.m
//  WYAiOSEnv
//
//  Created by 李世航 on 2018/7/9.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSString+FilePath.h"

@implementation NSString (FilePath)

+ (NSString *)wya_homePath
{
    return NSHomeDirectory ();
}

+ (NSString *)wya_appPath
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains (NSApplicationDirectory, NSUserDomainMask, YES);
    return [paths wya_safeObjectAtIndex:0];
}

+ (NSString *)wya_docPath
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths wya_safeObjectAtIndex:0];
}

+ (NSString *)wya_libPrefPath
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains (NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths wya_safeObjectAtIndex:0] stringByAppendingFormat:@"/Preference"];
}

+ (NSString *)wya_libCachePath
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains (NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths wya_safeObjectAtIndex:0] stringByAppendingFormat:@"/Caches"];
}

+ (NSString *)wya_tmpPath
{
    return [NSHomeDirectory () stringByAppendingFormat:@"/tmp"];
}

@end
