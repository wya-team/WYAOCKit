//
//  WYAPickerManager.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAPickerManager : NSObject
@property (nonatomic, strong) NSDate * minimumDate;
@property (nonatomic, strong) NSDate * maximumDate;
@property (nonatomic, strong) NSMutableArray * yearArray;
@property (nonatomic, strong) NSMutableArray * monthArray;
@property (nonatomic, strong) NSMutableArray * dayArray;
@property (nonatomic, strong) NSMutableArray * hourArray;
@property (nonatomic, strong) NSMutableArray * minuteArray;
@property (nonatomic, strong) NSMutableArray * secondArray;

@property (nonatomic, assign) NSInteger selectYear;
@property (nonatomic, assign) NSInteger selectMonth;

@property (nonatomic, strong) NSDateComponents * selectComponents;
@property (nonatomic, strong) NSDate * selectDate;

/// 获取当前选中日期在选择器上对应的选择行数
@property (nonatomic, assign) NSInteger yearRow;
@property (nonatomic, assign) NSInteger monthRow;
@property (nonatomic, assign) NSInteger dayRow;
@property (nonatomic, assign) NSInteger hourRow;
@property (nonatomic, assign) NSInteger minuteRow;
@property (nonatomic, assign) NSInteger secondRow;
@end

NS_ASSUME_NONNULL_END
