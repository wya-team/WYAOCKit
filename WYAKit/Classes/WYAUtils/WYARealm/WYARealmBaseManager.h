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
 删除某一个数据

 @param model model
 @return YES or NO
 */
- (BOOL)wya_deleteRealmWithObject:(RLMObject *)model;

/**
 根据主键删除一个模型

 @param objectName className
 @param primaryKey 主键
 @return YES or NO
 */
- (BOOL)wya_deleteRealmWithObjectName:(NSString * _Nonnull)objectName primaryKey:(id)primaryKey;
/**
 根据条件删除所有符合条件的数据

 @param objectName 需要操作的class
 @param format 筛选条件
 */
- (void)wya_deleteRealmWithObjectName:(NSString * _Nonnull)objectName whereFormat:(NSString *)format;

/**
 删除1张模型表数据

 @param objectName 需要删除的模型
 */
- (void)wya_deleteRealmWithObjectName:(NSString *)objectName;
/**
 清空数据库(慎用)
 */
- (BOOL)wya_deleteAllObjects;

/**
 更新model
这个方法是增量更新的，后面传一个字典，使用这个方法的前提是有主键
 @param objectName 需要更新的模型类名
 @param valueInfo 需要更新的字典
 @return YES or NO
 */
- (BOOL)wya_updateRealmWithClassName:(NSString * _Nonnull)objectName withValue:(NSDictionary *)valueInfo;

/**
 更新model
 会去先查找有没有与传入的模型相同的主键，如果有，就更新该条数据
 这里需要注意，这个方法不是增量更新，所有的值都必须有，如果有哪几个值是null，那么就会覆盖原来已经有的值，这样就会出现数据丢失的问题
 @param model model
 @return YES or NO
 */
- (BOOL)wya_updateRealmWithClassName:(RLMObject *)model;
/**
 查询类型为objectName的类的全部内容

 @param objectName objectName
 @return RLMResults
 */
- (RLMResults *)wya_lookupRealmWithAllClassName:(NSString * _Nonnull)objectName;

/**
 条件查询获取模型

 @param objectName 模型className
 @param format 查询条件
 @return 集合
 */
- (RLMResults *)wya_lookupRealmWithAllClassName:(NSString * _Nonnull)objectName whereFormat:(NSString *)format;

/**
 根据keyPath对集合进行排序
 @param rlmResults 需要排序的集合
 @param keyPath 排序依据的值
 @param ascending 升序降序
 @return 返回一个新的数组
 */
- (RLMResults *)wya_sortedResults:(RLMResults *)rlmResults KeyPath:(NSString *)keyPath ascending:(BOOL)ascending;

@end

NS_ASSUME_NONNULL_END
