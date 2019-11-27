//
//  WYABrightnessView.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/7.
//

#import "WYABrightnessView.h"

@interface WYABrightnessView ()
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UIView * gridView;
@property (nonatomic, strong) NSMutableArray * tips;
@property (nonatomic, assign) BOOL orientationDidChange;
@end

@implementation WYABrightnessView
#pragma mark ======= LifeCircle
+ (instancetype)sharedBrightnessView
{
    static WYABrightnessView * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WYABrightnessView alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:instance];

    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame               = CGRectMake(ScreenWidth * 0.5, ScreenHeight * 0.5, 155, 155);
        self.layer.cornerRadius  = 10;
        self.layer.masksToBounds = YES;

        // 使用UIToolbar实现毛玻璃效果，简单粗暴，支持iOS7+
        UIToolbar * toolbar = [[UIToolbar alloc] initWithFrame:self.bounds];
        toolbar.alpha       = 0.97;
        [self addSubview:toolbar];

        [self setup];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.center = CGPointMake(Window.bounds.size.width * 0.5, Window.bounds.size.height * 0.5);

    CGFloat titleLabel_X      = 0;
    CGFloat titleLabel_Y      = 5;
    CGFloat titleLabel_Width  = self.cmam_width;
    CGFloat titleLabel_Height = 30;
    self.titleLabel.frame =
    CGRectMake(titleLabel_X, titleLabel_Y, titleLabel_Width, titleLabel_Height);

    self.imageView.center    = CGPointMake(155 * 0.5, 155 * 0.5);
    CGFloat imageView_Width  = 79;
    CGFloat imageView_Height = 76;
    self.imageView.bounds    = CGRectMake(0, 0, imageView_Width, imageView_Height);

    CGFloat gridView_X      = 13;
    CGFloat gridView_Y      = 132;
    CGFloat gridView_Width  = self.bounds.size.width - 26;
    CGFloat gridView_Height = 7;
    self.gridView.frame     = CGRectMake(gridView_X, gridView_Y, gridView_Width, gridView_Height);
}

#pragma mark - Private Method -
#pragma mark ======= UI
- (void)setup
{
    self.layer.cornerRadius  = 5.f;
    self.layer.masksToBounds = YES;

    [self addSubview:self.titleLabel];
    [self addSubview:self.imageView];
    [self addSubview:self.gridView];

    [self createTips];
    [self addNotification];
    [self addObserver];
}

- (void)createTips
{
    self.tips = [NSMutableArray arrayWithCapacity:16];

    CGFloat tipW = (132 - 17) / 16;
    CGFloat tipH = 5;
    CGFloat tipY = 1;

    for (int i = 0; i < 16; i++) {
        CGFloat tipX          = i * (tipW + 1) + 1;
        UIImageView * image   = [[UIImageView alloc] init];
        image.backgroundColor = [UIColor whiteColor];
        image.frame           = CGRectMake(tipX, tipY, tipW, tipH);
        [self.gridView addSubview:image];
        [self.tips addObject:image];
    }
    [self updateLongView:[UIScreen mainScreen].brightness];
}

- (void)updateLongView:(CGFloat)sound
{
    CGFloat stage   = 1 / 15.0;
    NSInteger level = sound / stage;

    for (int i = 0; i < self.tips.count; i++) {
        UIImageView * img = self.tips[i];

        if (i <= level) {
            img.hidden = NO;
        } else {
            img.hidden = YES;
        }
    }
}

- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateLayer:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

- (void)addObserver
{
    [[UIScreen mainScreen] addObserver:self
                            forKeyPath:@"brightness"
                               options:NSKeyValueObservingOptionNew
                               context:NULL];
}

- (void)appearSoundView
{
    if (self.alpha == 0.0) {
        self.orientationDidChange = NO;
        self.alpha                = 1.0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{ [self disAppearSoundView]; });
    }
}

- (void)disAppearSoundView
{
    if (self.alpha == 1.0) {
        [UIView animateWithDuration:0.8 animations:^{ self.alpha = 0.0; }];
    }
}

#pragma mark ======= KVO
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    CGFloat sound      = [change[@"new"] floatValue];
    Window.windowLevel = UIWindowLevelAlert + 1000;
    [self appearSoundView];
    [self updateLongView:sound];
}

#pragma mark ======= Notifation
- (void)updateLayer:(NSNotification *)notify
{
    [Window bringSubviewToFront:self];

    self.orientationDidChange = YES;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark - Getter -
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel * object     = [[UILabel alloc] init];
            object.text          = @"亮度";
            object.textColor     = [UIColor blackColor];
            object.font          = FONT(15);
            object.textAlignment = NSTextAlignmentCenter;
            object;
        });
    }
    return _titleLabel;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = ({
            UIImageView * object = [[UIImageView alloc] init];
            object.image         = [UIImage loadBundleImage:@"icon_video_brightness"
                                          ClassName:NSStringFromClass(self.class)];
            object;
        });
    }
    return _imageView;
}

- (UIView *)gridView
{
    if (!_gridView) {
        _gridView = ({
            UIView * object = [[UIView alloc] init];
            object.backgroundColor =
            [UIColor colorWithRed:0.25f
                            green:0.22f
                             blue:0.21f
                            alpha:1.00f];
            object;
        });
    }
    return _gridView;
}
@end
