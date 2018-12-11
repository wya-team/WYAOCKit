//
//  WYADownloader.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/6.
//

#import "WYADownloader.h"

#define floderPath [[NSString wya_libCachePath] stringByAppendingPathComponent:@"WYADownload"]

@interface WYADownloader ()<NSURLSessionDownloadDelegate>

@property (nonatomic, strong) NSURLSession * session;
@property (nonatomic, strong) NSURLSessionConfiguration * config;
@property (nonatomic, strong) NSOperationQueue * downloadQueue;
@property (nonatomic, strong) NSMutableDictionary * taskDic;
@property (nonatomic, strong) NSMutableArray<WYADownloadModel *> * downloadArray;
@property (nonatomic, strong) NSMutableArray<WYADownloadModel *> * downloadFinishArray;


@end

@implementation WYADownloader

+ (instancetype)sharedDownloader
{
    static WYADownloader * downloader;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        downloader = [[WYADownloader alloc]init];
        [downloader createFilePath];
    });
    return downloader;
}

-(void)createFilePath{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if (![fileManager isExecutableFileAtPath:floderPath]) {
        [fileManager createDirectoryAtPath:floderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSLog(@"path==%@",floderPath);
}

#pragma mark - Private Method -
-(BOOL)compareDownloadTasks:(WYADownloadModel *)model ResultHandle:(void(^)(NSString * result))handle{
    __block BOOL isHave;
    [self.downloadArray enumerateObjectsUsingBlock:^(WYADownloadModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([model.urlString isEqualToString:obj.urlString]) {
            handle(@"该任务已存在与下载列表");
            isHave = YES;
            *stop = YES;
        }
    }];
    [self.downloadFinishArray enumerateObjectsUsingBlock:^(WYADownloadModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([model.urlString isEqualToString:obj.urlString]) {
            handle(@"该任务已下载完成");
            isHave = YES;
            *stop = YES;
        }
    }];
    return isHave;
}

#pragma mark - Public Method -
#pragma mark 下载
-(void)wya_DownloadTaskWithModel:(WYADownloadModel *)model ResultHandle:(void(^)(NSString * result))handle{
    if ([self compareDownloadTasks:model ResultHandle:handle]) {
        return;
    }
    
    NSURL * url = [NSURL URLWithString:model.urlString];
    NSURLSessionDownloadTask * downloadTask = [self.session downloadTaskWithURL:url];
    [self.taskDic setObject:downloadTask forKey:model.urlString];
    [self.downloadArray addObject:model];
    model.downloadState = WYADownloadStateDownloading;
    [downloadTask resume];
    model.downloadState = WYADownloadStateDownloading;
}

//- (void)wya_downloadAllWithModel:(NSMutableArray <WYADownloadModel *> *)models{
//    for (WYADownloadModel * model in models) {
//        [self wya_DownloadTaskWithModel:model];
//    }
//}

#pragma mark 暂停
-(void)wya_suspendDownloadWithModel:(WYADownloadModel *)model{
    
    NSURLSessionDownloadTask * task = self.taskDic[model.urlString];
    [task suspend];
    [task cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        model.resumeData = resumeData;
    }];
    model.downloadState = WYADownloadStateSuspend;
}

-(void)wya_suspendAllDownload{
    
}

#pragma mark 取消
-(void)wya_giveupDownloadWithModel:(WYADownloadModel *)model{
    NSURLSessionDownloadTask * task = self.taskDic[model.urlString];
    [task cancel];
    model.downloadState = WYADownloadStateFail;
}

-(void)wya_giveupAllDownload{
    
}

#pragma mark 继续
-(void)wya_keepDownloadWithModel:(WYADownloadModel *)model{
    
    NSURLSessionDownloadTask * task = [self.session downloadTaskWithResumeData:model.resumeData];
    [task resume];
    [self.taskDic setObject:task forKey:model.urlString];
    model.downloadState = WYADownloadStateDownloading;
}

-(void)wya_keepAllDownload{
    for (WYADownloadModel * model in self.downloadArray) {
        [self wya_keepDownloadWithModel:model];
    }
}

#pragma mark - NSURLSessionTaskDelegate -
/**
 在任务下载完成、下载失败
或者是应用被杀掉后，重新启动应用并创建相关identifier的Session时调用

 @param session 会话
 @param task 任务
 @param error 失败
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
didCompleteWithError:(nullable NSError *)error{
    if (error) {
        
    }else{
        
    }
    NSLog(@"error==%@",[error localizedDescription]);
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
    
    [self.taskDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isEqual:downloadTask]) {
            NSString * urlS = (NSString *)key;
            for (WYADownloadModel * model in self.downloadArray) {
                if ([model.urlString isEqualToString:urlS]) {
                    model.downloadState = WYADownloadStateComplete;
                    [self.taskDic removeObjectForKey:key];
                    [self.downloadArray removeObject:model];
                    [self.downloadFinishArray addObject:model];
                    NSURL * url;
                    if (model.destinationPath) {
                        url = [NSURL fileURLWithPath:model.destinationPath];
                        NSLog(@"userPath==%@",model.destinationPath);
                    }else{
                        NSString * temPath = [floderPath stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
                        NSLog(@"tempath==%@",temPath);
                        url = [NSURL fileURLWithPath:temPath];
                    }
                    
                    
                    NSFileManager * fileManager = [NSFileManager defaultManager];
                    NSError * fileError;
                    BOOL isfile = [fileManager moveItemAtURL:location toURL:url error:&fileError];
                    NSLog(@"file==%d",isfile);
                    *stop = YES;
                }
            }
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
    NSLog(@"progress==%f",1.0*totalBytesWritten/totalBytesExpectedToWrite);
    __block CGFloat pro = 1.0*totalBytesWritten/totalBytesExpectedToWrite;
    [self.taskDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isEqual:downloadTask]) {
            NSString * urlS = (NSString *)key;
            for (WYADownloadModel * model in self.downloadArray) {
                if ([model.urlString isEqualToString:urlS]) {
                    model.progress = pro;
                    model.downloadState = WYADownloadStateDownloading;
                    if (@available(iOS 11.0, *)) {
                        NSDictionary *progressInfo = downloadTask.progress.userInfo;
                        NSNumber *startTimeValue = progressInfo[@"startTime"];
                        if (startTimeValue) {
                            CFAbsoluteTime startTime = [startTimeValue doubleValue];
                            
                            CGFloat downloadSpeed = (CGFloat)totalBytesWritten / (CGFloat)(CFAbsoluteTimeGetCurrent() - startTime);
                            
                            if (downloadSpeed>1024*1024*1024) {
                                model.speed = [NSString stringWithFormat:@"%.2fGB/s",downloadSpeed/(1024*1024*1024)];
                            }else if (downloadSpeed>1024*1024) {
                                model.speed = [NSString stringWithFormat:@"%.2fMB/s",downloadSpeed/(1024*1024)];
                            }else if (downloadSpeed>1024){
                                model.speed = [NSString stringWithFormat:@"%.2fKB/s",downloadSpeed/1024];
                            }else{
                                model.speed = [NSString stringWithFormat:@"%.2fB/s",downloadSpeed];
                            }
                            
                        } else {
                            [downloadTask.progress setUserInfoObject:@(CFAbsoluteTimeGetCurrent()) forKey:@"startTime"];
                        }
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    *stop = YES;
                }
            }
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
- (NSURLSessionConfiguration *)config{
    if(!_config){
        _config = ({
            NSURLSessionConfiguration * object = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:NSStringFromClass(self.class)];
            object.timeoutIntervalForRequest = 15;//超时时间
            object.allowsCellularAccess = NO;//是否允许蜂窝网连接
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

- (NSMutableArray<WYADownloadModel *> *)downloadArray{
    if(!_downloadArray){
        _downloadArray = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _downloadArray;
}

- (NSMutableArray<WYADownloadModel *> *)downloadFinishArray{
    if(!_downloadFinishArray){
        _downloadFinishArray = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _downloadFinishArray;
}
@end


@implementation WYADownloader (Config)


@end
