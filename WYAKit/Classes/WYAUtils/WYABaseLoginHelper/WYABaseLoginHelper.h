//
//  WYABaseLoginHelper.h
//  ResponderChainDemo
//
//  Created by 李雪峰 on 2019/5/15.
//  Copyright © 2019 李雪峰. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
#define WYALoginKeychain @"WYALoginKeychain"
/**
 touchID或faceID验证结果

 @param isPass 是否验证通过
 */
typedef void(^TouchIDVerifyResultBlock)(BOOL isPass,NSString *password);

@interface WYABaseLoginHelper : NSObject

@property (nonatomic, copy) NSString * account;
@property (nonatomic, copy) NSString * curService;

@property (nonatomic, copy) TouchIDVerifyResultBlock resultBlock;


/**
 添加账号密码至登录钥匙串

 @param password 密码
 @param account 账号
 @return 添加是否成功
 */
+ (BOOL)setLoginPassword:(NSString *)password account:(NSString *)account;

/**
 删除登录钥匙串中指定的账号密码

 @param account 账号
 @return 删除是否成功
 */
+ (BOOL)deleteLoginPasswordForaccount:(NSString *)account;

/**
 添加账号密码至钥匙串

 @param password 密码
 @param serviceName 钥匙串名
 @param account 账号
 @return 添加是否成功
 */
+ (BOOL)setPassword:(NSString *)password ForService:(NSString *)serviceName account:(NSString *)account;


/**
 从钥匙串中删除账号密码

 @param serviceName 钥匙串名
 @param account 账号
 @return 删除是否成功
 */
+ (BOOL)deletePasswordForService:(NSString *)serviceName account:(NSString *)account;


/**
 检测当前账号是否存储在登录钥匙串中

 @param account 账号
 @param block 钥匙串名
 */
+ (void)checkLoginAccount:(NSString *)account resultBlock:(TouchIDVerifyResultBlock)block;

/**
 检测当前账号是否存储在该钥匙串中

 @param account 账号
 @param serviceName 钥匙串名
 */
+ (void)checkAccount:(NSString *)account serviceName:(NSString *)serviceName resultBlock:(TouchIDVerifyResultBlock)block;

@end

NS_ASSUME_NONNULL_END