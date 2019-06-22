//
//  UIDevice+Category.m
//  WYAKit
//
//  Created by 李世航 on 2019/6/22.
//

#import "UIDevice+Category.h"
#include <sys/mount.h>
#include <sys/param.h>

@implementation UIDevice (Category)
+ (double)wya_phoneFreeMemory {
    //可用大小
    struct statfs buf;
    long long freespace = -1;
    if (statfs("/var", &buf) >= 0) { freespace = (long long)(buf.f_bsize * buf.f_bfree); }
    return (double)freespace / 1024 / 1024 / 1024;
}

+ (unsigned long long)wya_fileSizeWithPath:(NSString *)path {
    // 总大小
    unsigned long long size = 0;
    //    NSString *sizeText = nil;
    NSFileManager * manager = [NSFileManager defaultManager];

    BOOL isDir = NO;
    BOOL exist = [manager fileExistsAtPath:path isDirectory:&isDir];

    // 判断路径是否存在
    if (!exist) return size;
    if (isDir) { // 是文件夹
        NSDirectoryEnumerator * enumerator = [manager enumeratorAtPath:path];
        for (NSString * subPath in enumerator) {
            NSString * fullPath = [path stringByAppendingPathComponent:subPath];
            size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
    } else { // 是文件
        size += [manager attributesOfItemAtPath:path error:nil].fileSize;
    }
    return size;
}
@end
