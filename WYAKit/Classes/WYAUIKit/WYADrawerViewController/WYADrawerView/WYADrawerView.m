//
//  WYADrawerView.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/24.
//

#import "WYADrawerView.h"

@interface WYADrawerView ()
@property (nonatomic, strong) UIButton * leftSuperView;
@property (nonatomic, strong) UIButton * rightSuperView;
@property (nonatomic, assign) CGRect  leftRect;
@property (nonatomic, assign) CGRect  rightRect;
@property (nonatomic, strong) UIView * leftView;
@property (nonatomic, strong) UIView * rightView;
@end

@implementation WYADrawerView

- (instancetype)initWithFrame:(CGRect)frame leftView:(UIView *)leftView rightView:(UIView *)rightView
{
    self = [super initWithFrame:frame];
    if (self) {
        self.leftRatio = 0.7;
        self.rightRatio = 0.7;
        if (leftView) {
            self.leftView = leftView;
            [self addSubview:self.leftSuperView];
            [self.leftSuperView addSubview:self.leftView];
        }
        
        if (rightView) {
            self.rightView = rightView;
            [self addSubview:self.rightSuperView];
            [self.rightSuperView addSubview:self.rightView];
        }
        
        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(viewMove:)];
        [self addGestureRecognizer:pan];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat leftSuperView_X = 0;
    CGFloat leftSuperView_Y = 0;
    CGFloat leftSuperView_Width = self.cmam_width;
    CGFloat leftSuperView_Height = self.cmam_height;
    self.leftSuperView.frame = CGRectMake(leftSuperView_X, leftSuperView_Y, leftSuperView_Width, leftSuperView_Height);
    
    
    CGFloat leftView_X = -self.leftSuperView.cmam_width*self.leftRatio;
    CGFloat leftView_Y = 0;
    CGFloat leftView_Width = self.leftSuperView.cmam_width*self.leftRatio;
    CGFloat leftView_Height = self.leftSuperView.cmam_height;
    self.leftView.frame = CGRectMake(leftView_X, leftView_Y, leftView_Width, leftView_Height);
    self.leftRect = self.leftView.frame;
    
    CGFloat rightSuperView_X = 0;
    CGFloat rightSuperView_Y = 0;
    CGFloat rightSuperView_Width = self.cmam_width;
    CGFloat rightSuperView_Height = self.cmam_height;
    self.rightSuperView.frame = CGRectMake(rightSuperView_X, rightSuperView_Y, rightSuperView_Width, rightSuperView_Height);
    
    CGFloat rightView_X = self.rightSuperView.cmam_width;
    CGFloat rightView_Y = 0;
    CGFloat rightView_Width = self.rightSuperView.cmam_width*self.rightRatio;
    CGFloat rightView_Height = self.rightSuperView.cmam_height;
    self.rightView.frame = CGRectMake(rightView_X, rightView_Y, rightView_Width, rightView_Height);
    self.rightRect = self.rightView.frame;
}

#pragma mark - Super Method  -
- (void)addSubview:(UIView *)view{
    [super addSubview:view];
    [self bringSubviewToFront:self.leftSuperView];
    [self bringSubviewToFront:self.rightSuperView];
}

