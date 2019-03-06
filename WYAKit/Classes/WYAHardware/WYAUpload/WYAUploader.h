//
//  WYAUploader.h
//  WYAKit
//
//  Created by 李世航 on 2019/3/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAUploader : NSObject
+ (instancetype)sharedUpload;

/**
 上传文件
 before中返回字典数据应该为
 @{
 @"uploadType"://@"video",@"image",@"file"
 @"image":<UIImage *>,
 @"imageName":@"",
 @"data":<NSData *>,
 @"videoPath":@"",
 }
 @param before 上传之前操作
 @param after 上传之后返回结果
 */
- (void)wya_uploadFileWithUrl:(NSString *)url
         beforeParamsCallback:(NSDictionary *(^)(void))before
                afterCallback:(void(^)(CGFloat progress, NSDictionary *  resultDic, NSError * error))after;

@end

NS_ASSUME_NONNULL_END
