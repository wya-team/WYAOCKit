//
//  WYABaseLoginHelper.m
//  ResponderChainDemo
//
//  Created by 李雪峰 on 2019/5/15.
//  Copyright © 2019 李雪峰. All rights reserved.
//

#import "WYABaseLoginHelper.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "SSKeychain.h"

@implementation WYABaseLoginHelper

+ (NSArray<NSDictionary<NSString *, id> *> *)accountsForService:(NSString *)serviceName error:(NSError *__autoreleasing *)error __attribute__((swift_error(none))){
    return [SSKeychain accountsForService:serviceName error:error];
}

+ (BOOL)setLoginPassword:(NSString *)password account:(NSString *)account{
    return [self setPassword:password ForService:WYALoginKeychain account:account];
}

+ (BOOL)deleteLoginPasswordForaccount:(NSString *)account{
    return [self deletePasswordForService:WYALoginKeychain account:account];
}

+ (BOOL)setPassword:(NSString *)password ForService:(NSString *)serviceName account:(NSString *)account{
    return [SSKeychain setPassword:password forService:serviceName account:account];
}

+ (BOOL)deletePasswordForService:(NSString *)serviceName account:(NSString *)account{
    return [SSKeychain deletePasswordForService:serviceName account:account];
}

+ (void)checkLoginAccount:(NSString *)account resultBlock:(TouchIDVerifyResultBlock)block{
    [self checkAccount:account serviceName:WYALoginKeychain resultBlock:block];
}

+ (BOOL)checkLoginAccount:(NSString *)account{
    return [self checkLoginAccount:account serviceName:WYALoginKeychain];
}

+ (BOOL)verifyEnableFingerPrint{
    LAContext *context = [[LAContext alloc] init];
    context.localizedFallbackTitle = @"";// 右侧按钮名称
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        return YES;
    }
    else{
        return NO;
    }
}

+ (BOOL)checkLoginAccount:(NSString *)account serviceName:(NSString *)serviceName{
    NSArray * accounts = [SSKeychain accountsForService:serviceName];
    BOOL isExist = NO;
    for (NSDictionary * dic in accounts) {
        NSString * acct = [dic objectForKey:@"acct"];
        if ([account isEqualToString:acct]) {
            isExist = YES;
            break;
        }
    }
    return isExist;
}

// 检测当前账号是否已有秘钥存储在钥匙串中
+ (void)checkAccount:(NSString *)account serviceName:(NSString *)serviceName resultBlock:(TouchIDVerifyResultBlock)block{
    
    if ([self checkLoginAccount:account serviceName:serviceName]) {
        [self verifyFingerPrintWithAccount:account serviceName:serviceName resultBlock:block];
    }
}

// 验证指纹
+ (void)verifyFingerPrintWithAccount:(NSString *)account serviceName:(NSString *)serviceName resultBlock:(TouchIDVerifyResultBlock)block{
    
    LAContext *context = [[LAContext alloc] init];
    context.localizedFallbackTitle = @"";// 右侧按钮名称
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"读取当前账号存储在钥匙串中的密码" reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSLog(@"TouchID 验证成功");
                    NSString * password = [SSKeychain passwordForService:serviceName account:account];
                    if (block) {
                        block(YES, password);
                    }
                });
            }else if(error){
                
                switch (error.code) {
                    case LAErrorAuthenticationFailed:{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            NSLog(@"TouchID 验证失败");
                            if (block) {
                                block(NO, @"TouchID 验证失败");
                            }
                        });
                        break;
                    }
                    case LAErrorUserCancel:{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            NSLog(@"TouchID 被用户手动取消");
                        });
                    }
                        break;
                    case LAErrorUserFallback:{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // 若有右侧按钮则会触发
                            NSLog(@"用户不使用TouchID,选择手动输入密码");
                        });
                    }
                        break;
                    case LAErrorSystemCancel:{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            NSLog(@"TouchID 被系统取消 (如遇到来电,锁屏,按了Home键等)");
                        });
                    }
                        break;
                    case LAErrorPasscodeNotSet:{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            NSLog(@"TouchID 无法启动,因为用户没有设置密码");
                        });
                    }
                        break;
                    case LAErrorTouchIDNotEnrolled:{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            NSLog(@"TouchID 无法启动,因为用户没有设置TouchID");
                        });
                    }
                        break;
                    case LAErrorTouchIDNotAvailable:{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            NSLog(@"TouchID 无效");
                        });
                    }
                        break;
                    case LAErrorTouchIDLockout:{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            NSLog(@"TouchID 被锁定(连续多次验证TouchID失败,系统需要用户手动输入密码)");
                        });
                    }
                        break;
                    case LAErrorAppCancel:{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            NSLog(@"当前软件被挂起并取消了授权 (如App进入了后台等)");
                        });
                    }
                        break;
                    case LAErrorInvalidContext:{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            NSLog(@"当前软件被挂起并取消了授权 (LAContext对象无效)");
                        });
                    }
                        break;
                    default:
                        break;
                }
            }
        }];
    }else{
        NSLog(@"当前设备不支持TouchID");
    }
    
}

@end
