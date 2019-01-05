//
//  ImagePickerCollectionViewCell.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/14.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAPhotoBrowserCell.h"
#import "WYAPhotoBrowserModel.h"
#import <Photos/Photos.h>

@interface WYAPhotoBrowserCell ()
@property (nonatomic, strong) UIButton * button;
@property (nonatomic, strong) UIView * videoPreview; //只是用来显示图片和文字的，没有其他用
@property (nonatomic, strong) UIImageView * videoImageView;
@property (nonatomic, strong) UILabel * videoLabel;
@property (nonatomic, strong) UIView * cellPreview;

@end

@implementation WYAPhotoBrowserCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];

        [self.contentView addSubview:self.imageV];
        [self.contentView addSubview:self.button];
        [self.contentView addSubview:self.videoPreview];
        [self.videoPreview addSubview:self.videoImageView];
        [self.videoPreview addSubview:self.videoLabel];

        [self.contentView addSubview:self.cellPreview];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat imageV_X      = CGRectGetMinX(self.contentView.frame);
    CGFloat imageV_Y      = CGRectGetMinY(self.contentView.frame);
    CGFloat imageV_Width  = self.contentView.frame.size.width;
    CGFloat imageV_Height = self.contentView.frame.size.height;
    self.imageV.frame     = CGRectMake(imageV_X, imageV_Y, imageV_Width, imageV_Height);

    CGFloat button_X      = self.contentView.frame.size.width * 0.7;
    CGFloat button_Y      = 0;
    CGFloat button_Width  = self.contentView.frame.size.width * 0.3;
    CGFloat button_Height = self.contentView.frame.size.width * 0.3;
    self.button.frame     = CGRectMake(button_X, button_Y, button_Width, button_Height);

    CGFloat videoPreview_X      = 0;
    CGFloat videoPreview_Y      = self.contentView.cmam_height * 0.7;
    CGFloat videoPreview_Width  = self.contentView.cmam_width;
    CGFloat videoPreview_Height = self.contentView.cmam_height * 0.3;
    self.videoPreview.frame     = CGRectMake(videoPreview_X, videoPreview_Y, videoPreview_Width, videoPreview_Height);

    CGFloat videoImageView_X      = self.videoPreview.cmam_width / 4;
    CGFloat videoImageView_Y      = self.videoPreview.cmam_height / 4;
    CGFloat videoImageView_Width  = self.videoPreview.cmam_height / 2;
    CGFloat videoImageView_Height = self.videoPreview.cmam_height / 2;
    self.videoImageView.frame     = CGRectMake(videoImageView_X, videoImageView_Y, videoImageView_Width, videoImageView_Height);

    CGFloat videoLabel_X      = CGRectGetMaxX(self.videoImageView.frame);
    CGFloat videoLabel_Y      = 0;
    CGFloat videoLabel_Width  = self.videoPreview.cmam_width - CGRectGetMaxX(self.videoImageView.frame);
    CGFloat videoLabel_Height = self.videoPreview.cmam_height;
    self.videoLabel.frame     = CGRectMake(videoLabel_X, videoLabel_Y, videoLabel_Width, videoLabel_Height);

    self.cellPreview.frame = self.contentView.frame;
}

#pragma mark - Private Method -
- (void)buttonClick:(UIButton *)sender
{
    if (self.selectImage) {
        self.selectImage(sender);
    }
}

- (void)loadImage
{
    PHAsset * asset = (PHAsset *)self.model.asset;
    CGFloat ratio   = asset.pixelWidth / (CGFloat)asset.pixelHeight;
    CGFloat width   = self.cmam_width * [UIScreen mainScreen].scale * 3;
    // 超宽图片
    if (ratio > 1.8) {
        width = width * ratio;
    }
    // 超高图片
    if (ratio < 0.2) {
        width = width * 0.5;
    }
    CGFloat height = width / ratio;

    PHImageManager * manager    = [PHImageManager defaultManager];
    PHImageRequestOptions * opi = [[PHImageRequestOptions alloc] init];
    //        opi.synchronous = YES; //默认no，异步加载
    opi.resizeMode = PHImageRequestOptionsResizeModeFast;
    //            opi.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;

    [manager requestImageForAsset:self.model.asset targetSize:CGSizeMake(width, height) contentMode:PHImageContentModeAspectFill options:opi resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        self.imageV.image     = result;
        self.model.cacheImage = result;
    }];
}

