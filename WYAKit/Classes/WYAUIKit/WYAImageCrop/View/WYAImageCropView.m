//
//  WYAImageCropView.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/3.
//

#import "WYAImageCropView.h"
#import "WYAImageCropScrollView.h"
#import "WYAImageCropPhotoFramesView.h"

@interface WYAImageCropView ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) WYAImageCropScrollView * scrollView;
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, strong) UIImageView * backgroundImageView;
@property (nonatomic, strong) UIView * backgroundContainerView;

@property (nonatomic, strong) id translucencyEffect;
@property (nonatomic, strong) UIView *translucencyView;
@property (nonatomic, strong) UIView *overlayView;
@property (nonatomic, strong, readwrite) UIView *foregroundContainerView;
@property (nonatomic, strong) UIImageView *foregroundImageView;

@property (nonatomic, strong) WYAImageCropPhotoFramesView * photoFramesView;

@property (nonatomic, strong) UIPanGestureRecognizer *gridPanGestureRecognizer;
@end

@implementation WYAImageCropView

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.image = image;
        [self createUI];
    }
    return self;
}

#pragma mark --- Private Method
- (void)createUI{
    
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.backgroundColor = [UIColor colorWithWhite:0.12 alpha:1];
    
    self.scrollView = [[WYAImageCropScrollView alloc] initWithFrame:self.bounds];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.alwaysBounceHorizontal = YES;
    self.scrollView.alwaysBounceVertical = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
//    self.scrollView.touchesBegan = ^{ [weakSelf startEditing]; };
//    self.scrollView.touchesEnded = ^{ [weakSelf startResetTimer]; };
    
    self.backgroundImageView = [[UIImageView alloc] initWithImage:self.image];
    self.backgroundImageView.layer.minificationFilter = kCAFilterTrilinear;
    
    self.backgroundContainerView = [[UIView alloc] initWithFrame:self.backgroundImageView.frame];
    [self.backgroundContainerView addSubview:self.backgroundImageView];
    [self.scrollView addSubview:self.backgroundContainerView];
    
    if (NSClassFromString(@"UIVisualEffectView")) {
        self.translucencyEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        self.translucencyView = [[UIVisualEffectView alloc] initWithEffect:self.translucencyEffect];
        self.translucencyView.frame = self.bounds;
    }
    else {
        UIToolbar *toolbar = [[UIToolbar alloc] init];
        toolbar.barStyle = UIBarStyleBlack;
        self.translucencyView = toolbar;
        self.translucencyView.frame = CGRectInset(self.bounds, -1.0f, -1.0f);
    }
    self.translucencyView.hidden = NO;
    self.translucencyView.userInteractionEnabled = NO;
    self.translucencyView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:self.translucencyView];
    
    // The forground container that holds the foreground image view
    self.foregroundContainerView = [[UIView alloc] initWithFrame:(CGRect){0,0,200,200}];
    self.foregroundContainerView.clipsToBounds = YES;
    self.foregroundContainerView.userInteractionEnabled = NO;
    [self addSubview:self.foregroundContainerView];
    
    self.foregroundImageView = [[UIImageView alloc] initWithImage:self.image];
    self.foregroundImageView.layer.minificationFilter = kCAFilterTrilinear;
    [self.foregroundContainerView addSubview:self.foregroundImageView];
    
    // Disable colour inversion for the image views
    if (@available(iOS 11.0, *)) {
        self.foregroundImageView.accessibilityIgnoresInvertColors = YES;
        self.backgroundImageView.accessibilityIgnoresInvertColors = YES;
    }
    
    self.photoFramesView = [[WYAImageCropPhotoFramesView alloc]initWithFrame:self.foregroundContainerView.bounds];
    self.photoFramesView.userInteractionEnabled = NO;
    self.photoFramesView.gridHidden = YES;
    [self addSubview:self.photoFramesView];
    
    self.gridPanGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gridPanGestureRecognized:)];
    self.gridPanGestureRecognizer.delegate = self;
    [self.scrollView.panGestureRecognizer requireGestureRecognizerToFail:self.gridPanGestureRecognizer];
    [self addGestureRecognizer:self.gridPanGestureRecognizer];
}

#pragma mark --- Private Method

#pragma mark - Gesture Recognizer -
- (void)gridPanGestureRecognized:(UIPanGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:self];
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
//        [self startEditing];
//        self.panOriginPoint = point;
//        self.cropOriginFrame = self.cropBoxFrame;
//        self.tappedEdge = [self cropEdgeForPoint:self.panOriginPoint];
    }
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
//        [self startResetTimer];
    }
    
   
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
