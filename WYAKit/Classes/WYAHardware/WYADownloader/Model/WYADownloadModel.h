//
//  WYADownloadModel.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYADownloadModel : NSObject <NSCopying>

@property (nonatomic, copy) NSString * urlString;       //下载地址
@property (nonatomic, copy) NSString * destinationPath; //本地文件路径

@end

NS_ASSUME_NONNULL_END
