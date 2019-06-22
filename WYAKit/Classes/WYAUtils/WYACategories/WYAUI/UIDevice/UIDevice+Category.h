//
//  UIDevice+Category.h
//  WYAKit
//
//  Created by 李世航 on 2019/6/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Category)
/**
 获取手机可用内存

 @return 数值
 */
+ (double)wya_phoneFreeMemory;

/**
 获取文件或文件夹大小

 @return 大小
 */
+ (unsigned long long)wya_fileSizeWithPath:(NSString *)path;
@end

NS_ASSUME_NONNULL_END
