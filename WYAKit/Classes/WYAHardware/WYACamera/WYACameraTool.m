

#import "WYACameraTool.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

@interface WYACameraTool () <AVCaptureFileOutputRecordingDelegate>

@property (strong, nonatomic)
    AVCaptureSession * captureSession;                                           //负责输入和输出设备之间的连接会话,数据流的管理控制
@property (strong, nonatomic) AVCaptureVideoPreviewLayer * previewLayer;         //捕获到的视频呈现的layer
@property (strong, nonatomic) AVCaptureDeviceInput * backCameraInput;            //后置摄像头输入
@property (strong, nonatomic) AVCaptureDeviceInput * frontCameraInput;           //前置摄像头输入
@property (strong, nonatomic) AVCaptureDeviceInput * audioMicInput;              //麦克风输入
@property (strong, nonatomic) AVCaptureConnection * videoConnection;             //视频录制连接
@property (strong, nonatomic) AVCaptureMovieFileOutput * captureMovieFileOutput; //视频输出流
@property (strong, nonatomic) AVCaptureStillImageOutput * imageOutPut;           //照片输出流
@property (nonatomic, strong) AVCaptureDevice * device;
@property (nonatomic, assign) WYACameraOrientation cameraOrientation;
@end

@implementation WYACameraTool

- (instancetype)init {
    return [self initWithCameraOrientation:WYACameraOrientationBack];
}

- (instancetype)initWithCameraOrientation:(WYACameraOrientation)cameraOrientation {
    self = [super init];
    if (self) {
        self.cameraOrientation = cameraOrientation;
    }
    return self;
}

#pragma mark - Public Method -
//启动录制功能
- (void)startRecordFunction {
    [self.captureSession startRunning];
}

//关闭录制功能
- (void)stopRecordFunction {
    if (self.captureSession) [self.captureSession stopRunning];
}

//开始录制
- (void)startCapture {
    if (self.captureMovieFileOutput.isRecording) return;

    NSString * outputFilePath = [[self getVideoPathCache]
        stringByAppendingPathComponent:[self getVideoNameWithType:@"mp4"]];
    _videoPath = outputFilePath;
    NSLog(@"save path is :%@", outputFilePath);
    NSURL * fileUrl = [NSURL fileURLWithPath:outputFilePath];
    AVCaptureConnection * connect =
        [self.captureMovieFileOutput connectionWithMediaType:AVMediaTypeVideo];
    if (self.device.position == AVCaptureDevicePositionFront) { [connect setVideoMirrored:YES]; }
    //设置录制视频流输出的路径
    [self.captureMovieFileOutput startRecordingToOutputFileURL:fileUrl recordingDelegate:self];
}

//停止录制
- (void)stopCapture {
    if ([self.captureMovieFileOutput isRecording]) {
        [self.captureMovieFileOutput stopRecording]; //停止录制
    }
}

- (void)startTakingPhoto:(void (^)(UIImage * image))image {
    AVCaptureConnection * videoConnection =
        [self.imageOutPut connectionWithMediaType:AVMediaTypeVideo];
    if (videoConnection == nil) { return; }

    if (self.device.position == AVCaptureDevicePositionFront) {
        [videoConnection setVideoMirrored:YES];
    }

    [self.imageOutPut
        captureStillImageAsynchronouslyFromConnection:
            videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer,
                                                NSError * error) {

            if (imageDataSampleBuffer == nil) { return; }

            NSData * imageData = [AVCaptureStillImageOutput
                jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            UIImage * imagee = [UIImage imageWithData:imageData];
            image(imagee);
            if (self.saveAblum) {
                [self savePhtotsWithImage:imagee videoUrl:nil];
            }

        }];
}

- (void)openFlash {
    [self.captureSession beginConfiguration];
    AVCaptureDevice * backCamera = [self backCamera];
    if (backCamera.flashMode == AVCaptureFlashModeOff) {
        [backCamera lockForConfiguration:nil];
        backCamera.flashMode = AVCaptureFlashModeOn;
        [backCamera unlockForConfiguration];
    }
    //提交会话配置
    [self.captureSession commitConfiguration];
    [self startRecordFunction];
}

- (void)closeFlash {
    [self.captureSession beginConfiguration];
    AVCaptureDevice * backCamera = [self backCamera];
    if (backCamera.flashMode == AVCaptureFlashModeOn) {
        [backCamera lockForConfiguration:nil];
        backCamera.flashMode = AVCaptureFlashModeOff;
        [backCamera unlockForConfiguration];
    }
    //提交会话配置
    [self.captureSession commitConfiguration];
    [self startRecordFunction];
}

