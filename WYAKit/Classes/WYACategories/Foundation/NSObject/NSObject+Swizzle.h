//
//  NSObject+Swizzle.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/4.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)
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
@end
NSString * checkString (NSString * str);
NSString * checkNumber (NSString * str);
NSArray * checkArray (id arr);
