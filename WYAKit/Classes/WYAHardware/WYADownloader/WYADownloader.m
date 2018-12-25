//
//  WYADownloader.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/6.
//

#import "WYADownloader.h"
#import "WYADownloadTaskManager.h"

#define floderPath [[NSString wya_docPath] stringByAppendingPathComponent:@"WYADownload"]

NSString * const WYADownloaderDownloadArrayObserveKeyPath = @"downloadArray";
NSString * const WYADownloaderCompleteArrayObserveKeyPath = @"downloadFinishArray";

NSString * const WYADownloadingTable = @"WYADownloadingTable";
NSString * const WYADownloadCompleteTable = @"WYADownloadCompleteTable";

@interface WYADownloader ()<NSURLSessionDownloadDelegate,NSURLSessionDelegate>

@property (nonatomic, strong) NSURLSession * session;
@property (nonatomic, strong) NSURLSessionConfiguration * config;
@property (nonatomic, strong) NSOperationQueue * downloadQueue;
@property (nonatomic, strong) NSMutableDictionary * taskDic;
@property (nonatomic, strong) NSMutableArray<WYADownloadTaskManager *> * downloadArray;
@property (nonatomic, strong) NSMutableArray<WYADownloadTaskManager *> * downloadFinishArray;
@property (nonatomic, strong) JQFMDB * fmdb;
@property (nonatomic, strong) NSMutableDictionary * httpHeader;
@property (nonatomic, copy)   void(^appBackground)(NSURLSession * session);
@property (nonatomic, copy)   void(^userResultHandle)(WYADownloadModel * resultModel, NSString * result);
@end

@implementation WYADownloader

+ (instancetype)sharedDownloader
{
    static WYADownloader * downloader;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        downloader = [[WYADownloader alloc]init];
        [downloader createFilePath];
        [downloader addNotice];
        [downloader resumeDownloadTask];
    });
    return downloader;
}

#pragma mark - Private Method -
- (void)createFilePath{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if (![fileManager isExecutableFileAtPath:floderPath]) {
        [fileManager createDirectoryAtPath:floderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSLog(@"path==%@",floderPath);
}

- (void)addNotice{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveDownloadTask) name:UIApplicationWillTerminateNotification object:nil];
}

- (void)saveDownloadTask{
    
    for (WYADownloadTaskManager * manager in self.downloadArray) {
        NSArray * arr = [self.fmdb jq_lookupTable:WYADownloadingTable dicOrModel:[WYADownloadTaskManager class] whereFormat:[NSString stringWithFormat:@"WHERE urlString = '%@'",manager.urlString]];
        if (arr.count>0) {
            BOOL b = [self.fmdb jq_updateTable:WYADownloadingTable dicOrModel:manager whereFormat:[NSString stringWithFormat:@"WHERE urlString = '%@'",manager.urlString]];
            NSLog(@"b=%d",b);
        } else {
            BOOL a = [self.fmdb jq_insertTable:WYADownloadingTable dicOrModel:manager];
            NSLog(@"a==%d",a);
        }
    }
    
    for (WYADownloadTaskManager * manager in self.downloadFinishArray) {
        NSArray * arr = [self.fmdb jq_lookupTable:WYADownloadCompleteTable dicOrModel:[WYADownloadTaskManager class] whereFormat:[NSString stringWithFormat:@"WHERE urlString = '%@'",manager.urlString]];
        if (arr.count>0) {
            BOOL b = [self.fmdb jq_updateTable:WYADownloadCompleteTable dicOrModel:manager whereFormat:[NSString stringWithFormat:@"WHERE urlString = '%@'",manager.urlString]];
            NSLog(@"b=%d",b);
        } else {
            BOOL a = [self.fmdb jq_insertTable:WYADownloadCompleteTable dicOrModel:manager];
            NSLog(@"a==%d",a);
        }
    }
}

- (void)resumeDownloadTask{
    NSArray * arr = [self.fmdb jq_lookupTable:WYADownloadingTable dicOrModel:[WYADownloadTaskManager class] whereFormat:nil];
    if (arr.count>0) {
        [[self mutableArrayValueForKey:@"downloadArray"] removeAllObjects];
        [[self mutableArrayValueForKey:@"downloadArray"] addObjectsFromArray:arr];
    }
    
    NSArray * completeArray = [self.fmdb jq_lookupTable:WYADownloadCompleteTable dicOrModel:[WYADownloadTaskManager class] whereFormat:nil];
    if (completeArray.count>0) {
        [[self mutableArrayValueForKey:@"downloadFinishArray"] removeAllObjects];
        [[self mutableArrayValueForKey:@"downloadFinishArray"] addObjectsFromArray:completeArray];
    }
    
    NSURLSessionConfiguration * config = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:NSStringFromClass(self.class)];
    self.session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:self.downloadQueue];
}

