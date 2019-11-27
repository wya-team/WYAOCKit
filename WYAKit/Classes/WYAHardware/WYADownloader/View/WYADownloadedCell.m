//
//  WYADownloadedTableViewCell.m
//  WYAKit
//
//  Created by 李世航 on 2019/1/7.
//

#import "WYADownloadedCell.h"
#import "WYADownloader.h"

@interface WYADownloadedCell ()
@property (nonatomic, strong) UIButton * editButton;
@property (nonatomic, strong) UIView * bgView;
@property (nonatomic, strong) UILabel * speedLabel;
@property (nonatomic, strong) UIButton * placeholderButton; //开始或暂停
@property (nonatomic, strong) UILabel * downloadNameLabel;
@end

@implementation WYADownloadedCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.editButton];
        [self.contentView addSubview:self.bgView];
        [self.bgView addSubview:self.placeholderButton];
        [self.bgView addSubview:self.speedLabel];
        [self.bgView addSubview:self.downloadNameLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat editButton_X      = 16 * SizeAdapter;
    CGFloat editButton_Y      = 20;
    CGFloat editButton_Width  = 30 * SizeAdapter;
    CGFloat editButton_Height = 30 * SizeAdapter;
    self.editButton.frame =
    CGRectMake(editButton_X, editButton_Y, editButton_Width, editButton_Height);

    CGFloat bgView_X     = self.isEdit ? CGRectGetMaxX(self.editButton.frame) : 0;
    CGFloat bgView_Y     = 0;
    CGFloat bgView_Width = self.isEdit
                           ? self.contentView.cmam_width - CGRectGetMaxX(self.editButton.frame)
                           : self.contentView.cmam_width;
    CGFloat bgView_Height = self.contentView.cmam_height;
    self.bgView.frame     = CGRectMake(bgView_X, bgView_Y, bgView_Width, bgView_Height);

    CGFloat placeholderButton_X      = 16 * SizeAdapter;
    CGFloat placeholderButton_Y      = 5;
    CGFloat placeholderButton_Width  = 120 * SizeAdapter;
    CGFloat placeholderButton_Height = 60;
    self.placeholderButton.frame     = CGRectMake(placeholderButton_X, placeholderButton_Y,
                                              placeholderButton_Width, placeholderButton_Height);

    CGFloat downloadNameLabel_X = CGRectGetMaxX(self.placeholderButton.frame) + 10 * SizeAdapter;
    CGFloat downloadNameLabel_Y = 5;
    CGFloat downloadNameLabel_Width =
    self.bgView.cmam_width - CGRectGetMaxX(self.placeholderButton.frame) - 20 * SizeAdapter;
    CGFloat downloadNameLabel_Height = 30;
    self.downloadNameLabel.frame     = CGRectMake(downloadNameLabel_X, downloadNameLabel_Y,
                                              downloadNameLabel_Width, downloadNameLabel_Height);

    CGFloat speedLabel_X = CGRectGetMaxX(self.placeholderButton.frame) + 10 * SizeAdapter;
    CGFloat speedLabel_Y = CGRectGetMaxY(self.downloadNameLabel.frame) + 10;
    CGFloat speedLabel_Width =
    self.bgView.cmam_width - self.placeholderButton.cmam_right - 20 * SizeAdapter;
    CGFloat speedLabel_Height = 15;
    self.speedLabel.frame =
    CGRectMake(speedLabel_X, speedLabel_Y, speedLabel_Width, speedLabel_Height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Setter -
- (void)setModel:(WYADownloadModel *)model
{
    _model = model;
    if (model) {
        self.downloadNameLabel.text = model.title;
        if (model.videoImage) {
            [self.placeholderButton setImage:model.videoImage forState:UIControlStateNormal];
        } else {
            model.imageCallback = ^(UIImage * _Nonnull image) {
                [self.placeholderButton setImage:image forState:UIControlStateNormal];
            };
        }
        self.speedLabel.text = model.fileSize;
    }
}

- (void)setIsEdit:(BOOL)isEdit
{
    _isEdit                = isEdit;
    self.editButton.hidden = !_isEdit;
    [self layoutIfNeeded];
}

- (void)setIsAllSelect:(BOOL)isAllSelect
{
    if (self.isEdit) {
        self.editButton.selected = isAllSelect;
    }
}

#pragma mark - Getter -
- (UIButton *)placeholderButton
{
    if (!_placeholderButton) {
        _placeholderButton = ({
            UIButton * button          = [UIButton buttonWithType:UIButtonTypeCustom];
            button.layer.cornerRadius  = 5 * SizeAdapter;
            button.layer.masksToBounds = YES;
            [button setBackgroundColor:[UIColor grayColor]];
            button;
        });
    }
    return _placeholderButton;
}

- (UILabel *)speedLabel
{
    if (!_speedLabel) {
        _speedLabel = ({
            UILabel * object = [[UILabel alloc] init];
            object.font      = FONT(15);
            object;
        });
    }
    return _speedLabel;
}

- (UILabel *)downloadNameLabel
{
    if (!_downloadNameLabel) {
        _downloadNameLabel = ({
            UILabel * object = [[UILabel alloc] init];
            object.font      = FONT(15);
            object;
        });
    }
    return _downloadNameLabel;
}

- (UIButton *)editButton
{
    if (!_editButton) {
        _editButton = ({
            UIButton * object = [[UIButton alloc] init];
            [object setImage:[UIImage loadBundleImage:@"icon_radio_normal"
                                            ClassName:NSStringFromClass(self.class)]
                    forState:UIControlStateNormal];
            [object setImage:[UIImage loadBundleImage:@"icon_radio_selected"
                                            ClassName:NSStringFromClass(self.class)]
                    forState:UIControlStateSelected];
            WeakSelf(weakSelf);
            [object addCallBackAction:^(UIButton * button) {
                button.selected = !button.selected;
                if (weakSelf.editCallback) {
                    weakSelf.editCallback(weakSelf.model, weakSelf.editButton.selected);
                }
            }];
            object;
        });
    }
    return _editButton;
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = ({
            UIView * object        = [[UIView alloc] init];
            object.backgroundColor = [UIColor whiteColor];
            object;
        });
    }
    return _bgView;
}

@end
