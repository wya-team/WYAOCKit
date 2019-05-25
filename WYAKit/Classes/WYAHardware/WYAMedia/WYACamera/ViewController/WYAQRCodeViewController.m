//
//  QRCodeViewController.m
//  QRCodeDemo
//
//  Created by 李世航 on 2018/6/13.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAQRCodeViewController.h"
#import "UIImage+Catagory.h"
#import "WYANavBar.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

static CGFloat QRCodeWidth = 220;

#define TOP (ScreenHeight - WYAStatusBarHeight - QRCodeWidth) / 2
#define LEFT (ScreenWidth - QRCodeWidth) / 2
#define kScanRect CGRectMake(LEFT, TOP, QRCodeWidth, QRCodeWidth)

@interface WYAQRCodeViewController () <
AVCaptureMetadataOutputObjectsDelegate, AVCaptureVideoDataOutputSampleBufferDelegate,
UIImagePickerControllerDelegate, UINavigationControllerDelegate, WYANavBarDelegate> {
    int num;
    BOOL upOrdown;
    CAShapeLayer * cropLayer;
}

@property (nonatomic, strong) AVCaptureDevice * device;         //设备
@property (nonatomic, strong) AVCaptureDeviceInput * input;     //输入
@property (nonatomic, strong) AVCaptureMetadataOutput * output; //输出
@property (nonatomic, strong) AVCaptureSession * session;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer * preview;
@property (nonatomic, strong) NSTimer * timer;
@property (nonatomic, strong) UIImageView * line;
@property (nonatomic, strong) UIView * layerBackgroundView;
@property (nonatomic, strong) UIView * backgroundView;
@property (nonatomic, strong) WYANavBar * navBar;
@property (nonatomic, strong) UIImageView * qrCodeImageView;
@property (nonatomic, strong) UIButton * lampButton;
@property (nonatomic, strong) UILabel * lampLabel;
@property (nonatomic, assign) BOOL blowup; //相机扫描区域是否放大过
@end

@implementation WYAQRCodeViewController
#pragma mark - LifeCircle -
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    AVAuthorizationStatus AVstatus =
    [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo]; //相机权限
    if (AVstatus == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice
         requestAccessForMediaType:AVMediaTypeVideo
         completionHandler:^(BOOL granted) {
             if (granted) {
                 [self setCameraLayer];
                 [self createUI];
                 [self setupCamera];
             } else {
                 dispatch_sync(dispatch_get_main_queue(), ^{
                     [UIView wya_warningToastWithMessage:
                      @"检测到您未开启相机，将在三秒钟返回"];
                 });

                 dispatch_after(
                                dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)),
                                dispatch_get_main_queue(), ^{
                                    if (self.navigationController) {
                                        [self.navigationController popViewControllerAnimated:YES];
                                    } else {
                                        [self dismissViewControllerAnimated:YES completion:nil];
                                    }
                                });
             }
         }];
    } else if (AVstatus == AVAuthorizationStatusAuthorized) {
        [self setCameraLayer];
        [self createUI];
        [self setupCamera];

    } else if (AVstatus == AVAuthorizationStatusDenied) {
        [UIView wya_showCenterToastWithMessage:
         @"检"
         @"测到您没有开启相机权限，请前往设置开启"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
                           [[UIApplication sharedApplication]
                            openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                       });
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    if (self.session) { [self.session stopRunning]; }

    if (self.timer) { [self.timer setFireDate:[NSDate distantFuture]]; }
}

