

#import "WYACameraViewController.h"
#import "WYACameraTool.h"
#import "WYAProgressView.h"
#import "WYACameraPreviewImageView.h"
#import "WYAImageCropViewController.h"

@interface WYACameraViewController ()

@property (nonatomic, strong) UILabel * messageLabel;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *flashButton;
@property (nonatomic, strong) UIButton *cameraButton;
//@property (nonatomic, strong) UIImageView * cameraImageView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) WYAProgressView * progressView;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;//相机拍摄预览图层
@property (nonatomic, strong) WYACameraTool *videoTool;

@property (nonatomic, assign) CGFloat timeCount;
@property (nonatomic, assign) CGFloat timeMargin;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) WYACameraPreviewImageView * placeholdImageView;
@property (nonatomic, strong) AVPlayer * player;
@end

@implementation WYACameraViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.time = 15.0;
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
                [self setupCaptureSession];
            }
        }];
    }else if (AVstatus == AVAuthorizationStatusAuthorized) {
        [self setupCaptureSession];
    }else if (AVstatus == AVAuthorizationStatusDenied) {
        [UIView wya_ShowCenterToastWithMessage:@"检测到您没有开启相机权限，请前往设置开启"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        });
    }
    
    if (avAudioStatus == AVAuthorizationStatusDenied) {
        [UIView wya_ShowCenterToastWithMessage:@"检测到您没有开启麦克风权限，请前往设置开启"];
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
    [self.view addSubview:self.cameraButton];

    [self.view addSubview:self.progressView];
    [self.view addSubview:self.messageLabel];

    self.cameraButton.center = CGPointMake(ScreenWidth-self.cameraButton.bounds.size.width, self.cameraButton.bounds.size.height);
    self.closeButton.center = CGPointMake(ScreenWidth*0.5-self.closeButton.bounds.size.width-30, ScreenHeight - self.progressView.bounds.size.height);
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
    flashButton.selected = !flashButton.isSelected;
    if(flashButton.selected){
        [self.videoTool openFlashLight];
    }
    else{
        [self.videoTool closeFlashLight];
    }
}

- (void)cameraButtonClick:(UIButton *)cameraButton
{
    cameraButton.selected = !cameraButton.isSelected;
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
        }];
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
            if (self.TakePhoto) {
                self.TakePhoto(self.placeholdImageView.image);
            }
        }else{
            if (self.TakeVideo) {
                self.TakeVideo(self.videoTool.videoPath);
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
    self.progressView.progress = progress;
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
       [_closeButton setImage:[UIImage loadBundleImage:@"shortvideo_button_close" ClassName:NSStringFromClass([self class])] forState:UIControlStateNormal];
        _closeButton.bounds = CGRectMake(0, 0, 50, 50);
       _closeButton.layer.cornerRadius =  _closeButton.bounds.size.width * 0.5;
       _closeButton.layer.masksToBounds = YES;
       [_closeButton addTarget:self action:@selector(closeButtonClick) forControlEvents:UIControlEventTouchUpInside];
   }
    return _closeButton;
}

- (UIButton *)flashButton
{
    if(!_flashButton)
    {
        _flashButton = [ UIButton buttonWithType:UIButtonTypeCustom];
        [_flashButton setImage:[UIImage loadBundleImage:@"room_pop_up_lamp" ClassName:NSStringFromClass([self class])] forState:UIControlStateNormal];
         _flashButton.bounds = CGRectMake(0, 0, 50, 50);
        _flashButton.layer.cornerRadius =  _flashButton.bounds.size.width * 0.5;
        _flashButton.layer.masksToBounds = YES;
        [_flashButton addTarget:self action:@selector(flashButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _flashButton;
}

- (UIButton *)cameraButton
{
    if(!_cameraButton)
    {
        _cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setImage:[UIImage loadBundleImage:@"turnCamera" ClassName:NSStringFromClass([self class])] forState:UIControlStateNormal];
        _cameraButton.bounds = CGRectMake(0, 0, 40, 40);
        _cameraButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_cameraButton addTarget:self action:@selector(cameraButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraButton;
}

-(WYAProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[WYAProgressView alloc]initWithFrame:CGRectMake((ScreenWidth-60*SizeAdapter)/2, ScreenHeight-WYABottomHeight-60*SizeAdapter-30, 60*SizeAdapter, 60*SizeAdapter)];
        _progressView.backGroundImage = [UIImage loadBundleImage:@"yuan" ClassName:NSStringFromClass([self class])];
        _progressView.progress = 0.f;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(takingPictures)];
        [_progressView addGestureRecognizer:tap];

        UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(startRecordingVideo:)];
        [_progressView addGestureRecognizer:longPress];
        [longPress requireGestureRecognizerToFail:tap];
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
                WYAImageCropViewController * vc = [[WYAImageCropViewController alloc]initWithImage:previewImage];
                vc.onDidCropToRect = ^(UIImage * _Nonnull image, CGRect cropRect, NSInteger angle) {
                    [vc dismissViewControllerAnimated:NO completion:^{
                        [strongSelf dismissViewControllerAnimated:YES completion:^{
                            if (strongSelf.TakePhoto) {
                                strongSelf.TakePhoto(image);
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
