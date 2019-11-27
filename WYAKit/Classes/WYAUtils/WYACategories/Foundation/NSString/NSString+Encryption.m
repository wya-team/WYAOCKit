//
//  NSString+Encryption.m
//  WYAKit
//
//  Created by 李世航 on 2019/6/22.
//

#import "NSString+Encryption.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Encryption)

@end

@implementation NSString (MD5)
- (NSString *)wya_md5WithString
{
    if (self == nil || [self length] == 0) {
        return nil;
    }

    const char * value = [self UTF8String];

    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);

    NSMutableString * outputString =
    [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++) {
        [outputString appendFormat:@"%02x", outputBuffer[count]];
    }

    return outputString;
}

- (NSString *)wya_to16MD5
{
    if (self == nil || [self length] == 0) {
        return nil;
    }

    return [[self wya_md5WithString] substringWithRange:NSMakeRange(8, 16)];
}
@end

@implementation NSString (SHA)

- (NSString *)wya_sha1
{
    if (self == nil || [self length] == 0) {
        return nil;
    }

    unsigned char digest[CC_SHA1_DIGEST_LENGTH], i;
    CC_SHA1([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString * ms = [NSMutableString string];

    for (i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [ms appendFormat:@"%02x", (int)(digest[i])];
    }

    return [ms copy];
}

- (NSString *)wya_sha256
{
    if (self == nil || [self length] == 0) {
        return nil;
    }

    unsigned char digest[CC_SHA256_DIGEST_LENGTH], i;
    CC_SHA256([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding],
              digest);
    NSMutableString * ms = [NSMutableString string];

    for (i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [ms appendFormat:@"%02x", (int)(digest[i])];
    }

    return [ms copy];
}

- (NSString *)wya_sha512
{
    if (self == nil || [self length] == 0) {
        return nil;
    }

    unsigned char digest[CC_SHA512_DIGEST_LENGTH], i;
    CC_SHA512([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding],
              digest);
    NSMutableString * ms = [NSMutableString string];

    for (i = 0; i < CC_SHA512_DIGEST_LENGTH; i++) {
        [ms appendFormat:@"%02x", (int)(digest[i])];
    }

    return [ms copy];
}

@end
