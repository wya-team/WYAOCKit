//
//  WYAUploader.h
//  WYAKit
//
//  Created by 李世航 on 2019/3/5.
//
//  上传视频功能和断点续传功能没有完善

#import <Foundation/Foundation.h>
#import "WYAUploadModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WYAUploader : NSObject

+ (instancetype)sharedUpload;

@property (nonatomic, strong) WYAUploadModel * uploadModel;

/**
 上传文件
 */
- (void)wya_uploadFile;

@end

NS_ASSUME_NONNULL_END
