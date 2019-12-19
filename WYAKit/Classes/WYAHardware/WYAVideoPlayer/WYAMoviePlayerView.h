//
//  WYAMoviePlayer.h
//  AFNetworking
//
//  Created by 李俊恒 on 2019/12/19.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WYAMoviePlayerView : UIView
/// 视频Url
@property (nonatomic, copy) NSURL *movieURL;
/// 封面图
@property (nonatomic, strong) UIImageView *coverView;
//展示视频
- (void)show;

@end

@interface WYAPlayerView:UIView

@property (nonatomic, copy) NSURL * URL;
- (void)play;
- (void)pause;
- (CMTime)currentTime;
@end
//===================================================================================
//下载管理 只支持单个视频下载
@interface WYAMovieDownLoadManager : NSObject

+ (instancetype)shareManager;

//缓存大小 已经是M了
+ (CGFloat)fileSize;

//删除本地缓存的视频
+ (void)clearDisk;

- (NSURLSessionDownloadTask *)downloadMovieWithURL:(NSURL *)URL
                                     progressBlock:(void(^)(CGFloat progress))progressBlock
                                           success:(void(^)(NSURL *URL))success
                                              fail:(void(^)(NSString *message))fail;
@end

//===================================================================================
//下载进度条

@interface WYAMovieProgressView : UIView

@property (nonatomic) CGFloat radius;//外圆半径 默认20

@property (nonatomic) CGFloat progress;//进度

@end

//===================================================================================
//播放失败提示
@interface WYAMovieHUD : UIView

+ (void)showWithMessage:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
