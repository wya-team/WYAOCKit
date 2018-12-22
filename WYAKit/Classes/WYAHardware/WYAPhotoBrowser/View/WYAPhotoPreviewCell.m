//
//  WYAPhotoPreviewCell.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/30.
//

#import "WYAPhotoPreviewCell.h"
#import "WYAPhotoBrowserModel.h"
#import <Photos/Photos.h>

@implementation WYAPhotoPreviewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.preview = [[WYAPhotoPreview alloc]init];
        [self addSubview:self.preview];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.preview.frame = self.bounds;
}

#pragma mark - Public Method -
- (void)setScrollZoom{
    [self.preview setScrollZoom];
}

#pragma mark --- Setter
-(void)setModel:(WYAPhotoBrowserModel *)model{
    _model = model;
    if (model) {
        if (model.cropImage) {
            self.preview.imageView.image = model.cropImage;
        }else {
            if (model.cacheImage) {
                self.preview.imageView.image = model.cacheImage;
            }else{
                
                PHAsset * asset = (PHAsset *)model.asset;
                
                PHImageManager * manager = [PHImageManager defaultManager];
                PHImageRequestOptions * opi = [[PHImageRequestOptions alloc]init];
                //        opi.synchronous = YES; //默认no，异步加载
                //              opi.resizeMode = PHImageRequestOptionsResizeModeFast;
                //            opi.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
                
                [manager requestImageForAsset:model.asset targetSize:CGSizeMake(self.cmam_width, self.cmam_height) contentMode:PHImageContentModeAspectFill options:opi resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                    self.preview.imageView.image = result;
                    model.cacheImage = result;
                    [self.preview setScrollZoom];
                }];
            }
        }
        
    }
}
@end

@interface WYAVideoPreviewCell ()
@property (nonatomic, strong) AVPlayer * player;
@property (nonatomic, strong) AVPlayerLayer * layer;
@property (nonatomic, strong) UIButton * playButton;
@end

@implementation WYAVideoPreviewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.playButton];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
//    CGFloat <#view#>_Width = ;
//    CGFloat <#view#>_Height = ;
//    <#view#>.frame = CGRectMake(<#view#>_X, <#view#>_Y, <#view#>_Width, <#view#>_Height);
}

#pragma mark - Setter -
-(void)setModel:(WYAPhotoBrowserModel *)model{
    if (model) {
        PHAsset * asset = model.asset;
        if (asset.mediaType == PHAssetMediaTypeVideo) {
            PHImageManager * manager = [PHImageManager defaultManager];
//            PHVideoRequestOptions * option = [[PHVideoRequestOptions alloc]init];
//            option.version = PHVideoRequestOptionsVersionOriginal;
            [manager requestPlayerItemForVideo:asset options:nil resultHandler:^(AVPlayerItem * _Nullable playerItem, NSDictionary * _Nullable info) {
                self.player = [AVPlayer playerWithPlayerItem:playerItem];
                self.layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
                self.layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
                self.layer.frame = self.bounds;
                [self.contentView.layer addSublayer:self.layer];
                
            }];
        }
    }
}

#pragma mark - Getter -
- (UIButton *)playButton{
    if(!_playButton){
        _playButton = ({
            UIButton * object = [[UIButton alloc]init];
            [object setImage:[UIImage loadBundleImage:@"icon_begin" ClassName:NSStringFromClass(self.class)] forState:UIControlStateNormal];
            [object addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _playButton;
}

@end


@interface WYAPhotoPreview ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIView * imageContainerView;
@end

@implementation WYAPhotoPreview

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.scrollV = [[UIScrollView alloc]init];
        self.scrollV.bouncesZoom = YES;
        self.scrollV.maximumZoomScale = 3.0;
        self.scrollV.minimumZoomScale = 1.0;
        self.scrollV.multipleTouchEnabled = YES;
        self.scrollV.delegate = self;
        self.scrollV.scrollsToTop = NO;
        self.scrollV.showsHorizontalScrollIndicator = NO;
        self.scrollV.showsVerticalScrollIndicator = YES;
        self.scrollV.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.scrollV.delaysContentTouches = NO;
        self.scrollV.canCancelContentTouches = YES;
        self.scrollV.alwaysBounceVertical = NO;
        if (@available(iOS 11, *)) {
            self.scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [self addSubview:self.scrollV];
        
        self.imageContainerView = [[UIView alloc] init];
        self.imageContainerView.clipsToBounds = YES;
        self.imageContainerView.contentMode = UIViewContentModeScaleAspectFill;
        [self.scrollV addSubview:self.imageContainerView];
        
        self.imageView = [[UIImageView alloc]init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.userInteractionEnabled = YES;
        [self.imageContainerView addSubview:self.imageView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.scrollV.frame = CGRectMake(10, 0, self.cmam_width-20, self.cmam_height);
    
    //    self.imageView.frame = CGRectMake(0, 0, self.scrollV.frame.size.width, self.scrollV.frame.size.height);
    //    self.scrollV.contentSize = CGSizeMake(self.imageView.cmam_width, self.imageView.cmam_height);
    [self setScrollZoom];
}

#pragma mark - Private Method -
- (void)setScrollZoom{
    [self.scrollV setZoomScale:1 animated:NO];
    [self setSubViewFrame];
}

- (void)setSubViewFrame{
    self.imageContainerView.cmam_origin = CGPointZero;
    self.imageContainerView.cmam_width = self.scrollV.cmam_width;
    UIImage * image = self.imageView.image;
    if (image.size.height/image.size.width > self.cmam_height/self.scrollV.cmam_width) {
        self.imageContainerView.cmam_height = floor(image.size.height/ (image.size.width/self.scrollV.cmam_width));
    }else{
        CGFloat height = image.size.height/image.size.width * self.scrollV.cmam_width;
        if (height<1||isnan(height)) {
            height = self.cmam_height;
        }
        height = floor(height);
        self.imageContainerView.cmam_height = height;
        self.imageContainerView.cmam_centerY = self.cmam_height/2;
    }
    
    if (self.imageContainerView.cmam_height>self.cmam_height && self.imageContainerView.cmam_height-self.cmam_height <=1) {
        self.imageContainerView.cmam_height = self.cmam_height;
    }
    
    CGFloat contentSizeH = MAX(self.imageContainerView.cmam_height, self.cmam_height);
    self.scrollV.contentSize = CGSizeMake(self.scrollV.cmam_width, contentSizeH);
    [self.scrollV scrollRectToVisible:self.bounds animated:NO];
    self.scrollV.alwaysBounceVertical = self.imageContainerView.cmam_height <= self.cmam_height ? NO : YES;
    self.imageView.frame = self.imageContainerView.bounds;
}

- (void)refreshImageContainerViewCenter {
    CGFloat offsetX = (self.scrollV.cmam_width > self.scrollV.contentSize.width) ? ((self.scrollV.cmam_width - self.scrollV.contentSize.width) * 0.5) : 0.0;
    CGFloat offsetY = (self.scrollV.cmam_height > self.scrollV.contentSize.height) ? ((self.scrollV.cmam_height - self.scrollV.contentSize.height) * 0.5) : 0.0;
    self.imageContainerView.center = CGPointMake(self.scrollV.contentSize.width * 0.5 + offsetX, self.scrollV.contentSize.height * 0.5 + offsetY);
}

#pragma mark - UIScrollViewDelegate -
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageContainerView;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    scrollView.contentInset = UIEdgeInsetsZero;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self refreshImageContainerViewCenter];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    //    [scrollView setZoomScale:scale animated:NO];
}

#pragma mark - Getter -

@end
