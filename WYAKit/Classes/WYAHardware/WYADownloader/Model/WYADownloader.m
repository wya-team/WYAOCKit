//
//  WYADownloader.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/6.
//

#import "WYADownloader.h"
#import "WYADownloadModel.h"

#define floderPath [[NSString wya_docPath] stringByAppendingPathComponent:@"WYADownload"]

NSString * const WYADownloaderDownloadArrayObserveKeyPath = @"downloadArray";
NSString * const WYADownloaderCompleteArrayObserveKeyPath = @"downloadFinishArray";

NSString * const WYADownloadingTable      = @"WYADownloadingTable";
NSString * const WYADownloadCompleteTable = @"WYADownloadCompleteTable";

@interface WYADownloader () <NSURLSessionDelegate, NSURLSessionDataDelegate, NSURLSessionDownloadDelegate>

@property (nonatomic, copy) NSString * identifier; // 下载的唯一标示用于恢复下载获取NSUrlSession
@property (nonatomic, strong) NSURLSession * session;
@property (nonatomic, strong) NSURLSessionConfiguration * config;
@property (nonatomic, strong) NSOperationQueue * downloadQueue;
@property (nonatomic, strong) NSMutableArray<WYADownloadModel *> * downloadArray;
@property (nonatomic, strong) NSMutableArray<WYADownloadModel *> * downloadFinishArray;
@property (nonatomic, strong) JQFMDB * fmdb;
@property (nonatomic, strong) NSMutableDictionary * httpHeader;
@property (nonatomic, copy) void (^appBackground)(NSURLSession * session);
@property (nonatomic, copy) void (^userResultHandle)(WYADownloadModel * resultModel, NSString * result);
@end

@implementation WYADownloader

+ (instancetype)sharedDownloader
{
    static WYADownloader * downloader;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        downloader = [[WYADownloader alloc] init];
        [downloader createFilePath];
        [downloader addNotice];
        [downloader resumeDownloadTask];
    });
    return downloader;
}

#pragma mark - Private Method -
/**
 创建存放视频资源和数据库的文件夹
 */
- (void)createFilePath
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if (![fileManager isExecutableFileAtPath:floderPath]) {
        [fileManager createDirectoryAtPath:floderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSLog(@"path==%@", floderPath);
}

/**
 添加程序被kill的通知
 */
- (void)addNotice
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveDownloadTask) name:UIApplicationWillTerminateNotification object:nil];
}

/**
 保存下载任务
 */
- (void)saveDownloadTask
{
    for (WYADownloadModel * manager in self.downloadArray) {
        NSArray * arr = [self.fmdb jq_lookupTable:WYADownloadingTable dicOrModel:[WYADownloadModel class] whereFormat:[NSString stringWithFormat:@"where urlString = '%@'", manager.urlString]];
        if (arr.count > 0) {
            BOOL b = [self.fmdb jq_updateTable:WYADownloadingTable dicOrModel:manager whereFormat:[NSString stringWithFormat:@"where urlString = '%@'", manager.urlString]];
            NSLog(@"b=%d", b);
        } else {
            BOOL a = [self.fmdb jq_insertTable:WYADownloadingTable dicOrModel:manager];
            NSLog(@"a==%d", a);
        }
    }

    for (WYADownloadModel * manager in self.downloadFinishArray) {
        NSArray * arr = [self.fmdb jq_lookupTable:WYADownloadCompleteTable dicOrModel:[WYADownloadModel class] whereFormat:[NSString stringWithFormat:@"WHERE urlString = '%@'", manager.urlString]];
        if (arr.count > 0) {
            BOOL b = [self.fmdb jq_updateTable:WYADownloadCompleteTable dicOrModel:manager whereFormat:[NSString stringWithFormat:@"WHERE urlString = '%@'", manager.urlString]];
            NSLog(@"b=%d", b);
        } else {
            BOOL a = [self.fmdb jq_insertTable:WYADownloadCompleteTable dicOrModel:manager];
            NSLog(@"a==%d", a);
        }
    }
}

/**
 恢复下载任务
 */
