//
//  WYAFreedomCell.m
//  WYAKit
//
//  Created by 李世航 on 2019/7/27.
//

#import "WYAFreedomCell.h"

@interface WYAFreedomCell ()
@property (nonatomic, strong) UIImageView * imageView;
@end

@implementation WYAFreedomCell
#pragma mark - LifeCircle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat imageView_x      = 5;
    CGFloat imageView_y      = 5;
    CGFloat imageView_width  = self.cmam_width - 10;
    CGFloat imageView_height = self.cmam_height - 10;
    CGRect imageView_rect    = CGRectMake(imageView_x, imageView_y, imageView_width, imageView_height);
    self.imageView.frame     = imageView_rect;
}

#pragma mark - Setter
- (void)setImage:(UIImage *)image
{
    if (image) {
        self.imageView.image = image;
    }
}
@end
