//
//  WYANoticeBar.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import "WYANoticeBar.h"

static void * NoticeBar = &NoticeBar;

@interface WYANoticeBar ()
@property (nonatomic, strong) UIButton * noticeButton;
@property (nonatomic, strong) UIButton * rightButton;
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, assign) WYANoticeBarScrollDirection direction;
@end

@implementation WYANoticeBar {
    NSTimer *_timer;
    CGFloat _labelWidth;
}

#pragma mark ======= LifeCircle
- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame scrollDirection:WYANoticeBarScrollDirectionLeft];
}

- (instancetype)initWithFrame:(CGRect)frame
              scrollDirection:(WYANoticeBarScrollDirection)scrollDirection {
    self = [super initWithFrame:frame];
    if (self) {
        self.direction = scrollDirection;
        self.showTextFont = 15;
        self.showTextColor = [UIColor blackColor];
        [self createUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat noticeButton_x      = 0;
    CGFloat noticeButton_y      = (self.cmam_height - 30 * SizeAdapter) / 2;
    CGFloat noticeButton_width  = self.showNoticeButton ? 30 * SizeAdapter : 0;
    CGFloat noticeButton_height = self.showNoticeButton ? 30 * SizeAdapter : 0;
    CGRect noticeButton_rect    = CGRectMake(noticeButton_x, noticeButton_y, noticeButton_width, noticeButton_height);
    self.noticeButton.frame     = noticeButton_rect;

    CGFloat rightButton_x      = self.showRightButton ? self.cmam_width - 30 * SizeAdapter : self.cmam_width;
    CGFloat rightButton_y      = (self.cmam_height - 30 * SizeAdapter) / 2;
    CGFloat rightButton_width  = self.showRightButton ? 30 * SizeAdapter : 0;
    CGFloat rightButton_height = self.showRightButton ? 30 * SizeAdapter : 0;
    CGRect rightButton_rect    = CGRectMake(rightButton_x, rightButton_y, rightButton_width, rightButton_height);
    self.rightButton.frame     = rightButton_rect;

    CGFloat titleView_x     = self.showNoticeButton ? self.noticeButton.cmam_right : 10 * SizeAdapter;
    CGFloat titleView_y     = (self.cmam_height - 30 * SizeAdapter) / 2;
    CGFloat titleView_width = self.cmam_width -
                              (self.showNoticeButton ? self.noticeButton.cmam_right : 0 * SizeAdapter) -
                              (self.showRightButton ? self.rightButton.cmam_width : 0 * SizeAdapter);
    CGFloat titleView_height = 30 * SizeAdapter;
    CGRect titleView_rect    = CGRectMake(titleView_x, titleView_y, titleView_width, titleView_height);
    self.scrollView.frame     = titleView_rect;
}

-(void)dealloc{
    [self wya_stop];
    [self.scrollView removeObserver:self forKeyPath:@"contentOffset" context:NoticeBar];
}

#pragma mark ======= Public Method
- (void)wya_start {
    CGFloat time = 0;
    if (self.direction == WYANoticeBarScrollDirectionLeft) {
        time = 0.01;
    } else {
        time = 2;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    [_timer fire];

}

- (void)wya_stop {
    if (_timer && [_timer isValid]) {
        [_timer setFireDate:[NSDate distantFuture]];
    }
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

#pragma mark--- Private Method
- (void)createUI {
    self.layer.masksToBounds = YES;

    [self addSubview:self.noticeButton];
    [self addSubview:self.rightButton];
    [self addSubview:self.scrollView];
    [self sendSubviewToBack:self.scrollView];

    self.noticeBackgroundColor = [UIColor whiteColor];
}

- (void)resertUI{

    for (UIView * view in self.scrollView.subviews) {
        [view removeFromSuperview];
    }
    if (self.direction == WYANoticeBarScrollDirectionLeft) {
        UILabel * titleLabel      = [[UILabel alloc] init];
        titleLabel.textColor = self.showTextColor;
        titleLabel.font = FONT(self.showTextFont);
        titleLabel.text = self.showText;
        CGSize size = [titleLabel sizeThatFits:CGSizeZero];
        _labelWidth = size.width;
        titleLabel.frame   = CGRectMake(0, 0, size.width, self.scrollView.cmam_height);
        [self.scrollView addSubview:titleLabel];
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    } else {
        UIView * view;
        for (NSInteger index = 0; index<self.textArray.count; index++) {
            UILabel * label      = [[UILabel alloc] init];
            label.textColor = self.showTextColor;
            label.font = FONT(self.showTextFont);
            NSInteger i;
            if (self.direction == WYANoticeBarScrollDirectionTop) {
                i = index;
            } else {
                i = self.textArray.count - 1 - index;
            }
            label.text = self.textArray[i];
            label.frame   = CGRectMake(0, view.cmam_bottom, self.scrollView.cmam_width, self.scrollView.cmam_height);
            [self.scrollView addSubview:label];
            view = label;
        }
        if (self.direction == WYANoticeBarScrollDirectionTop) {
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        } else {
            [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.cmam_height * (self.textArray.count - 1)) animated:NO];
        }
    }


}

-(void)timerAction{
    switch (self.direction) {
        case WYANoticeBarScrollDirectionLeft:
            [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x + 1, 0) animated:NO];
            break;
        case WYANoticeBarScrollDirectionTop:
            [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y + self.scrollView.cmam_height) animated:YES];
            break;
        case WYANoticeBarScrollDirectionBottom:
            [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y - self.scrollView.cmam_height) animated:YES];
            break;
        default:
            break;
    }

}

