//
//  NSString+FilePath.h
//  WYAiOSEnv
//
//  Created by 李俊恒 on 2018/7/9.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FilePath)

/**
 程序主目录，可见子目录(3个):Documents、Library、tmp
 
 @return 主目录路径
 */
+ (NSString *)wya_homePath;

/**
 程序目录，不能存任何东西
 
 @return 路径
 */
+ (NSString *)wya_appPath;

/**
 文档目录，需要ITUNES同步备份的数据存这里，可存放用户数据
 
 @return 路径
 */
+ (NSString *)wya_docPath;

/**
 配置目录，配置文件存这里
 
 @return 路径
 */
+ (NSString *)wya_libPrefPath;

/**
 缓存目录，系统永远不会删除这里的文件，ITUNES会删除
 
 @return 路径
 */
+ (NSString *)wya_libCachePath;

/**
 缓存目录，系统永远不会删除这里的文件，ITUNES会删除
 
 @return 路径
 */
+ (NSString *)wya_tmpPath;

/**
 判断该路径是文件还是文件夹

 @param filePath 路径
 @return YES为文件夹，no文件路径
 */
+ (BOOL)wya_IsDirectory:(NSString *)filePath;
@end
