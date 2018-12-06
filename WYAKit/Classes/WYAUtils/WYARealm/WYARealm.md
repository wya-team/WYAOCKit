# WYARealm
## 功能
- 创建Realm的单利，增加删除更新查询数据库数据，数据库存入的Model必须继承RLMObject 

- 关于RLMObject的一些注意事项

```
 (1) Realm支持以下的属性（property）种类：BOOL, bool, int, NSInteger, long, float, double, CGFloat, NSString, NSDate 和 NSData。

（2）你可以使用 RLMArray<Object> 和 RLMObject 来模拟对一或对多的关系(Realm也支持RLMObject继承) 

（3）Realm忽略了Objective-C的property attributes(如nonatomic, atomic, strong, copy, weak 等等）。 所以，推荐在创建模型的时候不要使用任何的property attributes。但是，假如你设置了，这些attributes会一直生效直到RLMObject被写入realm数据库。

（4）定义了 RLM_ARRAY_TYPE(Article) 这个宏表示支持 RLMArray<Article> 该属性 

（5）另外Realm提供了以下几个方法供对属性进行自定义：

1） + (NSArray *)indexedProperties; : 可以被重写来来提供特定属性（property）的属性值（attrbutes）例如某个属性值要添加索引。 

2） + (NSDictionary *)defaultPropertyValues; : 为新建的对象属性提供默认值。 

3） + (NSString *)primaryKey; : 可以被重写来设置模型的主键。定义主键可以提高效率并且确保唯一性。 

4） + (NSArray *)ignoredProperties; ：可以被重写来防止Realm存储模型属性。 
```
## 方法

```Object-C
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

```

## 基础用法

- 先创建需要存储的Model

```Object-C
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : RLMObject
@property NSString * name;
@property int age;
@property float height;
@property float weight;
@property float score;
@property NSString * grade;
@property NSString * studentId;
@end
RLM_ARRAY_TYPE(Student)// 这个一定要写

NS_ASSUME_NONNULL_END

#import "Student.h"

@implementation Student
+ (nullable NSString *)primaryKey{
    return @"studentId";
}
@end

```
- 基本的增删改查

```Object-C
Student * model = [[Student alloc]init];
model.name = @"娜美";
model.age = 18;
model.height = 166;
model.weight = 84;
model.score = 80;
model.grade = @"三年级二班";
model.studentId = studentId;
// 创建默认数据库
WYARealmBaseManager * dbManager = [WYARealmBaseManager wya_defaultRealm];
// 插入数据
[dbManager wya_insertRealmWithObject:model];

// 删除全部
[dbManager wya_deleteAllObjects];
// 删除最后一个
Student * model = [[self getRealmArray] lastObject];

[dbManager wya_deleteRealmWithObject:model];
// 更新 (必须有主键)没有主键需要将全部model属性赋值不然会有nil出现，如果有主键使用该方法赋值不会出现上述情况
Student * model = [[self getRealmArray] lastObject];

[dbManager wya_updateRealmWithClassName:@"Student" withValue:@{@"name":@"蒙奇D·路飞",@"studentId":model.studentId}];

// 获取全部数据
RLMResults * results = [dbManager wya_lookupRealmWithAllClassName:@"Student"];

// 获取条件查询的数据
RLMResults * results = [dbManager wya_lookupRealmWithAllClassName:@"Student" whereFormat:@"height>170"];
// 查询后获得的结果可以继续查询
RLMResults * res = [results objectsWhere:@"height<180"];
```


