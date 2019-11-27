//
//  WYAJoiningTogetherCell.m
//  WYAKit
//
//  Created by 李世航 on 2019/7/27.
//

#import "WYAJoiningTogetherCell.h"

@interface WYAJoiningTogetherCell ()

@end

@implementation WYAJoiningTogetherCell
#pragma mark - LifeCircle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.imgView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imgView.frame = self.contentView.frame;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Lazy
- (UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = ({
            UIImageView * object = [[UIImageView alloc] init];
            object.contentMode   = UIViewContentModeScaleAspectFill;
            object.clipsToBounds = YES;
            object;
        });
    }
    return _imgView;
}
@end
