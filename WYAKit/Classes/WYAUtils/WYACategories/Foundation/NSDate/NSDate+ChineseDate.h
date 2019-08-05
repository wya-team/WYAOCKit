//
//  NSDate+ChineseDate.h
//  WYAKit
//
//  Created by 李世航 on 2019/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (ChineseDate)
+ (NSUInteger)wya_chineseYearWithDate:(NSDate *)date;
+ (NSUInteger)wya_chineseMouthWithDate:(NSDate *)date;
+ (NSUInteger)wya_chineseDayWithDate:(NSDate *)date;
- (NSUInteger)wya_chineseYear;
- (NSUInteger)wya_chineseMouth;
- (NSUInteger)wya_chineseDay;
@end

NS_ASSUME_NONNULL_END
