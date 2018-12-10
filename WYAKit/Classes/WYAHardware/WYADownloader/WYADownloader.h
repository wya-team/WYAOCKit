//
//  WYADownloader.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/6.
//

#import <Foundation/Foundation.h>
#import "WYADownloadModel.h"
NS_ASSUME_NONNULL_BEGIN

//typedef void(^DownloadBlock)(CGFloat progress, BOOL isFinish);

@interface WYADownloader : NSObject

+ (instancetype)sharedDownloader;

@property (nonatomic, assign) BOOL allowsCellularAccess;
@property (nonatomic, assign) NSUInteger  maxConcurrentOperationCount;

-(void)wya_DownloadTaskWithModel:(WYADownloadModel *)model;

-(void)wya_suspendDownloadWithModel:(WYADownloadModel *)model;

-(void)wya_giveupDownloadWithModel:(WYADownloadModel *)model;

-(void)wya_keepDownloadWithModel:(WYADownloadModel *)model;
@end

@interface WYADownloader (Config)



@end

NS_ASSUME_NONNULL_END
