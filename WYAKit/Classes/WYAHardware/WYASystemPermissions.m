//
//  WYASystemPermissions.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/29.
//

#import "WYASystemPermissions.h"
#import <Photos/Photos.h>
#import <Contacts/Contacts.h>

@implementation WYASystemPermissions

+ (void)wya_checkSystemPermissionType:(WYASystemPermisionType)type
                      authorizedBlock:(AuthorizedBlock)authorizedBlock
           nowNotAllowAuthorizedBlock:(nowNotAllowBlock)nowNotAllowBlock
         neverNotAllowAuthorizedBlock:(neverNotAllowBlock)neverNotAllowBlock
{
    switch (type) {
        case WYASystemPermisionTypeAlbum:
            [self wya_checkPhotoAlbumPermissionsWithAuthorizedBlock:authorizedBlock nowNotAllowAuthorizedBlock:nowNotAllowBlock neverNotAllowAuthorizedBlock:neverNotAllowBlock];
            break;
        case WYASystemPermisionTypeCamera:
            [self wya_checkVideoPermissionsWithAuthorizedBlock:authorizedBlock nowNotAllowAuthorizedBlock:nowNotAllowBlock neverNotAllowAuthorizedBlock:neverNotAllowBlock];
            break;
        case WYASystemPermisionTypeAudio:
            [self wya_checkAudioPermissionsWithAuthorizedBlock:authorizedBlock nowNotAllowAuthorizedBlock:nowNotAllowBlock neverNotAllowAuthorizedBlock:neverNotAllowBlock];
            break;
        case WYASystemPermisionTypeAddressBook:
            [self wya_checkAddressBookPermissionsWithAuthorizedBlock:authorizedBlock nowNotAllowAuthorizedBlock:nowNotAllowBlock neverNotAllowAuthorizedBlock:neverNotAllowBlock];
            break;
        default:
            break;
    }
}

+ (void)wya_checkPhotoAlbumPermissionsWithAuthorizedBlock:(AuthorizedBlock)authorizedBlock
                               nowNotAllowAuthorizedBlock:(nowNotAllowBlock)nowNotAllowBlock
                             neverNotAllowAuthorizedBlock:(neverNotAllowBlock)neverNotAllowBlock {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (status == PHAuthorizationStatusAuthorized) {
                    // 允许
                    authorizedBlock();
                } else {
                    nowNotAllowBlock();
                }
            });
        }];
    } else if (status == PHAuthorizationStatusAuthorized) {
        // 允许
        authorizedBlock();
    } else {
        neverNotAllowBlock();
    }
}

+ (void)wya_checkVideoPermissionsWithAuthorizedBlock:(AuthorizedBlock)authorizedBlock
                          nowNotAllowAuthorizedBlock:(nowNotAllowBlock)nowNotAllowBlock
                        neverNotAllowAuthorizedBlock:(neverNotAllowBlock)neverNotAllowBlock {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo]; //相机权限
    if (status == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice
            requestAccessForMediaType:AVMediaTypeVideo
                    completionHandler:^(BOOL granted) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            if (granted) {
                                authorizedBlock();
                            } else {
                                nowNotAllowBlock();
                            }
                        });
                    }];
    } else if (status == AVAuthorizationStatusAuthorized) {
        authorizedBlock();
    } else if (status == AVAuthorizationStatusDenied) {
        neverNotAllowBlock();
    }
}

+ (void)wya_checkAudioPermissionsWithAuthorizedBlock:(AuthorizedBlock)authorizedBlock
                          nowNotAllowAuthorizedBlock:(nowNotAllowBlock)nowNotAllowBlock
                        neverNotAllowAuthorizedBlock:(neverNotAllowBlock)neverNotAllowBlock {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (status == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio
                                 completionHandler:^(BOOL granted) {
                                     dispatch_async(dispatch_get_main_queue(), ^{
                                         if (granted) {
                                             authorizedBlock();
                                         } else {
                                             nowNotAllowBlock();
                                         }
                                     });
                                 }];
    } else if (status == AVAuthorizationStatusAuthorized) {
        authorizedBlock();
    } else {
        neverNotAllowBlock();
    }
}

+ (void)wya_checkAddressBookPermissionsWithAuthorizedBlock:(AuthorizedBlock)authorizedBlock
                                nowNotAllowAuthorizedBlock:(nowNotAllowBlock)nowNotAllowBlock
                              neverNotAllowAuthorizedBlock:(neverNotAllowBlock)neverNotAllowBlock
{
    CNContactStore * contactStore = [[CNContactStore alloc] init];
    CNAuthorizationStatus status  = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if (status == CNAuthorizationStatusNotDetermined) {
        [contactStore requestAccessForEntityType:CNEntityTypeContacts
                               completionHandler:^(BOOL granted, NSError * _Nullable error) {
                                   dispatch_async(dispatch_get_main_queue(), ^{
                                       if (error) {

                                       }
                                       if (granted) {
                                           authorizedBlock();
                                       } else {
                                           nowNotAllowBlock();
                                       }
                                   });
                               }];
    } else if (status == CNAuthorizationStatusAuthorized) {
        authorizedBlock();
    } else {
        neverNotAllowBlock();
    }
}

@end
