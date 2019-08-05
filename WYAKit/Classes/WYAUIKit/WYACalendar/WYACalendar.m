//
//  WYACalendar.m
//  WYAKit
//
//  Created by 李世航 on 2019/7/31.
//

#import "WYACalendar.h"
#import "WYACalendarCell.h"
#import "WYACalendarHeaderView.h"
#import "WYACalendarFlowLayout.h"
#import "WYACalendarModel.h"
#import "WYACalendarBottomView.h"

@interface WYACalendar ()<UICollectionViewDataSource, UICollectionViewDelegate, WYACalendarFlowLayoutDelegate, WYACalendarOnlyOneRowLayoutDelegate>
@property (nonatomic, assign) WYACalendarScrollDirection scrollDirection;
@property (nonatomic, strong) UIView * backgroundView;
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) UIView * dateNoteView;
@property (nonatomic, strong) WYACalendarBottomView * bottomView;

@property (nonatomic, strong) UIImageView * backgroundImageView;
@property (nonatomic, strong) UILabel * backgroundLabel;

@property (nonatomic, strong) WYACalendarFlowLayout * flowLayout;
@property (nonatomic, strong) WYACalendarOnlyOneRowLayout * rowLayout;

@property (nonatomic, strong) NSCalendar * calendar;

@property (nonatomic, strong) NSArray * yearArray;
@property (nonatomic, strong) NSArray * weekdayArray;
@property (nonatomic, strong) NSMutableArray * calendarModels;
@end

@implementation WYACalendar
{
    WYACalendarCell * lastCell; // 选中的最后一个cell
    WYACalendarModel * lastModel;
    CGPoint lastPoint;

    NSInteger calendarSectionNumber; // 有多少个区
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

- (instancetype)initWithFrame:(CGRect)frame ScrollDirection:(WYACalendarScrollDirection)scrollDirection{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollDirection = scrollDirection;
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!calendarHeight) {
        calendarHeight = self.cmam_height;
    }
    CGFloat dateNoteView_x = 0;
    CGFloat dateNoteView_y = 0;
    CGFloat dateNoteView_width = self.cmam_width;
    CGFloat dateNoteView_height = 44;
    CGRect dateNoteView_rect = CGRectMake(dateNoteView_x, dateNoteView_y,  dateNoteView_width, dateNoteView_height);
    self.dateNoteView.frame = dateNoteView_rect;

    CGFloat bottomView_height = 44;

    CGFloat collectionView_x = 0;
    CGFloat collectionView_y = self.dateNoteView.cmam_bottom;
    CGFloat collectionView_width = self.cmam_width;
    CGFloat collectionView_height = self.cmam_height - self.dateNoteView.cmam_height - bottomView_height;
    CGRect collectionView_rect = CGRectMake(collectionView_x, collectionView_y,  collectionView_width, collectionView_height);
    self.collectionView.frame = collectionView_rect;

    CGFloat bottomView_x = 0;
    CGFloat bottomView_y = self.collectionView.cmam_bottom;
    CGFloat bottomView_width = self.cmam_width;
    CGRect bottomView_rect = CGRectMake(bottomView_x, bottomView_y,  bottomView_width, bottomView_height);
    self.bottomView.frame = bottomView_rect;

    CGFloat backgroundView_x = 0;
    CGFloat backgroundView_y = self.dateNoteView.cmam_bottom;
    CGFloat backgroundView_width = self.cmam_width;
    CGFloat backgroundView_height = self.collectionView.cmam_height;
    CGRect backgroundView_rect = CGRectMake(backgroundView_x, backgroundView_y,  backgroundView_width, backgroundView_height);
    self.backgroundView.frame = backgroundView_rect;
    self.backgroundImageView.frame = CGRectMake(0, 0, self.backgroundView.cmam_width, self.backgroundView.cmam_height);
    self.backgroundLabel.frame = self.backgroundImageView.frame;
}

