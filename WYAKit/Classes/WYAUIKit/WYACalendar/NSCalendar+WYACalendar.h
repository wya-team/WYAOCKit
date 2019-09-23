//
//  NSCalendar+WYACalendar.h
//  WYAKit
//
//  Created by 李世航 on 2019/8/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSCalendar (WYACalendar)
- (NSDate *)wya_fetchMonthFristDay:(NSDate *)date;
@end

NS_ASSUME_NONNULL_END
