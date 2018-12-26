

#import "WYACameraViewController.h"
#import "WYACameraTool.h"
#import "WYAProgressView.h"
#import "WYACameraPreviewImageView.h"
#import "WYAImageCropViewController.h"

@interface WYACameraViewController ()

@property (nonatomic, strong) UIView *containerView;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;//相机拍摄预览图层
@property (nonatomic, strong) WYACameraTool *videoTool;


@property (nonatomic, strong) UIView * cameraBar;//顶部放置以下控件的视图
@property (nonatomic, strong) UIButton *flashButton;//闪光灯
@property (nonatomic, strong) UIButton *cameraButton;//切换相机
@property (nonatomic, strong) UIButton * flashLightButton;//手电筒

@property (nonatomic, strong) UILabel * messageLabel;
@property (nonatomic, strong) UIButton *closeButton;//关闭按钮
@property (nonatomic, strong) WYAProgressView * progressView;

@property (nonatomic, assign) CGFloat timeCount;
@property (nonatomic, assign) CGFloat timeMargin;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) WYACameraPreviewImageView * placeholdImageView;
@property (nonatomic, strong) AVPlayer * player;
@property (nonatomic, assign) WYACameraType  cameraType;
@end

@implementation WYACameraViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.time = 15.0;
        self.cameraType = WYACameraTypeAll;
    }
    return self;
}

- (instancetype)initWithType:(WYACameraType)type
{
    self = [super init];
    if (self) {
        self.time = 15.0;
        self.cameraType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    AVAuthorizationStatus AVstatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];//相机权限
    AVAuthorizationStatus avAudioStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (AVstatus == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    [self setupCaptureSession];
                });
                
            }else {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    [UIView wya_warningToastWithMessage:@"检测到您未开启相机，将在三秒钟返回"];
                });
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    if (self.navigationController) {
                        [self.navigationController popViewControllerAnimated:YES];
                    }else{
                        [self dismissViewControllerAnimated:YES completion:nil];
                    }
                });
            }
        }];
    }else if (AVstatus == AVAuthorizationStatusAuthorized) {
        [self setupCaptureSession];
    }else if (AVstatus == AVAuthorizationStatusDenied) {
        [UIView wya_showCenterToastWithMessage:@"检测到您没有开启相机权限，请前往设置开启"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        });
    }
    
    if (avAudioStatus == AVAuthorizationStatusDenied) {
        [UIView wya_showCenterToastWithMessage:@"检测到您没有开启麦克风权限，请前往设置开启"];
    }
    
    [self setupSubView];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:2 animations:^{
        self.messageLabel.alpha = 0;
    } completion:^(BOOL finished) {
        [self.messageLabel removeFromSuperview];
    }];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.videoTool stopCapture];
    [self.videoTool stopRecordFunction];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark - Private Method -
- (void)setupSubView
{
    [self.view addSubview:self.containerView];
    [self.view addSubview:self.closeButton];
    [self.view addSubview:self.cameraBar];
    [self.cameraBar addSubview:self.cameraButton];
    [self.cameraBar addSubview:self.flashButton];
    [self.cameraBar addSubview:self.flashLightButton];
    
    [self.view addSubview:self.progressView];
    if (self.cameraType == WYACameraTypeAll) {
        [self.view addSubview:self.messageLabel];
    }
    
    
    self.cameraBar.frame = CGRectMake(0, 0, ScreenWidth, WYATopHeight);
    
    CGFloat width = self.cameraBar.cmam_width/3;
    self.flashButton.center = CGPointMake(width/2, WYAStatusBarHeight+22);
    self.cameraButton.center = CGPointMake(width + width/2, WYAStatusBarHeight+22);
    self.flashLightButton.center = CGPointMake( width*2 + width/2, WYAStatusBarHeight+22);
    
    self.closeButton.center = CGPointMake(ScreenWidth/4-10*SizeAdapter,  self.progressView.center.y);
    self.messageLabel.center = CGPointMake(ScreenWidth/2, self.progressView.center.y-60);
}

- (void)setupCaptureSession
{
    self.captureVideoPreviewLayer  =  [self.videoTool previewLayer];
    CALayer *layer=self.containerView.layer;
    layer.masksToBounds=YES;
    self.captureVideoPreviewLayer.frame = layer.bounds;
    [layer addSublayer:self.captureVideoPreviewLayer];
    //开启录制功能
    [self.videoTool startRecordFunction];
}

- (void)closeButtonClick
{
    [self endRecordingVideo];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)flashButtonClick:(UIButton *)flashButton
{
    flashButton.selected = !flashButton.selected;
    if(flashButton.selected){
        [self.videoTool openFlash];
    }
    else{
        [self.videoTool closeFlash];
    }
}