- (void)dealloc {
    [self.device removeObserver:self forKeyPath:@"adjustingFocus"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method -
#pragma mark ======= UI
- (void)setCameraLayer {
    [self setCropRect:kScanRect];

    if (self.session) { [self.session startRunning]; }
    if (self.timer) { [self.timer setFireDate:[NSDate distantPast]]; }
}

- (void)setCropRect:(CGRect)cropRect {
    cropLayer             = [[CAShapeLayer alloc] init];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, nil, cropRect);
    CGPathAddRect(path, nil, self.layerBackgroundView.bounds);

    [cropLayer setFillRule:kCAFillRuleEvenOdd];
    [cropLayer setPath:path];
    [cropLayer setFillColor:[UIColor blackColor].CGColor];
    [cropLayer setOpacity:0.6];
    [cropLayer setNeedsDisplay];

    [self.layerBackgroundView.layer addSublayer:cropLayer];
}

- (void)createUI {
    [self.view addSubview:self.layerBackgroundView];
    [self.view addSubview:self.backgroundView];
    [self.backgroundView addSubview:self.navBar];
    [self.backgroundView addSubview:self.qrCodeImageView];
    [self.backgroundView addSubview:self.lampLabel];
    [self.qrCodeImageView addSubview:self.lampButton];

    upOrdown = NO;
    num      = 0;
    _line    = [[UIImageView alloc] initWithFrame:CGRectMake(LEFT, TOP + 10, 220, 2)];

    _line.image = [UIImage loadBundleImage:@"line" ClassName:NSStringFromClass([self class])];
    [self.backgroundView addSubview:_line];

    self.timer = [NSTimer scheduledTimerWithTimeInterval:.02
                                                  target:self
                                                selector:@selector(animation1)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)setupCamera {
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device == nil) {
        UIAlertController * alert =
        [UIAlertController alertControllerWithTitle:@"提示"
                                            message:@"设备没有摄像头"
                                     preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确认"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * _Nonnull action){

                                                }]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    // Device
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [self.device addObserver:self
                  forKeyPath:@"adjustingFocus"
                     options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                     context:nil];

    // Input
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];

    // Output
    self.output = [[AVCaptureMetadataOutput alloc] init];
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];

    AVCaptureVideoDataOutput * videoOutput = [[AVCaptureVideoDataOutput alloc] init];
    [videoOutput setSampleBufferDelegate:self queue:dispatch_get_main_queue()];

    //设置扫描区域
    CGFloat top    = TOP / ScreenHeight;
    CGFloat left   = LEFT / ScreenWidth;
    CGFloat width  = 220 / ScreenWidth;
    CGFloat height = 220 / ScreenHeight;
    /// top 与 left 互换  width 与 height 互换
    [self.output setRectOfInterest:CGRectMake(top, left, height, width)];

    // Session
    self.session = [[AVCaptureSession alloc] init];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];

    if ([self.session canAddInput:self.input]) { [self.session addInput:self.input]; }

    if ([self.session canAddOutput:self.output]) { [self.session addOutput:self.output]; }
    if ([self.session canAddOutput:videoOutput]) { [self.session addOutput:videoOutput]; }
    // 条码类型 AVMetadataObjectTypeQRCode
    [self.output setMetadataObjectTypes:@[
                                          AVMetadataObjectTypeAztecCode,
                                          AVMetadataObjectTypeQRCode,
                                          AVMetadataObjectTypeUPCECode,
                                          AVMetadataObjectTypeEAN8Code,
                                          AVMetadataObjectTypeEAN13Code,
                                          AVMetadataObjectTypeCode39Code,
                                          AVMetadataObjectTypeCode93Code,
                                          AVMetadataObjectTypeCode128Code,
                                          AVMetadataObjectTypeInterleaved2of5Code,
                                          AVMetadataObjectTypeITF14Code
                                          ]];

    // Preview
    self.preview              = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.preview.position     = self.layerBackgroundView.center;
    self.preview.bounds       = self.layerBackgroundView.layer.bounds;
    [self.layerBackgroundView.layer insertSublayer:self.preview atIndex:0];

    // Start
    [self.session startRunning];
}

#pragma mark ======= Private Method
- (void)animation1 {
    if (upOrdown == NO) {
        num++;
        _line.frame = CGRectMake(LEFT, TOP + 10 + 2 * num, 220, 2);
        if (2 * num == 200) { upOrdown = YES; }
    } else {
        num--;
        _line.frame = CGRectMake(LEFT, TOP + 10 + 2 * num, 220, 2);
        if (num == 0) { upOrdown = NO; }
    }
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

- (void)goPhotoLibrary {
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType                = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate                  = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark ======= Event
- (void)openFlashLight {
    [self.session beginConfiguration];
    AVCaptureDevice * backCamera = [self backCamera];
    if (backCamera.torchMode == AVCaptureTorchModeOff) {
        [backCamera lockForConfiguration:nil];
        backCamera.torchMode = AVCaptureTorchModeOn;
        backCamera.flashMode = AVCaptureFlashModeOn;
        [backCamera unlockForConfiguration];
    }
    //提交会话配置
    [self.session commitConfiguration];
    [self.session startRunning];
}

- (void)closeFlashLight {
    [self.session beginConfiguration];
    AVCaptureDevice * backCamera = [self backCamera];
    if (backCamera.torchMode == AVCaptureTorchModeOn) {
        [backCamera lockForConfiguration:nil];
        backCamera.torchMode = AVCaptureTorchModeOff;
        backCamera.flashMode = AVCaptureTorchModeOff;
        [backCamera unlockForConfiguration];
    }
    //提交会话配置
    [self.session commitConfiguration];
    [self.session startRunning];
}

- (void)twoTapClick {
    if (self.blowup == YES) {
        [UIView animateWithDuration:0.5
                         animations:^{
                             self.preview.bounds =
                             CGRectMake(0, 0, self.layerBackgroundView.layer.bounds.size.width,
                                        self.layerBackgroundView.layer.bounds.size.width);
                         }];
        self.blowup = NO;
    }
}

#pragma mark ======= KVO
// 监听焦距发生改变
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"adjustingFocus"]) {
        BOOL adjustingFocus = [[change objectForKey:NSKeyValueChangeNewKey]
                               isEqualToNumber:[NSNumber numberWithInt:1]];

        NSLog(@"adjustingFocus~~%d  change~~%@", adjustingFocus, change);
        // 0代表焦距不发生改变 1代表焦距改变
        if (adjustingFocus == 1) {
            if (self.blowup == NO) {
                //                [UIView animateWithDuration:0.5 animations:^{
                //                    self.preview.bounds = CGRectMake(0, 0,
                //                    self.layerBackgroundView.layer.bounds.size.width*3,
                //                    self.layerBackgroundView.layer.bounds.size.width*3);
                //                }];
                //                self.blowup = YES;
            }
        }

    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark ======= WYANavBarDelegate
- (void)wya_goBackPressed:(UIButton *)sender {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)wya_rightBarButtonItemPressed:(UIButton *)sender {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) { [self goPhotoLibrary]; }
        }];
    } else if (status == PHAuthorizationStatusAuthorized) {
        [self goPhotoLibrary];
    } else if (status == PHAuthorizationStatusDenied) {
        [UIView wya_warningToastWithMessage:
         @"检"
         @"测到您没有开启相册权限，请前往设置开启"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
                           [[UIApplication sharedApplication]
                            openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                       });
    }
}