#pragma mark - Private Method
- (void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    [self wya_addSubViews:@[self.backgroundView,
                            self.dateNoteView,
                            self.collectionView,
                            self.bottomView]];
    [self.backgroundView wya_addSubViews:@[self.backgroundImageView, self.backgroundLabel]];
    UISwipeGestureRecognizer * upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(upSwipeAction:)];
    upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:upSwipe];

    UISwipeGestureRecognizer * downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(downSwipeAction:)];
    downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:downSwipe];

}

- (void)configDataSource{

    if (self.dataSource && [self.dataSource respondsToSelector:@selector(calendarDateRange)]) {
        self.yearArray = [self.dataSource calendarDateRange];
    }

    calendarSectionNumber = 12 * self.yearArray.count;
//    self.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    self.calendar = [NSCalendar currentCalendar];

    NSMutableArray * moreRows = [NSMutableArray array];
    for (NSInteger i = 0; i< calendarSectionNumber; i++) {
        NSMutableArray * array = [NSMutableArray arrayWithCapacity:0];
        [moreRows addObject:array];
    }

    for (NSInteger index=0; index<calendarSectionNumber; index++) {
        NSInteger yearIndex = index / 12;
        NSInteger monthIndex = index % 12;
        NSMutableArray * array = moreRows[index];
        NSDate * date = [self getFormatterMonthDaysWithYear:[self.yearArray[yearIndex] integerValue] section:monthIndex row:0];
        NSInteger weekDay = [NSDate wya_weekday:date];
        if (weekDay == 7) {
            weekDay = 0;
        }
        NSInteger number = [self convertDateToTotalDays:date];
        NSInteger row = (number + weekDay) / 7;
        NSInteger column = (number + weekDay) % 7;
        if (column > 0) {
            row = row + 1;
        }

        NSInteger count = row * 7;
        for (NSInteger j = 0; j<count; j++) {
            WYACalendarModel * model = [[WYACalendarModel alloc]init];
            [array addObject:model];
        }
    }
    self.calendarModels = moreRows;
    [self.collectionView reloadData];

//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSInteger year = [[NSDate date] wya_year];
//        NSNumber * fristYearNumber = [self.yearArray firstObject];
//        NSInteger month = [[NSDate date] wya_month];
//        CGFloat endOffsetX = ((year - fristYearNumber.integerValue) * 12 + (month - 1)) * self.collectionView.cmam_width;
//        [self.collectionView setContentOffset:CGPointMake(endOffsetX, 0) animated:NO];
//        self.bottomView.dateLabel.text = [NSString stringWithFormat:@"%d年%d月",[[NSDate date] wya_year], month];
//
//        UIImage * image;
//        if (self.dataSource && [self.dataSource respondsToSelector:@selector(calendarView:imageWithIndexPath:)]) {
//            image = [self.dataSource calendarView:self imageWithIndexPath:[NSIndexPath indexPathForItem:0 inSection:endOffsetX / self.collectionView.cmam_width]];
//        }
//
//        NSMutableAttributedString * text;
//        if (self.dataSource && [self.dataSource respondsToSelector:@selector(calendarView:textWithIndexPath:)]) {
//            text = [self.dataSource calendarView:self textWithIndexPath:[NSIndexPath indexPathForItem:0 inSection:endOffsetX / self.collectionView.cmam_width]];
//        }
//        if (image) {
//            self.backgroundImageView.hidden = NO;
//            self.backgroundImageView.image = image;
//        }
//
//        if (text) {
//            self.backgroundLabel.hidden = NO;
//            self.backgroundLabel.attributedText = text;
//        }
//    });

}

