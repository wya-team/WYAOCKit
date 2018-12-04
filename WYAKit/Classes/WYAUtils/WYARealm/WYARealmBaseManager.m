//
//  WYARealmBaseManager.m
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/12/4.
//

#import "WYARealmBaseManager.h"
@interface WYARealmBaseManager()
@property (nonatomic, strong) RLMRealm * realm;
@end
@implementation WYARealmBaseManager
+ (id)allocWithZone:(struct _NSZone *)zone{
    static WYARealmBaseManager * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

+ (instancetype)sharedInstance{
    // 如果有两个线程同时实例化，很有可能创建出两个实例来
    return [[self alloc] init];
}

+ (instancetype)wya_defaultRealm{
    WYARealmBaseManager * dbManager = [[WYARealmBaseManager alloc]init];
    dbManager.realm = [RLMRealm defaultRealm];
    return dbManager;
}

+ (instancetype)wya_realmWithURL:(NSURL *)fileURL{
    WYARealmBaseManager * dbManager = [[WYARealmBaseManager alloc]init];
    dbManager.realm = [RLMRealm realmWithURL:fileURL];
    return dbManager;
}
#pragma mark ======= 增删改查
- (BOOL)wya_insertRealmWithObject:(RLMObject *)model{
//    NSString *domain = @"com.WeiYiAn.MyApplication.ErrorDomain";
//    NSString *desc = NSLocalizedString(@"Unable to…", @"");
//    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : desc };
//
//    NSError *error = [NSError errorWithDomain:domain
//                                         code:-101
//                                     userInfo:userInfo];
    [self.realm beginWriteTransaction];
    [self.realm addObject:model];
    BOOL isSuccess = [self.realm commitWriteTransaction:nil];
    return isSuccess;
}

@end
