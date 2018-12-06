//
//  WYADownloader.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/6.
//

#import "WYADownloader.h"

@interface WYADownloader ()<NSURLSessionDownloadDelegate>
@property (nonatomic, copy)   DownloadBlock downloadBlock;
@property (nonatomic, strong) NSURLSessionDownloadTask * downloadTask;
@property (nonatomic, strong) NSURLSession * session;
@property (nonatomic, strong) NSData * resumeData;
@property (nonatomic, copy)   NSString * userFilePath;
@end

@implementation WYADownloader

+ (instancetype)sharedDownloader
{
    static WYADownloader * downloader;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        downloader = [[WYADownloader alloc]init];
    });
    return downloader;
}

#pragma mark - Public Method -
-(void)wya_DownloadTaskWithUrl:(NSString *)urlString{
    NSURLSession * session = [NSURLSession sharedSession];
    NSURL * url = [NSURL URLWithString:urlString];
    NSURLSessionDownloadTask * task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"location==%@",location);
        NSLog(@"name == %@",response.suggestedFilename);
        NSLog(@"error==%@",[error localizedDescription]);
        NSString * temPath = [[NSString wya_tmpPath] stringByAppendingPathComponent:response.suggestedFilename];
        NSLog(@"tempath==%@",temPath);
        NSFileManager * fileManager = [NSFileManager defaultManager];
        NSError * fileError;
        BOOL isfile = [fileManager moveItemAtURL:location toURL:[NSURL fileURLWithPath:temPath] error:&fileError];
        NSLog(@"file==%d",isfile);
        
    }];
    [task resume];
}

-(void)wya_DownloadTaskWithUrl:(NSString *)urlString
                      FilePath:(NSString *)filePath
                DownloadHandle:(DownloadBlock)handle{
    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURL * url = [NSURL URLWithString:urlString];
    self.downloadTask = [self.session downloadTaskWithURL:url];
    [self.downloadTask resume];
    self.userFilePath = filePath;
    self.downloadBlock = handle;
}

-(void)wya_suspendDownload{
    [self.downloadTask suspend];
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        self.resumeData = resumeData;
    }];
}

-(void)wya_giveupDownload:(void(^)(BOOL result))giveup{
    [self.downloadTask cancel];
//    NSFileManager * fileManager = [NSFileManager defaultManager];
//    NSError * userRemoveError;
//    BOOL isRemove = [fileManager removeItemAtURL:[NSURL fileURLWithPath:self.userFilePath] error:&userRemoveError];
//    giveup(isRemove);
    self.downloadBlock(0.f, NO);
}

-(void)wya_keepDownload{
    NSURLSessionDownloadTask * task = [self.session downloadTaskWithResumeData:self.resumeData];
    [task resume];
    self.downloadTask = task;
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
    NSURL * url;
    if (self.userFilePath) {
        url = [NSURL fileURLWithPath:self.userFilePath];
        NSLog(@"userPath==%@",self.userFilePath);
    }else{
        NSString * temPath = [[NSString wya_tmpPath] stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
        NSLog(@"tempath==%@",temPath);
        url = [NSURL fileURLWithPath:temPath];
    }
    
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSError * fileError;
    BOOL isfile = [fileManager moveItemAtURL:location toURL:url error:&fileError];
    NSLog(@"file==%d",isfile);
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
    CGFloat pro = 1.0*totalBytesWritten/totalBytesExpectedToWrite;
    if (pro >= 1) {
        self.downloadBlock(pro, YES);
    }else{
        self.downloadBlock(pro, NO);
    }
    
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
@end
