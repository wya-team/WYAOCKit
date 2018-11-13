//
//  MyVideoItem.h
//  VideoDemo
//
//  Created by 李世航 on 2018/5/28.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface WYAVideoItem : NSObject

/**
 视频url（必传属性）
 */
@property (nonatomic, strong) NSURL *videoUrl;

/**
 父视图（必传属性）
 */
@property (nonatomic, strong) UIView *superV;

/**
 位置（必传属性）
 */
@property (nonatomic, assign) CGRect rect;

/**
 预览图url
 */
@property (nonatomic, copy) NSString *previewImage;

@property (nonatomic, assign) NSInteger seekTime;

@property (nonatomic, assign) BOOL seekToTimeAutoPlay;

@property (nonatomic, strong) UIImage *playButtonNormalImage;

@property (nonatomic, strong) UIImage *playButtonSelectImage;

@property (nonatomic, strong) UIImage *zoomButtonNormalImage;

@property (nonatomic, strong) UIImage *zoomButtonSelectImage;


@end