- (void)flashLightButtonClick:(UIButton *)button{
    button.selected = !button.selected;
    if(button.selected){
        [self.videoTool openFlashLight];
    }
    else{
        [self.videoTool closeFlashLight];
    }
}

- (void)cameraButtonClick:(UIButton *)cameraButton
{
    cameraButton.selected = !cameraButton.selected;
    if(cameraButton.selected)
    {
        [self.videoTool changeCameraInputDeviceisFront:YES];
    }
    else{
        [self.videoTool changeCameraInputDeviceisFront:NO];
    }
}

- (void)startRecordingVideo:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan)
    {
        [self startTimer];
        [self.videoTool startCapture];
        [UIView animateWithDuration:0.2 animations:^{
            self.progressView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }];
    }else if (longPress.state == UIGestureRecognizerStateEnded){
        [self endRecordingVideo];
        [self.videoTool stopRecordFunction];
        
        [UIView animateWithDuration:0.2 animations:^{
            self.progressView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            if (self.videoTool.videoPath) {
                
                self.placeholdImageView.hidden = NO;
                NSURL * url = [NSURL fileURLWithPath:self.videoTool.videoPath];
                self.player = [AVPlayer playerWithURL:url];
                AVPlayerLayer * layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
                layer.frame = self.placeholdImageView.frame;
                [self.placeholdImageView.layer insertSublayer:layer atIndex:0];
                [self.player play];
                //注册通知
                [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(runLoopTheMovie:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
                
            }
        }];
        
    }
    
}

- (void)endRecordingVideo
{
    [self stopTimer];
    [self.videoTool stopCapture];
}

- (void)takingPictures
{
    [self.videoTool startTakingPhoto:^(UIImage *image) {
        self.placeholdImageView.hidden = NO;
        self.placeholdImageView.image = image;
        [self endRecordingVideo];

    }];
}

- (void)cancelClick{
    [self.placeholdImageView removeFromSuperview];
    self.placeholdImageView = nil;

    [self.videoTool startRecordFunction];
    
    if (self.videoTool.videoPath) {
        [self.player pause];
        NSFileManager * fileManage = [NSFileManager defaultManager];
        NSError * error;
        BOOL delet = [fileManage removeItemAtPath:self.videoTool.videoPath error:&error];
        NSLog(@"dele==%d",delet);
    }else if (self.placeholdImageView.image){
        self.placeholdImageView.image = nil;
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}

- (void)sureClick{
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.placeholdImageView.image) {
            if (self.takePhoto) {
                self.takePhoto(self.placeholdImageView.image);
            }
        }else{
            if (self.takeVideo) {
                self.takeVideo(self.videoTool.videoPath);
            }
        }
    }];
}

- (void)runLoopTheMovie:(NSNotification *)n{
    //注册的通知  可以自动把 AVPlayerItem 对象传过来，只要接收一下就OK
    
    AVPlayerItem * p = [n object];
    //关键代码
    [p seekToTime:kCMTimeZero];

    [self.player play];
    NSLog(@"重播");
}

- (void)startTimer
{
    CGFloat signleTime = self.time/360;
    self.timeCount = 0;
    self.timeMargin = signleTime;
    self.timer = [NSTimer  scheduledTimerWithTimeInterval:signleTime target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    self.progressView.progress = 0.f;
    [self.timer invalidate];
    self.timer = nil;
}

- (void)updateProgress
{
    if(self.timeCount >= self.time)
    {
        [self stopTimer];
        [self endRecordingVideo];
        return;
    }

    self.timeCount = self.timeCount + self.timeMargin;
    CGFloat progress = self.timeCount/self.time;
    NSLog(@"progress==%f",progress);
    self.progressView.progress = progress;
}

#pragma mark - Public Method -
- (void)clearCache{
    NSFileManager * fileManage = [NSFileManager defaultManager];
    NSError * error;
    [fileManage removeItemAtPath:[self.videoTool getVideoPathCache] error:&error];
    NSLog(@"error==%@",[error localizedDescription]);
}

#pragma mark - Setter -
- (void)setTime:(CGFloat)time{
    NSAssert(time>0, @"录制时间不能小于1s");
    _time = time;
}

#pragma mark - Getter -
- (UILabel *)messageLabel{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.text = @"轻触拍照，按住摄像";
        _messageLabel.bounds = CGRectMake(0, 0, 200, 30);
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _messageLabel;
}

- (UIView *)containerView
{
  if(!_containerView)
  {
      _containerView = [[UIView alloc]initWithFrame:self.view.bounds];
      _containerView.backgroundColor = [UIColor whiteColor];
  }
    return _containerView;
}

- (UIButton *)closeButton
{
   if(!_closeButton)
   {
       _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
       [_closeButton setImage:[UIImage loadBundleImage:@"icon_cancel_camera" ClassName:NSStringFromClass([self class])] forState:UIControlStateNormal];
        _closeButton.bounds = CGRectMake(0, 0, 50, 50);
       _closeButton.layer.cornerRadius =  _closeButton.bounds.size.width * 0.5;
       _closeButton.layer.masksToBounds = YES;
       [_closeButton addTarget:self action:@selector(closeButtonClick) forControlEvents:UIControlEventTouchUpInside];
   }
    return _closeButton;
}

- (UIView *)cameraBar{
    if(!_cameraBar){
        _cameraBar = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
            object;
        });
    }
    return _cameraBar;
}