- (void)resumeDownloadTask
{
    NSArray * arr = [self.fmdb jq_lookupTable:WYADownloadingTable dicOrModel:[WYADownloadModel class] whereFormat:nil];
    if (arr.count > 0) {
        [[self mutableArrayValueForKey:@"downloadArray"] removeAllObjects];
        [[self mutableArrayValueForKey:@"downloadArray"] addObjectsFromArray:arr];
    }

    NSArray * completeArray = [self.fmdb jq_lookupTable:WYADownloadCompleteTable dicOrModel:[WYADownloadModel class] whereFormat:nil];
    if (completeArray.count > 0) {
        [[self mutableArrayValueForKey:@"downloadFinishArray"] removeAllObjects];
        [[self mutableArrayValueForKey:@"downloadFinishArray"] addObjectsFromArray:completeArray];
    }

    NSURLSessionConfiguration * config = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:NSStringFromClass(self.class)];
    self.session                       = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:self.downloadQueue];
}

/**
 对比新加入的下载任务和当前在下载数组

 @param model 新加入的下载任务
 @param handle 回调
 @return bool
 */
- (BOOL)compareDownloadTasks:(WYADownloadModel *)model ResultHandle:(void (^)(WYADownloadModel * resultModel, NSString * result))handle
{
    __block BOOL isHave = NO;
    [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([model.urlString isEqualToString:obj.urlString]) {
            handle(model, @"该任务已存在与下载列表");
            isHave = YES;
            *stop  = YES;
        }
    }];
    [self.downloadFinishArray enumerateObjectsUsingBlock:^(WYADownloadModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([model.urlString isEqualToString:obj.urlString]) {
            handle(model, @"该任务已下载完成");
            isHave = YES;
            *stop  = YES;
        }
    }];
    return isHave;
}

#pragma mark - Public Method -
#pragma mark 下载
- (void)wya_DownloadTaskWithModel:(WYADownloadModel *)model ResultHandle:(void (^)(WYADownloadModel * resultModel, NSString * result))handle
{
    
    if ([self compareDownloadTasks:model ResultHandle:handle]) {
        return;
    }
    self.userResultHandle = handle;
    [[self mutableArrayValueForKey:@"downloadArray"] addObject:model];
    [model startDownloadWithSession:self.session];
}

#pragma mark 暂停
- (void)wya_suspendDownloadWithModel:(WYADownloadModel *)model
{
    [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.urlString isEqualToString:model.urlString]) {
            [obj suspendDownload];
            *stop = YES;
        }
    }];
}

- (void)wya_suspendAllDownload
{
}

#pragma mark 放弃下载
- (void)wya_giveupDownloadWithModel:(WYADownloadModel *)model
{
    [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.urlString isEqualToString:model.urlString]) {
            [obj giveupDownload];
            [[self mutableArrayValueForKey:@"downloadArray"] wya_safeRemoveObjectAtIndex:idx];
            *stop = YES;
        }
    }];
}

- (void)wya_giveupAllDownload
{
}

#pragma mark 继续
- (void)wya_keepDownloadWithModel:(WYADownloadModel *)model
{
    [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.urlString isEqualToString:model.urlString]) {
            [obj keepDownloadWithSession:self.session ResumeData:obj.downloadData];
            *stop = YES;
        }
    }];
}

- (void)wya_keepAllDownload
{
    //    for (WYADownloadModel * model in self.downloadArray) {
    //        [self wya_keepDownloadWithModel:model];
    //    }
}

#pragma mark 删除已下载的任务
- (void)wya_removeDownloadWithModel:(WYADownloadModel *)model
{
    NSMutableArray * arr = [[self mutableArrayValueForKey:@"downloadFinishArray"] mutableCopy];
    [arr enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        WYADownloadModel * taskManager = (WYADownloadModel *)obj;
        if (model == taskManager) {
            NSFileManager * fileManager = [NSFileManager defaultManager];
            if (model.destinationPath) {
                NSError * error;
                [fileManager removeItemAtPath:model.destinationPath error:&error];
                NSLog(@"removeManagerError==%@", error);
            }

            [[self mutableArrayValueForKey:@"downloadFinishArray"] removeObject:taskManager];
        }
    }];
}

