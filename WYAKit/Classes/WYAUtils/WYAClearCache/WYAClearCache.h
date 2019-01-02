//
//  WYAClearCache.h
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/12/6.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, WYAFileSizeUnit) {
    WYAFileSizeUnitMB = 0,
    WYAFileSizeUnitKB = 1,
    WYAFileSizeUnitGB = 2
};
NS_ASSUME_NONNULL_BEGIN

@interface WYAClearCache : NSObject

/**
 获取系统缓存caches文件大小

 @param folderSize block形式传出大小
 @param type 文件大小单位 KB\MB\GB
 */
+ (void)wya_defaultCachesFolderSizeBlock:(void (^)(float folderSize))folderSize UnitType:(WYAFileSizeUnit)type;

/**
 清理caches路径缓存

 @param clearStatus YES or NO
 */
+ (void)wya_clearCachesClearStatusBlock:(void (^)(BOOL status))clearStatus;

/**
 获取缓存文件大小
 
 @param folderSize block形式传出大小
 @param type 文件大小单位 KB\MB\GB
 */
+ (void)wya_fileSizeAtPath:(NSString *)filePath FolderSizeBlock:(void (^)(float folderSize))folderSize UnitType:(WYAFileSizeUnit)type;

/**
 清理自定义缓存内容

 @param filePath 路径
 @param clearStatus YES or NO
 */
+ (void)wya_clearFileAtPath:(NSString *)filePath ClearStatusBlock:(void (^)(BOOL status))clearStatus;

@end

NS_ASSUME_NONNULL_END
