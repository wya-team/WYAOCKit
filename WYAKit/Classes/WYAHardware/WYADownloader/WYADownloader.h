//
//  WYADownloader.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/6.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@class WYADownloadModel;

@interface WYADownloader : NSObject

@property (nonatomic, assign) BOOL allowsCellularAccess; //是否允许数据网络连接
//@property (nonatomic, assign) NSUInteger  maxConcurrentOperationCount;

@property (nonatomic, strong, readonly) NSArray * downloadingArray;      //正在下载的数组
@property (nonatomic, strong, readonly) NSArray * downloadCompleteArray; //已经下载完成的数组

/**
 初始化

 @return self
 */
+ (instancetype)sharedDownloader;

/**
 开始下载

 @param model 数据模型
 @param handle 回调，用来提示下载是否成功加入下载列表
 */
- (void)wya_DownloadTaskWithModel:(WYADownloadModel *)model ResultHandle:(void (^)(WYADownloadModel * resultModel, NSString * result))handle;

/**
 暂停下载

 @param model 数据模型
 */
- (void)wya_suspendDownloadWithModel:(WYADownloadModel *)model;

/**
 放弃下载任务（调用此方法resumeData将会不存在）

 @param model 数据模型
 */
- (void)wya_giveupDownloadWithModel:(WYADownloadModel *)model;

/**
 继续下载

 @param model 数据模型
 */
- (void)wya_keepDownloadWithModel:(WYADownloadModel *)model;

/**
 移除下载完成的任务

 @param model 数据模型
 */
- (void)wya_removeDownloadWithModel:(WYADownloadModel *)model;

/**
 设置请求头
 
 @param value value
 @param field key
 */
- (void)wya_SetValue:(nullable NSString *)value forHTTPHeaderField:(NSString *)field;

@end

FOUNDATION_EXPORT NSString * const WYADownloaderDownloadArrayObserveKeyPath; //监测下载队列的变化

FOUNDATION_EXPORT NSString * const WYADownloaderCompleteArrayObserveKeyPath; //监测下载完成队列的变化

NS_ASSUME_NONNULL_END
