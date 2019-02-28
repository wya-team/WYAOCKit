//
//  WYAFloatBall.m
//  AFNetworking
//
//  Created by 李俊恒 on 2019/2/28.
//

#import "WYAFloatBall.h"
#define margin 10

@implementation WYAFloatBall
#pragma mark ======= LifeCircle
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.iconImageView];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

#pragma mark ======= Lazy
// 考虑是否加入默认图片的设置？
- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
//        _iconImageView.backgroundColor = wya_rgb(102, 103, 103);
        _iconImageView.layer.borderWidth = 8;
        _iconImageView.layer.borderColor = wya_rgb(102, 103, 103).CGColor;
        _iconImageView.layer.cornerRadius = self.bounds.size.width / 2;
        _iconImageView.layer.masksToBounds = YES;
    };
    return _iconImageView;
}
#pragma mark ======= Event
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.center = [touches.anyObject locationInView:[UIApplication sharedApplication].keyWindow];
    if (self.delegate && [self.delegate respondsToSelector:@selector(floatBallBeginMove:)]) {
        [self.delegate floatBallBeginMove:self];
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endTouch:[touches.anyObject locationInView:[UIApplication sharedApplication].keyWindow]];
    if (self.delegate && [self.delegate respondsToSelector:@selector(floatBallEndMove:)]) {
        [self.delegate floatBallEndMove:self];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endTouch:[touches.anyObject locationInView:[UIApplication sharedApplication].keyWindow]];
    if (self.delegate && [self.delegate respondsToSelector:@selector(floatBallEndMove:)]) {
        [self.delegate floatBallEndMove:self];
    }
}
- (void)tap:(UIGestureRecognizer *)tap{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(floatBallDidClick:)]) {
        [self.delegate floatBallDidClick:self];
    }
}

- (void)endTouch:(CGPoint)point{
    CGRect frame = self.frame;
    if (point.x > ScreenWidth/2) {
        frame.origin.x = ScreenWidth - frame.size.width - margin;
    }else{
        frame.origin.x = margin;
    }
    if (frame.origin.y > ScreenHeight - 64) {
        frame.origin.y = ScreenHeight - 64;
    } else if (frame.origin.y < 20) {
        frame.origin.y = 20;
    }

    [UIView animateWithDuration:0.3 animations:^{
        self.frame = frame;
    }];
}
@end