- (void)wya_SetValue:(nullable NSString *)value forHTTPHeaderField:(NSString *)field
{
    [self.httpHeader setValue:value forKey:field];
    self.config.HTTPAdditionalHeaders = self.httpHeader;
}

#pragma mark - NSURLSessionDelegate  -
- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error
{
    NSLog(@"error==%@", error);
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session
{
    //    if (session.configuration.identifier) {
    //        //处理后台下载任务
    //        self.appBackground(session);
    //    }
}

#pragma mark - NSURLSessionTaskDelegate -
/**
 上传相关的？

 @param session <#session description#>
 @param task <#task description#>
 @param completionHandler <#completionHandler description#>
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
 needNewBodyStream:(void (^)(NSInputStream * _Nullable bodyStream))completionHandler
{
}

/**
 上传相关的？

 @param session <#session description#>
 @param task <#task description#>
 @param bytesSent <#bytesSent description#>
 @param totalBytesSent <#totalBytesSent description#>
 @param totalBytesExpectedToSend <#totalBytesExpectedToSend description#>
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
                             didSendBodyData:(int64_t)bytesSent
                              totalBytesSent:(int64_t)totalBytesSent
                    totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend
{
}

/**
 重定向

 @param session <#session description#>
 @param task <#task description#>
 @param response <#response description#>
 @param request <#request description#>
 @param completionHandler <#completionHandler description#>
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
                    willPerformHTTPRedirection:(NSHTTPURLResponse *)response
                                    newRequest:(NSURLRequest *)request
                             completionHandler:(void (^)(NSURLRequest * _Nullable))completionHandler
{
    NSLog(@"重定向");
}

/**
 身份验证

 @param session <#session description#>
 @param task <#task description#>
 @param challenge <#challenge description#>
 @param completionHandler <#completionHandler description#>
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
                    didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
                      completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler
{
    NSLog(@"身份验证");
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        NSLog(@"调用了里面这一层是服务器信任的证书");
        /*
         NSURLSessionAuthChallengeUseCredential = 0,                     使用证书
         NSURLSessionAuthChallengePerformDefaultHandling = 1,            忽略证书(默认的处理方式)
         NSURLSessionAuthChallengeCancelAuthenticationChallenge = 2,     忽略书证, 并取消这次请求
         NSURLSessionAuthChallengeRejectProtectionSpace = 3,            拒绝当前这一次, 下一次再询问
         */
        //        NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];

        NSURLCredential * card = [[NSURLCredential alloc] initWithTrust:challenge.protectionSpace.serverTrust];
        completionHandler(NSURLSessionAuthChallengePerformDefaultHandling, card);
    }
}

/**
 该会话已完成收集任务的度量标准

 @param session <#session description#>
 @param task <#task description#>
 @param metrics <#metrics description#>
 */
- (void)URLSession:(NSURLSession *)session
                                          task:(NSURLSessionTask *)task
                    didFinishCollectingMetrics:(NSURLSessionTaskMetrics *)metrics API_AVAILABLE(ios(10.0))
{
    NSLog(@"该会话已完成收集任务的度量标准");
}

