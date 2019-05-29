//
//  WYASystemPermissions.h
//  WYAKit
//
//  Created by 李世航 on 2019/3/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, WYASystemPermisionType) {
    WYASystemPermisionTypeAlbum,
    WYASystemPermisionTypeCamera,
    WYASystemPermisionTypeAudio,
    WYASystemPermisionTypeAddressBook,
};

/// 允许情况下的回调
typedef void(^AuthorizedBlock)(void);
/// 当前情况下的不允许回调
typedef void(^nowNotAllowBlock)(void);
/// 从未允许时的回调
typedef void(^neverNotAllowBlock)(void);

@interface WYASystemPermissions : NSObject

/**
 检测系统权限

 @param type 类型
 @param authorizedBlock 允许回调
 @param nowNotAllowBlock 现在不允许的回调
 @param neverNotAllowBlock 从未允许的回调
 */
+ (void)wya_checkSystemPermissionType:(WYASystemPermisionType)type
                      authorizedBlock:(AuthorizedBlock)authorizedBlock
           nowNotAllowAuthorizedBlock:(nowNotAllowBlock)nowNotAllowBlock
         neverNotAllowAuthorizedBlock:(neverNotAllowBlock)neverNotAllowBlock;
@end

NS_ASSUME_NONNULL_END