- (UIButton *)flashButton
{
    if(!_flashButton)
    {
        _flashButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_flashButton setImage:[UIImage loadBundleImage:@"icon_camera_flash_close" ClassName:NSStringFromClass([self class])] forState:UIControlStateNormal];
        [_flashButton setImage:[UIImage loadBundleImage:@"icon_camera_flash_open" ClassName:NSStringFromClass([self class])] forState:UIControlStateSelected];
         _flashButton.bounds = CGRectMake(0, 0, 40, 40);
        [_flashButton addTarget:self action:@selector(flashButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _flashButton;
}

-(UIButton *)flashLightButton{
    if (!_flashLightButton) {
        _flashLightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_flashLightButton setImage:[UIImage loadBundleImage:@"icon_scan_flashlight" ClassName:NSStringFromClass([self class])] forState:UIControlStateNormal];
        _flashLightButton.bounds = CGRectMake(0, 0, 40, 40);
        [_flashLightButton addTarget:self action:@selector(flashLightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _flashLightButton;
}

- (UIButton *)cameraButton
{
    if(!_cameraButton)
    {
        _cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setImage:[UIImage loadBundleImage:@"icon_camera_switch" ClassName:NSStringFromClass([self class])] forState:UIControlStateNormal];
        _cameraButton.bounds = CGRectMake(0, 0, 40, 40);
        _cameraButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_cameraButton addTarget:self action:@selector(cameraButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraButton;
}

-(WYAProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[WYAProgressView alloc]initWithFrame:CGRectMake((ScreenWidth-80*SizeAdapter)/2, ScreenHeight-WYABottomHeight-80*SizeAdapter-30, 80*SizeAdapter, 80*SizeAdapter)];
        _progressView.borderWidth = 10*SizeAdapter;
        _progressView.layer.cornerRadius = 40*SizeAdapter;
        _progressView.layer.masksToBounds = YES;
        if (self.cameraType == WYACameraTypeAll) {
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(takingPictures)];
            [_progressView addGestureRecognizer:tap];
            
            UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(startRecordingVideo:)];
            [_progressView addGestureRecognizer:longPress];
            [longPress requireGestureRecognizerToFail:tap];
        }else if (self.cameraType == WYACameraTypeImage) {
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(takingPictures)];
            [_progressView addGestureRecognizer:tap];
        }else {
            UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(startRecordingVideo:)];
            [_progressView addGestureRecognizer:longPress];
        }
        
    }
    return _progressView;
}

- (WYACameraTool *)videoTool
{
  if(!_videoTool)
  {
      _videoTool = [[WYACameraTool alloc]init];
  }
    return _videoTool;
}

- (WYACameraPreviewImageView *)placeholdImageView{
    if(!_placeholdImageView){
        _placeholdImageView = ({
            WYACameraPreviewImageView * object = [[WYACameraPreviewImageView alloc]initWithFrame:self.view.bounds];
            object.userInteractionEnabled = YES;
            object.hidden = YES;
            WeakSelf(weakSelf);
            object.cancelHandle = ^{
                [weakSelf cancelClick];
            };
            object.finishHandle = ^(UIImage * _Nonnull previewImage) {
                [weakSelf sureClick];
            };
            object.editHandle = ^(UIImage * _Nonnull previewImage) {
                StrongSelf(strongSelf);
                if (self.videoTool.videoPath) {
                    [UIView wya_showCenterToastWithMessage:@"视频编辑暂未规划"];
                    return ;
                }
                
                WYAImageCropViewController * vc = [[WYAImageCropViewController alloc]initWithImage:previewImage];
                vc.onDidCropToRect = ^(UIImage * _Nonnull image, CGRect cropRect, NSInteger angle) {
                    [vc dismissViewControllerAnimated:NO completion:^{
                        [strongSelf dismissViewControllerAnimated:YES completion:^{
                            if (strongSelf.takePhoto) {
                                strongSelf.takePhoto(image);
                            }
                        }];
                    }];
                };
                [strongSelf presentViewController:vc animated:YES completion:nil];
            };
            [self.view addSubview:object];
            object;
        });
    }
    return _placeholdImageView;
}


@end
