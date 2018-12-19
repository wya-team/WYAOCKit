

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface WYACameraTool : NSObject

/**
 只有在录制完成后才能获取到视频地址
 */
@property (readonly, nonatomic) NSString *videoPath;//视频路径

//捕获到的视频呈现的layer
- (AVCaptureVideoPreviewLayer *)previewLayer;

//启动摄影功能
- (void)startRecordFunction;

//关闭摄影功能
- (void)stopRecordFunction;

//开始录制
- (void) startCapture;

//停止录制
- (void) stopCapture;

//开启手电筒
- (void)openFlashLight;

//关闭手电筒
- (void)closeFlashLight;

//开启闪光灯
- (void)openFlash;

//关闭闪光灯
- (void)closeFlash;

//切换前后置摄像头
- (void)changeCameraInputDeviceisFront:(BOOL)isFront;

/**
 拍照
 */
- (void)startTakingPhoto:(void(^)(UIImage * image))image;

@end

@interface WYACameraTool(Authorization)

/**
   相机是否可以用
 */
- (BOOL)isAvailableWithCamera;

/**
    麦克风是否可以用
 */
- (BOOL)isAvailableWithMic;
@end
