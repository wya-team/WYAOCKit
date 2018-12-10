//
//  WYADownloadModel.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WYADownloadState) {
    WYADownloadModelNormal, //正常状态
    WYADownloadStateDownloading, //正在下载
    WYADownloadStateSuspend, //下载暂停
    WYADownloadStateComplete, //下载完成
    WYADownloadStateFail, //下载失败
};

@interface WYADownloadModel : NSObject

@property (nonatomic, copy)   NSString * urlString;
@property (nonatomic, copy)   NSString * destinationPath;//文件路径
@property (nonatomic, strong) NSData * resumeData;

@property (nonatomic, assign) CGFloat  progress;
@property (nonatomic, assign) WYADownloadState  downloadState;

@end

NS_ASSUME_NONNULL_END
