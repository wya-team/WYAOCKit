//
//  NSString+Encryption.h
//  WYAKit
//
//  Created by 李世航 on 2019/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Encryption)

@end

@interface NSString (MD5)
- (NSString *)wya_md5WithString; // MD5加密
- (NSString *)wya_to16MD5;
@end

@interface NSString (SHA)
- (NSString *)wya_sha1;
- (NSString *)wya_sha256;
- (NSString *)wya_sha512;
@end

NS_ASSUME_NONNULL_END
