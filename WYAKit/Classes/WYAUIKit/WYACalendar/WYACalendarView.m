//
//  WYACalendar.m
//  WYAKit
//
//  Created by 李世航 on 2019/7/31.
//

#import "WYACalendarView.h"
#import "WYACalendarItemCell.h"
#import "WYACalendarHeaderView.h"
#import "WYACalendarFlowLayout.h"
#import "WYACalendarModel.h"
#import "WYACalendarBottomView.h"
#import "NSCalendar+WYACalendar.h"

@interface WYACalendarView () <UICollectionViewDataSource, UICollectionViewDelegate, WYACalendarFlowLayoutDelegate>
@property (nonatomic, assign) WYACalendarScrollDirection scrollDirection;

@property (nonatomic, strong) UIView * backgroundView;
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) UIView * dateNoteView;
@property (nonatomic, strong) WYACalendarBottomView * bottomView;
@property (nonatomic, strong) UIImageView * backgroundImageView;
@property (nonatomic, strong) UILabel * backgroundLabel;

@property (nonatomic, strong) WYACalendarFlowLayout * flowLayout;

@property (nonatomic, strong) NSCalendar * calendar;
@property (nonatomic, assign) NSInteger calendarSectionNumber;

@property (nonatomic, strong) NSArray * weekdayArray;

@property (nonatomic, strong) NSMutableArray * selectDates;

@property (nonatomic, strong) NSDate * minDate;
@property (nonatomic, strong) NSDate * maxDate;
@end

@implementation WYACalendarView {
    WYACalendarItemCell * lastCell; // 选中的最后一个cell
    CGPoint lastPoint;

    CGFloat collectionChangeHeight;
    CGFloat calendarHeight;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame ScrollDirection:WYACalendarScrollVertical];
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero ScrollDirection:WYACalendarScrollVertical];
}

- (instancetype)initWithFrame:(CGRect)frame ScrollDirection:(WYACalendarScrollDirection)scrollDirection
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollDirection = scrollDirection;
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (!calendarHeight) {
        calendarHeight = self.cmam_height;
    }
    CGFloat dateNoteView_x      = 0;
    CGFloat dateNoteView_y      = 0;
    CGFloat dateNoteView_width  = self.cmam_width;
    CGFloat dateNoteView_height = 44;
    CGRect dateNoteView_rect    = CGRectMake(dateNoteView_x, dateNoteView_y, dateNoteView_width, dateNoteView_height);
    self.dateNoteView.frame     = dateNoteView_rect;

    CGFloat bottomView_height = 44;

    CGFloat collectionView_x      = 0;
    CGFloat collectionView_y      = self.dateNoteView.cmam_bottom;
    CGFloat collectionView_width  = self.cmam_width;
    CGFloat collectionView_height = self.cmam_height - self.dateNoteView.cmam_height - bottomView_height;
    CGRect collectionView_rect    = CGRectMake(collectionView_x, collectionView_y, collectionView_width, collectionView_height);
    self.collectionView.frame     = collectionView_rect;

    CGFloat bottomView_x     = 0;
    CGFloat bottomView_y     = self.collectionView.cmam_bottom;
    CGFloat bottomView_width = self.cmam_width;
    CGRect bottomView_rect   = CGRectMake(bottomView_x, bottomView_y, bottomView_width, bottomView_height);
    self.bottomView.frame    = bottomView_rect;

    CGFloat backgroundView_x       = 0;
    CGFloat backgroundView_y       = self.dateNoteView.cmam_bottom;
    CGFloat backgroundView_width   = self.cmam_width;
    CGFloat backgroundView_height  = self.collectionView.cmam_height;
    CGRect backgroundView_rect     = CGRectMake(backgroundView_x, backgroundView_y, backgroundView_width, backgroundView_height);
    self.backgroundView.frame      = backgroundView_rect;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.backgroundView.cmam_width, self.backgroundView.cmam_height);
    self.backgroundLabel.frame     = self.backgroundImageView.frame;
}

#pragma mark - Private Method
- (void)setupUI
{
    self.backgroundColor = [UIColor whiteColor];
    [self wya_addSubViews:@[ self.backgroundView,
                             self.dateNoteView,
                             self.collectionView,
                             self.bottomView ]];
    [self.backgroundView wya_addSubViews:@[ self.backgroundImageView, self.backgroundLabel ]];
    UISwipeGestureRecognizer * upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(upSwipeAction:)];
    upSwipe.direction                  = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:upSwipe];

    UISwipeGestureRecognizer * downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(downSwipeAction:)];
    downSwipe.direction                  = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:downSwipe];
}

