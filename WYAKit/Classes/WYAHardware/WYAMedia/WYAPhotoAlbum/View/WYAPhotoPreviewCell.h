//
//  WYAPhotoPreviewCell.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/30.
//

#import <UIKit/UIKit.h>
#import <PhotosUI/PhotosUI.h>

NS_ASSUME_NONNULL_BEGIN

@class WYAPhotoBrowserModel, PHAsset, WYAPreviewView, WYAProgressView;

@interface WYAPhotoPreviewCell : UICollectionViewCell


@property (nonatomic, assign) BOOL showGif;
@property (nonatomic, assign) BOOL showLivePhoto;

@property (nonatomic, strong) WYAPreviewView *previewView;
@property (nonatomic, strong) WYAPhotoBrowserModel *model;
@property (nonatomic, copy)   void (^singleTapCallBack)(void);
@property (nonatomic, copy)   void (^longPressCallBack)(void);
@property (nonatomic, assign) BOOL willDisplaying;


/**
 重置缩放比例
 */
- (void)resetCellStatus;

/**
 界面停止滑动后，加载gif和livephoto，保持界面流畅
 */
- (void)reloadGifLivePhotoVideo;

@end


@class WYAPreviewImageAndGif, WYAPreviewLivePhoto, WYAPreviewVideo, WYAPreviewNetVideo;

//预览大图，image、gif、livephoto、video
@interface WYAPreviewView : UIView

@property (nonatomic, assign) BOOL showGif;
@property (nonatomic, assign) BOOL showLivePhoto;

@property (nonatomic, strong) WYAPreviewImageAndGif *imageGifView;
@property (nonatomic, strong) WYAPreviewLivePhoto *livePhotoView;
@property (nonatomic, strong) WYAPreviewVideo *videoView;
@property (nonatomic, strong) WYAPreviewNetVideo *netVideoView;
@property (nonatomic, strong) WYAPhotoBrowserModel *model;
@property (nonatomic, copy)   void (^singleTapCallBack)(void);
@property (nonatomic, copy)   void (^longPressCallBack)(void);

/**
 界面每次即将显示时，重置scrollview缩放状态
 */
- (void)resetScale;

/**
 处理划出界面后操作
 */
- (void)handlerEndDisplaying;

/**
 reload gif,livephoto,video
 */
- (void)reload;

- (void)resumePlay;

- (UIImage *)image;

@end


//---------------base preview---------------
@interface WYABasePreviewView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) WYAProgressView *indicator;
@property (nonatomic, strong) PHAsset *asset;
@property (nonatomic, assign) PHImageRequestID imageRequestID;
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
@property (nonatomic, copy)   void (^singleTapCallBack)(void);

- (void)placeSubviews;
- (void)controllerScrollViewDidScroll;
- (CGSize)requestImageSize:(PHAsset *)asset;

- (void)singleTapAction;

- (void)loadNormalImage:(PHAsset *)asset;

- (void)resetScale;

- (UIImage *)image;

@end

//---------------image、gif、net image---------------
@interface WYAPreviewImageAndGif : WYABasePreviewView

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGesture;
@property (nonatomic, assign) BOOL loadOK;

@property (nonatomic, copy)   void (^longPressCallBack)(void);

- (void)loadGifImage:(PHAsset *)asset;
- (void)loadImage:(id)obj;

- (void)resumeGif;
- (void)pauseGif;

@end


//---------------livephoto---------------
@interface WYAPreviewLivePhoto : WYABasePreviewView

@property (nonatomic, strong) PHLivePhotoView *lpView;

- (void)loadLivePhoto:(PHAsset *)asset;

@end


//---------------video---------------
@interface WYAPreviewVideo : WYABasePreviewView

@property (nonatomic, strong) AVPlayerLayer *playLayer;
@property (nonatomic, strong) UILabel *icloudLoadFailedLabel;
@property (nonatomic, strong) UIButton *playBtn;

- (void)loadVideo:(PHAsset *)asset;

- (BOOL)haveLoadVideo;

- (void)stopPlayVideo;

@end


//---------------net video---------------
@interface WYAPreviewNetVideo : WYABasePreviewView

@property (nonatomic, strong) AVPlayerLayer *playLayer;
@property (nonatomic, strong) UIButton *playBtn;

- (void)loadNetVideo:(NSURL *)url;

- (void)seekToZero;

- (void)stopPlayNetVideo;

@end
NS_ASSUME_NONNULL_END
