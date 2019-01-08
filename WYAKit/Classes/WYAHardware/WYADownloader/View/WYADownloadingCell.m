//
//  WYADownloadingCell.m
//  WYAKit
//
//  Created by 李世航 on 2019/1/7.
//

#import "WYADownloadingCell.h"
#import "WYADownloader.h"
@interface WYADownloadingCell ()
@property (nonatomic, strong) UILabel * speedLabel;
@property (nonatomic, strong) UIProgressView * progressView;
@property (nonatomic, strong) UIButton * placeholderButton;
@property (nonatomic, strong) UILabel * downloadStateLabel;//开始或暂停
@property (nonatomic, strong) UILabel * downloadNameLabel;
@end

@implementation WYADownloadingCell

- (void)awakeFromNib {
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
        [self.contentView addSubview:self.downloadStateLabel];
        [self.contentView addSubview:self.progressView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat placeholderButton_X = 16;
    CGFloat placeholderButton_Y = 5;
    CGFloat placeholderButton_Width = 120;
    CGFloat placeholderButton_Height = 60;
    self.placeholderButton.frame = CGRectMake(placeholderButton_X, placeholderButton_Y, placeholderButton_Width, placeholderButton_Height);
    
    CGFloat downloadNameLabel_X = CGRectGetMaxX(self.placeholderButton.frame) +10;
    CGFloat downloadNameLabel_Y = 5;
    CGFloat downloadNameLabel_Width = ScreenWidth - CGRectGetMaxX(self.placeholderButton.frame) - 20;
    CGFloat downloadNameLabel_Height = 30;
    self.downloadNameLabel.frame = CGRectMake(downloadNameLabel_X, downloadNameLabel_Y, downloadNameLabel_Width, downloadNameLabel_Height);
    
    CGFloat speedLabel_X = CGRectGetMaxX(self.placeholderButton.frame) + 10;
    CGFloat speedLabel_Y = CGRectGetMaxY(self.downloadNameLabel.frame) + 10;
    CGFloat speedLabel_Width = ScreenWidth - self.placeholderButton.cmam_right - 20;
    CGFloat speedLabel_Height = 15;
    self.speedLabel.frame = CGRectMake(speedLabel_X, speedLabel_Y, speedLabel_Width, speedLabel_Height);
    
    CGFloat downloadStateLabel_X = CGRectGetMaxX(self.downloadNameLabel.frame) - 50;
    CGFloat downloadStateLabel_Y = self.speedLabel.cmam_top;
    CGFloat downloadStateLabel_Width = 50;
    CGFloat downloadStateLabel_Height = 15;
    self.downloadStateLabel.frame = CGRectMake(downloadStateLabel_X, downloadStateLabel_Y, downloadStateLabel_Width, downloadStateLabel_Height);
    
    CGFloat progressView_X = CGRectGetMaxX(self.placeholderButton.frame) + 10;
    CGFloat progressView_Y = CGRectGetMaxY(self.speedLabel.frame) + 5;
    CGFloat progressView_Width = ScreenWidth - CGRectGetMaxX(self.placeholderButton.frame) - 20;
    CGFloat progressView_Height = 5;
    self.progressView.frame = CGRectMake(progressView_X, progressView_Y, progressView_Width, progressView_Height);
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
    if (_model) {
        [_model removeObserver:self forKeyPath:@"progress"];
        [_model removeObserver:self forKeyPath:@"downloadState"];
        [_model removeObserver:self forKeyPath:@"speed"];
    }
    _model = model;
    if (model) {
        [model addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
        [model addObserver:self forKeyPath:@"downloadState" options:NSKeyValueObservingOptionNew context:nil];
        [model addObserver:self forKeyPath:@"speed" options:NSKeyValueObservingOptionNew context:nil];
    }
    [self.placeholderButton setImage:[UIImage wya_getVideoPreViewImage:[NSURL URLWithString:model.urlString]] forState:UIControlStateNormal];
    self.speedLabel.text = @"0KB/s";
    //    self.downloadNameLabel.text = model.urlString.lastPathComponent;
    self.progressView.progress = model.progress;
    [self configButton:model.downloadState];
}

- (void)configButton:(WYADownloadState)state
{
    switch (state) {
        case WYADownloadStateNormal:
            
            break;
        case WYADownloadStateWait:
            self.downloadStateLabel.text = @"等待";
            break;
        case WYADownloadStateDownloading:
            NSLog(@"下载中");
            self.downloadStateLabel.text = @"下载中";
            break;
        case WYADownloadStateSuspend:
            NSLog(@"暂停");
            self.downloadStateLabel.text = @"已暂停";
            break;
        case WYADownloadStateComplete:
            self.downloadStateLabel.text = @"完成";
            break;
        case WYADownloadStateFail:
            self.downloadStateLabel.text = @"失败";
            break;
        default:
            break;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"progress"]) {
        CGFloat progress = [change[@"new"] floatValue];
        NSLog(@"progress.currentThred==%@",[NSThread currentThread]);
        self.progressView.progress = progress;
    } else if ([keyPath isEqualToString:@"downloadState"]) {
        WYADownloadState state = [change[@"new"] integerValue];
        NSLog(@"下载状态 state==%d", state);
        [self configButton:state];
        
    } else if ([keyPath isEqualToString:@"speed"]) {
        NSString * speed = change[@"new"];
        self.speedLabel.text = speed;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (UIProgressView *)progressView
{
    if (!_progressView) {
        _progressView = ({
            UIProgressView * object  = [[UIProgressView alloc] init];
            object.trackTintColor    = [UIColor grayColor];
            object.progressTintColor = [UIColor redColor];
            object;
        });
    }
    return _progressView;
}

- (UIButton *)placeholderButton
{
    if (!_placeholderButton) {
        _placeholderButton = ({
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
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

- (UILabel *)downloadStateLabel
{
    if (!_downloadStateLabel) {
        _downloadStateLabel = ({
            UILabel * object = [[UILabel alloc] init];
            object.font      = FONT(15);
            object.textAlignment = NSTextAlignmentRight;
            object;
        });
    }
    return _downloadStateLabel;
}

- (void)dealloc
{
    [self.model removeObserver:self forKeyPath:@"progress"];
    [self.model removeObserver:self forKeyPath:@"downloadState"];
    [self.model removeObserver:self forKeyPath:@"speed"];
}


@end
