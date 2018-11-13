

#import "WYACameraViewController.h"
#import "WYACameraTool.h"
#import "WYACameraRecordProcessView.h"
#import "ImageMakeConfig.h"

#define kVideoMaxTime   15.0 //录制时间长度

@interface WYACameraViewController ()

@property (nonatomic, strong) UILabel * messageLabel;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *flashButton;
@property (nonatomic, strong) UIButton *cameraButton;
@property (nonatomic, strong) UIImageView * cameraImageView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILongPressGestureRecognizer * longPress;

@property (strong, nonatomic) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;//相机拍摄预览图层
@property (nonatomic, strong) WYACameraTool *videoTool;
@property (nonatomic, strong) WYACameraRecordProcessView *progressView;
@property (nonatomic, assign) CGFloat timeCount;
@property (nonatomic, assign) CGFloat timeMargin;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UIImageView * placeholdImageView;
@property (nonatomic, strong) UIButton * backButton;
@property (nonatomic, strong) UIButton * sureButton;
@property (nonatomic, strong) AVPlayer * player;
@end

@implementation WYACameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    
    [self setupSubView];
    [self setupCaptureSession];
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    self.cameraImageView.center = CGPointMake(width *0.5, height - self.cameraImageView.bounds.size.height);
    self.progressView.center = self.cameraImageView.center;
    self.cameraButton.center = CGPointMake(width-self.cameraButton.bounds.size.width, self.cameraButton.bounds.size.height);
    self.closeButton.center = CGPointMake(width*0.5-self.closeButton.bounds.size.width-30, height - self.cameraImageView.bounds.size.height);
    self.messageLabel.center = CGPointMake(width/2, self.progressView.center.y-60);

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
}


- (void)setupSubView
{
    [self.view addSubview:self.containerView];
    
    [self.view addSubview:self.closeButton];
    
    [self.view addSubview:self.cameraButton];
    [self.view addSubview:self.progressView];
    [self.view addSubview:self.cameraImageView];
    [self.view addSubview:self.messageLabel];

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

#pragma mark- action
- (void)closeButtonClick
{
    [self endRecordingVideo];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)flashButtonClick:(UIButton *)flashButton
{
    flashButton.selected = !flashButton.isSelected;
    if(flashButton.selected)
    {
        [self.videoTool openFlashLight];
    }
    else
        [self.videoTool closeFlashLight];
}

- (void)cameraButtonClick:(UIButton *)cameraButton
{
    cameraButton.selected = !cameraButton.isSelected;
    if(cameraButton.selected)
    {
        [self.videoTool changeCameraInputDeviceisFront:YES];
    }
    else
        [self.videoTool changeCameraInputDeviceisFront:NO];
}

- (void)startRecordingVideo:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan)
    {
        [self startTimer];
        [self.videoTool startCapture];
    }else if (longPress.state == UIGestureRecognizerStateEnded){
        [self endRecordingVideo];
        [self.videoTool stopRecordFunction];
        if (self.videoTool.videoPath) {
            [self.view addSubview:self.placeholdImageView];
            
            NSURL * url = [NSURL fileURLWithPath:self.videoTool.videoPath];
            self.player = [AVPlayer playerWithURL:url];
            AVPlayerLayer * layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
            layer.frame = self.placeholdImageView.frame;
            [self.placeholdImageView.layer addSublayer:layer];
            [self.player play];
            //注册通知
            [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(runLoopTheMovie:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
            [self.placeholdImageView addSubview:self.backButton];
            [self.placeholdImageView addSubview:self.sureButton];
            self.backButton.center = CGPointMake(50, SCREEN_HEIGHT-self.backButton.bounds.size.height-50);
            self.sureButton.center = CGPointMake(SCREEN_WIDTH-50, SCREEN_HEIGHT-self.backButton.bounds.size.height-50);
        }
    }
    
    
    
    
    
}

- (void)endRecordingVideo
{
    [self stopTimer];
    [self.videoTool stopCapture];
}

//拍照
- (void)takingPictures
{
    [self.videoTool startTakingPhoto:^(UIImage *image) {
        self.placeholdImageView.image = image;
        [self endRecordingVideo];
        [self.view addSubview:self.placeholdImageView];
        [self.placeholdImageView addSubview:self.backButton];
        [self.placeholdImageView addSubview:self.sureButton];
        self.backButton.center = CGPointMake(50, SCREEN_HEIGHT-self.backButton.bounds.size.height-50);
        self.sureButton.center = CGPointMake(SCREEN_WIDTH-50, SCREEN_HEIGHT-self.backButton.bounds.size.height-50);
    }];
}

- (void)cancelClick{
    [self.placeholdImageView removeFromSuperview];
//    [self startRecordingVideo:self.longPress];
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
    if (self.placeholdImageView.image) {
        if (self.TakePhoto) {
            self.TakePhoto(self.placeholdImageView.image);
        }
    }else{
        if (self.TakeVideo) {
            self.TakeVideo(self.videoTool.videoPath);
        }
    }
    
}

- (void)runLoopTheMovie:(NSNotification *)n{
    //注册的通知  可以自动把 AVPlayerItem 对象传过来，只要接收一下就OK
    
    AVPlayerItem * p = [n object];
    //关键代码
    [p seekToTime:kCMTimeZero];

    [self.player play];
    NSLog(@"重播");
}

#pragma mark - 定时器
- (void)startTimer
{
    self.progressView.hidden = NO;
    CGFloat signleTime = kVideoMaxTime/360;
    self.timeCount = 0;
    self.timeMargin = signleTime;
    self.timer = [NSTimer  scheduledTimerWithTimeInterval:signleTime target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    self.progressView.progress = 0;
    //self.progressView.hidden = YES;
    [self.timer invalidate];
    self.timer = nil;
}

- (void)updateProgress
{
    if(self.timeCount >=kVideoMaxTime)
    {
        [self stopTimer];
        [self endRecordingVideo];
        return;
    }
    NSLog(@"======%lf",self.timeCount);
    self.timeCount +=self.timeMargin;
    CGFloat progress = self.timeCount/kVideoMaxTime;
    self.progressView.progress = progress;
}

-(UIImage *)loadBundleImageWithImageName:(NSString *)imageName{
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]].resourcePath
                            stringByAppendingPathComponent:@"/WYAMedia.bundle"];
    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
    UIImage *image = [UIImage imageNamed:imageName
                                inBundle:resource_bundle
           compatibleWithTraitCollection:nil];
    return image;
}