#pragma mark =======  AVCaptureVideoDataOutputSampleBufferDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
       fromConnection:(AVCaptureConnection *)connection {
    CFDictionaryRef metadataDict =
    CMCopyDictionaryOfAttachments(NULL, sampleBuffer, kCMAttachmentMode_ShouldPropagate);
    NSDictionary * metadata =
    [[NSMutableDictionary alloc] initWithDictionary:(__bridge NSDictionary *)metadataDict];
    CFRelease(metadataDict);
    NSDictionary * exifMetadata =
    [[metadata objectForKey:(NSString *)kCGImagePropertyExifDictionary] mutableCopy];
    float brightnessValue =
    [[exifMetadata objectForKey:(NSString *)kCGImagePropertyExifBrightnessValue] floatValue];

    NSLog(@"%f", brightnessValue);
    //光感范围在-5~12,-5就是没有光线，12是光源贴近摄像头
    if (self.lampButton.selected) { return; }
    if (brightnessValue < 3) {
        [UIView animateWithDuration:1
                         animations:^{
                             self.lampButton.alpha = 1;
                             self.lampLabel.alpha  = 0;
                         }
                         completion:^(BOOL finished) {
                             self.lampButton.hidden = NO;
                             self.lampLabel.hidden  = YES;
                         }];
    } else {
        [UIView animateWithDuration:1
                         animations:^{
                             self.lampButton.alpha = 0;
                             self.lampLabel.alpha  = 1;
                         }
                         completion:^(BOOL finished) {
                             self.lampButton.hidden = YES;
                             self.lampLabel.hidden  = NO;
                         }];
    }
}

#pragma mark =======  AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputMetadataObjects:(NSArray *)metadataObjects
       fromConnection:(AVCaptureConnection *)connection {
    NSString * stringValue;

    if ([metadataObjects count] > 0) {
        [self closeFlashLight];
        //停止扫描
        [self.session stopRunning];
        [self.timer setFireDate:[NSDate distantFuture]];

        AVMetadataMachineReadableCodeObject * metadataObject =
        [metadataObjects wya_safeObjectAtIndex:0];
        stringValue = metadataObject.stringValue;
        NSLog(@"扫描结果：%@", stringValue);

        NSArray * arry = metadataObject.corners;
        for (id temp in arry) { NSLog(@"%@", temp); }

        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        if (self.navigationController) {
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }

        if (self.scanReault) { self.scanReault(stringValue); }

    } else {
        NSLog(@"无扫描信息");
        return;
    }
}

#pragma mark =======  UIImagePickerControllerDelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.session) { [self.session startRunning]; }
    if (self.timer) { [self.timer setFireDate:[NSDate distantFuture]]; }
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> *)info {
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    // CIDetector(CIDetector可用于人脸识别)进行图片解析，从而使我们可以便捷的从相册中获取到二维码
    // 声明一个 CIDetector，并设定识别类型 CIDetectorTypeQRCode
    CIDetector * detector =
    [CIDetector detectorOfType:CIDetectorTypeQRCode
                       context:nil
                       options:@{CIDetectorAccuracy : CIDetectorAccuracyHigh}];

    // 取得识别结果
    NSArray * features = [detector featuresInImage:[CIImage imageWithCGImage:image.CGImage]];

    if (features.count == 0) {
        [self dismissViewControllerAnimated:YES
                                 completion:^{
                                     [self.navigationController popViewControllerAnimated:YES];
                                 }];

        UIAlertController * alert =
        [UIAlertController alertControllerWithTitle:@"无扫描结果"
                                            message:nil
                                     preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确认"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * _Nonnull action){

                                                }]];
        [self presentViewController:alert animated:YES completion:nil];
        return;

    } else {
        for (int index = 0; index < [features count]; index++) {
            CIQRCodeFeature * feature = [features wya_safeObjectAtIndex:index];
            NSString * resultStr      = feature.messageString;
            if (self.scanReault) { self.scanReault(resultStr); }
        }
        [self dismissViewControllerAnimated:YES
                                 completion:^{
                                     if (self.timer) {
                                         [self.timer invalidate];
                                         self.timer = nil;
                                     }
                                     [self.navigationController popViewControllerAnimated:NO];
                                 }];
    }
}

