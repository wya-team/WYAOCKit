//
//  NSString+MD5.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)
- (NSString *)md5WithString; //MD5加密
- (NSString *)to16MD5;
- (NSString *)sha1;
- (NSString *)sha256;
- (NSString *)sha512;
@end