- (void)configDataSource
{
    //    if (self.dataSource && [self.dataSource respondsToSelector:@selector(calendarDateRange)]) {
    //        self.yearArray = [self.dataSource calendarDateRange];
    //    }
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(calendarMinimumDate)]) {
        self.minDate = [self.dataSource calendarMinimumDate];
    }
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(calendarMaximumDate)]) {
        self.maxDate = [self.dataSource calendarMaximumDate];
    }

    NSAssert(self.minDate && self.maxDate, @"最大时间和最小时间不能为空");
    self.sectionOption = WYACalendarSectionMonth;

    self.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
}

- (void)collectionSetOffset
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSInteger minYear    = [self.minDate wya_year];
        NSInteger minMonth   = [self.minDate wya_month];
        NSInteger year       = [[NSDate date] wya_year];
        NSInteger month      = [[NSDate date] wya_month];
        NSInteger offsetPage = 0;
        for (NSInteger i = minYear; i < year + 1; i++) {
            if (minYear == year) {
                for (NSInteger j = minMonth; j < month + 1; j++) {
                    offsetPage = offsetPage + 1;
                }
            } else {
                if (i == minYear) {
                    for (NSInteger j = minMonth; j < 13; j++) {
                        offsetPage = offsetPage + 1;
                    }
                } else if (i == year) {
                    for (NSInteger j = 1; j < month + 1; j++) {
                        offsetPage = offsetPage + 1;
                    }
                } else {
                    for (NSInteger j = 1; j < 13; j++) {
                        offsetPage = offsetPage + 1;
                    }
                }
            }
        }
        CGFloat endOffsetX = (offsetPage - 1) * self.collectionView.cmam_width;
        [self.collectionView setContentOffset:CGPointMake(endOffsetX, 0) animated:NO];
        self.bottomView.dateLabel.text = [NSString stringWithFormat:@"%d年%d月", year, month];

        UIImage * image;
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(calendarView:imageWithIndexPath:)]) {
            image = [self.dataSource calendarView:self imageWithIndexPath:[NSIndexPath indexPathForItem:0 inSection:endOffsetX / self.collectionView.cmam_width]];
        }

        NSMutableAttributedString * text;
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(calendarView:textWithIndexPath:)]) {
            text = [self.dataSource calendarView:self textWithIndexPath:[NSIndexPath indexPathForItem:0 inSection:endOffsetX / self.collectionView.cmam_width]];
        }
        if (image) {
            self.backgroundImageView.hidden = NO;
            self.backgroundImageView.image  = image;
        }

        if (text) {
            self.backgroundLabel.hidden         = NO;
            self.backgroundLabel.attributedText = text;
        }
    });
}

- (NSInteger)collectionSetOffsetWithDate:(NSDate *)date
{
    if (self.sectionOption == WYACalendarSectionMonth) {
        NSInteger section = [self.calendar components:NSCalendarUnitMonth fromDate:[self.calendar wya_fetchMonthFristDay:self.minDate] toDate:[self.calendar wya_fetchMonthFristDay:date] options:0].month;
        return section;
    } else if (self.sectionOption == WYACalendarSectionWeek) {
        NSInteger section = [self.calendar components:NSCalendarUnitWeekOfYear fromDate:[self.calendar wya_fetchMonthFristDay:self.minDate] toDate:date options:0].weekOfYear;
        return section;
    }
    return 0;
}

- (NSInteger)calendarSectionNumber
{
    if (self.sectionOption == WYACalendarSectionMonth) {
        NSInteger numberOfMonths = [self.calendar components:NSCalendarUnitMonth fromDate:[self.calendar wya_fetchMonthFristDay:self.minDate] toDate:self.maxDate options:0].month + 1;
        return numberOfMonths;
    } else if (self.sectionOption == WYACalendarSectionWeek) {
        NSInteger numberOfWeeks = [self.calendar components:NSCalendarUnitWeekOfYear fromDate:[self.calendar wya_fetchMonthFristDay:self.minDate] toDate:self.maxDate options:0].weekOfYear + 1;
        return numberOfWeeks;
    } else {
        return 0;
    }
}