- (void)upSwipeAction:(UISwipeGestureRecognizer *)gesture{
    if (!lastModel) {
        return;
    }
    NSLog(@"向上轻扫");

    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionLayoutSubviews|UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.cmam_height = 60 * SizeAdapter + 88;
    } completion:^(BOOL finished) {
        lastPoint = self.collectionView.contentOffset;
        [self.collectionView setCollectionViewLayout:self.rowLayout animated:NO completion:^(BOOL finished) {
            NSInteger lastYear = [lastModel.date wya_year];
            NSNumber * fristYear = [self.yearArray firstObject];

            NSInteger month = [lastModel.date wya_month] + (lastYear - [fristYear integerValue]) * 12;
            NSInteger allRow = 0;
            for (NSInteger i = 0; i<month-1; i++) {
                NSMutableArray * array = self.calendarModels[i];
                NSInteger row = array.count / 7;
                NSInteger column = array.count % 7;
                if (column > 0) {
                    row = row + 1;
                }
                allRow = allRow + row;
            }
            NSInteger currentSection = lastModel.indexPath.item / 7;
            NSLog(@"row==%d",allRow);
            [self.collectionView setContentOffset:CGPointMake((allRow + currentSection) * self.collectionView.cmam_width, 0)];
        }];
    }];

}

- (void)downSwipeAction:(UISwipeGestureRecognizer *)gesture{
    NSLog(@"向下轻扫");
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionLayoutSubviews|UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.cmam_height = calendarHeight;
    } completion:^(BOOL finished) {
        [self.collectionView setCollectionViewLayout:self.flowLayout animated:NO completion:^(BOOL finished) {
            [self.collectionView setContentOffset:lastPoint];
            NSInteger index = self.collectionView.contentOffset.x/self.collectionView.cmam_width;
            NSInteger yearIndex = index / 12;
            NSInteger monthindex = index % 12;
            self.bottomView.dateLabel.text = [NSString stringWithFormat:@"%d年%d月",[self.yearArray[yearIndex] integerValue], monthindex+1];
        }];
    }];
}

- (NSDate *)getFormatterMonthDaysWithYear:(NSInteger)year section:(NSInteger)section row:(NSInteger)row{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString * string = [NSString stringWithFormat:@"%d-%02d-%02d",year,section + 1,row+1];
    NSDate * date = [dateFormatter dateFromString:string];
    return date;
}

//根据date获取当月总天数
- (NSInteger)convertDateToTotalDays:(NSDate *)date {
    NSRange daysInOfMonth = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInOfMonth.length;
}

//根据date获取偏移指定月数的date
- (NSDate *)getDateFrom:(NSDate *)date offsetMonths:(NSInteger)offsetMonths {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];

    NSDateComponents *lastMonthComps = [[NSDateComponents alloc] init];
    [lastMonthComps setMonth:offsetMonths];  //year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    NSDate *newdate = [self.calendar dateByAddingComponents:lastMonthComps toDate:date options:0];
    return newdate;
}

