//
//  WYADownloadTaskManager.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/12.
//

#import "WYADownloadModel.h"
#define floderPath [[NSString wya_docPath] stringByAppendingPathComponent:@"WYADownload"]

@interface WYADownloadModel ()
@property (nonatomic, strong) UIImage * videoImg;
@property (nonatomic, copy) NSString * localPath;
@end

@implementation WYADownloadModel {
    NSNumber * startTime;
}
- (instancetype)init {
    self = [super init];
    if (self) { _downloadState = WYADownloadStateDownloading; }
    return self;
}

- (void)startDownloadWithSession:(NSURLSession *)session {
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

    if (!self.videoImg) {
        if (!self.imageData) {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                UIImage * image =
                    [UIImage wya_getVideoPreViewImage:[NSURL URLWithString:self.urlString]];
                self.imageData = UIImagePNGRepresentation(image);
                dispatch_sync(dispatch_get_main_queue(), ^{
                    self.videoImg = image;
                    if (self.imageCallback) { self.imageCallback(image); }
                });
            });
        } else {
            dispatch_sync(dispatch_get_main_queue(),
                          ^{ self.videoImg = [UIImage imageWithData:self.imageData]; });
        }
    }
    dispatch_sync(dispatch_get_main_queue(), ^{
        self.downloadState          = WYADownloadStateDownloading;
        NSFileManager * fileManager = [NSFileManager defaultManager];

        if (!self.localPath) {
            NSString * path =
                [floderPath stringByAppendingPathComponent:self.urlString.lastPathComponent];
            if (path.pathExtension.length < 1) {
                path = [path stringByAppendingPathExtension:@"mp4"];
            }
            self.localPath = path;
            if (![fileManager fileExistsAtPath:self.localPath]) {
                [fileManager createFileAtPath:self.localPath contents:nil attributes:nil];
            }
        }
    });
}

- (void)suspendDownload {
    self.downloadState = WYADownloadStateSuspend;

    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        self.downloadData = resumeData;
    }];
}

- (void)keepDownloadWithSession:(NSURLSession *)session ResumeData:(NSData *)data {
    self.downloadState = WYADownloadStateDownloading;

    self.downloadTask = [session downloadTaskWithResumeData:self.downloadData];
    [self.downloadTask resume];
}

- (void)giveupDownload {
    self.downloadState = WYADownloadStateFail;

    [self.downloadTask cancel];
}

- (void)moveLocationPathWithOldUrl:(NSURL *)oldUrl
                            handle:
                                (void (^)(WYADownloadModel * manager, NSString * errorInfo))handle {
    //    NSFileManager * fileManager = [NSFileManager defaultManager];
    //    NSError * fileError;
    //    BOOL isfile = [fileManager moveItemAtURL:oldUrl toURL:[NSURL
    //    fileURLWithPath:self.localPath] error:&fileError];
    //    NSLog(@"file=dsd=%d", isfile);
    //    NSLog(@"fileError==%@",fileError.localizedDescription);
    //    if (!isfile) {
    //        handle(self, [fileError localizedDescription]);
    //    }

    NSData * data = [NSData dataWithContentsOfURL:oldUrl];
    BOOL isfile   = [data writeToFile:self.localPath atomically:YES];
    if (!isfile) { handle(self, @"数据有误，请重新下载"); }
    NSLog(@"file=dsd=%d", isfile);

    dispatch_sync(dispatch_get_main_queue(), ^{
        if (isfile) {
            self.downloadState = WYADownloadStateComplete;
        } else {
            self.downloadState = WYADownloadStateFail;
        }
    });
}

- (void)readDownloadProgressWithdidWriteData:(int64_t)bytesWritten
                           totalBytesWritten:(int64_t)totalBytesWritten
                   totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progress = 1.0 * totalBytesWritten / totalBytesExpectedToWrite;
        if (totalBytesExpectedToWrite > 1024 * 1024 * 1024) {
            self.fileSize =
                [NSString stringWithFormat:@"%2.fGB", (double)totalBytesExpectedToWrite /
                                                          (1024 * 1024 * 1024)];
        } else if (totalBytesExpectedToWrite > 1024 * 1024) {
            self.fileSize = [NSString
                stringWithFormat:@"%2.fMB", (double)totalBytesExpectedToWrite / (1024 * 1024)];
        } else if (totalBytesExpectedToWrite > 1024) {
            self.fileSize =
                [NSString stringWithFormat:@"%2.fMB", (double)totalBytesExpectedToWrite / 1024];
        } else {
            self.fileSize =
                [NSString stringWithFormat:@"%2.fMB", (double)totalBytesExpectedToWrite];
        }
        if (self->startTime) {
            CFAbsoluteTime startTimeValue = [self->startTime doubleValue];

            CGFloat downloadSpeed =
                (CGFloat)totalBytesWritten / (CGFloat)(CFAbsoluteTimeGetCurrent() - startTimeValue);

            if (downloadSpeed > 1024 * 1024 * 1024) {
                self.speed =
                    [NSString stringWithFormat:@"%.2fGB/s", downloadSpeed / (1024 * 1024 * 1024)];
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
        if (self.downloadState == WYADownloadStateSuspend) { self.speed = @"0KB/s"; }
    });
}

#pragma mark - Setter -
- (void)setLocalPath:(NSString *)localPath {
    _localPath = localPath;
}

#pragma mark - Getter -
- (UIImage *)videoImage {
    return [UIImage imageWithData:self.imageData];
}

- (NSString *)destinationPath {
    return self.localPath;
}

@end
