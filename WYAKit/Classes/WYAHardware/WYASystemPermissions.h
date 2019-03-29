//
//  WYASystemPermissions.h
//  WYAKit
//
//  Created by 李世航 on 2019/3/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYASystemPermissions : NSObject

/**
 检测相册权限

 @param authorizedBlock 允许状态
 @param nowNotAllowBlock 弹出提示点击了不允许
 @param neverNotAllowBlock 从未允许
 */
+ (void)wya_checkPhotoAlbumPermissionsWithAuthorizedBlock:(void(^)(void))authorizedBlock
                               nowNotAllowAuthorizedBlock:(void(^)(void))nowNotAllowBlock
                             neverNotAllowAuthorizedBlock:(void(^)(void))neverNotAllowBlock;

/**
 检测相机权限

 @param authorizedBlock 允许状态
 @param nowNotAllowBlock 弹出提示点击了不允许
 @param neverNotAllowBlock 从未允许
 */
+ (void)wya_checkVideoPermissionsWithAuthorizedBlock:(void(^)(void))authorizedBlock
                          nowNotAllowAuthorizedBlock:(void(^)(void))nowNotAllowBlock
                        neverNotAllowAuthorizedBlock:(void(^)(void))neverNotAllowBlock;

/**
 检测音频权限

 @param authorizedBlock 允许状态
 @param nowNotAllowBlock 弹出提示点击了不允许
 @param neverNotAllowBlock 从未允许
 */
+ (void)wya_checkAudioPermissionsWithAuthorizedBlock:(void(^)(void))authorizedBlock
                          nowNotAllowAuthorizedBlock:(void(^)(void))nowNotAllowBlock
                        neverNotAllowAuthorizedBlock:(void(^)(void))neverNotAllowBlock;

/**
 检测通讯录权限(iOS9.0)

 @param authorizedBlock 允许状态
 @param nowNotAllowBlock 弹出提示点击了不允许
 @param neverNotAllowBlock 从未允许
 @param errorBlock 错误
 */
+ (void)wya_checkAddressBookPermissionsWithAuthorizedBlock:(void(^)(void))authorizedBlock
                                nowNotAllowAuthorizedBlock:(void(^)(void))nowNotAllowBlock
                              neverNotAllowAuthorizedBlock:(void(^)(void))neverNotAllowBlock
                                                errorBlock:(void(^)(NSError *))errorBlock;
@end

NS_ASSUME_NONNULL_END