//根据date获取偏移指定年数的date
- (NSDate *)getDateFrom:(NSDate *)date offsetYears:(NSInteger)offsetYears {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];

    NSDateComponents *lastMonthComps = [[NSDateComponents alloc] init];
    [lastMonthComps setYear:offsetYears];  //year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    NSDate *newdate = [self.calendar dateByAddingComponents:lastMonthComps toDate:date options:0];
    return newdate;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.calendarModels.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSMutableArray * array = self.calendarModels[section];
    return array.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WYACalendarCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger yearIndex = indexPath.section / 12;
    NSInteger monthIndex = indexPath.section % 12;
    NSDate *date = [self getFormatterMonthDaysWithYear:[self.yearArray[yearIndex] integerValue] section:monthIndex row:0];
    NSInteger weekDay = [NSDate wya_weekday:date];
    if (weekDay == 7) {
        weekDay = 0;
    }
    WYACalendarModel * model = self.calendarModels[indexPath.section][indexPath.item];
    NSInteger todayYear = [[NSDate date] wya_year];
    NSNumber * number = [NSNumber numberWithInteger:todayYear];
    NSInteger todayYearIndex = [self.yearArray indexOfObject:number];
    NSInteger todayMonth = [[NSDate date] wya_month];
    NSInteger today = [[NSDate date] wya_day] + weekDay - 1;
    if (indexPath.section == todayYearIndex * 12 + todayMonth - 1) {
        if (indexPath.row == today) {
            model.isToday = YES;
        }
    }

    NSInteger oneMonthAllDay = [self convertDateToTotalDays:date];
    if (indexPath.item < weekDay || indexPath.item >= oneMonthAllDay + weekDay) {
        model.text = @"";
    } else {
        model.text = [NSString stringWithFormat:@"%d",indexPath.item - weekDay + 1];
        model.titleColor = self.calenderDateTitleColor;
        model.titleFont = self.calenderDateTitleFont;
        model.backgroundImage = self.calenderDateBackgroundImage;
        model.todayColor = self.calenderTodayColor;
        model.todayTagColor = self.calenderTodayTagColor;
        model.selectColor = self.calenderDateSelectColor;
        model.tagColor = self.calenderDateTagColor;
        model.date = date;
        model.chineseDateText = [NSString stringWithFormat:@"%d",[model.date wya_chineseDay]];
    }
    model.indexPath = indexPath;
    cell.model = model;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (self.scrollDirection == WYACalendarScrollVertical) {
        if (kind == UICollectionElementKindSectionHeader) {

            WYACalendarHeaderView * view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                              withReuseIdentifier:@"header"
                                                                                     forIndexPath:indexPath];
            view.titleLabel.text = [NSString stringWithFormat:@"%d月",indexPath.section + 1];

            return view;
        }
    }
    return nil;
}

#pragma mark - WYACalendarFlowLayoutDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger yearIndex = indexPath.section / 12;
    NSInteger monthIndex = indexPath.section % 12;
    NSDate *date = [self getFormatterMonthDaysWithYear:[self.yearArray[yearIndex] integerValue] section:monthIndex row:0];
    NSInteger number = [self convertDateToTotalDays:date];
    NSInteger weekDay = [NSDate wya_weekday:date];
    number = number + (weekDay == 7 ? 0 : weekDay);
    NSInteger integer = number / 7;
    NSInteger remainder = number % 7;
    if (remainder > 0) {
        integer = integer + 1;
    }
    CGFloat width = self.collectionView.cmam_width / 7;
    CGFloat height = self.collectionView.cmam_height / integer;
    CGSize size = CGSizeMake(width, height);
//    NSLog(@"collectionSize==%@",NSStringFromCGSize(size));
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (self.scrollDirection == WYACalendarScrollVertical) {
        return CGSizeMake(self.collectionView.cmam_width, 50);
    }
    return CGSizeZero;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//    return CGSizeMake(0.01, 0.01);
//}

#pragma mark - WYACalendarOnlyOneRowLayoutDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView rowlayout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger yearIndex = indexPath.section / 12;
    NSInteger monthIndex = indexPath.section % 12;
    NSDate *date = [self getFormatterMonthDaysWithYear:[self.yearArray[yearIndex] integerValue] section:monthIndex row:0];

    NSInteger number = [self convertDateToTotalDays:date];
    NSInteger weekDay = [NSDate wya_weekday:date];
    number = number + (weekDay == 7 ? 0 : weekDay);
    NSInteger integer = number / 7;
    NSInteger remainder = number % 7;
    if (remainder > 0) {
        integer = integer + 1;
    }
    CGFloat width = self.collectionView.cmam_width / 7;
    CGFloat height = self.collectionView.cmam_height / integer;
    CGSize size = CGSizeMake(width, height);
    //    NSLog(@"collectionSize==%@",NSStringFromCGSize(size));
    return size;
}