-(BOOL)compareDownloadTasks:(WYADownloadModel *)model ResultHandle:(void(^)(WYADownloadModel * resultModel, NSString * result))handle{
    __block BOOL isHave = NO;
    [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadTaskManager * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([model.urlString isEqualToString:obj.urlString]) {
            handle(model, @"该任务已存在与下载列表");
            isHave = YES;
            *stop = YES;
        }
    }];
    [self.downloadFinishArray enumerateObjectsUsingBlock:^(WYADownloadTaskManager * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([model.urlString isEqualToString:obj.urlString]) {
            handle(model, @"该任务已下载完成");
            isHave = YES;
            *stop = YES;
        }
    }];
    return isHave;
}

#pragma mark - Public Method -
#pragma mark 下载
-(void)wya_DownloadTaskWithModel:(WYADownloadModel *)model ResultHandle:(void(^)(WYADownloadModel * resultModel, NSString * result))handle{
    if ([self compareDownloadTasks:model ResultHandle:handle]) {
        return;
    }
    self.userResultHandle = handle;
    WYADownloadTaskManager * manager = [[WYADownloadTaskManager alloc]init];
    [manager startDownloadWithSession:self.session Model:model];
    [[self mutableArrayValueForKey:@"downloadArray"] addObject:manager];
    
}


#pragma mark 暂停
-(void)wya_suspendDownloadWithModel:(WYADownloadModel *)model{
    [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadTaskManager * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.urlString isEqualToString:model.urlString]) {
            [obj suspendDownload];
            *stop = YES;
        }
    }];
}

-(void)wya_suspendAllDownload{
    
}

#pragma mark 取消
-(void)wya_giveupDownloadWithModel:(WYADownloadModel *)model{
    [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadTaskManager * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.urlString isEqualToString:model.urlString]) {
            [obj giveupDownload];
            *stop = YES;
        }
    }];
}

-(void)wya_giveupAllDownload{
    
}

#pragma mark 继续
-(void)wya_keepDownloadWithModel:(WYADownloadModel *)model{
    [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadTaskManager * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.urlString isEqualToString:model.urlString]) {
            [obj keepDownloadWithSession:nil ResumeData:nil];
            *stop = YES;
        }
    }];
}

-(void)wya_keepAllDownload{
//    for (WYADownloadModel * model in self.downloadArray) {
//        [self wya_keepDownloadWithModel:model];
//    }
}

- (void)wya_AppGoBackgroundWithSessionHandle:(void(^)(NSURLSession * session))handle{
    self.appBackground = handle;
}

#pragma mark - NSURLSessionDelegate  -
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session{
    if (session.configuration.identifier) {
        //处理后台下载任务
        self.appBackground(session);
    }
}

- (void)wya_SetValue:(nullable NSString *)value forHTTPHeaderField:(NSString *)field{
    [self.httpHeader setValue:value forKey:field];
    self.config.HTTPAdditionalHeaders = self.httpHeader;
}

#pragma mark - NSURLSessionTaskDelegate -
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
didCompleteWithError:(nullable NSError *)error{
    NSLog(@"err==%@",error);
    NSLog(@"error==%@",[error localizedDescription]);
    if (error) {
        
        if ([error.userInfo objectForKey:NSURLSessionDownloadTaskResumeData]){
            NSData * data = [error.userInfo objectForKey:NSURLSessionDownloadTaskResumeData];
            NSURLSessionDownloadTask * task = [session downloadTaskWithResumeData:data];
            [task resume];
            NSString * string = [error.userInfo objectForKey:NSURLErrorFailingURLStringErrorKey];
            [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadTaskManager * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([string isEqualToString:obj.urlString]) {
                    obj.downloadTask = task;
                    *stop = YES;
                }
            }];
        }
    }else{
        [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadTaskManager * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.isSuccess == NO) {

                [[self mutableArrayValueForKey:@"downloadArray"] removeObject:obj];
                dispatch_sync(dispatch_get_main_queue(), ^{
                   self.userResultHandle(obj.model, @"该资源有误");
                });
                *stop = YES;
            }
            if (obj.downloadTask == task) {
                [[self mutableArrayValueForKey:@"downloadArray"] removeObject:obj];
                [[self mutableArrayValueForKey:@"downloadFinishArray"] addObject:obj];
                *stop = YES;
            }
        }];
    }
    
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
    
    [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadTaskManager * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.downloadTask == downloadTask) {
            [obj moveLocationPathWithOldUrl:location];
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
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    
    [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadTaskManager * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.downloadTask == downloadTask) {
            [obj readDownloadProgressWithdidWriteData:bytesWritten totalBytesWritten:totalBytesWritten totalBytesExpectedToWrite:totalBytesExpectedToWrite];
            *stop = YES;
        }
    }];
}

