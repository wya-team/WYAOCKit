//
//  NSString+MD5.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)
- (NSString *)wya_md5WithString; // MD5加密
- (NSString *)wya_to16MD5;
- (NSString *)wya_sha1;
- (NSString *)wya_sha256;
- (NSString *)wya_sha512;
@end