#pragma mark ======= KVO
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey, id> *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"] && context == NoticeBar) {
        if (self.direction == WYANoticeBarScrollDirectionLeft) {
            NSValue * newvalue = change[NSKeyValueChangeNewKey];
            CGFloat point_x    = newvalue.UIOffsetValue.horizontal;
            if (point_x > _labelWidth) {
                [self.scrollView setContentOffset:CGPointMake(-self.cmam_width, 0) animated:NO];
            }
        } else {
            NSValue * newvalue = change[NSKeyValueChangeNewKey];
            CGFloat point_y    = newvalue.UIOffsetValue.vertical;
            if (self.direction == WYANoticeBarScrollDirectionTop) {
                if (fabs(point_y) == self.textArray.count * self.scrollView.cmam_height) {
                    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
                }
            } else {
                if (point_y == -self.scrollView.cmam_height) {
                    [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.cmam_height * (self.textArray.count - 1)) animated:NO];
                }
            }
        }

    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark--- Setter
- (void)setShowText:(NSString *)showText {
    _showText = showText;
    if (showText) {
        [self wya_stop];
        [self layoutIfNeeded];
        [self resertUI];
    }
}

- (void)setShowNoticeButton:(BOOL)showNoticeButton {
    _showNoticeButton = showNoticeButton;
    if (showNoticeButton == NO) {
        self.noticeButton.hidden = YES;
    } else {
        self.noticeButton.hidden = NO;
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setShowRightButton:(BOOL)showRightButton {
    _showRightButton = showRightButton;
    if (showRightButton == NO) {
        self.rightButton.hidden = YES;
    } else {
        self.rightButton.hidden = NO;
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setShowTextColor:(UIColor *)showTextColor {
    _showTextColor = showTextColor;
}

- (void)setShowTextFont:(CGFloat)showTextFont {
    _showTextFont = showTextFont;
}

- (void)setNoticeButtonImage:(UIImage *)noticeButtonImage {
    [self.noticeButton setImage:noticeButtonImage forState:UIControlStateNormal];
}

- (void)setRightButtonImage:(UIImage *)rightButtonImage {
    [self.rightButton setImage:rightButtonImage forState:UIControlStateNormal];
}

- (void)setNoticeBackgroundColor:(UIColor *)noticeBackgroundColor {
    self.scrollView.backgroundColor = noticeBackgroundColor;
    [self.noticeButton setBackgroundColor:noticeBackgroundColor];
    [self.rightButton setBackgroundColor:noticeBackgroundColor];
}

- (void)setTextArray:(NSArray *)textArray {
    _textArray = textArray;
    if (textArray) {
        [self wya_stop];
        [self layoutIfNeeded];
        [self resertUI];
    }
}

#pragma mark ======= Getter
- (UIButton *)noticeButton{
    if(!_noticeButton){
        _noticeButton = ({
            WeakSelf(weakSelf);
            UIButton * object = [[UIButton alloc]init];
            [object addCallBackAction:^(UIButton * button) {
                if (weakSelf.leftButtonHandle) { weakSelf.leftButtonHandle(); }
            }];
            object;
       });
    }
    return _noticeButton;
}

- (UIButton *)rightButton{
    if(!_rightButton){
        _rightButton = ({
            WeakSelf(weakSelf);
            UIButton * object = [[UIButton alloc]init];
            [object addCallBackAction:^(UIButton *button) {
                if (weakSelf.rightButtonHandle) { weakSelf.rightButtonHandle(); }
            }];
            object;
       });
    }
    return _rightButton;
}

- (UIScrollView *)scrollView{
    if(!_scrollView){
        _scrollView = ({
            UIScrollView * object = [[UIScrollView alloc]init];
            object.clipsToBounds = YES;
            [object addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:NoticeBar];
            object;
       });
    }
    return _scrollView;
}
@end
