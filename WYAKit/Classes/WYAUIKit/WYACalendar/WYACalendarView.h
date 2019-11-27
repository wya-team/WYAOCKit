//
//  WYACalendar.h
//  WYAKit
//
//  Created by 李世航 on 2019/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WYACalendarView;
@class WYACalendarModel;
typedef NS_ENUM(NSUInteger, WYACalendarScrollDirection) {
    WYACalendarScrollVertical,
    WYACalendarScrollHorizontal,
};

typedef NS_ENUM(NSUInteger, WYACalendarSectionOption) {
    WYACalendarSectionMonth,
    WYACalendarSectionWeek,
};

@protocol WYACalendarDataSource <NSObject>
@required
/**
 日期区间范围
 example: @[@(2017),@(2018),@(2019),@(2020),@(2021)]

 @return 日期数组
 */
//- (NSArray <NSNumber *>*)calendarDateRange;

/**
 日期最小的日期

 @return 日期
 */
- (NSDate *)calendarMinimumDate;

/**
 日期最大的日期

 @return 日期
 */
- (NSDate *)calendarMaximumDate;

@optional
/***********************日历背景图片或者文字两个代理方法只需实现其中一个就可以************************/
/**
 日期背景图片

 @param calendarView 日历组件
 @param indexPath 区域
 @return 图片
 */
- (UIImage *)calendarView:(WYACalendarView *)calendarView imageWithIndexPath:(NSIndexPath *)indexPath;

/**
 日历背景文字

 @param calendarView 日历组件
 @param indexPath 区域
 @return 富文本
 */
- (NSMutableAttributedString *)calendarView:(WYACalendarView *)calendarView textWithIndexPath:(NSIndexPath *)indexPath;
@end

@protocol WYACalendarDelegate <NSObject>
- (void)calendarView:(WYACalendarView *)calendarView didSelectModel:(WYACalendarModel *)model;
@end

@interface WYACalendarView : UIView
@property (nonatomic, weak) id<WYACalendarDataSource> dataSource;
@property (nonatomic, weak) id<WYACalendarDelegate> delegate;
@property (nonatomic, assign) WYACalendarSectionOption sectionOption;
// 日期字体大小
@property (nonatomic, strong) UIFont * calenderDateTitleFont;
// 日期字体颜色
@property (nonatomic, strong) UIColor * calenderDateTitleColor;
// 日期背景图片(暂时未实现)
@property (nonatomic, strong) UIImage * calenderDateBackgroundImage;
// 日期选中时的颜色
@property (nonatomic, strong) UIColor * calenderDateSelectColor;
// 日期标记颜色
@property (nonatomic, strong) UIColor * calenderDateTagColor;
// 今天的默认颜色
@property (nonatomic, strong) UIColor * calenderTodayColor;
// 今天的标记颜色
@property (nonatomic, strong) UIColor * calenderTodayTagColor;
// 是否可以选中多个，default is 1
@property (nonatomic, assign) BOOL canSelectMore;

- (instancetype)initWithFrame:(CGRect)frame ScrollDirection:(WYACalendarScrollDirection)scrollDirection;
@end

NS_ASSUME_NONNULL_END
