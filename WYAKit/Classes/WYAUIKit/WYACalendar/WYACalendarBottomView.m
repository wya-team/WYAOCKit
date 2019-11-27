//
//  WYACalendarBottomView.m
//  WYAKit
//
//  Created by 李世航 on 2019/8/2.
//

#import "WYACalendarBottomView.h"

@interface WYACalendarBottomView ()

@end

@implementation WYACalendarBottomView
#pragma mark - LifeCircle
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self wya_addSubViews:@[ self.dateLabel ]];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat dateLabel_x      = 0;
    CGFloat dateLabel_y      = 0;
    CGFloat dateLabel_width  = self.cmam_width;
    CGFloat dateLabel_height = self.cmam_height;
    CGRect dateLabel_rect    = CGRectMake(dateLabel_x, dateLabel_y, dateLabel_width, dateLabel_height);
    self.dateLabel.frame     = dateLabel_rect;
}

#pragma mark - Lazy
- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = ({
            UILabel * object     = [[UILabel alloc] init];
            object.text          = @"哈哈，这里应是日期";
            object.textAlignment = NSTextAlignmentCenter;
            object;
        });
    }
    return _dateLabel;
}
@end
