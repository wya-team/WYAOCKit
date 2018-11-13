//
//  NSString+WYAVersionCompare.h
//  WYASDProject
//
//  Created by 李俊恒 on 2018/9/18.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WYAVersionCompare)
/**
 对比版本号
 
 @param v1 线上版本
 @param v2 当前系统版本
 @return 返回0（版本号相等）、1（提示用户更新）、-1（线上版本大于当前版本）
 */
+ (NSInteger)compareVersion:(NSString *)v1 to:(NSString *)v2;
@end
