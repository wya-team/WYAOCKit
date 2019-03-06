//
//  WYAUploader.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/5.
//

#import "WYAUploader.h"
#import <AliyunOSSiOS/OSSService.h>
@implementation WYAUploader

+ (instancetype)sharedUpload{
    static WYAUploader * loader;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loader = [[WYAUploader alloc]init];
    });
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


- (void)wya_uploadFileWithUrl:(NSString *)url
         beforeParamsCallback:(NSDictionary *(^)(void))before
                afterCallback:(void(^)(CGFloat progress, NSDictionary *  resultDic, NSError * error))after
{
    [WYAUploader getWithUrl:url Params:nil Success:^(NSDictionary * _Nonnull dic) {
        NSMutableDictionary * resultDic = [dic[@"data"] mutableCopy];
        NSDictionary * dataDic = before();

        if (dataDic) {
            [resultDic addEntriesFromDictionary:dataDic];
        }
        [self uploadALiYunWithDataDic:resultDic AfterCallback:after];

    } Fail:^(NSString * _Nonnull err) {
        after(0, @{@"status": @"0", @"msg":@"上传失败,参数获取错误", @"data":[NSNull null]}, nil);
    }];

}

- (void)uploadALiYunWithDataDic:(NSDictionary *)dataDic AfterCallback:(void(^)(CGFloat progress, NSDictionary *  resultDic, NSError * error))after{
    //初始化（AccessKey   SecretKey）
    id<OSSCredentialProvider> credential = [[OSSPlainTextAKSKPairCredentialProvider alloc] initWithPlainTextAccessKey:dataDic[@"OSSAccessKeyId"]                                                                                                            secretKey:dataDic[@"accessKeySecret"]];
//    NSError * err;
//    NSString * sign = [credential sign:dataDic[@"signature"] error:&err];
//    NSLog(@"err==%@",[err localizedDescription]);

    OSSClient *client = [[OSSClient alloc] initWithEndpoint:dataDic[@"host"] credentialProvider:credential];


    OSSPutObjectRequest * put = [OSSPutObjectRequest new];

    put.bucketName = dataDic[@"bucket"];

    if ([dataDic[@"uploadType"] isEqualToString:@"image"]) {

        NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
        NSTimeInterval time = [date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
        NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
        NSString * firstPath = [dataDic[@"dir"] stringByAppendingPathComponent:timeString];
        NSString *imageName = [[firstPath stringByAppendingPathComponent:dataDic[@"imageName"]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        put.objectKey = imageName;

        //设置上传文件格式（告诉浏览器这是图片，不然默认的是下载）
        put.contentType = @"image/png";

        //上传date（上传之后直接就是照片格式）
        NSData *data = UIImagePNGRepresentation(dataDic[@"image"]);
        put.uploadingData = data;//

        put.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
            // 当前上传段长度、当前已经上传总长度、一共需要上传的总长度
            after(totalBytesSent/totalBytesExpectedToSend*1.0, nil, nil);
        };
        
        // 阻塞直到上传完成
        NSLog(@"imageName==%@",imageName);
        OSSTask * putTask = [client putObject:put];
        [putTask waitUntilFinished];
        if (putTask.error) {
            NSLog(@"错误==%@",[putTask.error localizedDescription]);
            after(0, @{@"status": @"0", @"msg":@"上传失败", @"data":[NSNull null]}, nil);
        }else{
            NSLog(@"成功=%@",putTask.result);
            NSString * url = [NSString stringWithFormat:@"https://%@.%@/%@",dataDic[@"bucket"],dataDic[@"host"],imageName];
            after(1,
                  @{@"status": @"1",
                    @"msg":@"上传成功",
                    @"data":@{
                            @"url":url,
                            }},
                  nil);
        }
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

@end
