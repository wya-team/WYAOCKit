//
//  WYAPhotoPreviewCell.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/30.
//

#import "WYAPhotoPreviewCell.h"
#import "WYAPhotoBrowserModel.h"
#import <Photos/Photos.h>

@interface WYAPhotoPreviewCell ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIImageView * imageView;
@end

@implementation WYAPhotoPreviewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollV = [[UIScrollView alloc]init];
        self.scrollV.bouncesZoom = YES;
        self.scrollV.maximumZoomScale = 2.5;
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
        [self.contentView addSubview:self.scrollV];
        
        self.imageView = [[UIImageView alloc]init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.userInteractionEnabled = YES;
        [self.scrollV addSubview:self.imageView];
        
        [self.scrollV setZoomScale:1 animated:NO];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.scrollV.frame = CGRectMake(10, 0, self.contentView.cmam_width-20, self.contentView.cmam_height);
    [self.scrollV setZoomScale:1 animated:NO];
    self.imageView.center = self.scrollV.center;
    self.imageView.bounds = CGRectMake(0, 0, self.scrollV.frame.size.width, self.scrollV.frame.size.height);
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    scrollView.contentInset = UIEdgeInsetsZero;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    [scrollView setZoomScale:scale animated:NO];
}

#pragma mark --- Setter
-(void)setModel:(WYAPhotoBrowserModel *)model{
    _model = model;
    if (model) {
        if (model.cacheImage) {
            self.imageView.image = model.cacheImage;
        }else{
            
            PHAsset * asset = (PHAsset *)model.asset;
            
            PHImageManager * manager = [PHImageManager defaultManager];
            PHImageRequestOptions * opi = [[PHImageRequestOptions alloc]init];
            //        opi.synchronous = YES; //默认no，异步加载
//              opi.resizeMode = PHImageRequestOptionsResizeModeFast;
            //            opi.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
            
            [manager requestImageForAsset:model.asset targetSize:CGSizeMake(self.imageView.cmam_width, self.imageView.cmam_height) contentMode:PHImageContentModeAspectFill options:opi resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                self.imageView.image = result;
                model.cacheImage = result;
            }];
        }
    }
}
@end
