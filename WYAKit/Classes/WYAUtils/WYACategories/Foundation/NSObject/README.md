# NSObject

## 功能
- 动态添加分类、删除动态添加的分类、获取版本号、获取对象所有属性、获取手机型号 、为UI添加倒计时、拦截方法，覆盖方法等

## NSObject+Category

#### 属性

属性 | 说明 | 类型 | 默认值
--- | --- | --- | ---
associatedObjectNames | 相关对象的名字（只读属性） | NSMutableArray | -

#### 方法

```Object-C
/**
 为当前的object动态增加分类

 @param propertyName 分类名称
 @param value 分类值
 @param policy 分类内存管理类型
 */
- (void)objc_setAssociatedObject:(NSString *)propertyName value:(id)value policy:(objc_AssociationPolicy)policy;

/**
 *  获取当前object某个动态增加的分类
 *
 *  @param propertyName 分类名称
 *
 *  @return 值
 */
- (id)objc_getAssociatedObject:(NSString *)propertyName;
/**
 *  删除动态增加的所有分类
 */
- (void)objc_removeAssociatedObjects;

/**
 *  获取对象的所有属性
 *
 *  @return 属性dict
 */
- (NSArray *)getProperties;

/**
 获取版本号
 
 @return 版本号
 */
+ (NSString *)version;

/**
 获取build版本号
 
 @return build版本号
 */
+ (NSInteger)build;

/**
 获取BundleID
 
 @return BundleID
 */
+ (NSString *)identifier;

/**
 当前语言
 
 @return 语言
 */
+ (NSString *)currentLanguage;

/**
 获取手机具体型号
 
 @return 型号
 */
+ (NSString *)deviceModel;

/**
 按钮倒计时
 
 @param time 倒计时总时间
 @param countDownBlock 每秒倒计时会执行的block
 @param finishBlock 倒计时完成会执行的block
 */
- (void)countDownTime:(NSUInteger)time countDownBlock:(TYNCountDownBlock)countDownBlock outTimeBlock:(TYNFinishBlock)finishBlock;
```

## NSObject+PerformBlock

```Object-C
+ (NSException *)tryCatch:(void (^) (void))block;
+ (NSException *)tryCatch:(void (^) (void))block finally:(void (^) (void))aFinisheBlock;

/**
 *  在主线程运行block
 *
 *  @param aInMainBlock 被运行的block
 */
+ (void)performInMainThreadBlock:(void (^) (void))aInMainBlock;
/**
 *  延时在主线程运行block
 *
 *  @param aInMainBlock 被运行的block
 *  @param delay        延时时间
 */
+ (void)performInMainThreadBlock:(void (^) (void))aInMainBlock afterSecond:(NSTimeInterval)delay;
/**
 *  在非主线程运行block
 *
 *  @param aInThreadBlock 被运行的block
 */
+ (void)performInThreadBlock:(void (^) (void))aInThreadBlock;
/**
 *  延时在非主线程运行block
 *
 *  @param aInThreadBlock 被运行的block
 *  @param delay          延时时间
 */
+ (void)performInThreadBlock:(void (^) (void))aInThreadBlock afterSecond:(NSTimeInterval)delay;

```
## NSObject+Swizzle

```Object-C
/**
 覆盖实例方法

 @param origSelector 源方法
 @param newSelector 新方法
 */
+ (void)overrideInstanceMethod:(SEL)origSelector withInstanceMethod:(SEL)newSelector;

/**
 覆盖类方法

 @param origSelector 源方法
 @param newSelector 新方法
 */
+ (void)overrideClassMethod:(SEL)origSelector withClassMethod:(SEL)newSelector;

/**
 拦截实例方法

 @param origSelector 源方法
 @param newSelector 新方法
 */
+ (void)exchangeInstanceMethod:(SEL)origSelector withInstanceMethod:(SEL)newSelector;

/**
 拦截类方法

 @param origSelector 源方法
 @param newSelector 新方法
 */
+ (void)exchangeClassMethod:(SEL)origSelector withClassMethod:(SEL)newSelector;
```

