//
//  WYADownloadTaskManager.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/12.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WYADownloadState) {
    WYADownloadStateNormal,      //正常状态
    WYADownloadStateWait,        //等待下载
    WYADownloadStateDownloading, //正在下载
    WYADownloadStateSuspend,     //下载暂停
    WYADownloadStateComplete,    //下载完成
    WYADownloadStateFail,        //下载失败,或者被删除
};

@interface WYADownloadModel : NSObject

@property (nonatomic, copy) NSString * urlString;                      //下载地址（需要解码）
@property (nonatomic, copy) NSString * destinationPath;                //本地文件路径
@property (nonatomic, assign) CGFloat progress;                        //进度
@property (nonatomic, copy) NSString * speed;                          //下载速度，直接显示就好
@property (nonatomic, assign) WYADownloadState downloadState;          //下载状态
@property (nonatomic, strong) NSURLSessionDownloadTask * downloadTask; //下载任务
@property (nonatomic, strong) NSData * downloadData;

//以下方法请勿调用
- (void)startDownloadWithSession:(NSURLSession *)session;
- (void)suspendDownload;
- (void)keepDownloadWithSession:(NSURLSession *)session ResumeData:(NSData *)data;
- (void)giveupDownload;
- (void)moveLocationPathWithOldUrl:(NSURL *)oldUrl handle:(void (^)(WYADownloadModel * manager, NSString * errorInfo))handle;
- (void)readDownloadProgressWithdidWriteData:(int64_t)bytesWritten
                           totalBytesWritten:(int64_t)totalBytesWritten
                   totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite;

@end

NS_ASSUME_NONNULL_END
