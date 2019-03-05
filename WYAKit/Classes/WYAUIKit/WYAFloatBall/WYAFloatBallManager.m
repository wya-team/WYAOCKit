//
//  WYAFloatBallManager.m
//  AFNetworking
//
//  Created by 李俊恒 on 2019/2/28.
//

#import "WYAFloatBallManager.h"
#import "NSObject+WYAFloatBall.h"
#import "WYAFloatAreaView.h"
#import "WYATransitionPop.h"
#import "WYATransitionPush.h"
#import <objc/runtime.h>

#define KFloatAreaR ScreenWidth * 0.45
#define KFloatMargin 30
#define KCoef 1.2
#define KBallSizeR 70

@interface WYAFloatBallManager () <WYAFloatBallDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) WYAFloatAreaView * floatArea;
@property (nonatomic, strong) WYAFloatAreaView * cancelFloatArea;
@property (nonatomic, strong) UIViewController * tempFloatViewController;

@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer * edgePan;
@property (nonatomic, strong) CADisplayLink * link;
@property (nonatomic, assign) BOOL showFloatBall;
@property (nonatomic, strong) NSMutableArray<NSString *> * floatVcClass;

@end

@implementation WYAFloatBallManager
#pragma mark ======= Public Method
+ (instancetype)shared {
    return [[self alloc] init];
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static WYAFloatBallManager * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance                                                                                     = [super allocWithZone:zone];
        instance.floatVcClass                                                                        = [NSMutableArray array];
        [instance wya_floatBallCurrentNavigationController].interactivePopGestureRecognizer.delegate = instance;
        [instance wya_floatBallCurrentNavigationController].delegate                                 = instance;
    });
    return instance;
}

+ (void)wya_addFloatVcS:(NSArray<NSString *> *)vcClass {
    [vcClass enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![[WYAFloatBallManager shared].floatVcClass containsObject:obj]) {
            [[WYAFloatBallManager shared].floatVcClass wya_safeAddObject:obj];
        }
    }];
}

// 展示悬浮窗
- (void)wya_showBallBtnWith:(UIViewController *)fromVC {
    self.floatViewController = fromVC;
    if ([self haveIconImage]) {
        self.floatBall.iconImageView.image = [self getFloatBallIconImage];
    }
    self.floatBall.alpha = 1;
    [Window addSubview:self.floatBall];
}

// 移除悬浮窗
- (void)wya_removeBallBtn {
    self.tempFloatViewController = nil;
    self.floatViewController     = nil;
    [self.floatBall removeFromSuperview];
    self.floatBall = nil;
}

