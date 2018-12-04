//
//  WYARealmBaseManager.h
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/12/4.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN
@interface WYARealmBaseManager : NSObject

#pragma mark ======= 创建数据库

/**
 默认Realm数据库

 @return realm
 */
+ (instancetype)wya_defaultRealm;

/**
 自定义Realm数据库

 @param fileURL 本地存储路径
 @return realm
 */
+ (instancetype)wya_realmWithURL:(NSURL *)fileURL;

/**
 添加一个model

 @param model 需要存储的model
 @return 存储是否成功
 */
- (BOOL)wya_insertRealmWithObject:(RLMObject *)model;

/**
 删除某个model

 @param model 需要删除的model
 @return 删除是否成功
 */
- (BOOL)wya_deleteRealmWithObject:(RLMObject *)model;

/**
 清空数据库
 */
- (void)wya_deleteAllObjects;

/**
 更新model

 @param model 更新某个model
 @return 更新是否成功
 */
- (BOOL)wya_updateRealmWithObject:(RLMObject *)model;

/**
 更新某个模型的值

 @param variable 需要更新的成员变量
 @return 是否成功
 */
- (BOOL)wya_updateRealmWithObjectProperty:(id)variable;

/**
 查询类型为objectName的类的全部内容

 @param objectName objectName
 @return RLMResults
 */
- (RLMResults *)wya_lookupRealmWithAllClassName:(NSString * _Nonnull)objectName;
- (RLMResults *)wya_lookupRealmWithAllClassName:(NSString *)objectName whereFormat:(NSString *)format;
- (RLMResults *)wya_sortedResultsUsingKeyPath:(NSString *)keyPath ascending:(BOOL)ascending;

@end

NS_ASSUME_NONNULL_END
