//
//  UITableView+CellAnimation.m
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UITableView+CellAnimation.h"

@implementation UITableView (CellAnimation)
- (void)wya_moveAnimation
{
    NSArray * cells = self.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        CGFloat totalTime      = 0.4;
        UITableViewCell * cell = [self.visibleCells objectAtIndex:i];
        cell.transform         = CGAffineTransformMakeTranslation(-ScreenWidth, 0);
        [UIView animateWithDuration:0.4
        delay:i * (totalTime / cells.count)
        usingSpringWithDamping:0.7
        initialSpringVelocity:1 / 0.7
        options:UIViewAnimationOptionCurveEaseIn
        animations:^{ cell.transform = CGAffineTransformIdentity; }
        completion:^(BOOL finished){

        }];
    }
}

- (void)wya_alphaAnimation
{
    NSArray * cells = self.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell * cell = [self.visibleCells objectAtIndex:i];
        cell.alpha             = 0.0;
        [UIView animateWithDuration:0.3
        delay:i * 0.05
        options:0
        animations:^{ cell.alpha = 1.0; }
        completion:^(BOOL finished){

        }];
    }
}

- (void)wya_fallAnimation
{
    NSArray * cells = self.visibleCells;

    NSTimeInterval totalTime = 0.8;

    for (int i = 0; i < cells.count; i++) {
        UITableViewCell * cell = [self.visibleCells objectAtIndex:i];
        cell.transform         = CGAffineTransformMakeTranslation(0, -ScreenHeight);
        [UIView animateWithDuration:0.3
        delay:(cells.count - i) * (totalTime / cells.count)
        options:0
        animations:^{ cell.transform = CGAffineTransformIdentity; }
        completion:^(BOOL finished){

        }];
    }
}

- (void)wya_shakeAnimation
{
    NSArray * cells = self.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell * cell = [cells objectAtIndex:i];
        if (i % 2 == 0) {
            cell.transform = CGAffineTransformMakeTranslation(-ScreenWidth, 0);
        } else {
            cell.transform = CGAffineTransformMakeTranslation(ScreenWidth, 0);
        }
        [UIView animateWithDuration:0.4
        delay:i * 0.03
        usingSpringWithDamping:0.75
        initialSpringVelocity:1 / 0.75
        options:0
        animations:^{ cell.transform = CGAffineTransformIdentity; }
        completion:^(BOOL finished){

        }];
    }
}

- (void)wya_overTurnAnimation
{
    NSArray * cells = self.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell * cell   = [cells objectAtIndex:i];
        cell.layer.opacity       = 0.0;
        cell.layer.transform     = CATransform3DMakeRotation(M_PI, 1, 0, 0);
        NSTimeInterval totalTime = 0.7;
        [UIView animateWithDuration:0.3
        delay:i * (totalTime / cells.count)
        options:0
        animations:^{
            cell.layer.opacity   = 1.0;
            cell.layer.transform = CATransform3DIdentity;
        }
        completion:^(BOOL finished){

        }];
    }
}

- (void)wya_toTopAnimation
{
    NSArray * cells = self.visibleCells;

    NSTimeInterval totalTime = 0.8;

    for (int i = 0; i < cells.count; i++) {
        UITableViewCell * cell = [self.visibleCells objectAtIndex:i];
        cell.transform         = CGAffineTransformMakeTranslation(0, ScreenHeight);
        [UIView animateWithDuration:0.35
        delay:i * (totalTime / cells.count)
        options:UIViewAnimationOptionCurveEaseOut
        animations:^{ cell.transform = CGAffineTransformIdentity; }
        completion:^(BOOL finished){

        }];
    }
}

- (void)wya_springListAnimation
{
    NSArray * cells = self.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell * cell   = [cells objectAtIndex:i];
        cell.layer.opacity       = 0.7;
        cell.layer.transform     = CATransform3DMakeTranslation(0, -ScreenHeight, 20);
        NSTimeInterval totalTime = 1.0;

        [UIView animateWithDuration:0.4
        delay:i * (totalTime / cells.count)
        usingSpringWithDamping:0.65
        initialSpringVelocity:1 / 0.65
        options:UIViewAnimationOptionCurveEaseIn
        animations:^{
            cell.layer.opacity   = 1.0;
            cell.layer.transform = CATransform3DMakeTranslation(0, 0, 20);
        }
        completion:^(BOOL finished){

        }];
    }
}

- (void)wya_shrinkToTopAnimation
{
    NSArray * cells = self.visibleCells;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell * cell = [cells objectAtIndex:i];
        CGRect rect            = [cell convertRect:cell.bounds fromView:self];
        cell.transform         = CGAffineTransformMakeTranslation(0, -rect.origin.y);
        [UIView animateWithDuration:0.5
                         animations:^{ cell.transform = CGAffineTransformIdentity; }];
    }
}

- (void)wya_layDownAnimation
{
    NSArray * cells          = self.visibleCells;
    NSMutableArray * rectArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell * cell = [cells objectAtIndex:i];
        CGRect rect            = cell.frame;
        [rectArr addObject:[NSValue valueWithCGRect:rect]];
        rect.origin.y        = i * 10;
        cell.frame           = rect;
        cell.layer.transform = CATransform3DMakeTranslation(0, 0, i * 5);
    }
    NSTimeInterval totalTime = 0.8;
    for (int i = 0; i < cells.count; i++) {
        UITableViewCell * cell = [cells objectAtIndex:i];
        CGRect rect            = [[rectArr objectAtIndex:i] CGRectValue];
        [UIView animateWithDuration:(totalTime / cells.count) * i
        animations:^{ cell.frame = rect; }
        completion:^(BOOL finished) { cell.layer.transform = CATransform3DIdentity; }];
    }
}

- (void)wya_roteAnimation
{
    NSArray * cells               = self.visibleCells;
    CABasicAnimation * animation  = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.fromValue           = @(-M_PI);
    animation.toValue             = 0;
    animation.duration            = 0.3;
    animation.removedOnCompletion = NO;
    animation.repeatCount         = 3;
    animation.fillMode            = kCAFillModeForwards;
    animation.autoreverses        = NO;

    for (int i = 0; i < cells.count; i++) {
        UITableViewCell * cell = [cells objectAtIndex:i];

        cell.alpha = 0.0;
        [UIView animateWithDuration:0.1
        delay:i * 0.25
        options:0
        animations:^{ cell.alpha = 1.0; }
        completion:^(BOOL finished) {
            [cell.layer addAnimation:animation forKey:@"rotationYkey"];
        }];
    }
}

@end