/**
 在任务下载完成、下载失败
或者是应用被杀掉后，重新启动应用并创建相关identifier的Session时调用

 Task <940143AA-CA47-4BE8-99BD-7018E9CE9051>.<3> load failed with error Error Domain=NSURLErrorDomain Code=-999 "(null)" UserInfo={NSURLErrorBackgroundTaskCancelledReasonKey=0, NSErrorFailingURLStringKey=https://video.pc6.com/v/1810/pyqxxjc3.mp4, NSErrorFailingURLKey=https://video.pc6.com/v/1810/pyqxxjc3.mp4, _NSURLErrorRelatedURLSessionTaskErrorKey=(
 "BackgroundDownloadTask <940143AA-CA47-4BE8-99BD-7018E9CE9051>.<3>",
 "LocalDownloadTask <940143AA-CA47-4BE8-99BD-7018E9CE9051>.<3>"
 ), _NSURLErrorFailingURLSessionTaskErrorKey=BackgroundDownloadTask <940143AA-CA47-4BE8-99BD-7018E9CE9051>.<3>, NSURLSessionDownloadTaskResumeData=<62706c69 73743030 d4010203 04050641 42582476 65727369 6f6e5824 6f626a65
 
 @param session 会话
 @param task 任务
 @param error 失败
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
                    didCompleteWithError:(nullable NSError *)error
{
    NSLog(@"err==%@", error);

    if (error) {
        if (error.code == -999) {
            //下载被暂停或者取消
            for (WYADownloadModel * obj in self.downloadingArray) {
                if (obj.downloadTask == task) {
                    //暂停或者取消
                    NSLog(@"下载被取消");
                    return;
                }
            }

            // 恢复后台下载的任务
            if ([error.userInfo objectForKey:NSURLSessionDownloadTaskResumeData]) {
                NSData * data                   = [error.userInfo objectForKey:NSURLSessionDownloadTaskResumeData];
                NSURLSessionDownloadTask * task = [session downloadTaskWithResumeData:data];
                [task resume];
                NSString * string = [error.userInfo objectForKey:NSURLErrorFailingURLStringErrorKey];
                [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([string isEqualToString:obj.urlString]) {
                        obj.downloadTask = task;
                        *stop            = YES;
                    }
                }];
            }
        }

    } else {
        [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

            NSHTTPURLResponse * response = (NSHTTPURLResponse *)task.response;
            if (400 <= response.statusCode && response.statusCode < 499) {
                [[self mutableArrayValueForKey:@"downloadArray"] wya_safeRemoveObjectAtIndex:idx];
                dispatch_sync(dispatch_get_main_queue(), ^{
                    self.userResultHandle(obj, @"该资源有误");
                });
                *stop = YES;
            } else if (500 <= response.statusCode && response.statusCode <= 599) {
                [[self mutableArrayValueForKey:@"downloadArray"] wya_safeRemoveObjectAtIndex:idx];
                dispatch_sync(dispatch_get_main_queue(), ^{
                    self.userResultHandle(obj, @"服务器错误");
                });
                *stop = YES;
            } else {
                if (obj.downloadTask == task) {
                    [[self mutableArrayValueForKey:@"downloadArray"] wya_safeRemoveObjectAtIndex:idx];
                    [[self mutableArrayValueForKey:@"downloadFinishArray"] wya_safeAddObject:obj];
                    [self.fmdb jq_deleteTable:WYADownloadingTable whereFormat:[NSString stringWithFormat:@"WHERE urlString = '%@'", obj.urlString]];
                    *stop = YES;
                }
            }

        }];
    }
}

#pragma mark - NSURLSessionDataDelegate  -
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler
{
    NSLog(@"response==%@", response);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
                    didBecomeDownloadTask:(NSURLSessionDownloadTask *)downloadTask
{
    NSLog(@"转为下载");
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
                    didBecomeStreamTask:(NSURLSessionStreamTask *)streamTask
{
    NSLog(@"告知代理该数据任务已更改为下载任务");
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data
{
    NSLog(@"告诉代理数据任务已收到一些预期的数据");
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
 willCacheResponse:(NSCachedURLResponse *)proposedResponse
 completionHandler:(void (^)(NSCachedURLResponse * _Nullable cachedResponse))completionHandler
{
    NSLog(@"向代表询问数据（或上传）任务是否应将响应存储在缓存中");
}

#pragma mark - NSURLSessionDownloadDelegate -
/**
 下载完成回调

 @param session 会话
 @param downloadTask 任务
 @param location 文件位置
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
                    didFinishDownloadingToURL:(NSURL *)location
{
    [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.downloadTask == downloadTask) {
            [obj moveLocationPathWithOldUrl:location handle:^(WYADownloadModel * _Nonnull manager, NSString * errorInfo) {
                [[self mutableArrayValueForKey:@"downloadFinishArray"] removeObject:manager];
                self.userResultHandle(manager, errorInfo);
            }];
            *stop = YES;
        }
    }];
}

/**
 下载进度回调

 @param session 会话
 @param downloadTask 任务
 @param bytesWritten 本次写入数据大小
 @param totalBytesWritten 已经写入数据大小
 @param totalBytesExpectedToWrite 要下载的文件总大小
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
                                 didWriteData:(int64_t)bytesWritten
                            totalBytesWritten:(int64_t)totalBytesWritten
                    totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.downloadTask == downloadTask) {
            [obj readDownloadProgressWithdidWriteData:bytesWritten totalBytesWritten:totalBytesWritten totalBytesExpectedToWrite:totalBytesExpectedToWrite];
            *stop = YES;
        }
    }];
}

/**
 恢复(暂停)下载回调

 @param session 会话
 @param downloadTask 任务
 @param fileOffset 如果文件的缓存策略或上次修改日期阻止重用现有内容，则此值为零。否则，此值是一个整数，表示磁盘上不需要再次检索的字节数。
 @param expectedTotalBytes 文件的预期长度，由Content-Length标头提供。如果未提供此标头，则值为。NSURLSessionTransferSizeUnknown
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes
{
    NSLog(@"继续下载");
}

#pragma mark - Setter -
- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess
{
    self.config.allowsCellularAccess = allowsCellularAccess;
}

- (void)setMaxConcurrentOperationCount:(NSUInteger)maxConcurrentOperationCount
{
    self.downloadQueue.maxConcurrentOperationCount = maxConcurrentOperationCount;
}

#pragma mark - Getter -
- (NSString *)floder{
    return floderPath;
}
- (NSArray *)downloadingArray
{
    return [self.downloadArray copy];
}

- (NSArray *)downloadCompleteArray
{
    return [self.downloadFinishArray copy];
}

- (BOOL)allowsCellularAccess
{
    return self.config.allowsCellularAccess;
}

- (JQFMDB *)fmdb
{
    if (!_fmdb) {
        _fmdb = [JQFMDB shareDatabase:@"WYADownloader" path:floderPath];
        if (![_fmdb jq_isExistTable:WYADownloadingTable]) {
            [_fmdb jq_createTable:WYADownloadingTable dicOrModel:[WYADownloadModel class]];
        }
        if (![_fmdb jq_isExistTable:WYADownloadCompleteTable]) {
            [_fmdb jq_createTable:WYADownloadCompleteTable dicOrModel:[WYADownloadModel class]];
        }
    }
    return _fmdb;
}

- (NSURLSessionConfiguration *)config
{
    if (!_config) {
        _config = ({
            NSURLSessionConfiguration * object = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:NSStringFromClass(self.class)];
            object.timeoutIntervalForRequest   = 15; //超时时间
            object.allowsCellularAccess        = NO; //是否允许蜂窝网连接
            object.HTTPAdditionalHeaders       = @{ @"Accept" : @"application/json",
                                              @"Accept-Language" : @"en" };
            object;
        });
    }
    return _config;
}

- (NSURLSession *)session
{
    if (!_session) {
        _session = ({
            NSURLSession * object = [NSURLSession sessionWithConfiguration:self.config delegate:self delegateQueue:self.downloadQueue];

            object;
        });
    }
    return _session;
}

- (NSOperationQueue *)downloadQueue
{
    if (!_downloadQueue) {
        _downloadQueue = ({
            NSOperationQueue * object = [[NSOperationQueue alloc] init];
            //            object.maxConcurrentOperationCount = 1;//并发数
            object;
        });
    }
    return _downloadQueue;
}

- (NSMutableArray<WYADownloadModel *> *)downloadArray
{
    if (!_downloadArray) {
        _downloadArray = ({
            NSMutableArray * object = [[NSMutableArray alloc] init];
            object;
        });
    }
    return _downloadArray;
}

- (NSMutableArray<WYADownloadModel *> *)downloadFinishArray
{
    if (!_downloadFinishArray) {
        _downloadFinishArray = ({
            NSMutableArray * object = [[NSMutableArray alloc] init];
            object;
        });
    }
    return _downloadFinishArray;
}

- (NSMutableDictionary *)httpHeader
{
    if (!_httpHeader) {
        _httpHeader = ({
            NSMutableDictionary * object = [[NSMutableDictionary alloc] init];
            [object setValue:@"application/json" forKey:@"Accept"];
            [object setValue:@"en" forKey:@"Accept-Language"];
            object;
        });
    }
    return _httpHeader;
}
@end
