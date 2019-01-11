//
//  WYARealmBaseManager.m
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/12/4.
//

#import "WYARealmBaseManager.h"

@interface WYARealmBaseManager ()
@property (nonatomic, strong) RLMRealm * realm;
@end

@implementation WYARealmBaseManager
+ (id)allocWithZone:(struct _NSZone *)zone {
    static WYARealmBaseManager * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ instance = [super allocWithZone:zone]; });
    return instance;
}

+ (instancetype)sharedInstance {
    // 如果有两个线程同时实例化，很有可能创建出两个实例来
    return [[self alloc] init];
}

+ (instancetype)wya_defaultRealm {
    WYARealmBaseManager * dbManager = [[WYARealmBaseManager alloc] init];
    dbManager.realm                 = [RLMRealm defaultRealm];
    return dbManager;
}

+ (instancetype)wya_realmWithURL:(NSURL *)fileURL {
    WYARealmBaseManager * dbManager = [[WYARealmBaseManager alloc] init];
    dbManager.realm                 = [RLMRealm realmWithURL:fileURL];
    return dbManager;
}
#pragma mark ======= 增删改查
/// 添加
- (BOOL)wya_insertRealmWithObject:(RLMObject *)model {
    [self.realm beginWriteTransaction];
    [self.realm addObject:model];
    BOOL isSuccess = [self.realm commitWriteTransaction:nil];
    return isSuccess;
}

/// 删除
- (BOOL)wya_deleteRealmWithObject:(RLMObject *)model {
    BOOL isSuccess =
        [self.realm transactionWithBlock:^{ [self.realm deleteObject:model]; }
                                   error:nil];
    return isSuccess;
}

- (BOOL)wya_deleteRealmWithObjectName:(NSString * _Nonnull)objectName primaryKey:(id)primaryKey {
    RLMObject * tempClass =
        [NSClassFromString(objectName) objectInRealm:self.realm
                                       forPrimaryKey:primaryKey];
    BOOL isSuccess =
        [self.realm transactionWithBlock:^{ [self.realm deleteObject:tempClass]; }
                                   error:nil];
    return isSuccess;
}

- (void)wya_deleteRealmWithObjectName:(NSString *)objectName whereFormat:(NSString *)format {
    RLMResults * results = [NSClassFromString(objectName) objectsWhere:format];
    for (RLMObject * tempObject in results) {
        [self.realm transactionWithBlock:^{ [self.realm deleteObject:tempObject]; } error:nil];
    }
}

- (void)wya_deleteRealmWithObjectName:(NSString *)objectName {
    RLMResults * results = [NSClassFromString(objectName) allObjects];
    for (RLMObject * tempObj in results) {
        [self.realm transactionWithBlock:^{ [self.realm deleteObject:tempObj]; }];
    }
}

- (BOOL)wya_deleteAllObjects {
    BOOL isSuccess =
        [self.realm transactionWithBlock:^{ [self.realm deleteAllObjects]; }
                                   error:nil];
    return isSuccess;
}
/// 更新
- (BOOL)wya_updateRealmWithClassName:(RLMObject *)model {
    BOOL isSuccess =
        [self.realm transactionWithBlock:^{ [self.realm addOrUpdateObject:model]; }
                                   error:nil];
    return isSuccess;
}

- (BOOL)wya_updateRealmWithClassName:(NSString *)objectName withValue:(NSDictionary *)valueInfo {
    BOOL isSuccess = [self.realm transactionWithBlock:^{
        [NSClassFromString(objectName) createOrUpdateInRealm:self.realm withValue:valueInfo];
    } error:nil];
    return isSuccess;
}

/// 查询
- (RLMResults *)wya_lookupRealmWithAllClassName:(NSString * _Nonnull)objectName {
    RLMResults * results = [NSClassFromString(objectName) allObjects];
    return results;
}
- (RLMResults *)wya_lookupRealmWithAllClassName:(NSString *)objectName
                                    whereFormat:(NSString *)format {
    RLMResults * results = [NSClassFromString(objectName) objectsWhere:format];
    return results;
}
- (RLMResults *)wya_sortedResults:(RLMResults *)rlmResults
                          KeyPath:(NSString *)keyPath
                        ascending:(BOOL)ascending {
    RLMResults * results = [rlmResults sortedResultsUsingKeyPath:keyPath ascending:ascending];
    return results;
}
@end