#pragma mark - Getter -
//返回后置摄像头
- (AVCaptureDevice *)backCamera {
    return [self cameraWithPosition:AVCaptureDevicePositionBack];
}

- (UIView *)layerBackgroundView {
    if (!_layerBackgroundView) {
        _layerBackgroundView = ({
            UIView * object = [[UIView alloc] initWithFrame:self.view.bounds];
            object;
        });
    }
    return _layerBackgroundView;
}

- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = ({
            UIView * object        = [[UIView alloc] initWithFrame:self.view.bounds];
            object.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.1];
            object;
        });
    }
    return _backgroundView;
}
- (WYANavBar *)navBar {
    if (!_navBar) {
        _navBar = ({
            WYANavBar * object =
            [[WYANavBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, WYATopHeight)];
            object.delegate = self;
            object.navTitle = @"二维码";
            [object
             wya_customGobackWithImage:[UIImage loadBundleImage:@"返回"
                                                      ClassName:NSStringFromClass(self.class)]];
            [object wya_addRightNavBarButtonWithNormalTitle:@[ @"相册" ]];
            object;
        });
    }
    return _navBar;
}

- (UIImageView *)qrCodeImageView {
    if (!_qrCodeImageView) {
        _qrCodeImageView = ({
            UIImageView * object = [[UIImageView alloc] initWithFrame:kScanRect];
            object.image =
            [UIImage loadBundleImage:@"pick_bg"
                           ClassName:NSStringFromClass([self class])];
            object.userInteractionEnabled = YES;

            UITapGestureRecognizer * tap =
            [[UITapGestureRecognizer alloc] initWithTarget:self
                                                    action:@selector(twoTapClick)];
            tap.numberOfTapsRequired = 2;
            [object addGestureRecognizer:tap];
            object;
        });
    }
    return _qrCodeImageView;
}

- (UIButton *)lampButton {
    if (!_lampButton) {
        _lampButton = ({
            UIButton * object = [[UIButton alloc]
                                 initWithFrame:CGRectMake((self.qrCodeImageView.cmam_width - 50 * SizeAdapter) / 2,
                                                          self.qrCodeImageView.cmam_height - 55 * SizeAdapter,
                                                          50 * SizeAdapter, 50 * SizeAdapter)];
            [object setTitle:@"轻触照亮" forState:UIControlStateNormal];
            [object setTitle:@"轻触关闭" forState:UIControlStateSelected];
            [object setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [object setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
            object.titleLabel.font = FONT(12);
            [object setImage:[UIImage loadBundleImage:@"icon_scan_flashlight"
                                            ClassName:NSStringFromClass(self.class)]
                    forState:UIControlStateNormal];
            [object setImage:[UIImage loadBundleImage:@"" ClassName:NSStringFromClass(self.class)]
                    forState:UIControlStateSelected];
            object.hidden = YES;
            object.alpha  = 0;
            [object wya_setButtonImageLocationTopWithSpace:3 * SizeAdapter];
            [object addCallBackAction:^(UIButton * button) {
                button.selected = !button.selected;
                if (button.selected) {
                    [self openFlashLight];
                } else {
                    [self closeFlashLight];
                }
            }];
            object;
        });
    }
    return _lampButton;
}

- (UILabel *)lampLabel {
    if (!_lampLabel) {
        _lampLabel = ({
            UILabel * object = [[UILabel alloc]
                                initWithFrame:CGRectMake(self.qrCodeImageView.cmam_left,
                                                         self.qrCodeImageView.cmam_bottom + 20 * SizeAdapter,
                                                         self.qrCodeImageView.cmam_width, 20 * SizeAdapter)];
            object.alpha         = 1;
            object.text          = @"将二维码/条码放入框内，即可自动扫描";
            object.textColor     = [UIColor whiteColor];
            object.font          = FONT(12);
            object.textAlignment = NSTextAlignmentCenter;
            object;
        });
    }
    return _lampLabel;
}
@end
