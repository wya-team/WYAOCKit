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
/// 下载地址（需要解码）
@property (nonatomic, copy) NSString * urlString;
/// 本地文件路径
@property (nonatomic, copy, readonly) NSString * destinationPath;
/// 下载内容标题
@property (nonatomic, copy) NSString * title;
/// 文件大小
@property (nonatomic, copy) NSString * fileSize;
/**************KVO监听**************/
/// 进度
@property (nonatomic, assign) CGFloat progress;
/// 下载速度，直接显示就好
@property (nonatomic, copy) NSString * speed;
/// 下载状态
@property (nonatomic, assign) WYADownloadState downloadState;


/// 下载任务
@property (nonatomic, strong) NSURLSessionDownloadTask * downloadTask;
/// 下载保存数据
@property (nonatomic, strong) NSData * downloadData;
/// 图片第一帧图片(用于储存数据库)
@property (nonatomic, strong) NSData * imageData;
/// 视频第一帧图片
@property (nonatomic, strong) UIImage * videoImage;

@property (nonatomic, copy) void (^imageCallback)(UIImage * image);


//以下方法请勿调用
- (void)startDownloadWithSession:(NSURLSession *)session;
- (void)suspendDownload;
- (void)keepDownloadWithSession:(NSURLSession *)session ResumeData:(NSData *)data;
- (void)giveupDownload;
- (void)moveLocationPathWithOldUrl:(NSURL *)oldUrl
                            handle:
(void (^)(WYADownloadModel * manager, NSString * errorInfo))handle;
- (void)readDownloadProgressWithdidWriteData:(int64_t)bytesWritten
                           totalBytesWritten:(int64_t)totalBytesWritten
                   totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite;

@end

NS_ASSUME_NONNULL_END
