//
//  WYAVideoCell.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/11/20.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYAVideoCell.h"

@interface WYAVideoCell ()
@property (nonatomic, strong) UILabel * label;
@property (nonatomic, strong) UIView * videoSuperView;
@property (nonatomic, strong) UIView * effectView;
@end

@implementation WYAVideoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        [self.contentView addSubview:self.videoSuperView];
//        [self.videoSuperView addSubview:self.playView];
        [self.videoSuperView addSubview:self.effectView];
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat label_x = 0;
    CGFloat label_y = 0;
    CGFloat label_width = self.contentView.cmam_width;
    CGFloat label_height = 80;
    CGRect label_rect = CGRectMake(label_x, label_y,  label_width, label_height);
    self.label.frame = label_rect;

    CGFloat videoSuperView_x = 0;
    CGFloat videoSuperView_y = self.label.cmam_bottom + 20;
    CGFloat videoSuperView_width = self.contentView.cmam_width;
    CGFloat videoSuperView_height = self.contentView.cmam_height - 100;
    CGRect videoSuperView_rect = CGRectMake(videoSuperView_x, videoSuperView_y,  videoSuperView_width, videoSuperView_height);
    self.videoSuperView.frame = videoSuperView_rect;
    self.effectView.frame = self.videoSuperView.bounds;

}

- (UIView *)videoSuperView{
    if (!_videoSuperView) {
        _videoSuperView = [[UIView alloc] init];
        _videoSuperView.tag = 123456789;
    }
    return _videoSuperView;
}

- (UIView *)effectView {
    if (!_effectView) {
        if (@available(iOS 8.0, *)) {
            UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
            _effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        } else {
            UIToolbar *effectView = [[UIToolbar alloc] init];
            effectView.barStyle = UIBarStyleBlackTranslucent;
            _effectView = effectView;
        }
    }
    return _effectView;
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.text = @"这是一串测试文字，可能非常的长。这是一串测试文字，可能非常的长。这是一串测试文字，可能非常的长。";
        _label.numberOfLines = 0;
        _label.textColor = [UIColor blackColor];
    }
    return _label;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