- (nullable NSDate *)fs_firstDayOfWeek:(NSDate *)week
{
    if (!week) return nil;
    NSDateComponents * weekdayComponents = [self.calendar components:NSCalendarUnitWeekday fromDate:week];
    NSDateComponents * components        = [[NSDateComponents alloc] init];
    components.day                       = -(weekdayComponents.weekday - self.calendar.firstWeekday);
    components.day                       = (components.day - 7) % 7;
    NSDate * firstDayOfWeek              = [self.calendar dateByAddingComponents:components toDate:week options:0];
    firstDayOfWeek                       = [self.calendar dateBySettingHour:0 minute:0 second:0 ofDate:firstDayOfWeek options:0];
    components.day                       = NSIntegerMax;
    return firstDayOfWeek;
}

- (NSDate *)getDateWithIndexPath:(NSIndexPath *)indexPath
{
    if (self.sectionOption == WYACalendarSectionMonth) {
        NSDate * monthDate = [self.minDate wya_offsetMonths:indexPath.section];
        NSDate * lastDate  = [self.calendar wya_fetchMonthFristDay:monthDate];
        NSInteger week     = [lastDate wya_weekday];
        NSDate * dayDate   = [lastDate wya_offsetDays:indexPath.item - week];
        return dayDate;
    } else if (self.sectionOption == WYACalendarSectionWeek) {
        return [self weekOfFirstday:indexPath];
    }
    return nil;
}

- (NSDate *)weekOfFirstday:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath==%@", indexPath);
    NSDate * fristDay                    = [self.calendar wya_fetchMonthFristDay:self.minDate];
    NSDateComponents * weekdayComponents = [self.calendar components:NSCalendarUnitWeekday fromDate:fristDay];
    NSDateComponents * components        = [[NSDateComponents alloc] init];
    components.day                       = -(weekdayComponents.weekday - self.calendar.firstWeekday);
    components.day                       = (components.day - 7) % 7;
    NSDate * firstDayOfWeek              = [self.calendar dateByAddingComponents:components toDate:fristDay options:0];
    firstDayOfWeek                       = [self.calendar dateBySettingHour:0 minute:0 second:0 ofDate:firstDayOfWeek options:0];
    components.day                       = NSIntegerMax;

    NSDate * a    = [self.calendar dateByAddingUnit:NSCalendarUnitWeekOfYear value:indexPath.section toDate:firstDayOfWeek options:0];
    NSDate * date = [self.calendar dateByAddingUnit:NSCalendarUnitDay value:indexPath.item toDate:a options:0];
    return date;
}

- (void)upSwipeAction:(UISwipeGestureRecognizer *)gesture
{
    NSLog(@"向上轻扫");

    [UIView animateWithDuration:0.2
    delay:0
    options:UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionBeginFromCurrentState
    animations:^{
        self.cmam_height = 60 * SizeAdapter + 88;
    }
    completion:^(BOOL finished) {
        lastPoint          = self.collectionView.contentOffset;
        self.sectionOption = WYACalendarSectionWeek;
        [self.collectionView reloadData];
        [self.collectionView.collectionViewLayout invalidateLayout];
        NSInteger section = [self collectionSetOffsetWithDate:[self.selectDates lastObject]];
        [self.collectionView setContentOffset:CGPointMake(self.collectionView.cmam_width * section, 0)];
    }];
}

- (void)downSwipeAction:(UISwipeGestureRecognizer *)gesture
{
    NSLog(@"向下轻扫");
    [UIView animateWithDuration:0.2
    delay:0
    options:UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionBeginFromCurrentState
    animations:^{
        self.cmam_height = calendarHeight;
    }
    completion:^(BOOL finished) {
        self.sectionOption = WYACalendarSectionMonth;
        [self.collectionView reloadData];
        [self.collectionView.collectionViewLayout invalidateLayout];
        [self.collectionView setCollectionViewLayout:self.flowLayout
                                            animated:NO
                                          completion:^(BOOL finished){

                                          }];
    }];
}

- (NSDate *)getFormatterMonthDaysWithYear:(NSInteger)year section:(NSInteger)section row:(NSInteger)row
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString * string = [NSString stringWithFormat:@"%d-%02d-%02d", year, section + 1, row + 1];
    NSDate * date     = [dateFormatter dateFromString:string];
    return date;
}

//根据date获取当月总天数
- (NSInteger)convertDateToTotalDays:(NSDate *)date
{
    NSRange daysInOfMonth = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInOfMonth.length;
}

