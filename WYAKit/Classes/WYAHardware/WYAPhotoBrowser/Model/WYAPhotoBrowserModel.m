//
//  WYAPhotoBrowserModel.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/15.
//

#import "WYAPhotoBrowserModel.h"

@implementation WYAPhotoBrowserModel

//- (PHImageRequestID)requestThumbImageCompletion:(WYAImageModelRequestSuccessBlock)requestBlock{
//    PHImageManager * manager    = [PHImageManager defaultManager];
//    PHImageRequestOptions * opi = [[PHImageRequestOptions alloc] init];
//    //        opi.synchronous = YES; //默认no，异步加载
//    opi.resizeMode = PHImageRequestOptionsResizeModeFast;
//    //            opi.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
//    // 从iCloud上下载图片
//    opi.networkAccessAllowed = YES;
//    // 图片获取进度
//    opi.progressHandler = ^(double progress, NSError * _Nullable error, BOOL * _Nonnull stop, NSDictionary * _Nullable info) {
//        NSLog(@"progress==%f,errror==%@,stop==%d,info==%@", progress, [error localizedDescription], *stop, info);
//    };
//    WeakSelf(weakSelf);
//    return [manager requestImageForAsset:self.asset
//                       targetSize:self.requestSize
//                      contentMode:PHImageContentModeAspectFill
//                          options:opi
//                    resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
//                        NSLog(@"imageinfo==%@", info);
//                        requestBlock(result, weakSelf, info);
//                    }];
//}



@end
