//
//  WYAAudioRecoder.m
//  WYAKit
//
//  Created by 李世航 on 2019/2/28.
//

/**
 AVAudioSessionCategoryPlayAndRecord :录制和播放
 AVAudioSessionCategoryAmbient :用于非以语音为主的应用,随着静音键和屏幕关闭而静音.
 AVAudioSessionCategorySoloAmbient :类似AVAudioSessionCategoryAmbient不同之处在于它会中止其它应用播放声音。
 AVAudioSessionCategoryPlayback :用于以语音为主的应用,不会随着静音键和屏幕关闭而静音.可在后台播放声音
 AVAudioSessionCategoryRecord :用于需要录音的应用,除了来电铃声,闹钟或日历提醒之外的其它系统声音都不会被播放,只提供单纯录音功能.
 */

#import "WYAAudioRecoder.h"

#import <AVKit/AVKit.h>

#import <NTYAmrConverter/NTYAmrConverter.h>

@interface WYAAudioRecoder () <AVAudioRecorderDelegate, AVAudioPlayerDelegate>
@property (nonatomic, strong) AVAudioSession * session;
@property (nonatomic, strong) AVAudioRecorder * audioRecorder;
@property (nonatomic, strong) AVAudioPlayer * audioPlayer;
@property (nonatomic, strong) NSDictionary * setting;
@end

@implementation WYAAudioRecoder

+ (instancetype)sharedManager {
    static WYAAudioRecoder * recoder;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        recoder = [[WYAAudioRecoder alloc] init];
    });
    return recoder;
}

- (AVAudioRecorder *)createAudioRecorderWithUrl:(NSURL *)url {
    NSError * recorderError;
    AVAudioRecorder * audioRecorder = [[AVAudioRecorder alloc] initWithURL:url settings:[NTYAmrCoder audioRecorderSettings] error:&recorderError];
    audioRecorder.delegate          = self;
    audioRecorder.meteringEnabled   = YES;
    return audioRecorder;
}

#pragma mark ======= Public Method
- (BOOL)wya_startRecorderWithUrl:(NSURL *)url error:(NSError *)error {
    self.session = [AVAudioSession sharedInstance];

    [self.session setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
    [self.session setActive:YES error:nil];
    self.audioRecorder = [self createAudioRecorderWithUrl:url];
    if ([self.audioRecorder prepareToRecord]) {
        if ([self.audioRecorder record]) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

- (void)wya_pauseRecorder {
    [self.audioRecorder pause];
}

- (void)wya_stopRecorder {
    if ([self.audioRecorder prepareToRecord]) {
        [self.audioRecorder stop];
    }
}

- (BOOL)wya_turnAmrAudioWithWavPath:(NSString *)wavPath amrPath:(NSString *)amrPath DeleteRedundantAudio:(BOOL)redundantAudio {

    BOOL isSuccess = [NTYAmrCoder encodeWavFile:wavPath toAmrFile:amrPath];
    if (isSuccess) {
        if (redundantAudio) {
            NSFileManager * fileManager = [NSFileManager defaultManager];
            if ([fileManager fileExistsAtPath:wavPath]) {
                NSError * error;
                [fileManager removeItemAtPath:wavPath error:&error];
                if (error) {
                    return NO;
                } else {
                    return YES;
                }
            } else {
                return NO;
            }
        } else {
            return YES;
        }
    } else {
        return NO;
    }
}

- (BOOL)wya_turnWavAudioWithAmrPath:(NSString *)amrPath wavPath:(NSString *)wavPath DeleteRedundantAudio:(BOOL)redundantAudio {
    BOOL isSuccess = [NTYAmrCoder decodeAmrFile:amrPath toWavFile:wavPath];
    if (isSuccess) {
        if (redundantAudio) {
            NSFileManager * fileManager = [NSFileManager defaultManager];
            if ([fileManager fileExistsAtPath:amrPath]) {
                NSError * error;
                [fileManager removeItemAtPath:amrPath error:&error];
                if (error) {
                    return NO;
                } else {
                    return YES;
                }
            } else {
                return NO;
            }
        } else {
            return YES;
        }
    } else {
        return NO;
    }
}

- (BOOL)wya_startPlayAudioWithUrl:(NSURL *)url volume:(CGFloat)volume numberOfLoops:(NSInteger)numberOfLoops currentTime:(NSTimeInterval)currentTime error:(NSError *)error {

    if (![url.pathExtension isEqualToString:@"wav"]) {
        return NO;
    }

    self.session = [AVAudioSession sharedInstance];
    NSError * sessionError;
    [self.session setCategory:AVAudioSessionCategoryPlayback error:&sessionError];
    [self.session setActive:YES error:nil];
    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sensorStateChange:) name:UIDeviceProximityStateDidChangeNotification object:nil];

    self.audioPlayer               = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    self.audioPlayer.delegate      = self;
    self.audioPlayer.volume        = volume;
    self.audioPlayer.numberOfLoops = numberOfLoops;
    self.audioPlayer.currentTime   = currentTime;
    //准备播放 / 播放
    if ([self.audioPlayer prepareToPlay]) {
        [self.audioPlayer play];
    }
    return YES;
}

- (void)wya_pausePlayAudio {
    [self.audioPlayer pause];
}

- (void)wya_stopPlayAudio {
    [self.audioPlayer stop];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceProximityStateDidChangeNotification object:nil];
}

#pragma mark ======= Notication
- (void)sensorStateChange:(NSNotification *) not{
    if ([[UIDevice currentDevice] proximityState] == YES) {
        //靠近耳朵
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    } else {
        //离开耳朵
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    }
}

#pragma mark ======= AVAudioRecorderDelegate
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
}

- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError * __nullable)error {
}

#pragma mark ======= AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error {
}

#pragma mark ======= Getter
- (NSDictionary *)setting {
    // 录音参数
    NSDictionary * setting = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [NSNumber numberWithInt:kAudioFormatLinearPCM], AVFormatIDKey,        // 编码格式
                                               [NSNumber numberWithFloat:8000], AVSampleRateKey,                     //采样率
                                               [NSNumber numberWithInt:2], AVNumberOfChannelsKey,                    //通道数
                                               [NSNumber numberWithInt:16], AVLinearPCMBitDepthKey,                  //采样位数(PCM专属)
                                               [NSNumber numberWithBool:NO], AVLinearPCMIsNonInterleaved,            //是否允许音频交叉(PCM专属)
                                               [NSNumber numberWithBool:NO], AVLinearPCMIsFloatKey,                  //采样信号是否是浮点数(PCM专属)
                                               [NSNumber numberWithBool:NO], AVLinearPCMIsBigEndianKey,              //是否是大端存储模式(PCM专属)
                                               [NSNumber numberWithInt:AVAudioQualityMax], AVEncoderAudioQualityKey, //音质
                                               nil];
    return setting;
}

@end
