//
//  WYACalendarHeaderView.m
//  WYAKit
//
//  Created by 李世航 on 2019/8/1.
//

#import "WYACalendarHeaderView.h"

@interface WYACalendarHeaderView ()

@end

@implementation WYACalendarHeaderView

#pragma mark - LifeCircle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(0, 0, self.cmam_width, self.cmam_height);
}

#pragma mark - Lazy
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel               = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
@end
