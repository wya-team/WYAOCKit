//
//  WYAInteractiveTransition.m
//  ViewControllerTransition
//
//

#import "WYAInteractiveTransition.h"

@interface WYAInteractiveTransition () <UIGestureRecognizerDelegate>

@property (nonatomic, weak) UIViewController * weakVC;
@property (nonatomic, assign) WYADrawerTransitiontype type;
@property (nonatomic, assign) BOOL openEdgeGesture;
@property (nonatomic, assign) WYADrawerTransitionDirection direction;
@property (nonatomic, strong) CADisplayLink * link;
@property (nonatomic, copy) void (^transitionDirectionAutoBlock)
    (WYADrawerTransitionDirection direction);

@end

@implementation WYAInteractiveTransition {
    CGFloat _percent;
    CGFloat _remaincount;
    BOOL _toFinish;
    CGFloat _oncePercent;
}

- (CADisplayLink *)link {
    if (!_link) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(wya_update)];
        [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return _link;
}

- (instancetype)initWithTransitiontype:(WYADrawerTransitiontype)type {
    if (self = [super init]) {
        _type = type;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(wya_singleTap)
                                                     name:WYALateralSlideTapNoticationKey
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(wya_handleHiddenPan:)
                                                     name:WYALateralSlidePanNoticationKey
                                                   object:nil];
    }
    return self;
}

+ (instancetype)interactiveWithTransitiontype:(WYADrawerTransitiontype)type {
    return [[self alloc] initWithTransitiontype:type];
}

- (void)addPanGestureForViewController:(UIViewController *)viewController {
    self.weakVC = viewController;
    UIPanGestureRecognizer * pan =
        [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(wya_handleShowPan:)];
    pan.delegate = self;
    [viewController.view addGestureRecognizer:pan];
}

- (UIViewController *)viewController:(UIView *)view {
    for (UIView * next = view; next; next = next.superview) {
        UIResponder * nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma mark -GestureRecognizer
- (void)wya_singleTap {
    if (_type == WYADrawerTransitiontypeShow) return;
    [self.weakVC dismissViewControllerAnimated:YES completion:nil];
}

- (void)wya_handleHiddenPan:(NSNotification *)note {
    if (_type == WYADrawerTransitiontypeShow) return;
    UIPanGestureRecognizer * pan = note.object;
    [self handleGesture:pan];
}

- (void)wya_handleShowPan:(UIPanGestureRecognizer *)pan {
    if (_type == WYADrawerTransitiontypeHidden) return;
    [self handleGesture:pan];
}

- (void)hiddenBeganTranslationX:(CGFloat)x {
    if ((x > 0 && _direction == WYADrawerTransitionFromLeft) ||
        (x < 0 && _direction == WYADrawerTransitionFromRight))
        return;
    self.interacting = YES;
    [self.weakVC dismissViewControllerAnimated:YES completion:nil];
}

- (void)showBeganTranslationX:(CGFloat)x gesture:(UIPanGestureRecognizer *)pan {
    //    NSLog(@"---->%f", x);
    if (x >= 0)
        _direction = WYADrawerTransitionFromLeft;
    else
        _direction = WYADrawerTransitionFromRight;

    if ((x < 0 && _direction == WYADrawerTransitionFromLeft) ||
        (x > 0 && _direction == WYADrawerTransitionFromRight))
        return;

    CGFloat locX = [pan locationInView:_weakVC.view].x;
    //    NSLog(@"locX: %f",locX);
    if (_openEdgeGesture && ((locX > 50 && _direction == WYADrawerTransitionFromLeft) ||
                             (locX < CGRectGetWidth(_weakVC.view.frame) - 50 &&
                              _direction == WYADrawerTransitionFromRight)))
        return;

    self.interacting = YES;
    if (_transitionDirectionAutoBlock) { _transitionDirectionAutoBlock(_direction); }
}

- (void)handleGesture:(UIPanGestureRecognizer *)pan {
    CGFloat x = [pan translationInView:pan.view].x;

    _percent = 0;
    _percent = x / pan.view.frame.size.width;

    if ((_direction == WYADrawerTransitionFromRight && _type == WYADrawerTransitiontypeShow) ||
        (_direction == WYADrawerTransitionFromLeft && _type == WYADrawerTransitiontypeHidden)) {
        _percent = -_percent;
    }

    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged: {
            if (!self.interacting) { // 保证present只调用一次
                if (_type == WYADrawerTransitiontypeShow) {
                    // 必须最少有20个位移才进行抽屉显示
                    if (fabs(x) > 20) [self showBeganTranslationX:x gesture:pan];
                } else {
                    [self hiddenBeganTranslationX:x];
                }
            } else {
                _percent = fminf(fmaxf(_percent, 0.003), 0.97);
                [self updateInteractiveTransition:_percent];
            }
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            self.interacting = NO;
            if (_percent > self.configuration.finishPercent) {
                [self startDisplayerLink:_percent toFinish:YES];
            } else {
                [self startDisplayerLink:_percent toFinish:NO];
            }
            break;
        }
        default:
            break;
    }
}

- (void)startDisplayerLink:(CGFloat)percent toFinish:(BOOL)finish {
    if (finish && percent >= 1) {
        [self finishInteractiveTransition];
        return;
    } else if (!finish && percent <= 0) {
        [self cancelInteractiveTransition];
        return;
    }
    _toFinish              = finish;
    CGFloat remainDuration = finish ? self.duration * (1 - percent) : self.duration * percent;
    _remaincount           = 60 * remainDuration;
    _oncePercent           = finish ? (1 - percent) / _remaincount : percent / _remaincount;
    [self starDisplayLink];
}

#pragma mark - displayerLink
- (void)starDisplayLink {
    [self link];
}

- (void)stopDisplayerLink {
    [self.link invalidate];
    self.link = nil;
}

- (void)wya_update {
    if (_percent >= 0.97 && _toFinish) {
        [self stopDisplayerLink];
        [self finishInteractiveTransition];
    } else if (_percent <= 0.03 && !_toFinish) {
        [self stopDisplayerLink];
        [self cancelInteractiveTransition];
    } else {
        if (_toFinish) {
            _percent += _oncePercent;
        } else {
            _percent -= _oncePercent;
        }
        CGFloat percent = fminf(fmaxf(_percent, 0.03), 0.97);
        [self updateInteractiveTransition:percent];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
    shouldRecognizeSimultaneouslyWithGestureRecognizer:
        (UIGestureRecognizer *)otherGestureRecognizer {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    SEL selector =
        @selector(wya_gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:);
    if ([self.weakVC respondsToSelector:selector]) {
        IMP imp = [self.weakVC methodForSelector:selector];
        BOOL(*func) (id, SEL, UIGestureRecognizer *, UIGestureRecognizer *) = (void *)imp;
        BOOL result = func(self.weakVC, selector, gestureRecognizer, otherGestureRecognizer);
        return result;
    }
#pragma clang diagnostic pop
    // 没有实现对应方法直接走以下默认逻辑
    if ([[self viewController:otherGestureRecognizer.view]
            isKindOfClass:[UITableViewController class]]) {
        return YES;
    }
    return NO;
}

@end
