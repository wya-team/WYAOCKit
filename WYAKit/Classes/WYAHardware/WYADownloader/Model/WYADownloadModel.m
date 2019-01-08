//
//  WYADownloadTaskManager.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/12.
//

#import "WYADownloadModel.h"
#define floderPath [[NSString wya_docPath] stringByAppendingPathComponent:@"WYADownload"]

@interface WYADownloadModel ()

@end

@implementation WYADownloadModel
{
    NSNumber * startTime;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _downloadState = WYADownloadStateDownloading;
    }
    return self;
}

- (void)startDownloadWithSession:(NSURLSession *)session
{
    NSAssert(self.urlString, @"下载地址不能为空");
    // 字符串解码
    NSString * urlS = [self.urlString stringByRemovingPercentEncoding];

    // 第一种下载
    //    NSURL * url                   = [NSURL URLWithString:urlS];
    //    self.downloadTask             = [session downloadTaskWithURL:url];

    // 第二种下载
    NSURL * url                   = [NSURL URLWithString:urlS];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    self.downloadTask             = [session downloadTaskWithRequest:request];

    [self.downloadTask resume];
    self.downloadState = WYADownloadStateDownloading;
}

- (void)suspendDownload
{
    self.downloadState = WYADownloadStateSuspend;
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        self.downloadData = resumeData;
    }];
}

- (void)keepDownloadWithSession:(NSURLSession *)session ResumeData:(NSData *)data
{
    self.downloadState = WYADownloadStateDownloading;
    self.downloadTask  = [session downloadTaskWithResumeData:self.downloadData];
    [self.downloadTask resume];
}

- (void)giveupDownload
{
    self.downloadState = WYADownloadStateFail;
    [self.downloadTask cancel];
}

- (void)moveLocationPathWithOldUrl:(NSURL *)oldUrl handle:(void (^)(WYADownloadModel * manager, NSString * errorInfo))handle
{
    self.downloadState          = WYADownloadStateComplete;
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSURL * url;
    if (self.destinationPath) {
        url = [NSURL fileURLWithPath:self.destinationPath];
    } else {
        NSString * path = [floderPath stringByAppendingPathComponent:self.urlString.lastPathComponent];
        if (path.pathExtension.length < 1) {
            path = [path stringByAppendingPathExtension:@"mp4"];
        }
        url                  = [NSURL fileURLWithPath:path];
        self.destinationPath = path;
    }
    NSError * fileError;
    BOOL isfile = [fileManager moveItemAtURL:oldUrl toURL:url error:&fileError];
    if (!isfile) {
        handle(self, [fileError localizedDescription]);
    }
    NSLog(@"file==%d", isfile);
    NSLog(@"fileError==%@", [fileError localizedDescription]);
}

- (void)readDownloadProgressWithdidWriteData:(int64_t)bytesWritten
                           totalBytesWritten:(int64_t)totalBytesWritten
                   totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progress = 1.0 * totalBytesWritten / totalBytesExpectedToWrite;
        if (self->startTime) {
            CFAbsoluteTime startTimeValue = [self->startTime doubleValue];
            
            CGFloat downloadSpeed = (CGFloat)totalBytesWritten / (CGFloat)(CFAbsoluteTimeGetCurrent() - startTimeValue);
            
            if (downloadSpeed > 1024 * 1024 * 1024) {
                self.speed = [NSString stringWithFormat:@"%.2fGB/s", downloadSpeed / (1024 * 1024 * 1024)];
            } else if (downloadSpeed > 1024 * 1024) {
                self.speed = [NSString stringWithFormat:@"%.2fMB/s", downloadSpeed / (1024 * 1024)];
            } else if (downloadSpeed > 1024) {
                self.speed = [NSString stringWithFormat:@"%.2fKB/s", downloadSpeed / 1024];
            } else {
                self.speed = [NSString stringWithFormat:@"%.2fB/s", downloadSpeed];
            }
        } else {
            self->startTime = @(CFAbsoluteTimeGetCurrent());
        }
    });
    
}

#pragma mark - Setter -
- (void)setDestinationPath:(NSString *)destinationPath
{
    if (destinationPath) {
        NSAssert(![NSString wya_IsDirectory:destinationPath], @"该路径不能是文件夹");
        _destinationPath = destinationPath;
    }
}

@end