//开启手电筒
- (void)openFlashLight {
    //改变会话的配置前一定要先开启配置，配置完成后提交配置改变
    //[self stopRecordFunction];
    [self.captureSession beginConfiguration];
    AVCaptureDevice * backCamera = [self backCamera];
    if (backCamera.torchMode == AVCaptureTorchModeOff) {
        [backCamera lockForConfiguration:nil];
        backCamera.torchMode = AVCaptureTorchModeOn;
        backCamera.flashMode = AVCaptureFlashModeOn;
        [backCamera unlockForConfiguration];
    }
    //提交会话配置
    [self.captureSession commitConfiguration];
    [self startRecordFunction];
}

//关闭手电筒
- (void)closeFlashLight {
    //改变会话的配置前一定要先开启配置，配置完成后提交配置改变
    // [self stopRecordFunction];
    [self.captureSession beginConfiguration];
    AVCaptureDevice * backCamera = [self backCamera];
    if (backCamera.torchMode == AVCaptureTorchModeOn) {
        [backCamera lockForConfiguration:nil];
        backCamera.torchMode = AVCaptureTorchModeOff;
        backCamera.flashMode = AVCaptureTorchModeOff;
        [backCamera unlockForConfiguration];
    }
    //提交会话配置
    [self.captureSession commitConfiguration];
    [self startRecordFunction];
}

//切换前后置摄像头
- (void)changeCameraInputDeviceisFront:(BOOL)isFront {
    //改变会话的配置前一定要先开启配置，配置完成后提交配置改变
    [self stopRecordFunction];
    [self.captureSession beginConfiguration];
    if (isFront) {
        [self.captureSession removeInput:self.backCameraInput];
        if ([self.captureSession canAddInput:self.frontCameraInput]) {
            //[self changeCameraAnimation];
            [self.captureSession addInput:self.frontCameraInput];
        }
    } else {
        [self.captureSession removeInput:self.frontCameraInput];
        if ([self.captureSession canAddInput:self.backCameraInput]) {
            //[self changeCameraAnimation];
            [self.captureSession addInput:self.backCameraInput];
        }
    }
    //提交会话配置
    [self.captureSession commitConfiguration];
    [self startRecordFunction];
}

#pragma mark - 视频输出代理
- (void)captureOutput:(AVCaptureFileOutput *)captureOutput
    didStartRecordingToOutputFileAtURL:(NSURL *)fileURL
                       fromConnections:(NSArray *)connections {
    NSLog(@"开始录制...");
    NSLog(@"connect==%@", connections);
}
- (void)captureOutput:(AVCaptureFileOutput *)captureOutput
    didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL
                        fromConnections:(NSArray *)connections
                                  error:(NSError *)error {
    NSLog(@"视频录制完成.");
    //    //视频录入完成之后在后台将视频存储到相
    //    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
    //        [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:outputFileURL];
    //    } completionHandler:^(BOOL success, NSError * _Nullable error) {
    //        if (error) {
    //            NSLog(@"保存视频到相簿过程中发生错误，错误信息：%@",error.localizedDescription);
    //        }
    //        NSLog(@"成功保存视频到相簿.");
    //    }];
    if (self.saveAblum) {
        [self savePhtotsWithImage:nil videoUrl:outputFileURL];
    }
}

/**
 * 保存图片到相册
 */
- (void)savePhtotsWithImage:(UIImage *)image videoUrl:(NSURL *)videoUrl {
    // 获取当前的授权状态
    PHAuthorizationStatus lastStatus = [PHPhotoLibrary authorizationStatus];

    // 请求授权
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{

            if (status == PHAuthorizationStatusDenied) {
                if (lastStatus == PHAuthorizationStatusNotDetermined) {
                    //说明，用户之前没有做决定，在弹出授权框中，选择了拒绝
                    [UIView wya_showBottomToastWithMessage:@"保存失败"];
                    return;
                }
                // 说明，之前用户选择拒绝过，现在又点击保存按钮，说明想要使用该功能，需要提示用户打开授权
                [UIView wya_showBottomToastWithMessage:@"请前往设置界面开启权限"];

            } else if (status == PHAuthorizationStatusAuthorized) {
                //保存图片---调用上面封装的方法
                [self saveImageToCustomAblumWithImage:image videoUrl:videoUrl];
            } else if (status == PHAuthorizationStatusRestricted) {
                [UIView wya_showBottomToastWithMessage:@"保存失败"];
            }
        });
    }];
}

