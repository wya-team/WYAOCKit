//
//  WYADownloader.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DownloadBlock)(CGFloat progress, BOOL isFinish);

@interface WYADownloader : NSObject

+ (instancetype)sharedDownloader;

-(void)wya_DownloadTaskWithUrl:(NSString *)urlString;

-(void)wya_DownloadTaskWithUrl:(NSString *)urlString FilePath:(NSString *)filePath DownloadHandle:(DownloadBlock)handle;

-(void)wya_suspendDownload;

-(void)wya_giveupDownload:(void(^)(BOOL result))giveup;

-(void)wya_keepDownload;
@end

NS_ASSUME_NONNULL_END
