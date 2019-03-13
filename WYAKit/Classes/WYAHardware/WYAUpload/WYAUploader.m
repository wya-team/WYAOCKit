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
@end

@implementation WYAUploader

+ (instancetype)sharedUpload{
    static WYAUploader * loader;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loader = [[WYAUploader alloc]init];
    });
    loader.uploadModel = nil;
    return loader;
}

+ (AFHTTPSessionManager *)AFManager
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    // 超过时间
    manager.requestSerializer.timeoutInterval = 6;

    // 声明上传的是json格式的参数，需要你和后台约定好，不然会出现后台无法获取到你上传的参数问题
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 上传普通格式
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传JSON格式

    // 声明获取到的数据格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    //        manager.responseSerializer = [AFJSONResponseSerializer serializer]; // AFN会JSON解析返回的数据
    // 个人建议还是自己解析的比较好，有时接口返回的数据不合格会报3840错误，大致是AFN无法解析返回来的数据
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain",@"text/xml", nil];
    return manager;
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
        self.uploadModel.uploadAfter(0,
                                     @{
                                       @"status": @"0",
                                       @"msg": @"上传失败,参数获取错误",
                                       @"data": [NSNull null]
                                       },
                                     err);
    }];

}

- (void)uploadALiYunWithDataDic:(NSDictionary *)dataDic
                  AfterCallback:(void(^)(CGFloat progress, NSDictionary *  resultDic, NSError * error))after
{
    id<OSSCredentialProvider> credential = [[OSSPlainTextAKSKPairCredentialProvider alloc] initWithPlainTextAccessKey:dataDic[@"OSSAccessKeyId"]                                                                                                            secretKey:dataDic[@"accessKeySecret"]];
    self.client = [[OSSClient alloc] initWithEndpoint:dataDic[@"host"] credentialProvider:credential];
    OSSPutObjectRequest * put = [OSSPutObjectRequest new];
    put.bucketName = dataDic[@"bucket"];
    put.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
        // 当前上传段长度、当前已经上传总长度、一共需要上传的总长度
        after(totalBytesSent/totalBytesExpectedToSend*1.0, nil, nil);
    };
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time = [date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString * timeString = [NSString stringWithFormat:@"%.0f", time];
    NSString * firstPath = [dataDic[@"dir"] stringByAppendingPathComponent:timeString];
    NSString * fileName;
    if ([dataDic[@"uploadType"] isEqualToString:@"image"]) {

        fileName = [[firstPath stringByAppendingPathComponent:dataDic[@"imageName"]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        put.objectKey = fileName;

        //设置上传文件格式（告诉浏览器这是图片，不然默认的是下载）
        if ([dataDic[@"imageType"] isEqualToString:@"png"]) {
            put.contentType = @"image/png";
            NSData *data = UIImagePNGRepresentation(dataDic[@"image"]);
            put.uploadingData = data;
        } else if ([dataDic[@"imageType"] isEqualToString:@"jpeg"]) {
            put.contentType = @"image/jpeg";
            NSData *data = UIImageJPEGRepresentation(dataDic[@"image"], [dataDic[@"imageCompressionRatio"] floatValue]);
            put.uploadingData = data;
        }


    }else if ([dataDic[@"uploadType"] isEqualToString:@"video"]) {
        fileName = [[firstPath stringByAppendingPathComponent:dataDic[@"videoName"]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        put.objectKey = fileName;
        if (dataDic[@"videoData"]) {
            put.uploadingData = dataDic[@"videoData"];
        }
        if (dataDic[@"videoPath"]) {
            put.uploadingFileURL = dataDic[@"videoPath"];
        }
    }else if ([dataDic[@"uploadType"] isEqualToString:@"file"]) {
        fileName = [[firstPath stringByAppendingPathComponent:dataDic[@"fileName"]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        put.objectKey = fileName;
        if (dataDic[@"fileData"]) {
            put.uploadingData = dataDic[@"fileData"];
        }
        if (dataDic[@"filePath"]) {
            put.uploadingFileURL = dataDic[@"filePath"];
        }
    }

    // 阻塞直到上传完成
    OSSTask * putTask = [self.client putObject:put];
    if ([dataDic[@"sync"] integerValue] == 1) {
        [putTask waitUntilFinished];
        if (putTask.error) {
            NSLog(@"错误==%@",[putTask.error localizedDescription]);
            after(0,
                  @{
                    @"status": @"0",
                    @"msg": @"上传失败",
                    @"data": [NSNull null],
                    },
                  nil);
        }else{
            NSLog(@"成功=%@",putTask.result);
            NSString * url = [NSString stringWithFormat:@"https://%@.%@/%@",dataDic[@"bucket"],dataDic[@"host"],fileName];
            after(1,
                  @{@"status": @"1",
                    @"msg": @"上传成功",
                    @"data": @{
                                @"url":url,
                            }
                    },
                  nil);
        }
    }else {
        [putTask continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
            if (putTask.error) {
                NSLog(@"错误==%@",[putTask.error localizedDescription]);
                after(0,
                      @{
                        @"status": @"0",
                        @"msg": @"上传失败",
                        @"data": [NSNull null]
                        },
                      nil);
            }else{
                NSLog(@"成功=%@",putTask.result);
                NSString * url = [NSString stringWithFormat:@"https://%@.%@/%@",dataDic[@"bucket"],dataDic[@"host"],fileName];
                after(1,
                      @{@"status": @"1",
                        @"msg": @"上传成功",
                        @"data": @{
                                    @"url":url,
                                 }},
                      nil);
            }
            return nil;
        }];
    }
}

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

-(void)setUploadModel:(WYAUploadModel *)uploadModel{
    _model = uploadModel;
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
