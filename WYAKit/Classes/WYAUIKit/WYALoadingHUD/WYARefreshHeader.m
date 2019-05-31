//
//  WYARefreshHeader.m
//  AFNetworking
//
//  Created by 李雪峰 on 2019/5/30.
//

#define HeaderDefaultHeight 54
#define  IndicatorWidth 20
#import "NSBundle+MJRefresh.h"
#import "WYARefreshHeader.h"
#import "UIView+WYACircleLoading.h"
#import "UIView+WYALoadingAnimate.h"

@interface WYARefreshHeader()
@property (weak, nonatomic) UIActivityIndicatorView *loadingView;
@end

@implementation WYARefreshHeader

#pragma mark - 懒加载子控件
- (UIActivityIndicatorView *)loadingView
{
    if (!_loadingView) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        loadingView.hidesWhenStopped = YES;
        [loadingView setFrame:CGRectMake((self.bounds.size.width - IndicatorWidth)/2, (self.bounds.size.height - IndicatorWidth)/2, 20, 20)];
        [self addSubview:_loadingView = loadingView];
    }
    return _loadingView;
}
#pragma mark - 重写父类的方法
- (void)prepare
{
    [super prepare];
    
}

- (void)placeSubviews
{
    [super placeSubviews];
    
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    // 根据状态做事情
    if (state == MJRefreshStateIdle) {
        [self hideLoading];
    } else if (state == MJRefreshStatePulling) {
        [self hideLoading];
    } else if (state == MJRefreshStateRefreshing) {
        [self showLoading];
    }
}

- (void)showLoading{
    if (self.animateStyle == WYALoadingGraphAnimateStyleCircle) {
        [self drawCircleAnimateWithWidth:20.f];
    }
    else if (self.animateStyle == WYALoadingGraphAnimateStyleIndicator){
        [self.loadingView startAnimating];
    }
    else{
        [self drawWordAnimationWithText:@"WYA" fontSize:20];
    }
}

- (void)hideLoading{
    if (self.animateStyle == WYALoadingGraphAnimateStyleIndicator) {
        [self.loadingView stopAnimating];
        [self.loadingView removeFromSuperview];//为了切换动画时，释放loadingview。防止移除的图层对象没有释放，再次走removeFromSuperlayer方法报错
    }
    else if (self.animateStyle == WYALoadingGraphAnimateStyleWordPath){
        [UIView animateWithDuration:0.25 animations:^{
            [self hideWYALoading];
        }];
    }
    else{
        [self.layer removeAllAnimations];
        [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    }
}

+ (instancetype)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action animateStyle:(WYALoadingGraphAnimateStyle)animateStyle{
    
    WYARefreshHeader * header = (WYARefreshHeader *)[super headerWithRefreshingTarget:target refreshingAction:action];
    header.animateStyle = animateStyle;
    return header;
    
}

- (void)setAnimateStyle:(WYALoadingGraphAnimateStyle)animateStyle{
    
    [self hideLoading];
    _animateStyle = animateStyle;
    
}


@end