//根据date获取偏移指定月数的date
- (NSDate *)getDateFrom:(NSDate *)date offsetMonths:(NSInteger)offsetMonths
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];

    NSDateComponents * lastMonthComps = [[NSDateComponents alloc] init];
    [lastMonthComps setMonth:offsetMonths]; //year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    NSDate * newdate = [self.calendar dateByAddingComponents:lastMonthComps toDate:date options:0];
    return newdate;
}

//根据date获取偏移指定年数的date
- (NSDate *)getDateFrom:(NSDate *)date offsetYears:(NSInteger)offsetYears
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];

    NSDateComponents * lastMonthComps = [[NSDateComponents alloc] init];
    [lastMonthComps setYear:offsetYears]; //year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    NSDate * newdate = [self.calendar dateByAddingComponents:lastMonthComps toDate:date options:0];
    return newdate;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSInteger month = self.calendarSectionNumber;
    return month;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.sectionOption == WYACalendarSectionMonth) {
        return 42;
    } else if (self.sectionOption == WYACalendarSectionWeek) {
        return 7;
    }
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYACalendarItemCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    WYACalendarModel * model   = [[WYACalendarModel alloc] init];
    model.titleFont            = self.calenderDateTitleFont;
    model.titleColor           = self.calenderDateTitleColor;
    model.todayColor           = self.calenderTodayColor;
    model.todayTagColor        = self.calenderTodayTagColor;
    model.selectColor          = self.calenderDateSelectColor;
    model.tagColor             = self.calenderDateTagColor;
    NSDate * date              = [self getDateWithIndexPath:indexPath];

    model.date = date;
    cell.model = model;
    for (NSDate * selectDate in self.selectDates) {
        if ([selectDate wya_isSameDay:date]) {
            cell.selected = YES;
            [cell reloadUI];
        }
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (self.scrollDirection == WYACalendarScrollVertical) {
        if (kind == UICollectionElementKindSectionHeader) {
            WYACalendarHeaderView * view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                              withReuseIdentifier:@"header"
                                                                                     forIndexPath:indexPath];
            view.titleLabel.text = [NSString stringWithFormat:@"%d月", indexPath.section + 1];

            return view;
        }
    }
    return nil;
}

#pragma mark - WYACalendarFlowLayoutDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.sectionOption == WYACalendarSectionMonth) {
        CGFloat width  = self.collectionView.cmam_width / 7;
        CGFloat height = self.collectionView.cmam_height / 6;
        CGSize size    = CGSizeMake(width, height);
        return size;
    } else if (self.sectionOption == WYACalendarSectionWeek) {
        CGFloat width  = self.collectionView.cmam_width / 7;
        CGFloat height = self.collectionView.cmam_height;
        CGSize size    = CGSizeMake(width, height);
        return size;
    }
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (self.scrollDirection == WYACalendarScrollVertical) {
        return CGSizeMake(self.collectionView.cmam_width, 50);
    }
    return CGSizeZero;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//    return CGSizeMake(0.01, 0.01);
//}

#pragma mark - UICollectionViewDelegate
// 是否可以选中cell
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYACalendarItemCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
    NSDate * date              = [self getDateWithIndexPath:indexPath];
    [self.selectDates addObject:date];
    cell.selected = YES;
    [cell reloadUI];
}
// 点击当前的cell是否可以被选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (self.canSelectMore) {
    //        return NO;
    //    }
    return YES;
}

// 对之前选中的cell进行反选
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 如果allowsMultipleSelection = yes,indexpath为当前点击的cell的indexpath，如果allowsMultipleSelection = no，indexpath为上一个cell的indexpath
    WYACalendarItemCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.selected              = NO;
    NSDate * date              = [self getDateWithIndexPath:indexPath];
    [self.selectDates removeObject:date];
    [cell reloadUI];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
}

#pragma mark - Setter
- (void)setDataSource:(id<WYACalendarDataSource>)dataSource
{
    _dataSource = dataSource;
    if (dataSource) {
        [self configDataSource];
    }
}
- (void)setCalenderDateTitleFont:(UIFont *)calenderDateTitleFont
{
    _calenderDateTitleFont = calenderDateTitleFont;
    [self.collectionView reloadData];
}

- (void)setCalenderDateTitleColor:(UIColor *)calenderDateTitleColor
{
    _calenderDateTitleColor = calenderDateTitleColor;
    [self.collectionView reloadData];
}

