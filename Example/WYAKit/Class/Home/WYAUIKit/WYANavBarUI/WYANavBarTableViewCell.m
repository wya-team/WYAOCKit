//
//  WYANavBarTableViewCell.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2019/1/7.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYANavBarTableViewCell.h"

@interface WYANavBarTableViewCell ()
@property (nonatomic, strong) UILabel * contentLabel;
@end

@implementation WYANavBarTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.contentLabel];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker * make) {
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
    }];
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = ({
            UILabel * object           = [[UILabel alloc] init];
            object.font                = FONT(16);
            object.textColor           = BLACKTEXTCOLOR;
            object.backgroundColor     = WHITECOLOR;
            object.layer.cornerRadius  = 10;
            object.layer.masksToBounds = YES;
            object;
        });
    }
    return _contentLabel;
}
- (void)setTitleString:(NSString *)titleString {
    _titleString           = titleString;
    self.contentLabel.text = titleString;
}
@end