/**
 恢复下载回调

 @param session 会话
 @param downloadTask 任务
 @param fileOffset <#fileOffset description#>
 @param expectedTotalBytes <#expectedTotalBytes description#>
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes{
    
}

#pragma mark - Setter -
-(void)setAllowsCellularAccess:(BOOL)allowsCellularAccess{
    self.config.allowsCellularAccess = allowsCellularAccess;
}

-(void)setMaxConcurrentOperationCount:(NSUInteger)maxConcurrentOperationCount{
    self.downloadQueue.maxConcurrentOperationCount = maxConcurrentOperationCount;
}

#pragma mark - Getter -
-(NSArray *)downloadingArray{
    return [self.downloadArray copy];
}

-(NSArray *)downloadCompleteArray{
    return [self.downloadFinishArray copy];
}

-(BOOL)allowsCellularAccess{
    return self.config.allowsCellularAccess;
}

-(JQFMDB *)fmdb{
    if (!_fmdb) {
        _fmdb = [JQFMDB shareDatabase:@"WYADownloader" path:floderPath];
        if (![_fmdb jq_isExistTable:WYADownloadingTable]) {
            [_fmdb jq_createTable:WYADownloadingTable dicOrModel:[WYADownloadTaskManager class]];
        }
        if (![_fmdb jq_isExistTable:WYADownloadCompleteTable]) {
            [_fmdb jq_createTable:WYADownloadCompleteTable dicOrModel:[WYADownloadTaskManager class]];
        }
    }
    return _fmdb;
}

- (NSURLSessionConfiguration *)config{
    if(!_config){
        _config = ({
            NSURLSessionConfiguration * object = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:NSStringFromClass(self.class)];
            object.timeoutIntervalForRequest = 15;//超时时间
            object.allowsCellularAccess = NO;//是否允许蜂窝网连接
            object.HTTPAdditionalHeaders = @{@"Accept": @"application/json",
                                             @"Accept-Language": @"en"};
            object;
        });
    }
    return _config;
}

- (NSURLSession *)session{
    if(!_session){
        _session = ({
            NSURLSession * object = [NSURLSession sessionWithConfiguration:self.config delegate:self delegateQueue:self.downloadQueue];
            
            object;
       });
    }
    return _session;
}

- (NSOperationQueue *)downloadQueue{
    if(!_downloadQueue){
        _downloadQueue = ({
            NSOperationQueue * object = [[NSOperationQueue alloc]init];
//            object.maxConcurrentOperationCount = 1;
            object;
       });
    }
    return _downloadQueue;
}

- (NSMutableDictionary *)taskDic{
    if(!_taskDic){
        _taskDic = ({
            NSMutableDictionary * object = [[NSMutableDictionary alloc]init];
            object;
       });
    }
    return _taskDic;
}

- (NSMutableArray<WYADownloadTaskManager *> *)downloadArray{
    if(!_downloadArray){
        _downloadArray = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _downloadArray;
}

- (NSMutableArray<WYADownloadTaskManager *> *)downloadFinishArray{
    if(!_downloadFinishArray){
        _downloadFinishArray = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _downloadFinishArray;
}

- (NSMutableDictionary *)httpHeader{
    if(!_httpHeader){
        _httpHeader = ({
            NSMutableDictionary * object = [[NSMutableDictionary alloc]init];
            [object setValue:@"application/json" forKey:@"Accept"];
            [object setValue:@"en" forKey:@"Accept-Language"];
            object;
       });
    }
    return _httpHeader;
}
@end
