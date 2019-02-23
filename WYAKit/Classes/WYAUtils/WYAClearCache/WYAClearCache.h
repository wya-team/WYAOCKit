//
//  WYAClearCache.h
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/12/6.
//

#import <Foundation/Foundation.h>
// 使用自动计算单位方法，废弃type类型方式
// typedef NS_ENUM(NSInteger, WYAFileSizeUnit) {
//    WYAFileSizeUnitMB = 0,
//    WYAFileSizeUnitKB = 1,
//    WYAFileSizeUnitGB = 2
//};
NS_ASSUME_NONNULL_BEGIN

@interface WYAClearCache : NSObject

/**
 获取系统缓存caches文件大小

 @param folderSize block形式传出大小
 */
+ (void)wya_defaultCachesFolderSizeBlock:(void (^)(NSString * folderSize))folderSize;

/**
 获取系统缓存caches文件大小单位B

 @param folderSize folderSize block形式传出大小 单位为B
 */
+ (void)wya_defaultCachesFolderSizeValueBlock:(void (^)(NSString * folderSize))folderSize;

/**
 清理caches路径缓存

 @param clearStatus YES or NO
 */
+ (void)wya_clearCachesClearStatusBlock:(void (^)(BOOL status))clearStatus;

/**
 获取缓存文件大小

 @param folderSize block形式传出大小
 */
+ (void)wya_cacheFileSizeAtPath:(NSString *)filePath
           FolderSizeBlock:(void (^)(NSString * folderSize))folderSize;

/**
 获取缓存文件大小单位B

 @param folderSize block形式传出大小 单位为B
 */
+ (void)wya_cacheFileSizeAtPath:(NSString *)filePath
      FolderSizeValueBlock:(void (^)(NSString * folderSize))folderSize;

/**
 清理自定义缓存内容

 @param filePath 路径
 @param clearStatus YES or NO
 */
+ (void)wya_clearFileAtPath:(NSString *)filePath
           ClearStatusBlock:(void (^)(BOOL status))clearStatus;

/**
 获取可用空间/系统总空间
 例如：可用空间3.97G / 总空间59.59G

 @return string
 */
+ (NSString *)wya_getDivceSize;

/**
 获取可用空间

 @param folderSize 返回可用的size
 */
+ (void)wya_getDivceAvailableSizeBlock:(void (^)(NSString * folderSize))folderSize;

/**
 获取Divce总存储空间
 */
+ (NSString *)wya_getDivceTotalSize;

/**
 获取Divce总空间单位KB以字符串形式返回

 @return 返回总空间单位KB未处理的原始数据
 */
+ (NSString *)wya_getDivceTotalSizeValue;

/**
 获取可用空间单位KB

 @param folderSize 单位KB的可用空间未处理的原始数据
 */
+ (void)wya_getDivceAvailableSizeValueBlock:(void (^)(NSString * folderSize))folderSize;

@end

NS_ASSUME_NONNULL_END