#pragma mark - UICollectionViewDelegate
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    WYACalendarCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.model.selectColor = self.calenderDateSelectColor;
    cell.model.tagColor = self.calenderDateTagColor;
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    WYACalendarCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.model.selectColor = [UIColor clearColor];
    cell.model.tagColor = [UIColor clearColor];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    WYACalendarModel * model = self.calendarModels[indexPath.section][indexPath.row];

    NSInteger weekDay = [NSDate wya_weekday:model.date];
    if (weekDay < 7) {
        if (indexPath.item < weekDay) {
            return;
        }
    }

    if (lastModel) {
        if (lastModel == model) {
            model.isSelect = NO;
            lastModel = nil;
        } else {
            if (!self.canSelectMore) {
                lastModel.isSelect = NO;
                model.isSelect = YES;
                lastModel = model;
            } else {
                model.isSelect = YES;
                lastModel = model;
            }
        }
    } else {
        model.isSelect = YES;
        lastModel = model;
    }

    [collectionView reloadData];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.collectionView.collectionViewLayout == self.flowLayout) {

        NSInteger index = scrollView.contentOffset.x/scrollView.cmam_width;
        NSInteger yearIndex = index / 12;
        NSInteger monthindex = index % 12;
        self.bottomView.dateLabel.text = [NSString stringWithFormat:@"%d年%d月",[self.yearArray[yearIndex] integerValue], monthindex+1];

        UIImage * image;
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(calendarView:imageWithIndexPath:)]) {
            image = [self.dataSource calendarView:self imageWithIndexPath:[NSIndexPath indexPathForItem:0 inSection:index]];
        }

        NSMutableAttributedString * text;
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(calendarView:textWithIndexPath:)]) {
            text = [self.dataSource calendarView:self textWithIndexPath:[NSIndexPath indexPathForItem:0 inSection:index]];
        }
        if (image) {
            self.backgroundImageView.hidden = NO;
            self.backgroundImageView.image = image;
        }

        if (text) {
            self.backgroundLabel.hidden = NO;
            self.backgroundLabel.attributedText = text;
        }
    } else if (self.collectionView.collectionViewLayout == self.rowLayout) {
        NSInteger offsetX = self.collectionView.contentOffset.x / self.collectionView.cmam_width;
        NSInteger index = 0;
        for (NSInteger i=0; i<self.calendarModels.count; i++) {
            NSMutableArray * array = self.calendarModels[i];

            NSInteger row = array.count / 7;
            NSInteger column = array.count % 7;
            if (column > 0) {
                row = row + 1;
            }
            index = index + row;
            NSInteger yearIndex = i / 12;
            NSInteger monthIndex = i % 12;
            if (offsetX < index) {
                self.bottomView.dateLabel.text = [NSString stringWithFormat:@"%d年%d月",[self.yearArray[yearIndex] integerValue], monthIndex+1];
                break;
            }
        }
    }

}

#pragma mark - Setter
- (void)setDataSource:(id<WYACalendarDataSource>)dataSource{
    _dataSource = dataSource;
    if (dataSource) {
        [self configDataSource];
    }
}
- (void)setCalenderDateTitleFont:(UIFont *)calenderDateTitleFont{
    _calenderDateTitleFont = calenderDateTitleFont;
    [self.collectionView reloadData];
}

- (void)setCalenderDateTitleColor:(UIColor *)calenderDateTitleColor{
    _calenderDateTitleColor = calenderDateTitleColor;
    [self.collectionView reloadData];
}

- (void)setCalenderDateBackgroundImage:(UIImage *)calenderDateBackgroundImage{
    _calenderDateBackgroundImage = calenderDateBackgroundImage;
    [self.collectionView reloadData];
}

- (void)setCalenderDateSelectColor:(UIColor *)calenderDateSelectColor{
    _calenderDateSelectColor = calenderDateSelectColor;
    [self.collectionView reloadData];
}

- (void)setCalenderDateTagColor:(UIColor *)calenderDateTagColor{
    _calenderDateTagColor = calenderDateTagColor;
    [self.collectionView reloadData];
}

