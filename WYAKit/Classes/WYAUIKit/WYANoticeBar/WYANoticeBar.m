//
//  WYANoticeBar.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import "WYANoticeBar.h"

@interface WYANoticeBar ()
@property (nonatomic, strong) UIButton * noticeButton;
@property (nonatomic, strong) UIButton * rightButton;
@property (nonatomic, strong) UIView * titleView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) NSMutableArray * titleLabelArray;
@property (nonatomic, assign) WYANoticeBarScrollDirection direction;
@property (nonatomic, assign) NSInteger titleIndex;
@end

@implementation WYANoticeBar {
    CGRect rectMark1; //标记第一个位置
    CGRect rectMark2; //标记第二个位置
    BOOL isStop;      //停止
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame scrollDirection:WYANoticeBarScrollDirectionLeft];
}

- (instancetype)initWithFrame:(CGRect)frame
              scrollDirection:(WYANoticeBarScrollDirection)scrollDirection {
    self = [super initWithFrame:frame];
    if (self) {
        self.direction = scrollDirection;
        [self createUI];
    }
    return self;
}

#pragma mark--- Private Method
- (void)layoutSubviews {
    [super layoutSubviews];

    self.noticeButton.frame = CGRectMake(0, (self.cmam_height - 30 * SizeAdapter) / 2,
                                         self.showNoticeButton ? 30 * SizeAdapter : 0,
                                         self.showNoticeButton ? 30 * SizeAdapter : 0);
    self.rightButton.frame = CGRectMake(
        self.showRightButton ? self.cmam_width - 30 * SizeAdapter : self.cmam_width,
        (self.cmam_height - 30 * SizeAdapter) / 2, self.showRightButton ? 30 * SizeAdapter : 0,
        self.showRightButton ? 30 * SizeAdapter : 0);

    self.titleView.frame =
        CGRectMake(self.showNoticeButton ? self.noticeButton.cmam_right : 10 * SizeAdapter,
                   (self.cmam_height - 30 * SizeAdapter) / 2,
                   self.cmam_width -
                       (self.showNoticeButton ? self.noticeButton.cmam_right : 10 * SizeAdapter) -
                       (self.showRightButton ? self.rightButton.cmam_width : 10 * SizeAdapter),
                   30 * SizeAdapter);
}

- (void)createUI {
    self.layer.masksToBounds = YES;
    WeakSelf(weakSelf);
    self.noticeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.noticeButton addCallBackAction:^(UIButton * button) {
        if (weakSelf.leftButtonHandle) { weakSelf.leftButtonHandle(); }
    }];
    [self addSubview:self.noticeButton];

    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightButton addCallBackAction:^(UIButton * button) {
        if (weakSelf.rightButtonHandle) { weakSelf.rightButtonHandle(); }
    }];
    [self addSubview:self.rightButton];

    self.titleView = [[UIView alloc] init];
    [self addSubview:self.titleView];
    [self sendSubviewToBack:self.titleView];

    self.titleLabelArray = [NSMutableArray arrayWithCapacity:0];

    self.noticeBackgroundColor = [UIColor whiteColor];
    self.titleIndex            = 0;
}

- (void)paomaAnimate {
    if (!isStop) {
        if (self.direction == WYANoticeBarScrollDirectionLeft) {
            if (self.titleLabelArray.count < 2) { return; }
            UILabel * lbindex0 = self.titleLabelArray[0];
            UILabel * lbindex1 = self.titleLabelArray[1];

            [UIView transitionWithView:self
                duration:[self displayDurationForString:self.titleLabel.text]
                options:UIViewAnimationOptionCurveLinear
                animations:^{

                    CGFloat lbindex0_X      = -self->rectMark1.size.width;
                    CGFloat lbindex0_Y      = 0;
                    CGFloat lbindex0_Width  = self->rectMark1.size.width;
                    CGFloat lbindex0_Height = self->rectMark1.size.height;
                    lbindex0.frame =
                        CGRectMake(lbindex0_X, lbindex0_Y, lbindex0_Width, lbindex0_Height);

                    CGFloat lbindex1_X      = lbindex0.frame.origin.x + lbindex0.frame.size.width;
                    CGFloat lbindex1_Y      = 0;
                    CGFloat lbindex1_Width  = lbindex1.frame.size.width;
                    CGFloat lbindex1_Height = lbindex1.frame.size.height;
                    lbindex1.frame =
                        CGRectMake(lbindex1_X, lbindex1_Y, lbindex1_Width, lbindex1_Height);

                }
                completion:^(BOOL finished) {

                    lbindex0.frame = self->rectMark2;
                    lbindex1.frame = self->rectMark1;

                    [self.titleLabelArray replaceObjectAtIndex:0 withObject:lbindex1];
                    [self.titleLabelArray replaceObjectAtIndex:1 withObject:lbindex0];

                    [self paomaAnimate];
                }];
        } else if (self.direction == WYANoticeBarScrollDirectionTop ||
                   self.direction == WYANoticeBarScrollDirectionBottom) {
            UILabel * label = self.titleLabelArray[self.titleIndex];
            UILabel * nextLabel;
            if (self.titleIndex == self.titleLabelArray.count - 1) {
                nextLabel = self.titleLabelArray[0];
            } else {
                nextLabel = self.titleLabelArray[self.titleIndex + 1];
            }
            label.frame = CGRectMake(0, 0, self.titleView.cmam_width, self.titleView.cmam_height);
            if (self.direction == WYANoticeBarScrollDirectionTop) {
                nextLabel.frame = CGRectMake(0, self.titleView.cmam_height,
                                             self.titleView.cmam_width, self.titleView.cmam_height);
            } else {
                nextLabel.frame = CGRectMake(0, -self.titleView.cmam_height,
                                             self.titleView.cmam_width, self.titleView.cmam_height);
            }

            [UIView transitionWithView:label
                duration:0.5
                options:UIViewAnimationOptionCurveEaseInOut
                animations:^{
                    if (self.direction == WYANoticeBarScrollDirectionTop) {
                        label.frame =
                            CGRectMake(0, -self.titleView.cmam_height, self.titleView.cmam_width,
                                       self.titleView.cmam_height);
                    } else {
                        label.frame =
                            CGRectMake(0, self.titleView.cmam_height, self.titleView.cmam_width,
                                       self.titleView.cmam_height);
                    }
                    nextLabel.frame =
                        CGRectMake(0, 0, self.titleView.cmam_width, self.titleView.cmam_height);
                }
                completion:^(BOOL finished) {
                    if (self.titleIndex == self.titleLabelArray.count - 1) {
                        self.titleIndex = 0;
                    } else {
                        self.titleIndex++;
                    }
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)),
                                   dispatch_get_main_queue(), ^{ [self paomaAnimate]; });

                }];
        }
    }
}

