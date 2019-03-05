//
//  ImageBrowserCell.h
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/26.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@class WYAPreview;

@interface WYAImageBrowserCell : UICollectionViewCell

@property (nonatomic, strong) WYAPreview * preview;
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, copy) void (^singleTapCallback)(void);

@end

@interface WYAVideoBrowserCell : UICollectionViewCell
@property (nonatomic, strong) AVPlayer * player;
@property (nonatomic, strong) AVPlayerLayer * playerLayer;
@property (nonatomic, strong) AVPlayerItem * playerItem;
@property (nonatomic, strong) NSURL * url;
@end

@interface WYAPreview : UIView
@property (nonatomic, copy) void (^singleTapCallback)(void);
@property (nonatomic, strong) UIScrollView * scrollV;
@property (nonatomic, strong) UIImageView * imageView;
- (void)setScrollZoom;
@end
