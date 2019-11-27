//
//  WYACalendarCell.m
//  WYAKit
//
//  Created by 李世航 on 2019/7/31.
//

#import "WYACalendarItemCell.h"

@interface WYACalendarItemCell ()
@property (nonatomic, strong) CALayer * imageLayer;
@property (nonatomic, strong) UIView * topContainerView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIView * tagView;
@property (nonatomic, strong) UIImage * backgroundImage;

@end

@implementation WYACalendarItemCell
#pragma mark - LifeCircle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        [self.contentView wya_addSubViews:@[ self.titleLabel, self.tagView ]];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat titleLabel_x               = (self.contentView.cmam_width - 25 * SizeAdapter) / 2;
    CGFloat titleLabel_y               = 5 * SizeAdapter;
    CGFloat titleLabel_width           = 25 * SizeAdapter;
    CGFloat titleLabel_height          = 25 * SizeAdapter;
    CGRect titleLabel_rect             = CGRectMake(titleLabel_x, titleLabel_y, titleLabel_width, titleLabel_height);
    self.titleLabel.frame              = titleLabel_rect;
    self.titleLabel.layer.cornerRadius = titleLabel_height / 2;

    CGFloat tagView_x               = (self.cmam_width - 5 * SizeAdapter) / 2;
    CGFloat tagView_y               = self.titleLabel.cmam_bottom + 5 * SizeAdapter;
    CGFloat tagView_width           = 5 * SizeAdapter;
    CGFloat tagView_height          = 5 * SizeAdapter;
    CGRect tagView_rect             = CGRectMake(tagView_x, tagView_y, tagView_width, tagView_height);
    self.tagView.frame              = tagView_rect;
    self.tagView.layer.cornerRadius = tagView_height / 2;
}

#pragma mark - Setter
- (void)setModel:(WYACalendarModel *)model
{
    _model = model;
    if (model) {
        if ([model.date wya_isToday]) {
            if (self.isSelected) {
                self.titleLabel.backgroundColor = model.selectColor;
            } else {
                self.titleLabel.backgroundColor = model.todayColor;
            }
            if (self.isSelected) {
                self.tagView.backgroundColor = model.tagColor;
            } else {
                self.tagView.backgroundColor = model.todayTagColor;
            }
        } else {
            if (self.isSelected) {
                self.titleLabel.backgroundColor = model.selectColor;
            } else {
                self.titleLabel.backgroundColor = [UIColor clearColor];
            }
            if (self.isSelected) {
                self.tagView.backgroundColor = model.tagColor;
            } else {
                self.tagView.backgroundColor = [UIColor clearColor];
            }
        }
        self.titleLabel.text = model.text;
        self.titleLabel.font = model.titleFont;
        //        if (model.isNowMonth) {
        self.titleLabel.textColor = model.titleColor;
        //        } else {
        //            self.titleLabel.textColor = [UIColor grayColor];
        //        }
    }
}

- (void)reloadUI
{
    if ([self.model.date wya_isToday]) {
        if (self.isSelected) {
            self.titleLabel.backgroundColor = self.model.selectColor;
        } else {
            self.titleLabel.backgroundColor = self.model.todayColor;
        }
        if (self.isSelected) {
            self.tagView.backgroundColor = self.model.tagColor;
        } else {
            self.tagView.backgroundColor = self.model.todayTagColor;
        }
    } else {
        if (self.isSelected) {
            self.titleLabel.backgroundColor = self.model.selectColor;
        } else {
            self.titleLabel.backgroundColor = [UIColor clearColor];
        }
        if (self.isSelected) {
            self.tagView.backgroundColor = self.model.tagColor;
        } else {
            self.tagView.backgroundColor = [UIColor clearColor];
        }
    }
    self.titleLabel.text      = self.model.text;
    self.titleLabel.font      = self.model.titleFont;
    self.titleLabel.textColor = self.model.titleColor;
}

#pragma mark - Lazy
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel                     = [[UILabel alloc] init];
        _titleLabel.textAlignment       = NSTextAlignmentCenter;
        _titleLabel.layer.masksToBounds = YES;
    }
    return _titleLabel;
}

- (UIView *)tagView
{
    if (!_tagView) {
        _tagView = ({
            UIView * object            = [[UIView alloc] init];
            object.backgroundColor     = [UIColor clearColor];
            object.layer.masksToBounds = YES;
            object;
        });
    }
    return _tagView;
}

- (UIView *)topContainerView
{
    if (!_topContainerView) {
        _topContainerView = ({
            UIView * object = [[UIView alloc] init];
            object;
        });
    }
    return _topContainerView;
}
@end
