# WYAClearCache

## 功能

- 系统的缓存机制可以直接查看缓存大小，或者清除缓存。

- 自定义缓存机制，可以传入path去查看文件大小以及清除“缓存”

## 方法

```objective-c
typedef NS_ENUM(NSInteger, WYAFileSizeUnit) {
    WYAFileSizeUnitMB   = 0,
    WYAFileSizeUnitKB   = 1,
    WYAFileSizeUnitGB   = 2
};

/**
 获取系统缓存caches文件大小

 @param folderSize block形式传出大小
 @param type 文件大小单位 KB\MB\GB
 */
+ (void)wya_defaultCachesFolderSizeBlock:(void(^)(float folderSize))folderSize UnitType:(WYAFileSizeUnit)type;


/**
 清理caches路径缓存

 @param clearStatus YES or NO
 */
+ (void)wya_clearCachesClearStatusBlock:(void(^)(BOOL status))clearStatus;

/**
 获取缓存文件大小
 
 @param folderSize block形式传出大小
 @param type 文件大小单位 KB\MB\GB
 */
+ (void)wya_fileSizeAtPath:(NSString *)filePath FolderSizeBlock:(void(^)(float folderSize))folderSize UnitType:(WYAFileSizeUnit)type;


/**
 清理自定义缓存内容

 @param filePath 路径
 @param clearStatus YES or NO
 */
+ (void)wya_clearFileAtPath:(NSString *)filePath ClearStatusBlock:(void(^)(BOOL status))clearStatus;

/**
获取可用空间/系统总空间
例如：可用空间3.97G / 总空间59.59G

@return string
*/
+ (NSString *)wya_getDivceSize;


/**
获取可用空间

@param folderSize 返回可用的size
@param type 传入需要的Type
*/
+ (void)wya_getDivceAvailableSizeBlock:(void (^)(float folderSize))folderSize UnitType:(WYAFileSizeUnit)type;

```

## 基本用法

```objective-c
// 查看缓存
 [WYAClearCache wya_defaultCachesFolderSizeBlock:^(float folderSize) {} UnitType:WYAFileSizeUnitMB];
        
 // 清除缓存
 [WYAClearCache wya_clearCachesClearStatusBlock:^(BOOL status) { NSLog(@"清理成功");}];
 
 // 获取可用空间
 [WYAClearCache wya_getDivceAvailableSizeBlock:^(float folderSize) {
 NSString * tempSize = [NSString stringWithFormat:@"%.2fG",folderSize];
 NSLog(@"---------%@",tempSize);
 } UnitType:WYAFileSizeUnitGB];
```