#pragma mark - lazy
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
       _closeButton = [ UIButton buttonWithType:UIButtonTypeCustom];
       [_closeButton setImage:[self loadBundleImageWithImageName:@"shortvideo_button_close"] forState:UIControlStateNormal];
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
        [_flashButton setImage:[self loadBundleImageWithImageName:@"room_pop_up_lamp"] forState:UIControlStateNormal];
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
        _cameraButton = [ UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setImage:[self loadBundleImageWithImageName:@"turnCamera"] forState:UIControlStateNormal];
        _cameraButton.bounds = CGRectMake(0, 0, 40, 40);
        _cameraButton.layer.cornerRadius =  _cameraButton.bounds.size.width * 0.5;
        _cameraButton.layer.masksToBounds = YES;
        [_cameraButton addTarget:self action:@selector(cameraButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraButton;
}

- (UIImageView *)cameraImageView
{
    if(!_cameraImageView)
    {
        _cameraImageView = [[UIImageView alloc]initWithImage:[self loadBundleImageWithImageName:@"camera"]];
        _cameraImageView.bounds = CGRectMake(0, 0, 60, 60);
        _cameraImageView.layer.cornerRadius =  _cameraImageView.bounds.size.width * 0.5;
        _cameraImageView.layer.masksToBounds = YES;

        _cameraImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(takingPictures)];
        [_cameraImageView addGestureRecognizer:tap];

        self.longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(startRecordingVideo:)];
        [self.longPress requireGestureRecognizerToFail:tap];
        [_cameraImageView addGestureRecognizer:self.longPress];
    }
    return _cameraImageView;
}

- (WYACameraTool *)videoTool
{
  if(!_videoTool)
  {
      _videoTool = [[WYACameraTool alloc]init];
  }
    return _videoTool;
}

- (WYACameraRecordProcessView *)progressView
{
  if(!_progressView)
  {
      CGFloat widthHeight = self.cameraImageView.bounds.size.width - 2*lineWith;
      _progressView = [[WYACameraRecordProcessView alloc]initWithCenter:CGPointMake(widthHeight *0.5, widthHeight*0.5) radius:(widthHeight-lineWith) *0.5];
      _progressView.bounds =CGRectMake(0, 0, widthHeight, widthHeight);
      _progressView.hidden = YES;
  }
    return _progressView;
}

- (UIImageView *)placeholdImageView{
    if (!_placeholdImageView) {
        _placeholdImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        _placeholdImageView.userInteractionEnabled = YES;
    }
    return _placeholdImageView;
}

- (UIButton *)backButton{
    if(!_backButton)
    {
        _backButton = [ UIButton buttonWithType:UIButtonTypeCustom];
        UIImage * image = [self loadBundleImageWithImageName:@"mistake"];
        [_backButton setImage:image forState:UIControlStateNormal];
        _backButton.bounds = CGRectMake(0, 0, 40, 40);
        _backButton.layer.cornerRadius =  _cameraButton.bounds.size.width * 0.5;
        _backButton.layer.masksToBounds = YES;
        [_backButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UIButton *)sureButton{
    if (!_sureButton) {
        _sureButton = [ UIButton buttonWithType:UIButtonTypeCustom];
        [_sureButton setImage:[self loadBundleImageWithImageName:@"correct"] forState:UIControlStateNormal];
        _sureButton.bounds = CGRectMake(0, 0, 40, 40);
        [_sureButton addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}

@end
