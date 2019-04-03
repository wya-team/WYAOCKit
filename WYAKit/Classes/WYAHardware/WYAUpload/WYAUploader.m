//
//  WYAUploader.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/5.
//

#import "WYAUploader.h"
#import <AliyunOSSiOS/OSSService.h>
#import "WYAKitInstance.h"

@interface WYAUploader ()
@property(nonatomic, strong) WYAUploadModel * model;
@property(nonatomic, strong) OSSClient * client;
@property (nonatomic, strong) NSDictionary * aliyunParams;
@end

@implementation WYAUploader

#pragma mark ======= Public Method
+ (instancetype)sharedUpload{
    static WYAUploader * loader;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loader = [[WYAUploader alloc]init];
    });
    loader.uploadModel = nil;
    return loader;
}

- (void)wya_uploadFile{
    NSLog(@"url==%@",self.uploadModel.uploadUrl);
    [WYAUploader getWithUrl:self.uploadModel.uploadUrl Params:nil Success:^(NSDictionary * _Nonnull dic) {
        NSMutableDictionary * resultDic = [dic[@"data"] mutableCopy];
        NSDictionary * dataDic = self.uploadModel.uploadBefore();

        if (dataDic) {
            [resultDic addEntriesFromDictionary:dataDic];
        }
        
        [self uploadALiYunWithDataDic:resultDic AfterCallback:self.uploadModel.uploadAfter];

    } Fail:^(NSString * _Nonnull err) {
        self.uploadModel.uploadAfter(NO,
                                     @[@{
                                           @"status": @"0",
                                           @"msg": @"上传失败,参数获取错误",
                                           @"data": [NSNull null]
                                           },]);
    }];

}

- (void)uploadALiYunWithDataDic:(NSDictionary *)dataDic
                  AfterCallback:(void(^)(BOOL isfinish, NSMutableArray * resultArray))after
{
    id<OSSCredentialProvider> credential = [[OSSPlainTextAKSKPairCredentialProvider alloc] initWithPlainTextAccessKey:dataDic[@"OSSAccessKeyId"]                                                                                                            secretKey:dataDic[@"accessKeySecret"]];
    self.client = [[OSSClient alloc] initWithEndpoint:dataDic[@"host"] credentialProvider:credential];

//    if ([dataDic.allKeys containsObject:@"uploadType"]) {
//        if ([dataDic[@"uploadType"] isEqualToString:@""]) {
//
//        }
//    }else {
//        self.uploadModel.uploadAfter(0,
//                                     @{
//                                       @"status": @"0",
//                                       @"msg": @"上传失败,参数获取错误",
//                                       @"data": [NSNull null]
//                                       },
//                                     nil);
//    }

    switch (self.uploadModel.fileType) {
        case WYAUploadFileTypeImage:
            [self uploadImageWithDataDic:dataDic AfterCallback:after];
            break;
        case WYAUploadFileTypeVideo:
            [self uploadVideoWithDataDic:dataDic AfterCallback:after];
            break;
        case WYAUploadFileTypeFile:
            [self uploadFileWithDataDic:dataDic AfterCallback:after];
            break;
        default:
            break;
    }
}

