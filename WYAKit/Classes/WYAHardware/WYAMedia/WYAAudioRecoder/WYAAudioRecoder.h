//
//  WYAAudioRecoder.h
//  WYAKit
//
//  Created by 李世航 on 2019/2/28.
//
/**
 由于ios支持wav，默认生成wav格式音频，如需转amr格式，请调用一下方法
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAAudioRecoder : NSObject

/**
 初始化

 @return self
 */
+ (instancetype)sharedManager;

/**
 开始录音

 @param url 传入的本地保存路径
 @param error 错误
 @return 是否成功开始录制
 */
- (BOOL)wya_startRecorderWithUrl:(NSURL *)url error:(NSError *)error;

/**
 暂停录制
 */
- (void)wya_pauseRecorder;

/**
 停止录制
 */
- (void)wya_stopRecorder;

/**
 wav格式转amr格式

 @param wavPath 路径
 @param amrPath 路径
 @param redundantAudio 是否成功转化后删除最初的那个音频
 @return 是否成功转化
 */
- (BOOL)wya_turnAmrAudioWithWavPath:(NSString *)wavPath
                            amrPath:(NSString *)amrPath
               DeleteRedundantAudio:(BOOL)redundantAudio;

/**
 amr格式转wav格式

 @param amrPath 路径
 @param wavPath 路径
 @param redundantAudio 是否成功转化后删除最初的那个音频
 @return 是否成功转化
 */
- (BOOL)wya_turnWavAudioWithAmrPath:(NSString *)amrPath
                            wavPath:(NSString *)wavPath
               DeleteRedundantAudio:(BOOL)redundantAudio;

/**
 播放音频

 @param url 音频路径
 @param volume 声音大小
 @param speed 播放速度
 @param numberOfLoops 播放次数
 @param currentTime 开始位置
 @param error 错误
 @return 是否成功播放
 */
- (BOOL)wya_startPlayAudioWithUrl:(NSURL *)url
                           volume:(CGFloat)volume
                            speed:(CGFloat)speed
                    numberOfLoops:(NSInteger)numberOfLoops
                      currentTime:(NSTimeInterval)currentTime
                            error:(NSError *)error;

/**
 暂停播放
 */
- (void)wya_pausePlayAudio;

/**
 停止播放
 */
- (void)wya_stopPlayAudio;

@end

NS_ASSUME_NONNULL_END