#pragma mark - Public Method -
- (void)wya_leftViewMove{

    self.leftSuperView.hidden = NO;
    /*  CoreAnimation: stiffness must be greater than 0.
     *  CoreAnimation: damping must be greater than or equal to 0
     *  出现上面两个警告是因为 Duration * Damping * SpringVelocity 的值为5，设置三个s参数值不等于5就好
     */
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1.f initialSpringVelocity:10 options: UIViewAnimationOptionCurveLinear animations:^{
        
        self.leftView.frame = CGRectMake(0, 0, self.leftView.cmam_width, self.leftView.cmam_height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)wya_rightViewMove{
    self.rightSuperView.hidden = NO;
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1.f initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.rightView.frame = CGRectMake(self.cmam_width*(1-self.rightRatio), 0, self.rightView.cmam_width, self.rightView.cmam_height);
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - Private Method -
- (void)viewMove:(UIPanGestureRecognizer *)pan{
    CGPoint point = [pan locationInView:pan.view];
//    NSLog(@"point.x==%f",point.x);
    CGPoint selfPoint = [pan translationInView:pan.view];
    NSLog(@"selfPoint=%f",selfPoint.x);
    if (pan.state == UIGestureRecognizerStateBegan) {
        if (30.f<point.x && point.x<ScreenWidth-30.f) {
            //如果区域超过响应区域直接返回
            return;
        }else if (0.f<point.x && point.x<30.f){
            self.leftSuperView.hidden = NO;
            self.rightSuperView.hidden = YES;
        }else if (ScreenWidth-30.f<point.x && point.x< ScreenWidth) {
            self.rightSuperView.hidden = NO;
            self.leftSuperView.hidden = YES;
        }
    }else if (pan.state == UIGestureRecognizerStateChanged) {
        if (selfPoint.x>0 && selfPoint.x<self.cmam_width*self.leftRatio) {
            //左滑
            self.leftView.frame = CGRectMake(selfPoint.x+self.leftRect.origin.x, self.leftView.cmam_top, self.leftView.cmam_width, self.leftView.cmam_height);
            NSLog(@"leftframe == %@",NSStringFromCGRect(self.leftView.frame));
            
            
        }else if (selfPoint.x < 0 && selfPoint.x>-self.cmam_width*self.rightRatio){
            //右滑
            self.rightView.frame = CGRectMake(selfPoint.x+self.rightRect.origin.x, self.rightView.cmam_top, self.rightView.cmam_width, self.rightView.cmam_height);
            NSLog(@"rightframe == %@",NSStringFromCGRect(self.leftView.frame));
        }
        
        
    }else if (pan.state == UIGestureRecognizerStateEnded) {
        if (selfPoint.x>0) {
            if (self.leftView.cmam_left>self.leftRect.origin.x/2) {
                [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1.f initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    self.leftView.frame = CGRectMake(0, self.leftView.cmam_top, self.leftView.cmam_width, self.leftView.cmam_height);
                } completion:^(BOOL finished) {
                    self.leftSuperView.hidden = NO;
                }];
                
            }else{
                [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1.f initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    self.leftView.frame = self.leftRect;
                } completion:^(BOOL finished) {
                    self.leftSuperView.hidden = YES;
                }];
            }
            
        }else if (selfPoint.x<0){
            if (self.rightRect.origin.x-self.rightView.cmam_left>self.rightView.cmam_width/2) {
                [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1.f initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    self.rightView.frame = CGRectMake(self.rightSuperView.cmam_width*(1-self.rightRatio), self.rightView.cmam_top, self.rightView.cmam_width, self.rightView.cmam_height);
                } completion:^(BOOL finished) {
                    self.rightSuperView.hidden = NO;
                }];
            }else{
                [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1.f initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    self.rightView.frame = self.rightRect;
                } completion:^(BOOL finished) {
                    self.rightSuperView.hidden = YES;
                }];
            }
        }
    }else if (pan.state == UIGestureRecognizerStateFailed || pan.state == UIGestureRecognizerStateCancelled) {
        if (selfPoint.x>0) {
            [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1.f initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.leftView.frame = self.leftRect;
            } completion:^(BOOL finished) {
                self.leftSuperView.hidden = YES;
            }];
        }else{
            [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1.f initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.rightView.frame = self.rightRect;
            } completion:^(BOOL finished) {
                self.rightSuperView.hidden = YES;
            }];
        }
    }
}

- (void)rightViewMove:(UIPanGestureRecognizer *)pan{
    
}

#pragma mark - Setter -
- (void)setLeftRatio:(CGFloat)leftRatio{
    _leftRatio = leftRatio;
    [self layoutIfNeeded];
}

- (void)setRightRatio:(CGFloat)rightRatio{
    _rightRatio = rightRatio;
    [self layoutIfNeeded];
}

#pragma mark - Getter -
- (UIButton *)leftSuperView{
    if(!_leftSuperView){
        _leftSuperView = ({
            UIButton * object = [[UIButton alloc]init];
            object.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
            object.hidden = YES;
            [object addCallBackAction:^(UIButton *button) {
                button.frame = self.leftRect;
                button.hidden = YES;
            }];
            object;
       });
    }
    return _leftSuperView;
}

- (UIButton *)rightSuperView{
    if(!_rightSuperView){
        _rightSuperView = ({
            UIButton * object = [[UIButton alloc]init];
            object.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
            object.hidden = YES;
            [object addCallBackAction:^(UIButton *button) {
                button.frame = self.rightRect;
                button.hidden = YES;
            }];
            object;
       });
    }
    return _rightSuperView;
}
@end
