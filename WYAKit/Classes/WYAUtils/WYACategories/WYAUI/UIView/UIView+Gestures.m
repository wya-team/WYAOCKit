//
//  UIView+Gestures.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/11.
//

#import "UIView+Gestures.h"
#import <objc/runtime.h>

@implementation UIView (Gestures)

- (void)wya_AddTapGesturesWithTapStyle:(WYATapGesturesStyle)tapStyle
                             TapHandle:(void (^)(UITapGestureRecognizer * gesture))handle {
    UITapGestureRecognizer * tap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(tapAction:)];
    //设置点按次数
    switch (tapStyle) {
        case WYATapGesturesStyleSingle:
            tap.numberOfTapsRequired = 1;
            objc_setAssociatedObject(self, @"tapOne", tap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            objc_setAssociatedObject(self, @"tapOneHandle", handle,
                                     OBJC_ASSOCIATION_COPY_NONATOMIC);
            break;
        case WYATapGesturesStyleDouble:
            tap.numberOfTapsRequired = 2;
            objc_setAssociatedObject(self, @"tapTwo", tap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            objc_setAssociatedObject(self, @"tapTwoHandle", handle,
                                     OBJC_ASSOCIATION_COPY_NONATOMIC);
            break;
        default:
            break;
    }
    //设置多少个手指点击
    tap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tap];

    UITapGestureRecognizer * oneTap = objc_getAssociatedObject(self, @"tapOne");
    UITapGestureRecognizer * twoTap = objc_getAssociatedObject(self, @"tapTwo");
    if (oneTap && twoTap) { [oneTap requireGestureRecognizerToFail:twoTap]; }
}

- (void)tapAction:(UITapGestureRecognizer *)gesture {
    void (^handleOne)(UITapGestureRecognizer * gesture) =
        objc_getAssociatedObject(self, @"tapOneHandle");
    void (^handleTwo)(UITapGestureRecognizer * gesture) =
        objc_getAssociatedObject(self, @"tapTwoHandle");
    UITapGestureRecognizer * oneTap = objc_getAssociatedObject(self, @"tapOne");
    UITapGestureRecognizer * twoTap = objc_getAssociatedObject(self, @"tapTwo");
    if (gesture == oneTap && handleOne) {
        handleOne(gesture);
        return;
    }
    if (gesture == twoTap && handleTwo) {
        handleTwo(gesture);
        return;
    }
}