#pragma mark - Public Method -

#pragma mark - Setter -
- (void)setModel:(WYAPhotoBrowserModel *)model
{
    _model = model;
    if (model) {
        self.videoPreview.hidden = YES;

        PHAsset * asset = (PHAsset *)model.asset;
        if (asset.mediaType == PHAssetMediaTypeVideo) {
            self.videoPreview.hidden = NO;
            NSInteger time           = (NSInteger)asset.duration;
            NSInteger dur            = time % 60;
            NSInteger due            = time / 60;
            NSString * string        = [NSString stringWithFormat:@"%ld:%ld", (long)due, (long)dur];
            self.videoLabel.text     = string;
        }

        if (model.cropImage) {
            self.imageV.image = model.cropImage;
        } else {
            if (model.cacheImage) {
                self.imageV.image = model.cacheImage;
            } else {
                [self loadImage];
            }
        }

        self.button.selected = model.selected;
        if (model.isMaxCount) {
            if (!model.selected) {
                self.cellPreview.hidden     = NO;
                self.userInteractionEnabled = NO;
            } else {
                self.cellPreview.hidden     = YES;
                self.userInteractionEnabled = YES;
            }

        } else {
            self.cellPreview.hidden     = YES;
            self.userInteractionEnabled = YES;
        }
    }
}

#pragma mark - Getter -
- (UIImageView *)imageV
{
    if (!_imageV) {
        _imageV = ({
            UIImageView * object       = [[UIImageView alloc] init];
            object.contentMode         = UIViewContentModeScaleAspectFill;
            object.layer.masksToBounds = YES;
            object;
        });
    }
    return _imageV;
}

- (UIButton *)button
{
    if (!_button) {
        _button = ({
            UIButton * object = [[UIButton alloc] init];
            [object setImage:[UIImage loadBundleImage:@"icon_radio_normal" ClassName:NSStringFromClass([self class])] forState:UIControlStateNormal];
            [object setImage:[UIImage loadBundleImage:@"icon_radio_selected" ClassName:NSStringFromClass([self class])] forState:UIControlStateSelected];
            [object addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            object.imageView.contentMode = UIViewContentModeScaleAspectFill;
            object;
        });
    }
    return _button;
}

- (UIView *)videoPreview
{
    if (!_videoPreview) {
        _videoPreview = ({
            UIView * object        = [[UIView alloc] init];
            object.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
            object.hidden          = YES;
            object;
        });
    }
    return _videoPreview;
}

- (UIImageView *)videoImageView
{
    if (!_videoImageView) {
        _videoImageView = ({
            UIImageView * object = [[UIImageView alloc] init];
            object.image         = [UIImage loadBundleImage:@"icon_video" ClassName:NSStringFromClass(self.class)];
            object;
        });
    }
    return _videoImageView;
}

- (UILabel *)videoLabel
{
    if (!_videoLabel) {
        _videoLabel = ({
            UILabel * object     = [[UILabel alloc] init];
            object.textColor     = [UIColor whiteColor];
            object.font          = FONT(15);
            object.textAlignment = NSTextAlignmentCenter;
            object;
        });
    }
    return _videoLabel;
}

- (UIView *)cellPreview
{
    if (!_cellPreview) {
        _cellPreview = ({
            UIView * object               = [[UIView alloc] init];
            object.backgroundColor        = [UIColor colorWithWhite:0.5 alpha:0.8];
            object.hidden                 = YES;
            object.userInteractionEnabled = NO;
            object;
        });
    }
    return _cellPreview;
}
@end
