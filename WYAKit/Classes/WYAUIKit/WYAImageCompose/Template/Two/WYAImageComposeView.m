//
//  WYAImageComposeView.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/12.
//

#import "WYAImageComposeView.h"

@implementation WYAImageComposeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;

        UIRotationGestureRecognizer * rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
        [self addGestureRecognizer:rotation];

        UIPinchGestureRecognizer * pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
        [self addGestureRecognizer:pinch];
    }
    return self;
}

#pragma mark - Setter
- (void)setNeedPan:(BOOL)needPan
{
    if (needPan) {
        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panClick:)];
        [self addGestureRecognizer:pan];
    }
}
- (void)panClick:(UIPanGestureRecognizer *)gesture
{
    UIView * piece = [gesture view];
    [piece.superview bringSubviewToFront:piece];

    if ([gesture state] == UIGestureRecognizerStateBegan || [gesture state] == UIGestureRecognizerStateChanged) {
        if (self.panClick) {
            CGPoint point = [gesture locationInView:piece];
            NSLog(@"point==%@", NSStringFromCGPoint(point));
            self.panClick(point, piece);
        }
        CGPoint translation = [gesture translationInView:[piece superview]];
        NSLog(@"translation==%@", NSStringFromCGPoint(translation));
        piece.center = CGPointMake(piece.center.x + translation.x, piece.center.y + translation.y);

        [gesture setTranslation:CGPointZero inView:[piece superview]];
    }
}

- (void)rotationAction:(UIRotationGestureRecognizer *)gesture
{
    self.transform   = CGAffineTransformRotate(self.transform, gesture.rotation);
    gesture.rotation = 0;
}

- (void)pinchAction:(UIPinchGestureRecognizer *)gesture
{
    self.transform = CGAffineTransformScale(self.transform, gesture.scale, gesture.scale);
    gesture.scale  = 1.0f;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