- (void)uploadImageWithDataDic:(NSDictionary *)dataDic
                 AfterCallback:(void(^)(BOOL isfinish, NSMutableArray * resultArray))after{
    NSMutableArray * array = [NSMutableArray array];
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = self.uploadModel.imageArray.count;
    if (self.uploadModel.imageArray.count > 0) {
        for (UIImage * image in self.uploadModel.imageArray) {
            NSBlockOperation * operation = [NSBlockOperation blockOperationWithBlock:^{
                OSSPutObjectRequest * put = [OSSPutObjectRequest new];
                put.bucketName = dataDic[@"bucket"];
//                put.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
//
//                };
                NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
                NSTimeInterval time = [date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
                NSString * timeString = [NSString stringWithFormat:@"%.0f", time];
                NSString * firstPath = [dataDic[@"dir"] stringByAppendingPathComponent:timeString];
                NSString * fileName = [[firstPath stringByAppendingPathComponent:self.uploadModel.fileName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                put.objectKey = fileName;
                switch (self.uploadModel.imageType) {
                    case WYAUploadImageTypePNG:
                    {
                        put.contentType = @"image/png";
                    }
                        break;
                    case WYAUploadImageTypeJPEG:
                    {
                        put.contentType = @"image/jpeg";
                    }
                        break;
                    default:
                        break;
                }
                put.uploadingData = [self dataWithImage:image];
                // 阻塞直到上传完成
                OSSTask * putTask = [self.client putObject:put];
                [putTask waitUntilFinished];
                if (putTask.error) {
                    NSLog(@"错误==%@",[putTask.error localizedDescription]);
                    NSDictionary * dic = @{
                                           @"image":image,
                                           @"error":putTask.error,
                                           };
                    [array addObject:dic];
                }else{
                    NSLog(@"成功=%@",putTask.result);
                    NSString * url = [NSString stringWithFormat:@"https://%@.%@/%@",dataDic[@"bucket"],dataDic[@"host"],fileName];
                    NSDictionary * dic = @{
                                           @"url":url,
                                           };
                    [array addObject:dic];
                }
                if (!self.uploadModel.sync) {
                    if (image == self.uploadModel.imageArray.lastObject) {
                        after(YES, array);

                    }
                }
            }];
            if (queue.operations.count != 0) {
                [operation addDependency:queue.operations.lastObject];
            }
            [queue addOperation:operation];
        }
        if (self.uploadModel.sync) {
            [queue waitUntilAllOperationsAreFinished];
            after(YES, array);
        }
    } else {
        [array addObject:@{@"result":@"上传图片不能为空"}];
        after(NO, array);
    }


}

- (NSData *)dataWithImage:(UIImage *)image{
    switch (self.uploadModel.imageType) {
        case WYAUploadImageTypePNG:
            return UIImagePNGRepresentation(image);
        case WYAUploadImageTypeJPEG:
            return UIImageJPEGRepresentation(image, self.uploadModel.imageCompressionRatio);
        default:
            return nil;
    }
}

- (void)uploadVideoWithDataDic:(NSDictionary *)dataDic
                 AfterCallback:(void(^)(BOOL isfinish, NSMutableArray * resultArray))after{
    NSMutableArray * array = [NSMutableArray array];
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = self.uploadModel.videoDataArray.count;
    if (self.uploadModel.videoDataArray.count > 0) {
        for (NSData * data in self.uploadModel.videoDataArray) {
            NSBlockOperation * operation = [NSBlockOperation blockOperationWithBlock:^{
                OSSPutObjectRequest * put = [OSSPutObjectRequest new];
                put.bucketName = dataDic[@"bucket"];
//                put.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
//                    // 当前上传段长度、当前已经上传总长度、一共需要上传的总长度
//
//                };
                NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
                NSTimeInterval time = [date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
                NSString * timeString = [NSString stringWithFormat:@"%.0f", time];
                NSString * firstPath = [dataDic[@"dir"] stringByAppendingPathComponent:timeString];
                NSString * fileName = [[firstPath stringByAppendingPathComponent:self.uploadModel.fileName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                put.objectKey = fileName;
                put.uploadingData = data;
//                put.uploadingFileURL =
                // 阻塞直到上传完成
                OSSTask * putTask = [self.client putObject:put];
                [putTask waitUntilFinished];
                if (putTask.error) {
                    NSLog(@"错误==%@",[putTask.error localizedDescription]);
                    NSDictionary * dic = @{
                                           @"videoData":data,
                                           @"error":putTask.error,
                                           };
                    [array addObject:dic];
                }else{
                    NSLog(@"成功=%@",putTask.result);
                    NSString * url = [NSString stringWithFormat:@"https://%@.%@/%@",dataDic[@"bucket"],dataDic[@"host"],fileName];
                    NSDictionary * dic = @{
                                           @"url":url,
                                           };
                    [array addObject:dic];
                }
                if (!self.uploadModel.sync) {
                    if (data == self.uploadModel.videoDataArray.lastObject) {
                        after(YES, array);
                    }
                }
            }];
            if (queue.operations.count != 0) {
                [operation addDependency:queue.operations.lastObject];
            }
            [queue addOperation:operation];
        }
        if (self.uploadModel.sync) {
            [queue waitUntilAllOperationsAreFinished];
            after(YES, array);
        }
    } else {
        [array addObject:@{@"result":@"上传视频数据不能为空"}];
        after(NO, array);
    }
}

- (void)uploadFileWithDataDic:(NSDictionary *)dataDic
                AfterCallback:(void(^)(BOOL isfinish, NSMutableArray * resultArray))after{
    NSMutableArray * array = [NSMutableArray array];
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = self.uploadModel.fileDataArray.count;
    if (self.uploadModel.fileDataArray.count > 0) {
        for (NSData * data in self.uploadModel.fileDataArray) {
            NSBlockOperation * operation = [NSBlockOperation blockOperationWithBlock:^{
                OSSPutObjectRequest * put = [OSSPutObjectRequest new];
                put.bucketName = dataDic[@"bucket"];
//                put.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
//                    // 当前上传段长度、当前已经上传总长度、一共需要上传的总长度
//                    after(totalBytesSent/totalBytesExpectedToSend*1.0, nil, nil);
//                };
                NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
                NSTimeInterval time = [date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
                NSString * timeString = [NSString stringWithFormat:@"%.0f", time];
                NSString * firstPath = [dataDic[@"dir"] stringByAppendingPathComponent:timeString];
                NSString * fileName = [[firstPath stringByAppendingPathComponent:self.uploadModel.fileName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                put.objectKey = fileName;
                put.uploadingData = data;
                //                put.uploadingFileURL =
                // 阻塞直到上传完成
                OSSTask * putTask = [self.client putObject:put];
                [putTask waitUntilFinished];
                if (putTask.error) {
                    NSLog(@"错误==%@",[putTask.error localizedDescription]);
                    NSDictionary * dic = @{
                                           @"videoData":data,
                                           @"error":putTask.error,
                                           };
                    [array addObject:dic];
                }else{
                    NSLog(@"成功=%@",putTask.result);
                    NSString * url = [NSString stringWithFormat:@"https://%@.%@/%@",dataDic[@"bucket"],dataDic[@"host"],fileName];
                    NSDictionary * dic = @{
                                           @"url":url,
                                           };
                    [array addObject:dic];
                }
                if (!self.uploadModel.sync) {
                    if (data == self.uploadModel.fileDataArray.lastObject) {
                        after(YES, array);
                    }
                }
            }];
            if (queue.operations.count != 0) {
                [operation addDependency:queue.operations.lastObject];
            }
            [queue addOperation:operation];
        }
        if (self.uploadModel.sync) {
            [queue waitUntilAllOperationsAreFinished];
            after(YES, array);
        }
    } else {
        [array addObject:@{@"result":@"上传视频数据不能为空"}];
        after(NO, array);
    }
}

#pragma mark ======= Private Method
+ (void)getWithUrl:(NSString *)urlString
            Params:(NSMutableDictionary *)params
           Success:(void(^)(NSDictionary * dic))success
              Fail:(void(^)(NSString * err))fail
{
    AFHTTPSessionManager *manager = [self AFManager];

    [manager GET:urlString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSDictionary * jsonObj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        success(jsonObj);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        fail(error.localizedDescription);

    }];

}

#pragma mark ======= Setter
-(void)setUploadModel:(WYAUploadModel *)uploadModel{
    _model = uploadModel;
}

#pragma mark ======= Getter
+ (AFHTTPSessionManager *)AFManager
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 6;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain",@"text/xml", nil];
    return manager;
}

-(WYAUploadModel *)uploadModel{
    if (_model) {
        return _model;
    }
    WYAKitInstance * instance = [WYAKitInstance sharedInstance];
    if (instance.uploadModel) {
        return instance.uploadModel;
    }
    return nil;
}

@end