- (void)setCalenderDateBackgroundImage:(UIImage *)calenderDateBackgroundImage
{
    _calenderDateBackgroundImage = calenderDateBackgroundImage;
    [self.collectionView reloadData];
}

- (void)setCalenderDateSelectColor:(UIColor *)calenderDateSelectColor
{
    _calenderDateSelectColor = calenderDateSelectColor;
    [self.collectionView reloadData];
}

- (void)setCalenderDateTagColor:(UIColor *)calenderDateTagColor
{
    _calenderDateTagColor = calenderDateTagColor;
    [self.collectionView reloadData];
}

- (void)setCalenderTodayColor:(UIColor *)calenderTodayColor
{
    _calenderTodayColor = calenderTodayColor;
    [self.collectionView reloadData];
}

- (void)setCalenderTodayTagColor:(UIColor *)calenderTodayTagColor
{
    _calenderTodayTagColor = calenderTodayTagColor;
    [self.collectionView reloadData];
}

- (void)setCanSelectMore:(BOOL)canSelectMore
{
    self.collectionView.allowsMultipleSelection = canSelectMore;
}

#pragma mark - Lazy
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = ({
            UICollectionViewFlowLayout * layout;
            if (self.scrollDirection == WYACalendarScrollHorizontal) {
                layout = self.flowLayout;
            } else {
                layout                     = [[UICollectionViewFlowLayout alloc] init];
                layout.headerReferenceSize = CGSizeMake(self.cmam_width, 50);
            }

            UICollectionView * object = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
            if (self.scrollDirection == WYACalendarScrollHorizontal) {
                object.pagingEnabled = YES;
            }
            object.dataSource = self;
            object.delegate   = self;
            [object registerClass:[WYACalendarItemCell class] forCellWithReuseIdentifier:@"cell"];
            [object registerClass:[WYACalendarHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
            object.backgroundColor                = [UIColor clearColor];
            object.showsHorizontalScrollIndicator = NO;
            object.allowsMultipleSelection        = NO;
            object;
        });
    }
    return _collectionView;
}
- (UIView *)backgroundView
{
    if (!_backgroundView) {
        _backgroundView = ({
            UIView * object = [[UIView alloc] init];
            object;
        });
    }
    return _backgroundView;
}

- (UIImageView *)backgroundImageView
{
    if (!_backgroundImageView) {
        _backgroundImageView = ({
            UIImageView * object          = [[UIImageView alloc] init];
            object.userInteractionEnabled = YES;
            object.contentMode            = UIViewContentModeScaleAspectFill;
            object.clipsToBounds          = YES;
            object.hidden                 = YES;
            object;
        });
    }
    return _backgroundImageView;
}

- (UILabel *)backgroundLabel
{
    if (!_backgroundLabel) {
        _backgroundLabel = ({
            UILabel * object = [[UILabel alloc] init];
            object.hidden    = YES;
            object;
        });
    }
    return _backgroundLabel;
}

- (UIView *)dateNoteView
{
    if (!_dateNoteView) {
        _dateNoteView = ({
            UIView * object = [[UIView alloc] init];
            CGFloat width   = self.cmam_width / self.weekdayArray.count;
            for (NSInteger i = 0; i < self.weekdayArray.count; i++) {
                NSString * string   = self.weekdayArray[i];
                UILabel * label     = [[UILabel alloc] init];
                label.text          = string;
                label.textAlignment = NSTextAlignmentCenter;
                label.frame         = CGRectMake(width * i, 0, width, 44);
                [object addSubview:label];
            }
            object;
        });
    }
    return _dateNoteView;
}

- (NSArray *)weekdayArray
{
    if (!_weekdayArray) {
        _weekdayArray = ({
            NSArray * object = @[ @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六" ];
            object;
        });
    }
    return _weekdayArray;
}

- (WYACalendarBottomView *)bottomView
{
    if (!_bottomView) {
        _bottomView = ({
            WYACalendarBottomView * object = [[WYACalendarBottomView alloc] init];
            object;
        });
    }
    return _bottomView;
}

- (WYACalendarFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = ({
            WYACalendarFlowLayout * object = [[WYACalendarFlowLayout alloc] init];
            object.delegate                = self;
            object.calendar                = self;
            object;
        });
    }
    return _flowLayout;
}

- (NSMutableArray *)selectDates
{
    if (!_selectDates) {
        _selectDates = ({
            NSMutableArray * object = [[NSMutableArray alloc] init];
            object;
        });
    }
    return _selectDates;
}
@end
