//
//  WYADownloadModel.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/10.
//

#import "WYADownloadModel.h"

@implementation WYADownloadModel

-(void)setDestinationPath:(NSString *)destinationPath{
    if (destinationPath) {
        NSAssert(![NSString wya_IsDirectory:destinationPath], @"该路径不能是文件夹");
        _destinationPath = destinationPath;
    }
}

@end
