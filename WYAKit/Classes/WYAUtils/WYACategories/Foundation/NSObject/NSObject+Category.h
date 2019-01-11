//
//  NSObject+Category.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/4.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <sys/utsname.h>

typedef void (^TYNCountDownBlock)(NSUInteger timer);
typedef void (^TYNFinishBlock)(void);

@interface NSObject (Category)
@property (nonatomic, strong, readonly) NSMutableArray * associatedObjectNames; // 相关对象的名字

/**
 为当前的object动态增加分类

 @param propertyName 分类名称
 @param value 分类值
 @param policy 分类内存管理类型
 */
- (void)objc_setAssociatedObject:(NSString *)propertyName
                           value:(id)value
                          policy:(objc_AssociationPolicy)policy;

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
+ (NSString *)wya_version;

/**
 获取build版本号

 @return build版本号
 */
+ (NSInteger)wya_build;

/**
 获取BundleID

 @return BundleID
 */
+ (NSString *)wya_identifier;

/**
 当前语言

 @return 语言
 */
+ (NSString *)wya_currentLanguage;

/**
 获取手机具体型号

 @return 型号
 */
+ (NSString *)wya_deviceModel;

/**
 按钮倒计时

 @param time 倒计时总时间
 @param countDownBlock 每秒倒计时会执行的block
 @param finishBlock 倒计时完成会执行的block
 */
- (void)wya_countDownTime:(NSUInteger)time
           countDownBlock:(TYNCountDownBlock)countDownBlock
             outTimeBlock:(TYNFinishBlock)finishBlock;

@end
