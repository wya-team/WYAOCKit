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


 // file
 @"fileName":@"",
 @"fileData":<NSData *>,
 @"filePath":@"",
 }
 */
typedef NS_ENUM(NSInteger, WYAUploadFileType) {
    WYAUploadFileTypeImage,
    WYAUploadFileTypeVideo,
    WYAUploadFileTypeFile,
};

typedef NS_ENUM(NSInteger, WYAUploadImageType) {
    WYAUploadImageTypePNG,
    WYAUploadImageTypeJPEG,
};

typedef NSDictionary *(^UploadBefore)(void);
typedef void(^UploadAfter)(BOOL isfinish, NSMutableArray * resultArray);

@interface WYAUploadModel : NSObject
/// 获取上传图片至阿里云的参数的地址
@property(nonatomic, copy) NSString * uploadUrl;
/// 上传之前回调
@property(nonatomic, copy) UploadBefore uploadBefore;
/// 上传之后回调
@property(nonatomic, copy) UploadAfter uploadAfter;
/// 是否同步
@property (nonatomic, assign) BOOL sync;
/// 上传文件类型
@property (nonatomic, assign) WYAUploadFileType fileType;
/// 上传文件名称
@property (nonatomic, copy) NSString * fileName;
/*********上传image使用*******/
/// 图片类型
@property (nonatomic, assign) WYAUploadImageType imageType;
/// 图片压缩比例只有在 WYAUploadImageTypeJPEG 有效
@property (nonatomic, assign) CGFloat imageCompressionRatio;
/// 图片数组
@property (nonatomic, strong) NSMutableArray<UIImage *> * imageArray;
/*********上传video使用*******/
/// 视频数组（任选一个）
@property (nonatomic, strong) NSMutableArray<NSData *> * videoDataArray;
///// 视频数组（任选一个）
//@property (nonatomic, strong) NSMutableArray<NSString *> * videoPathArray;
/*********上传video使用*******/
/// 文件数组（任选一个）
@property (nonatomic, strong) NSMutableArray<NSData *> * fileDataArray;
///// 文件数组（任选一个）
//@property (nonatomic, strong) NSMutableArray<NSString *> * filePathArray;
@end

NS_ASSUME_NONNULL_END
