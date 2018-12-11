//
//  WYADownloadModel.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WYADownloadState) {
    WYADownloadStateNormal, //正常状态
    WYADownloadStateWait, //等待下载
    WYADownloadStateDownloading, //正在下载
    WYADownloadStateSuspend, //下载暂停
    WYADownloadStateComplete, //下载完成
    WYADownloadStateFail, //下载失败
};

@interface WYADownloadModel : NSObject

@property (nonatomic, copy)   NSString * urlString;//下载地址
@property (nonatomic, copy)   NSString * destinationPath;//本地文件路径
@property (nonatomic, strong) NSData * resumeData;

@property (nonatomic, assign) CGFloat  progress; //进度
@property (nonatomic, assign) WYADownloadState  downloadState; //下载状态
@property (nonatomic, copy) NSString *  speed; //下载速度，直接显示就好

@end

NS_ASSUME_NONNULL_END
