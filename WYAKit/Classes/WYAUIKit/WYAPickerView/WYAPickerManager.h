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

@property (nonatomic, copy)   NSString * selectYear;
@property (nonatomic, copy)   NSString * selectMonth;
@end

NS_ASSUME_NONNULL_END
