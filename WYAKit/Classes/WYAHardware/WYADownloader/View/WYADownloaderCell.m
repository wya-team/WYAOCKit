//
//  WYADownloaderCell.m
//  WYAKit
//
//  Created by 李世航 on 2019/1/10.
//

#import "WYADownloaderCell.h"

@interface WYADownloaderCell ()

@end

@implementation WYADownloaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.placeholderButton];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.fileNumberLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat placeholderButton_X      = 16 * SizeAdapter;
    CGFloat placeholderButton_Y      = 5 * SizeAdapter;
    CGFloat placeholderButton_Width  = 120 * SizeAdapter;
    CGFloat placeholderButton_Height = 80 * SizeAdapter;
    self.placeholderButton.frame     = CGRectMake(placeholderButton_X, placeholderButton_Y,
                                              placeholderButton_Width, placeholderButton_Height);

    CGFloat titleLabel_X     = CGRectGetMaxX(self.placeholderButton.frame) + 10 * SizeAdapter;
    CGFloat titleLabel_Y     = 5 * SizeAdapter;
    CGFloat titleLabel_Width = self.contentView.cmam_width -
                               CGRectGetMaxX(self.placeholderButton.frame) - 20 * SizeAdapter;
    CGFloat titleLabel_Height = 50 * SizeAdapter;
    self.titleLabel.frame =
    CGRectMake(titleLabel_X, titleLabel_Y, titleLabel_Width, titleLabel_Height);

    CGFloat fileNumberLabel_X = CGRectGetMaxX(self.placeholderButton.frame) + 10 * SizeAdapter;
    CGFloat fileNumberLabel_Y = self.contentView.cmam_height - 35 * SizeAdapter;
    CGFloat fileNumberLabel_Width =
    self.contentView.cmam_width - self.placeholderButton.cmam_right - 20 * SizeAdapter;
    CGFloat fileNumberLabel_Height = 15 * SizeAdapter;
    self.fileNumberLabel.frame     = CGRectMake(fileNumberLabel_X, fileNumberLabel_Y,
                                            fileNumberLabel_Width, fileNumberLabel_Height);
}

#pragma mark - Getter -
- (UIButton *)placeholderButton
{
    if (!_placeholderButton) {
        _placeholderButton = ({
            UIButton * button          = [UIButton buttonWithType:UIButtonTypeCustom];
            button.layer.cornerRadius  = 5 * SizeAdapter;
            button.layer.masksToBounds = YES;
            [button setBackgroundImage:[UIImage loadBundleImage:@"icon_photo"
                                                      ClassName:NSStringFromClass(self.class)]
                              forState:UIControlStateNormal];
            button;
        });
    }
    return _placeholderButton;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel * object = [[UILabel alloc] init];
            object.font      = FONT(15);
            object;
        });
    }
    return _titleLabel;
}

- (UILabel *)fileNumberLabel
{
    if (!_fileNumberLabel) {
        _fileNumberLabel = ({
            UILabel * object = [[UILabel alloc] init];
            object.font      = FONT(15);
            object;
        });
    }
    return _fileNumberLabel;
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

@end