- (void)setCalenderTodayColor:(UIColor *)calenderTodayColor{
    _calenderTodayColor = calenderTodayColor;
    [self.collectionView reloadData];
}

- (void)setCalenderTodayTagColor:(UIColor *)calenderTodayTagColor{
    _calenderTodayTagColor = calenderTodayTagColor;
    [self.collectionView reloadData];
}

- (void)setCanSelectMore:(BOOL)canSelectMore{
    _canSelectMore = canSelectMore;
    [self.collectionView reloadData];
}

#pragma mark - Lazy
- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = ({
            UICollectionViewFlowLayout * layout;
            if (self.scrollDirection == WYACalendarScrollHorizontal) {
                layout = self.flowLayout;
            } else {
                layout = [[UICollectionViewFlowLayout alloc] init];
                layout.headerReferenceSize = CGSizeMake(self.cmam_width, 50);
            }

            UICollectionView * object = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
            if (self.scrollDirection == WYACalendarScrollHorizontal) {
                object.pagingEnabled = YES;
            }
            object.dataSource = self;
            object.delegate = self;
            [object registerClass:[WYACalendarCell class] forCellWithReuseIdentifier:@"cell"];
            [object registerClass:[WYACalendarHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
            object.backgroundColor = [UIColor clearColor];
            object.showsHorizontalScrollIndicator = NO;
            object;
       });
    }
    return _collectionView;
}
- (UIView *)backgroundView{
    if(!_backgroundView){
        _backgroundView = ({
            UIView * object = [[UIView alloc]init];
            object;
        });
    }
    return _backgroundView;
}

- (UIImageView *)backgroundImageView{
    if(!_backgroundImageView){
        _backgroundImageView = ({
            UIImageView * object = [[UIImageView alloc]init];
            object.userInteractionEnabled = YES;
            object.contentMode = UIViewContentModeScaleAspectFill;
            object.clipsToBounds = YES;
            object.hidden = YES;
            object;
       });
    }
    return _backgroundImageView;
}

- (UILabel *)backgroundLabel{
    if(!_backgroundLabel){
        _backgroundLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object.hidden = YES;
            object;
        });
    }
    return _backgroundLabel;
}

- (UIView *)dateNoteView{
    if(!_dateNoteView){
        _dateNoteView = ({
            UIView * object = [[UIView alloc]init];
            CGFloat width = self.cmam_width / self.weekdayArray.count;
            for (NSInteger i = 0; i < self.weekdayArray.count; i++) {
                NSString * string = self.weekdayArray[i];
                UILabel * label = [[UILabel alloc] init];
                label.text = string;
                label.textAlignment = NSTextAlignmentCenter;
                label.frame = CGRectMake(width * i, 0, width, 44);
                [object addSubview:label];
            }
            object;
       });
    }
    return _dateNoteView;
}

- (NSArray *)weekdayArray{
    if(!_weekdayArray){
        _weekdayArray = ({
            NSArray * object = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
            object;
       });
    }
    return _weekdayArray;
}

- (NSMutableArray *)calendarModels{
    if(!_calendarModels){
        _calendarModels = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _calendarModels;
}

- (WYACalendarBottomView *)bottomView{
    if(!_bottomView){
        _bottomView = ({
            WYACalendarBottomView * object = [[WYACalendarBottomView alloc]init];
            object;
       });
    }
    return _bottomView;
}

- (WYACalendarFlowLayout *)flowLayout{
    if(!_flowLayout){
        _flowLayout = ({
            WYACalendarFlowLayout * object = [[WYACalendarFlowLayout alloc]init];
            object.delegate = self;
            object;
       });
    }
    return _flowLayout;
}

- (WYACalendarOnlyOneRowLayout *)rowLayout{
    if(!_rowLayout){
        _rowLayout = ({
            WYACalendarOnlyOneRowLayout * object = [[WYACalendarOnlyOneRowLayout alloc]init];
            object.delegate = self;
            object;
       });
    }
    return _rowLayout;
}

@end