#pragma mark ======= UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self wya_floatBallCurrentNavigationController].viewControllers.count > 1) {
        [[WYAFloatBallManager shared] beginScreenEdgePanBack:gestureRecognizer];
        return YES;
    }
    return NO;
}
#pragma mark ======= Action
- (void)beginScreenEdgePanBack:(UIGestureRecognizer *)gestureRecognizer {
    if ([self.floatVcClass containsObject:NSStringFromClass([[self wya_floatBallCurrentViewController] class])]) {
        self.edgePan = (UIScreenEdgePanGestureRecognizer *)gestureRecognizer;
        [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        [Window addSubview:self.floatArea];
        self.tempFloatViewController = [self wya_floatBallCurrentViewController];
    }
}

- (void)panBack:(CADisplayLink *)link {
    if (self.floatViewController && self.tempFloatViewController == self.floatViewController) {
        [UIView animateWithDuration:0.5
            animations:^{
                self.floatArea.frame = CGRectMake(ScreenWidth, ScreenHeight, KFloatAreaR, KFloatAreaR);
            }
            completion:^(BOOL finished) {
                [self.floatArea removeFromSuperview];
                self.floatArea = nil;
                [self.link invalidate];
                self.link = nil;
                if (self.showFloatBall) {
                    self.floatViewController = self.tempFloatViewController;
                    if ([self haveIconImage]) {
                        self.floatBall.iconImageView.image = [self getFloatBallIconImage];
                    }
                    self.floatBall.alpha = 1;
                    [Window addSubview:self.floatBall];
                }
            }];
    } else {
        if (self.edgePan.state == UIGestureRecognizerStateChanged) {
            CGPoint tPoint       = [self.edgePan translationInView:Window];
            CGFloat x            = MAX(ScreenWidth + KFloatMargin - KCoef * tPoint.x, ScreenWidth - KFloatAreaR);
            CGFloat y            = MAX(ScreenHeight + KFloatMargin - KCoef * tPoint.x, ScreenHeight - KFloatAreaR);
            CGRect rect          = CGRectMake(x, y, KFloatAreaR, KFloatAreaR);
            self.floatArea.frame = rect;

            CGPoint touchPoint = [Window convertPoint:[self.edgePan locationInView:Window] toView:self.floatArea];

            if (touchPoint.x > 0 && touchPoint.y > 0) {
                if (!self.showFloatBall) {
                    if (pow((KFloatAreaR - touchPoint.x), 2) + pow((KFloatAreaR - touchPoint.y), 2) <= pow((KFloatAreaR), 2)) {
                        self.showFloatBall = YES;
                    } else {
                        if (self.showFloatBall) {
                            self.showFloatBall = NO;
                        }
                    }
                }
            } else {
                if (self.showFloatBall) {
                    self.showFloatBall = NO;
                }
            }
        } else if (self.edgePan.state == UIGestureRecognizerStatePossible) {
            [UIView animateWithDuration:0.5
                animations:^{
                    self.floatArea.frame = CGRectMake(ScreenWidth, ScreenHeight, KFloatAreaR, KFloatAreaR);
                }
                completion:^(BOOL finished) {
                    [self.floatArea removeFromSuperview];
                    self.floatArea = nil;
                    [self.link invalidate];
                    self.link = nil;
                    if (self.showFloatBall) {
                        self.floatViewController = self.tempFloatViewController;
                        if ([self haveIconImage]) {
                            self.floatBall.iconImageView.image = [self getFloatBallIconImage];
                        }
                        self.floatBall.alpha = 1;
                        [Window addSubview:self.floatBall];
                    }
                }];
        }
    }
}

- (UIImage *)getFloatBallIconImage {
    UIImage * tempIconImage    = [self.floatViewController valueForKey:@"hk_iconImage"];
    UIImage * defaultIconImage = [UIImage loadBundleImage:@"float_Ball_default"
                                                ClassName:NSStringFromClass([self class])];
    return tempIconImage == nil ? defaultIconImage : tempIconImage;
}

#pragma mark ======= WYAFloatBallDelegate

- (void)floatBallDidClick:(WYAFloatBall *)floatBall {
    [[self wya_floatBallCurrentNavigationController] pushViewController:self.floatViewController animated:YES];
}

- (void)floatBallBeginMove:(WYAFloatBall *)floatBall {
    if (!_cancelFloatArea) {
        [Window insertSubview:self.cancelFloatArea atIndex:1];
        [UIView animateWithDuration:0.5
                         animations:^{
                             self.cancelFloatArea.frame = CGRectMake(ScreenWidth - KFloatAreaR, ScreenHeight - KFloatAreaR, KFloatAreaR, KFloatAreaR);
                         }];
    }
    CGPoint center_ball = [Window convertPoint:self.floatBall.center toView:self.cancelFloatArea];
    if (pow((KFloatAreaR - center_ball.x), 2) + pow((KFloatAreaR - center_ball.y), 2) <= pow((KFloatAreaR), 2)) {
        if (!self.cancelFloatArea.highlight) {
            self.cancelFloatArea.highlight = YES;
        }
    } else {
        if (self.cancelFloatArea.highlight) {
            self.cancelFloatArea.highlight = NO;
        }
    }
}

- (void)floatBallEndMove:(WYAFloatBall *)floatBall {

    if (self.cancelFloatArea.highlight) {
        self.tempFloatViewController = nil;
        self.floatViewController     = nil;
        [self.floatBall removeFromSuperview];
        self.floatBall = nil;
    }

    [UIView animateWithDuration:0.5
        animations:^{
            self.cancelFloatArea.frame = CGRectMake(ScreenWidth, ScreenHeight, KFloatAreaR, KFloatAreaR);
        }
        completion:^(BOOL finished) {
            [self.cancelFloatArea removeFromSuperview];
            self.cancelFloatArea = nil;
        }];
}

#pragma UINavigationControllerDelegate

- (nullable id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                           animationControllerForOperation:(UINavigationControllerOperation)operation
                                                        fromViewController:(UIViewController *)fromVC
                                                          toViewController:(UIViewController *)toVC {

    UIViewController * vc = self.floatViewController;
    if (vc) {
        if (operation == UINavigationControllerOperationPush) {
            if (toVC != vc) {
                return nil;
            }
            WYATransitionPush * transition = [[WYATransitionPush alloc] init];
            return transition;
        } else if (operation == UINavigationControllerOperationPop) {
            if (fromVC != vc) {
                [self wya_showBallBtnWith:fromVC];
                return nil;
            }
            WYATransitionPop * transition = [[WYATransitionPop alloc] init];
            return transition;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}
#pragma mark ======= Private Method
- (BOOL)haveIconImage {
    BOOL have             = NO;
    unsigned int outCount = 0;
    Ivar * ivars          = class_copyIvarList([self.floatViewController class], &outCount);
    for (unsigned int i = 0; i < outCount; i++) {
        Ivar ivar             = ivars[i];
        const char * nameChar = ivar_getName(ivar);
        NSString * nameStr    = [NSString stringWithFormat:@"%s", nameChar];
        if ([nameStr isEqualToString:@"_hk_iconImage"]) {
            have = YES;
        }
    }
    free(ivars);
    return have;
}
#pragma mark - Setter

- (void)setShowFloatBall:(BOOL)showFloatBall {
    _showFloatBall           = showFloatBall;
    self.floatArea.highlight = showFloatBall;
}

#pragma mark - Lazy

- (CADisplayLink *)link {
    if (!_link) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(panBack:)];
    }
    return _link;
}

- (WYAFloatAreaView *)floatArea {
    if (!_floatArea) {
        _floatArea       = [[WYAFloatAreaView alloc] initWithFrame:CGRectMake(ScreenWidth + KFloatMargin, ScreenHeight + KFloatMargin, KFloatAreaR, KFloatAreaR)];
        _floatArea.style = WYAFloatAreaViewStyle_default;
    };
    return _floatArea;
}

- (WYAFloatAreaView *)cancelFloatArea {
    if (!_cancelFloatArea) {
        _cancelFloatArea = [[WYAFloatAreaView alloc] initWithFrame:CGRectMake(ScreenWidth, ScreenHeight, KFloatAreaR, KFloatAreaR)];
        ;
        _cancelFloatArea.style = WYAFloatAreaViewStyle_cancel;
    };
    return _cancelFloatArea;
}

- (WYAFloatBall *)floatBall {
    if (!_floatBall) {
        _floatBall          = [[WYAFloatBall alloc] initWithFrame:CGRectMake(ScreenWidth - KBallSizeR - 15, ScreenHeight / 3, KBallSizeR, KBallSizeR)];
        _floatBall.delegate = self;
    };
    return _floatBall;
}

- (id)copyWithZone:(NSZone *)zone {
    return [WYAFloatBallManager shared];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [WYAFloatBallManager shared];
}
@end