- (void)wya_start {
    isStop = NO;
    if (self.direction == WYANoticeBarScrollDirectionLeft) {
        if (self.titleLabelArray.count < 2) { return; }
        UILabel * lbindex0 = self.titleLabelArray[0];
        UILabel * lbindex1 = self.titleLabelArray[1];

        lbindex0.frame = rectMark2;
        lbindex1.frame = rectMark1;

        [self.titleLabelArray replaceObjectAtIndex:0 withObject:lbindex1];
        [self.titleLabelArray replaceObjectAtIndex:1 withObject:lbindex0];

    } else if (self.direction == WYANoticeBarScrollDirectionTop ||
               self.direction == WYANoticeBarScrollDirectionBottom) {
    }

    [self paomaAnimate];
}

- (void)wya_stop {
    isStop = YES;
}

- (NSTimeInterval)displayDurationForString:(NSString *)string {
    return string.length / 5;
}

#pragma mark--- Setter
- (void)setShowText:(NSString *)showText {
    _showText = showText;
    if (showText) {
        [self setNeedsLayout];
        [self layoutIfNeeded];
        self.titleLabel      = [[UILabel alloc] init];
        self.titleLabel.font = FONT(15);
        self.titleLabel.text = showText;
        [self.titleView addSubview:self.titleLabel];
        [self.titleLabelArray addObject:self.titleLabel];
        CGSize size = [self.titleLabel sizeThatFits:CGSizeZero];
        rectMark1   = CGRectMake(0, 0, size.width + 10, self.titleView.cmam_height);
        rectMark2   = CGRectMake(rectMark1.origin.x + rectMark1.size.width, 0, size.width + 10,
                               self.titleView.cmam_height);

        self.titleLabel.frame = rectMark1;
        if (size.width > self.titleView.cmam_width) {
            UILabel * label = [[UILabel alloc] initWithFrame:rectMark2];
            label.font      = FONT(15);
            label.text      = showText;
            [self.titleView addSubview:label];
            [self.titleLabelArray addObject:label];
        }
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
    if (self.direction == WYANoticeBarScrollDirectionLeft) {
        UILabel * lbindex0 = self.titleLabelArray[0];
        lbindex0.textColor = showTextColor;
        if (self.titleLabelArray.count < 2) { return; }
        UILabel * lbindex1 = self.titleLabelArray[1];
        lbindex1.textColor = showTextColor;
    } else {
        for (UILabel * label in self.titleLabelArray) { label.textColor = showTextColor; }
    }
}

- (void)setShowTextFont:(CGFloat)showTextFont {
    if (self.direction == WYANoticeBarScrollDirectionLeft) {
        UILabel * lbindex0 = self.titleLabelArray[0];
        lbindex0.font      = FONT(showTextFont);
        if (self.titleLabelArray.count < 2) { return; }
        UILabel * lbindex1 = self.titleLabelArray[1];
        lbindex1.font      = FONT(showTextFont);
    } else {
        for (UILabel * label in self.titleLabelArray) { label.font = FONT(showTextFont); }
    }
}

- (void)setNoticeButtonImage:(UIImage *)noticeButtonImage {
    [self.noticeButton setImage:noticeButtonImage forState:UIControlStateNormal];
}

- (void)setRightButtonImage:(UIImage *)rightButtonImage {
    [self.rightButton setImage:rightButtonImage forState:UIControlStateNormal];
}

- (void)setNoticeBackgroundColor:(UIColor *)noticeBackgroundColor {
    self.titleView.backgroundColor = noticeBackgroundColor;
    [self.noticeButton setBackgroundColor:noticeBackgroundColor];
    [self.rightButton setBackgroundColor:noticeBackgroundColor];
}

- (void)setTextArray:(NSArray *)textArray {
    _textArray = textArray;
    if (textArray) {
        [self setNeedsLayout];
        [self layoutIfNeeded];
        for (NSInteger index = 0; index < textArray.count; index++) {
            UILabel * label = [[UILabel alloc] init];
            label.text      = textArray[index];
            label.textColor = random(0, 0, 0, 1);
            label.font      = FONT(15);
            [self.titleView addSubview:label];
            [self.titleLabelArray addObject:label];
            if (index == 0) {
                rectMark1   = CGRectMake(0, 0, self.titleView.cmam_width, self.titleView.cmam_height);
                label.frame = rectMark1;
            } else {
                label.frame = CGRectMake(0, self.titleView.cmam_height, self.titleView.cmam_width,
                                         self.titleView.cmam_height);
            }
        }
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
