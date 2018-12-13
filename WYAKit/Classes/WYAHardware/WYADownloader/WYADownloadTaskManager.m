//
//  WYADownloadTaskManager.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/12.
//

#import "WYADownloadTaskManager.h"
#define floderPath [[NSString wya_docPath] stringByAppendingPathComponent:@"WYADownload"]

@interface WYADownloadTaskManager ()

@end

@implementation WYADownloadTaskManager
{
    NSNumber * startTime;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)startDownloadWithSession:(NSURLSession *)session Model:(WYADownloadModel *)model{
    NSURL * url = [NSURL URLWithString:model.urlString];
    _urlString = model.urlString;
    self.destinationPath = model.destinationPath;
    self.downloadState = WYADownloadStateDownloading;
    self.downloadTask = [session downloadTaskWithURL:url];
    [self.downloadTask resume];
}

- (void)suspendDownload{
    self.downloadState = WYADownloadStateSuspend;
    [self.downloadTask suspend];
}

- (void)keepDownloadWithSession:(NSURLSession *)session ResumeData:(NSData *)data{
    self.downloadState = WYADownloadStateDownloading;
    if (session && data) {
        self.downloadTask = [session downloadTaskWithResumeData:data];
    }
    [self.downloadTask resume];
}

- (void)giveupDownload{
    self.downloadState = WYADownloadStateFail;
    [self.downloadTask cancel];
}

- (void)moveLocationPathWithOldUrl:(NSURL *)oldUrl{
    self.downloadState = WYADownloadStateComplete;
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSURL * url;
    if (self.destinationPath) {
        url = [NSURL fileURLWithPath:self.destinationPath];
    } else {
        NSString * path = [floderPath stringByAppendingPathComponent:_urlString.lastPathComponent];
        if (path.pathExtension.length<1) {
            path = [path stringByAppendingPathExtension:@"mp4"];
        }
        url = [NSURL fileURLWithPath:path];
        self.destinationPath = path;
    }
    NSError * fileError;
    BOOL isfile = [fileManager moveItemAtURL:oldUrl toURL:url error:&fileError];
    NSLog(@"file==%d",isfile);
    NSLog(@"fileError==%@",[fileError localizedDescription]);
}

- (void)readDownloadProgressWithdidWriteData:(int64_t)bytesWritten
                           totalBytesWritten:(int64_t)totalBytesWritten
                   totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    self.progress = 1.0*totalBytesWritten/totalBytesExpectedToWrite;
    self.downloadState = WYADownloadStateDownloading;
    NSLog(@"pro==%f",_progress);
    if (startTime) {
        CFAbsoluteTime startTimeValue = [startTime doubleValue];
        
        CGFloat downloadSpeed = (CGFloat)totalBytesWritten / (CGFloat)(CFAbsoluteTimeGetCurrent() - startTimeValue);
        
        if (downloadSpeed>1024*1024*1024) {
            self.speed = [NSString stringWithFormat:@"%.2fGB/s",downloadSpeed/(1024*1024*1024)];
        }else if (downloadSpeed>1024*1024) {
            self.speed = [NSString stringWithFormat:@"%.2fMB/s",downloadSpeed/(1024*1024)];
        }else if (downloadSpeed>1024){
            self.speed = [NSString stringWithFormat:@"%.2fKB/s",downloadSpeed/1024];
        }else{
            self.speed = [NSString stringWithFormat:@"%.2fB/s",downloadSpeed];
        }
    } else {
        startTime = @(CFAbsoluteTimeGetCurrent());
    }
}

#pragma mark - Setter -
-(void)setDestinationPath:(NSString *)destinationPath{
    
    if (destinationPath) {
        NSAssert(![NSString wya_IsDirectory:destinationPath], @"该路径不能是文件夹");
        _destinationPath = destinationPath;
    }
}

@end