- (void)saveImageToCustomAblumWithImage:(UIImage *)image videoUrl:(NSURL *)videoUrl {

    PHFetchResult<PHAsset *> * assets = [self synchronousSaveImageWithPhotosWithImage:image videoUrl:videoUrl];
    if (assets == nil) {
        //失败
        [UIView wya_showBottomToastWithMessage:@"保存失败"];
        return;
    }

    // 保存在自定义相册（如果没有则创建）--调用刚才的方法
    PHAssetCollection * assetCollection = [self getAssetCollectionWithAppNameAndCreateCollection];
    if (assetCollection == nil) {
        //失败
        [UIView wya_showBottomToastWithMessage:@"保存失败"];
        return;
    }

    // 将刚才保存到相机胶卷的图片添加到自定义相册中 --- 保存带自定义相册--属于增的操作，需要在PHPhotoLibrary的block中进行
    NSError * error = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        //--告诉系统，要操作哪个相册
        PHAssetCollectionChangeRequest * collectionChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:assetCollection];
        //--添加图片到自定义相册--追加--就不能成为封面了
        //        [collectionChangeRequest addAssets:assets];
        //--插入图片到自定义相册--插入--可以成为封面
        [collectionChangeRequest insertAssets:assets atIndexes:[NSIndexSet indexSetWithIndex:0]];
    } error:&error];

    if (error) {
        //失败
        [UIView wya_showBottomToastWithMessage:@"保存失败"];
        return;
    }
}

- (PHFetchResult<PHAsset *> *)synchronousSaveImageWithPhotosWithImage:(UIImage *)image videoUrl:(NSURL *)videoUrl {
    __block NSString * createdAssetId = nil;

    // 添加图片到【相机胶卷】
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        if (image) {
            createdAssetId = [PHAssetChangeRequest creationRequestForAssetFromImage:image].placeholderForCreatedAsset.localIdentifier;
            return;
        }
        if (videoUrl) {
            createdAssetId = [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:videoUrl].placeholderForCreatedAsset.localIdentifier;
            return;
        }

    } error:nil];

    if (createdAssetId == nil) return nil;
    // 在保存完毕后取出图片
    return [PHAsset fetchAssetsWithLocalIdentifiers:@[ createdAssetId ] options:nil];
}

- (PHAssetCollection *)getAssetCollectionWithAppNameAndCreateCollection {

    // 获得所有的自定义相册
    PHFetchResult<PHAssetCollection *> * collections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    for (PHAssetCollection * collection in collections) {
        if ([collection.localizedTitle isEqualToString:self.albumName]) {
            return collection;
        }
    }

    NSError * error = nil;
    // 代码执行到这里，说明还没有自定义相册
    __block NSString * createdCollectionId = nil;

    // 创建一个新的相册
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        createdCollectionId = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:self.albumName].placeholderForCreatedAssetCollection.localIdentifier;
    } error:&error];

    if (error) {

        return nil;
    } else {

        // 创建完毕后再取出相册
        return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[ createdCollectionId ] options:nil].firstObject;
    }
}

#pragma mark - 视频地址
- (NSString *)getVideoPathCache {
    NSString * videoCache       = [NSTemporaryDirectory() stringByAppendingPathComponent:@"videos"];
    BOOL isDir                  = NO;
    NSFileManager * fileManager = [NSFileManager defaultManager];

    BOOL existed = [fileManager fileExistsAtPath:videoCache isDirectory:&isDir];
    if (!(isDir == YES && existed == YES)) {
        [fileManager createDirectoryAtPath:videoCache
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:nil];
    };
    return videoCache;
}
- (NSString *)getVideoNameWithType:(NSString *)fileType {
    NSTimeInterval now          = [[NSDate date] timeIntervalSince1970];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HHmmss"];
    NSDate * NowDate = [NSDate dateWithTimeIntervalSince1970:now];
    ;
    NSString * timeStr  = [formatter stringFromDate:NowDate];
    NSString * fileName = [NSString stringWithFormat:@"video_%@.%@", timeStr, fileType];
    return fileName;
}

#pragma mark ======= Setter
- (void)setVideoPreset:(WYAVideoPreset)videoPreset {
    AVCaptureSessionPreset preset;
    switch (videoPreset) {
        case WYAVideoPresetLow:
            preset = AVCaptureSessionPresetLow;
            break;
        case WYAVideoPresetMedium:
            preset = AVCaptureSessionPresetMedium;
            break;
        case WYAVideoPresetHigh:
            preset = AVCaptureSessionPresetHigh;
            break;
        default:
            break;
    }
    if ([self.captureSession canSetSessionPreset:preset]) {
        [self.captureSession setSessionPreset:preset];
    }
}

#pragma mark - Getter -
//捕获到的视频呈现的layer
- (AVCaptureVideoPreviewLayer *)previewLayer {
    if (_previewLayer == nil) {
        //通过AVCaptureSession初始化
        AVCaptureVideoPreviewLayer * preview =
            [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.captureSession];
        //设置比例为铺满全屏
        preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
        _previewLayer        = preview;
    }
    return _previewLayer;
}

