//
//  WYACalendarModel.h
//  WYAKit
//
//  Created by 李世航 on 2019/8/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYACalendarModel : NSObject
// 公历显示日期
@property (nonatomic, copy, readonly) NSString * text;
// 农历显示日期
@property (nonatomic, copy) NSString * chineseDateText;
// 日期字体大小
@property (nonatomic, strong) UIFont * titleFont;
// 日期字体颜色
@property (nonatomic, strong) UIColor * titleColor;
// 日期背景图片(暂时未实现)
@property (nonatomic, strong) UIImage * backgroundImage;
// 今天的颜色
@property (nonatomic, strong) UIColor * todayColor;
// 今天的标记颜色
@property (nonatomic, strong) UIColor * todayTagColor;
// 日期选中时的颜色
@property (nonatomic, strong) UIColor * selectColor;
// 日期标记颜色
@property (nonatomic, strong) UIColor * tagColor;
// 日期是否在当前月份中
@property (nonatomic, assign) BOOL isNowMonth;

@property (nonatomic, strong) NSIndexPath * indexPath;

@property (nonatomic, strong) NSDate * date;
@property (nonatomic, assign, readonly) NSInteger year;
@property (nonatomic, assign, readonly) NSInteger month;
@property (nonatomic, assign, readonly) NSInteger day;
@end

NS_ASSUME_NONNULL_END
