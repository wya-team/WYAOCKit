//
//  WYAAdaptiveLatticeView.h
//  WYAKit
//
//  Created by 李世航 on 2019/6/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAAdaptiveLatticeView : UIView
@property (nonatomic, copy) void (^updateFrame)(WYAAdaptiveLatticeView * view, CGRect rect);
- (void)addTitles:(NSArray *)titles;
@end

NS_ASSUME_NONNULL_END
