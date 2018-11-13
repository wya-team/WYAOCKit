//
//  NSDictionary+Category.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category)
/**
 *  字段转成json的字符串
 *
 *  @return json 字符串
 */
- (NSString *)TransToJSONString;
@end
