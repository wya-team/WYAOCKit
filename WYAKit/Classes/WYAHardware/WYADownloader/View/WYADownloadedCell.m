//
//  WYADownloadedTableViewCell.m
//  WYAKit
//
//  Created by 李世航 on 2019/1/7.
//

#import "WYADownloadedCell.h"
#import "WYADownloader.h"

@interface WYADownloadedCell ()
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

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.placeholderButton];
        [self.contentView addSubview:self.speedLabel];
        [self.contentView addSubview:self.downloadNameLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat placeholderButton_X      = 16;
    CGFloat placeholderButton_Y      = 5;
    CGFloat placeholderButton_Width  = 120;
    CGFloat placeholderButton_Height = 60;
    self.placeholderButton.frame     = CGRectMake(placeholderButton_X, placeholderButton_Y, placeholderButton_Width, placeholderButton_Height);

    CGFloat downloadNameLabel_X      = CGRectGetMaxX(self.placeholderButton.frame) + 10;
    CGFloat downloadNameLabel_Y      = 5;
    CGFloat downloadNameLabel_Width  = ScreenWidth - CGRectGetMaxX(self.placeholderButton.frame) - 20;
    CGFloat downloadNameLabel_Height = 30;
    self.downloadNameLabel.frame     = CGRectMake(downloadNameLabel_X, downloadNameLabel_Y, downloadNameLabel_Width, downloadNameLabel_Height);

    CGFloat speedLabel_X      = CGRectGetMaxX(self.placeholderButton.frame) + 10;
    CGFloat speedLabel_Y      = CGRectGetMaxY(self.downloadNameLabel.frame) + 10;
    CGFloat speedLabel_Width  = ScreenWidth - self.placeholderButton.cmam_right - 20;
    CGFloat speedLabel_Height = 15;
    self.speedLabel.frame     = CGRectMake(speedLabel_X, speedLabel_Y, speedLabel_Width, speedLabel_Height);
}

- (void)buttonClick
{
    WYADownloader * download = [WYADownloader sharedDownloader];
    switch (self.model.downloadState) {
        case WYADownloadStateDownloading: {
            [download wya_suspendDownloadWithModel:self.model];
        } break;
        case WYADownloadStateSuspend: {
            [download wya_keepDownloadWithModel:self.model];
        }

        default:
            break;
    }
}

- (void)setModel:(WYADownloadModel *)model
{
    _model = model;
    if (model) {
        self.downloadNameLabel.text = model.title;
        [self.placeholderButton setImage:[UIImage wya_getVideoPreViewImage:[NSURL URLWithString:model.urlString]] forState:UIControlStateNormal];
        [self configButton:model.downloadState];
    }
}

- (void)configButton:(WYADownloadState)state
{
    switch (state) {
        case WYADownloadStateNormal:

            break;
        case WYADownloadStateWait:

            break;
        case WYADownloadStateDownloading:
            NSLog(@"下载中");

            break;
        case WYADownloadStateSuspend:
            NSLog(@"暂停");

            break;
        case WYADownloadStateComplete:

            break;
        case WYADownloadStateFail:

            break;
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

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

- (void)dealloc
{
    [self.model removeObserver:self forKeyPath:@"progress"];
    [self.model removeObserver:self forKeyPath:@"downloadState"];
    [self.model removeObserver:self forKeyPath:@"speed"];
}

@end
