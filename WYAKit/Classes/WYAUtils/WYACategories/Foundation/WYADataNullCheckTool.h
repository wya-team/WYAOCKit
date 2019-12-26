//
//  WYADataNullCheckTool.h
//  WYA_Project
//
//  Created by 李俊恒 on 2018/4/9.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYADataNullCheckTool : NSObject

@end
NSString *checkString(NSString *str);
NSString *checkNumber(NSString *str);
NSArray *checkArray(id arr);

