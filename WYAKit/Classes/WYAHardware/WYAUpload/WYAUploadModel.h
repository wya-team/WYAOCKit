//
//  WYAUploadModel.h
//  WYAKit
//
//  Created by 李世航 on 2019/3/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 @{
 // 必传
 @"uploadType"://@"video",@"image",@"file"
 @"sync":

 // 以下按模块选则（image）
 @"image":<UIImage *>,
 @"imageName":@"",
 @"imageType":@"",//@"png",@"jpeg",
 @"imageCompressionRatio":0.5, // 0-1

 // video
 @"videoName":@"",
 @"videoData":<NSData *>,//videoData或者videoPath任选一个
 @"videoPath":@"",

 // file
 @"fileName":@"",
 @"fileData":<NSData *>,
 @"filePath":@"",
 }
 */
typedef NSDictionary *(^UploadBefore)(void);
typedef void(^UploadAfter)(CGFloat progress, NSDictionary *  resultDic, NSError * error);

@interface WYAUploadModel : NSObject

@property(nonatomic, copy) NSString * uploadUrl;
@property(nonatomic, copy) UploadBefore uploadBefore;
@property(nonatomic, copy) UploadAfter uploadAfter;
@end

NS_ASSUME_NONNULL_END