//捕获视频的会话
- (AVCaptureSession *)captureSession {
    if (_captureSession == nil) {
        _captureSession = [[AVCaptureSession alloc] init];

        //设置分辨率
        if ([_captureSession canSetSessionPreset:AVCaptureSessionPreset1280x720]) {
            _captureSession.sessionPreset = AVCaptureSessionPreset1280x720;
        }

        if (self.cameraOrientation == WYACameraOrientationBack) {
            if ([_captureSession canAddInput:self.backCameraInput]) {
                [_captureSession addInput:self.backCameraInput];
            }
        } else if (self.cameraOrientation == WYACameraOrientationFront) {
            if ([_captureSession canAddInput:self.frontCameraInput]) {
                [_captureSession addInput:self.frontCameraInput];
            }
        }

        //添加后置麦克风的输入
        if ([_captureSession canAddInput:self.audioMicInput]) {
            [_captureSession addInput:self.audioMicInput];
        }

        //将设备输出添加到会话中
        if ([_captureSession canAddOutput:self.captureMovieFileOutput]) {
            [_captureSession addOutput:self.captureMovieFileOutput];
        }

        if ([_captureSession canAddOutput:self.imageOutPut]) {
            [_captureSession addOutput:self.imageOutPut];
        }
        //设置视频录制的方向
        self.videoConnection.videoOrientation = AVCaptureVideoOrientationPortrait;
    }
    return _captureSession;
}

//后置摄像头输入
- (AVCaptureDeviceInput *)backCameraInput {
    if (_backCameraInput == nil) {
        NSError * error;
        _backCameraInput =
            [[AVCaptureDeviceInput alloc] initWithDevice:[self backCamera]
                                                   error:&error];
        if (error) { NSLog(@"获取后置摄像头失败~%d", [self isAvailableWithCamera]); }
    }
    return _backCameraInput;
}

//前置摄像头输入
- (AVCaptureDeviceInput *)frontCameraInput {
    if (_frontCameraInput == nil) {
        NSError * error;
        _frontCameraInput =
            [[AVCaptureDeviceInput alloc] initWithDevice:[self frontCamera]
                                                   error:&error];
        if (error) { NSLog(@"获取前置摄像头失败~"); }
    }
    return _frontCameraInput;
}

//麦克风输入
- (AVCaptureDeviceInput *)audioMicInput {
    if (_audioMicInput == nil) {
        AVCaptureDevice * mic = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
        NSError * error;
        _audioMicInput = [AVCaptureDeviceInput deviceInputWithDevice:mic error:&error];
        if (error) { NSLog(@"获取麦克风失败~%d", [self isAvailableWithMic]); }
    }
    return _audioMicInput;
}
//初始化设备输出对象，用于获得输出数据
- (AVCaptureMovieFileOutput *)captureMovieFileOutput {
    if (_captureMovieFileOutput == nil) {
        _captureMovieFileOutput = [[AVCaptureMovieFileOutput alloc] init];
    }
    return _captureMovieFileOutput;
}

- (AVCaptureStillImageOutput *)imageOutPut {
    if (!_imageOutPut) { _imageOutPut = [[AVCaptureStillImageOutput alloc] init]; }
    return _imageOutPut;
}

//视频连接
- (AVCaptureConnection *)videoConnection {
    _videoConnection = [self.captureMovieFileOutput connectionWithMediaType:AVMediaTypeVideo];
    if ([_videoConnection isVideoStabilizationSupported]) {
        _videoConnection.preferredVideoStabilizationMode = AVCaptureVideoStabilizationModeAuto;
    }
    return _videoConnection;
}

//返回前置摄像头
- (AVCaptureDevice *)frontCamera {
    self.device = [self cameraWithPosition:AVCaptureDevicePositionFront];
    return self.device;
}

//返回后置摄像头
- (AVCaptureDevice *)backCamera {
    self.device = [self cameraWithPosition:AVCaptureDevicePositionBack];
    return self.device;
}

//用来返回是前置摄像头还是后置摄像头
- (AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition)position {
    //返回和视频录制相关的所有默认设备
    NSArray * devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    //遍历这些设备返回跟position相关的设备
    for (AVCaptureDevice * device in devices) {
        if ([device position] == position) { return device; }
    }
    return nil;
}
@end

@implementation WYACameraTool (Authorization)

- (BOOL)isAvailableWithCamera {
    return [self isAvailableWithDeviveMediaType:AVMediaTypeVideo];
}
- (BOOL)isAvailableWithMic {
    return [self isAvailableWithDeviveMediaType:AVMediaTypeAudio];
}

- (BOOL)isAvailableWithDeviveMediaType:(NSString *)mediaType {
    AVAuthorizationStatus status =
        [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == ALAuthorizationStatusDenied || status == ALAuthorizationStatusRestricted)
        return NO;
    else
        return YES;
}

@end