- (void)wya_AddLongPressGestureWithDuration:(NSTimeInterval)duration
                                     Handle:
                                         (void (^)(UILongPressGestureRecognizer * gesture))handle {
    UILongPressGestureRecognizer * longPress =
        [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                      action:@selector(longPreAction:)];
    longPress.minimumPressDuration = duration;
    [self addGestureRecognizer:longPress];
    objc_setAssociatedObject(self, @"longPressHandle", handle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)longPreAction:(UILongPressGestureRecognizer *)gesture {
    void (^handle)(UILongPressGestureRecognizer * gesture) =
        objc_getAssociatedObject(self, @"longPressHandle");
    handle(gesture);
}

- (void)wya_AddPanGestureWithHandle:(void (^)(UIPanGestureRecognizer * gesture))handle {
    UIPanGestureRecognizer * pan =
        [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(panAction:)];
    [self addGestureRecognizer:pan];
    objc_setAssociatedObject(self, @"panHandle", handle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)panAction:(UIPanGestureRecognizer *)gesture {
    void (^handle)(UIPanGestureRecognizer * gesture) = objc_getAssociatedObject(self, @"panHandle");
    handle(gesture);
}

- (void)wya_AddSwipeGestureWithSwipeDirection:(UISwipeGestureRecognizerDirection)direction
                                  SwipeHandle:(void (^)(UISwipeGestureRecognizer * gesture))handle {
    UISwipeGestureRecognizer * swipe =
        [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(swipeAction:)];
    switch (direction) {
        case UISwipeGestureRecognizerDirectionUp:
            objc_setAssociatedObject(self, @"swipeUp", swipe, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            objc_setAssociatedObject(self, @"swipeUpHandle", handle,
                                     OBJC_ASSOCIATION_COPY_NONATOMIC);
            break;
        case UISwipeGestureRecognizerDirectionDown:
            objc_setAssociatedObject(self, @"swipeDown", swipe, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            objc_setAssociatedObject(self, @"swipeDownHandle", handle,
                                     OBJC_ASSOCIATION_COPY_NONATOMIC);
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            objc_setAssociatedObject(self, @"swipeLeft", swipe, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            objc_setAssociatedObject(self, @"swipeLeftHandle", handle,
                                     OBJC_ASSOCIATION_COPY_NONATOMIC);
            break;
        case UISwipeGestureRecognizerDirectionRight:
            objc_setAssociatedObject(self, @"swipeRight", swipe, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            objc_setAssociatedObject(self, @"swipeRightHandle", handle,
                                     OBJC_ASSOCIATION_COPY_NONATOMIC);
            break;
        default:
            break;
    }
    [self addGestureRecognizer:swipe];
}

- (void)swipeAction:(UISwipeGestureRecognizer *)gesture {
    void (^swipeUpHandle)(UISwipeGestureRecognizer * gesture) =
        objc_getAssociatedObject(self, @"swipeUpHandle");
    void (^swipeDownHandle)(UISwipeGestureRecognizer * gesture) =
        objc_getAssociatedObject(self, @"swipeDownHandle");
    void (^swipeLeftHandle)(UISwipeGestureRecognizer * gesture) =
        objc_getAssociatedObject(self, @"swipeLeftHandle");
    void (^swipeRightHandle)(UISwipeGestureRecognizer * gesture) =
        objc_getAssociatedObject(self, @"swipeRightHandle");
    UISwipeGestureRecognizer * swipeUp    = objc_getAssociatedObject(self, @"swipeUp");
    UISwipeGestureRecognizer * swipeDown  = objc_getAssociatedObject(self, @"swipeDown");
    UISwipeGestureRecognizer * swipeLeft  = objc_getAssociatedObject(self, @"swipeLeft");
    UISwipeGestureRecognizer * swipeRight = objc_getAssociatedObject(self, @"swipeRight");
    if (gesture == swipeUp && swipeUpHandle) {
        swipeUpHandle(gesture);
    } else if (gesture == swipeDown && swipeDownHandle) {
        swipeDownHandle(gesture);
    } else if (gesture == swipeLeft && swipeLeftHandle) {
        swipeLeftHandle(gesture);
    } else if (gesture == swipeRight && swipeRightHandle) {
        swipeRightHandle(gesture);
    }
}

- (void)wya_AddRotationGestureWithHandle:(void (^)(UIRotationGestureRecognizer * gesture))handle {
    UIRotationGestureRecognizer * rotation =
        [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                     action:@selector(rotationAction:)];
    [self addGestureRecognizer:rotation];
    objc_setAssociatedObject(self, @"rotationHandle", handle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)rotationAction:(UIRotationGestureRecognizer *)gesture {
    void (^handle)(UIRotationGestureRecognizer * gesture) =
        objc_getAssociatedObject(self, @"rotationHandle");
    handle(gesture);
}

- (void)wya_AddPinchGestureWithHandle:(void (^)(UIPinchGestureRecognizer * gesture))handle {
    UIPinchGestureRecognizer * pinch =
        [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(pinchAction:)];
    [self addGestureRecognizer:pinch];
    objc_setAssociatedObject(self, @"pinchHandle", handle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)pinchAction:(UIPinchGestureRecognizer *)gesture {
    void (^handle)(UIPinchGestureRecognizer * gesture) =
        objc_getAssociatedObject(self, @"pinchHandle");
    handle(gesture);
}
@end
