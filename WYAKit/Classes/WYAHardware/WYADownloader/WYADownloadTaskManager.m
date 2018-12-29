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
        _isSuccess = NO;
        _downloadState = WYADownloadStateDownloading;
    }
    return self;
}

- (void)startDownloadWithSession:(NSURLSession *)session Model:(WYADownloadModel *)model{
    //    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    //    [request setHTTPMethod:@"HEAD"];
    //    self.downloadTask = [session downloadTaskWithRequest:request];
//    NSString * utf8String = [model.urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //这里需要判断是编码还是解码
    NSString * utf8String = [model.urlString stringByRemovingPercentEncoding];
    NSURL * url = [NSURL URLWithString:utf8String];
    _urlString = utf8String;
    _model = model;
    self.destinationPath = model.destinationPath;
    self.downloadTask = [session downloadTaskWithURL:url];
    [self.downloadTask resume];
    self.downloadState = WYADownloadStateDownloading;
}

- (void)suspendDownload{
    
    self.downloadState = WYADownloadStateSuspend;
    NSLog(@"下载暂停");
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        self.downloadData = resumeData;
    }];

}

- (void)keepDownloadWithSession:(NSURLSession *)session ResumeData:(NSData *)data{
    self.downloadState = WYADownloadStateDownloading;
    self.downloadTask = [session downloadTaskWithResumeData:self.downloadData];
    [self.downloadTask resume];
    
}

- (void)giveupDownload{
    self.downloadState = WYADownloadStateFail;
    [self.downloadTask cancel];
}

- (void)moveLocationPathWithOldUrl:(NSURL *)oldUrl handle:(void(^)(WYADownloadTaskManager * manager))handle{
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
    if (!isfile) {
        handle(self);
    }
    NSLog(@"file==%d",isfile);
    NSLog(@"fileError==%@",[fileError localizedDescription]);
}

- (void)readDownloadProgressWithdidWriteData:(int64_t)bytesWritten
                           totalBytesWritten:(int64_t)totalBytesWritten
                   totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    if (totalBytesExpectedToWrite>0) {
        _isSuccess = YES;
    }
    self.progress = 1.0*totalBytesWritten/totalBytesExpectedToWrite;
//    NSLog(@"taskManager91");
//    NSLog(@"pro==%f",_progress);
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
