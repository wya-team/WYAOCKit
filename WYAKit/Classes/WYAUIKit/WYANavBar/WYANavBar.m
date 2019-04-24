//
//  WYANavBar.m
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/11/26.
//

#import "WYANavBar.h"
#import "Masonry.h"
#define TITLEFONT 18
#define BUTTON_TITLEFONT 16
#define ITEMSPACE_DEFAULT 10.f
#define LEFT_OR_RIGHT_SPACE 10.0
#define BUTTONWIDTH 36
#define LEFT_BASE_TAG 1000
#define RIGHT_BASE_TAG 2000

@interface WYANavBar ()
@property (nonatomic, strong) UILabel * titleLabel;              // 标题
@property (nonatomic, strong) UIImageView * backgroundImageView; // 背景图片
@property (nonatomic, strong) UIView * navBarView;               // 导航栏View
@property (nonatomic, strong) UIView * lineView;
@property (nonatomic, strong) UIView * leftButtonView;
@property (nonatomic, strong) UIView * rightButtonView;
@end

@implementation WYANavBar

- (instancetype)init {
    if (self = [super init]) {
        self.frame           = CGRectMake(0, 0, ScreenWidth, WYATopHeight);
        _titleLabel          = [[UILabel alloc] init];
        _backgroundImageView = [[UIImageView alloc] init];
        _navBarView          = [[UIView alloc] init];
        _lineView            = [[UIView alloc] init];
        _pageItemView        = [[UIView alloc] init];
        _leftButtonView      = [[UIView alloc] init];
        _rightButtonView     = [[UIView alloc] init];

        [self addSubview:_backgroundImageView];
        [_backgroundImageView addSubview:_navBarView];
        [_navBarView addSubview:_pageItemView];
        [_navBarView addSubview:_titleLabel];
        [_navBarView addSubview:_lineView];
        [_navBarView addSubview:_rightButtonView];
        [_navBarView addSubview:_leftButtonView];
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame           = CGRectMake(0, 0, ScreenWidth, WYATopHeight);
        _titleLabel          = [[UILabel alloc] init];
        _backgroundImageView = [[UIImageView alloc] init];
        _navBarView          = [[UIView alloc] init];
        _lineView            = [[UIView alloc] init];
        _pageItemView        = [[UIView alloc] init];
        _leftButtonView      = [[UIView alloc] init];
        _rightButtonView     = [[UIView alloc] init];

        [_navBarView addSubview:_titleLabel];
        [_navBarView addSubview:_pageItemView];
        [_navBarView addSubview:_lineView];
        [_backgroundImageView addSubview:_navBarView];
        [self addSubview:_backgroundImageView];
        [_navBarView addSubview:_rightButtonView];
        [_navBarView addSubview:_leftButtonView];

        [self setUp];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];

    if ([self.cmam_viewController isKindOfClass:[UITableViewController class]]) {
        self.frame = CGRectMake(0, -WYAStatusBarHeight, ScreenWidth, WYATopHeight);
    }

    [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.top.bottom.mas_equalTo(self);
    }];

    [_navBarView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.top.equalTo(self.backgroundImageView.mas_top).offset(WYAStatusBarHeight);
        make.left.mas_equalTo(self.backgroundImageView);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, WYANavBarHeight));
    }];

    [_pageItemView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.navBarView.mas_left).offset(46);
        make.right.equalTo(self.navBarView.mas_right).offset(-46);
        make.top.equalTo(self.navBarView.mas_top).offset(0);
        make.height.mas_equalTo(WYANavBarHeight);
    }];

    [_leftButtonView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.top.bottom.mas_equalTo(self.navBarView);
        make.width.mas_equalTo((ScreenWidth - 200 * SizeAdapter) * 0.5);
    }];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker * make) {
        make.center.mas_equalTo(self.navBarView);
        make.size.mas_equalTo(CGSizeMake(200 * SizeAdapter, 44));
    }];

    [_rightButtonView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.right.top.bottom.mas_equalTo(self.navBarView);
        make.width.mas_equalTo((ScreenWidth - 200 * SizeAdapter) * 0.5);
    }];

    [_lineView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.bottom.mas_equalTo(self.navBarView);
        make.height.mas_equalTo(1);
    }];
}
#pragma mark ======= private methods
- (void)setUp {
    self.backgroundColor                        = [UIColor whiteColor];
    self.titleLabel.textColor                   = [UIColor blackColor];
    self.titleLabel.font                        = [UIFont systemFontOfSize:TITLEFONT];
    self.titleLabel.adjustsFontSizeToFitWidth   = YES;
    _backgroundImageView.userInteractionEnabled = YES;
    self.titleLabel.textAlignment               = NSTextAlignmentCenter;
    _lineView.backgroundColor                   = [UIColor groupTableViewBackgroundColor];
    _navTitleFont                               = TITLEFONT;
    _space                                      = ITEMSPACE_DEFAULT;
    _leftBarButtonItemTitleFont                 = BUTTON_TITLEFONT;
    _rightBarButtonItemTitleFont                = BUTTON_TITLEFONT;
}
- (void)addLeftBarViewButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles
                                normalColor:(NSArray<UIColor *> *)normalColors
                           highlightedColor:(NSArray<UIColor *> *)highlightedColors
                                NormalImage:(NSArray<NSString *> *)normalImages
                             highlightedImg:(NSArray<NSString *> *)highlightedImgs {
    for (UIView * subView in self.leftButtonView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) { [subView removeFromSuperview]; }
    }
    CGFloat startX  = LEFT_OR_RIGHT_SPACE;
    CGFloat startY  = 4.0f;
    CGFloat width   = 36;
    CGFloat height  = 36;
    CGFloat space   = self.space;
    NSInteger count = normalTitles.count > 0 ? normalTitles.count : normalImages.count;
    for (int i = 0; i < count; i++) {
        int column = i % count;

        UIButton * customButton = [UIButton buttonWithType:UIButtonTypeCustom];

        customButton.tag = LEFT_BASE_TAG + i;

        if (normalTitles) {
            width = [[normalTitles wya_safeObjectAtIndex:i]
                wya_widthWithFontSize:self.leftBarButtonItemTitleFont
                               height:height];

            customButton.titleLabel.textAlignment = NSTextAlignmentCenter;

            customButton.titleLabel.font =
                [UIFont systemFontOfSize:self.leftBarButtonItemTitleFont];

            [customButton setTitle:[normalTitles wya_safeObjectAtIndex:i]
                          forState:UIControlStateNormal];

            [customButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

            if (normalColors.count) {
                [customButton setTitleColor:[normalColors wya_safeObjectAtIndex:i]
                                   forState:UIControlStateNormal];
            }
            if (highlightedColors.count) {
                [customButton setTitleColor:[highlightedColors wya_safeObjectAtIndex:i]
                                   forState:UIControlStateHighlighted];
            }
        } else if (normalImages.count > 0) {
            UIImage * image = [UIImage imageNamed:[normalImages wya_safeObjectAtIndex:i]];

            [customButton setImage:image forState:UIControlStateNormal];

            if (highlightedImgs.count > 0) {
                UIImage * imageHighlighted =
                    [UIImage imageNamed:[highlightedImgs wya_safeObjectAtIndex:i]];
                [customButton setImage:imageHighlighted forState:UIControlStateHighlighted];
            }
        }
        [self.leftButtonView addSubview:customButton];

        if (i == 0) {
            [customButton mas_makeConstraints:^(MASConstraintMaker * make) {
                make.left.equalTo(self.navBarView.mas_left).offset(20);
                make.size.mas_equalTo(CGSizeMake(width, height));
                make.top.equalTo(self.navBarView.mas_top).offset(startY);
            }];
        } else {
            [customButton mas_makeConstraints:^(MASConstraintMaker * make) {
                make.left.equalTo(self.navBarView.mas_left)
                    .offset(startX + column * (width + space));
                make.size.mas_equalTo(CGSizeMake(width, height));
                make.top.equalTo(self.navBarView.mas_top).offset(startY);
            }];
        }

        [customButton addTarget:self
                         action:@selector(customLeftButtonPressed:)
               forControlEvents:UIControlEventTouchUpInside];
        [customButton setEnlargeEdgeWithTop:4 right:4 bottom:4 left:4];
    }
}

- (void)addRightBarViewButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles
                                 normalColor:(NSArray<UIColor *> *)normalColors
                            highlightedColor:(NSArray<UIColor *> *)highlightedColors
                                 NormalImage:(NSArray<NSString *> *)normalImages
                              highlightedImg:(NSArray<NSString *> *)highlightedImgs {
    for (UIView * subView in self.rightButtonView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) { [subView removeFromSuperview]; }
    }
    //    CGFloat startX = LEFT_OR_RIGHT_SPACE;
    CGFloat startY  = 4.0f;
    CGFloat width   = 36;
    CGFloat height  = 36;
    CGFloat space   = self.space;
    NSInteger count = normalTitles.count > 0 ? normalTitles.count : normalImages.count;
    for (int i = 0; i < count; i++) {
        int column = i % count;

        UIButton * customButton = [UIButton buttonWithType:UIButtonTypeCustom];

        customButton.tag = RIGHT_BASE_TAG + i;

        if (normalTitles) {
            width = [[normalTitles wya_safeObjectAtIndex:i]
                wya_widthWithFontSize:self.rightBarButtonItemTitleFont
                               height:height];

            customButton.titleLabel.textAlignment = NSTextAlignmentCenter;

            customButton.titleLabel.font =
                [UIFont systemFontOfSize:self.rightBarButtonItemTitleFont];

            customButton.titleLabel.adjustsFontSizeToFitWidth = YES;

            [customButton setTitle:[normalTitles wya_safeObjectAtIndex:i]
                          forState:UIControlStateNormal];

            [customButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

            if (normalColors.count) {
                [customButton setTitleColor:[normalColors wya_safeObjectAtIndex:i]
                                   forState:UIControlStateNormal];
            }
            if (highlightedColors.count) {
                [customButton setTitleColor:[highlightedColors wya_safeObjectAtIndex:i]
                                   forState:UIControlStateHighlighted];
            }
        } else if (normalImages.count > 0) {
            UIImage * image = [UIImage imageNamed:[normalImages wya_safeObjectAtIndex:i]];

            [customButton setImage:image forState:UIControlStateNormal];

            if (highlightedImgs.count > 0) {
                UIImage * imageHighlighted =
                    [UIImage imageNamed:[highlightedImgs wya_safeObjectAtIndex:i]];
                [customButton setImage:imageHighlighted forState:UIControlStateHighlighted];
            }
        }

        [self.rightButtonView addSubview:customButton];

        [customButton setEnlargeEdgeWithTop:4 right:4 bottom:4 left:4];

        [customButton addTarget:self
                         action:@selector(customRightButtonpressed:)
               forControlEvents:UIControlEventTouchUpInside];

        if (i == 0) {
            [customButton mas_makeConstraints:^(MASConstraintMaker * make) {
                make.right.equalTo(self.navBarView.mas_right).offset(-16 * SizeAdapter);
                make.size.mas_equalTo(CGSizeMake(width, height));
                make.top.equalTo(self.navBarView.mas_top).offset(startY);
            }];
        } else {
            [customButton mas_makeConstraints:^(MASConstraintMaker * make) {
                make.right.equalTo(self.navBarView.mas_right)
                    .offset(-space - column * (width + space));
                make.size.mas_equalTo(CGSizeMake(width, height));
                make.top.equalTo(self.navBarView.mas_top).offset(startY);
            }];
        }
    }
}

- (void)addLeftGoBackWithTitle:(NSString *)title
                   normalColor:(UIColor *)normalColor
              highlightedColor:(UIColor *)highlightedColor
                         Image:(NSString *)imageNamed {
    for (UIView * subView in self.leftButtonView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) { [subView removeFromSuperview]; }
    }
    UIButton * customButton = [UIButton buttonWithType:UIButtonTypeCustom];

    customButton.frame = CGRectMake(16 * SizeAdapter, 4, 36, 36);

    customButton.titleLabel.textAlignment = NSTextAlignmentCenter;

    customButton.titleLabel.font = FONT(_leftBarButtonItemTitleFont);

    [customButton setTitle:title forState:UIControlStateNormal];

    [customButton setTitleColor:normalColor forState:UIControlStateNormal];

    if (highlightedColor) {
        [customButton setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    }

    [customButton addTarget:self
                     action:@selector(goBackPressed:)
           forControlEvents:UIControlEventTouchUpInside];
    [customButton setEnlargeEdgeWithTop:4 right:4 bottom:4 left:4];
    [self.leftButtonView addSubview:customButton];
}
#pragma mark ======= setter

- (void)setLeftButtons:(NSArray *)leftButtons {
    for (UIView * subView in self.leftButtonView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) { [subView removeFromSuperview]; }
    }
    CGFloat startX   = LEFT_OR_RIGHT_SPACE;
    CGFloat space    = self.space;
    NSUInteger count = leftButtons.count;
    _leftButtons     = leftButtons;
    for (int i = 0; i < count; i++) {
        int column            = i % count;
        UIButton * tempButton = [_leftButtons wya_safeObjectAtIndex:i];
        CGFloat width         = tempButton.bounds.size.width;
        CGFloat height        = tempButton.bounds.size.height;
        CGFloat startY        = (44 - width) * 0.5;

        [self.leftButtonView addSubview:tempButton];
        if (i == 0) {
            [tempButton mas_makeConstraints:^(MASConstraintMaker * make) {
                make.left.equalTo(self.navBarView.mas_left).offset(16 * SizeAdapter);
                make.size.mas_equalTo(CGSizeMake(width, height));
                make.top.equalTo(self.navBarView.mas_top).offset(startY);
            }];
        } else {
            [tempButton mas_makeConstraints:^(MASConstraintMaker * make) {
                make.left.equalTo(self.navBarView.mas_left)
                    .offset(startX + column * (width + space));
                make.size.mas_equalTo(CGSizeMake(width, height));
                make.top.equalTo(self.navBarView.mas_top).offset(startY);
            }];
        }
    }
}
- (void)setRightButtons:(NSArray *)rightButtons {
    for (UIView * subView in self.rightButtonView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) { [subView removeFromSuperview]; }
    }
    //    CGFloat startX  = LEFT_OR_RIGHT_SPACE;
    CGFloat startY   = 4.0f;
    CGFloat space    = self.space;
    NSUInteger count = rightButtons.count;
    _rightButtons    = rightButtons;
    for (int i = 0; i < count; i++) {
        int column            = i % count;
        UIButton * tempButton = [_rightButtons wya_safeObjectAtIndex:i];
        CGFloat width         = tempButton.bounds.size.width;
        CGFloat height        = tempButton.bounds.size.height;
        [self.rightButtonView addSubview:tempButton];
        if (i == 0) {
            [tempButton mas_makeConstraints:^(MASConstraintMaker * make) {
                make.right.equalTo(self.navBarView.mas_right).offset(-16 * SizeAdapter);
                make.size.mas_equalTo(CGSizeMake(width, height));
                make.top.equalTo(self.navBarView.mas_top).offset(startY);
            }];
        } else {
            [tempButton mas_makeConstraints:^(MASConstraintMaker * make) {
                make.right.equalTo(self.navBarView.mas_right)
                    .offset(-space - column * (width + space));
                make.size.mas_equalTo(CGSizeMake(width, height));
                make.top.equalTo(self.navBarView.mas_top).offset(startY);
            }];
        }
    }
}
- (void)setIsShowLine:(BOOL)isShowLine {
    _isShowLine = isShowLine;
    if (!isShowLine) {
        [self.lineView removeFromSuperview];
        self.lineView = nil;
    }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    if (_backgroundImage) { _backgroundImageView.image = [UIImage new]; }
    if (backgroundImage) {
        _backgroundImage           = backgroundImage;
        _backgroundImageView.image = backgroundImage;
    }
}
- (void)setNavTitle:(NSString *)navTitle {
    _navTitle            = navTitle;
    self.titleLabel.text = _navTitle;
}
- (void)setNavTitleFont:(CGFloat)navTitleFont {
    _navTitleFont        = navTitleFont;
    self.titleLabel.font = [UIFont systemFontOfSize:_navTitleFont];
}
- (void)setNavTitleColor:(UIColor *)navTitleColor {
    _navTitleColor            = navTitleColor;
    self.titleLabel.textColor = _navTitleColor;
}
#pragma mark ======= public methods
#pragma mark ======= left
#pragma mark--------- goBack
- (void)wya_goBackButtonWithImage:(NSString *)imageNamed {
    [self wya_customGobackWithImage:[UIImage imageNamed:imageNamed]];
}
- (void)wya_customGobackWithImage:(UIImage *)image {
    for (UIView * subView in self.leftButtonView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) { [subView removeFromSuperview]; }
    }
    UIButton * customButton = [UIButton buttonWithType:UIButtonTypeCustom];

    customButton.frame = CGRectMake(16 * SizeAdapter, 4, 36, 36);

    [customButton setImage:image forState:UIControlStateNormal];

    [customButton addTarget:self
                     action:@selector(goBackPressed:)
           forControlEvents:UIControlEventTouchUpInside];

    [self.leftButtonView addSubview:customButton];
}
- (void)wya_goBackButtonWithTitle:(NSString *)title
                      normalColor:(UIColor * _Nullable)normalColor
                 highlightedColor:(UIColor * _Nullable)highlightedColor {
    UIColor * normal = normalColor ? normalColor : [UIColor blackColor];
    [self addLeftGoBackWithTitle:title
                     normalColor:normal
                highlightedColor:highlightedColor
                           Image:nil];
}

#pragma mark------------leftCustom
- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles {
    [self addLeftBarViewButtonWithNormalTitle:normalTitles
                                  normalColor:nil
                             highlightedColor:nil
                                  NormalImage:nil
                               highlightedImg:nil];
}
- (void)wya_addLeftNavBarButtonWithNormalImage:(NSArray<NSString *> *)normalImages
                                highlightedImg:(NSArray<NSString *> *)highlightedImgs {
    [self addLeftBarViewButtonWithNormalTitle:nil
                                  normalColor:nil
                             highlightedColor:nil
                                  NormalImage:normalImages
                               highlightedImg:highlightedImgs];
}

- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles
                                   normalColor:(NSArray<UIColor *> *)normalColors
                              highlightedColor:(NSArray<UIColor *> *)highlightedColors {
    [self addLeftBarViewButtonWithNormalTitle:normalTitles
                                  normalColor:normalColors
                             highlightedColor:highlightedColors
                                  NormalImage:nil
                               highlightedImg:nil];
}
#pragma mark ======= right
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles {
    [self addRightBarViewButtonWithNormalTitle:normalTitles
                                   normalColor:nil
                              highlightedColor:nil
                                   NormalImage:nil
                                highlightedImg:nil];
}
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles
                                    normalColor:(NSArray<UIColor *> *)normalColors
                               highlightedColor:(NSArray<UIColor *> *)highlightedColors {
    [self addRightBarViewButtonWithNormalTitle:normalTitles
                                   normalColor:normalColors
                              highlightedColor:highlightedColors
                                   NormalImage:nil
                                highlightedImg:nil];
}
- (void)wya_addRightNavBarButtonWithNormalImage:(NSArray<NSString *> *)normalImages
                                 highlightedImg:(NSArray<NSString *> *)highlightedImgs {
    [self addRightBarViewButtonWithNormalTitle:nil
                                   normalColor:nil
                              highlightedColor:nil
                                   NormalImage:normalImages
                                highlightedImg:highlightedImgs];
}
#pragma mark ======= leftAction
- (void)goBackPressed:(UIButton *)sender {
    NSLog(@"%@", sender.titleLabel.text);

    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_goBackPressed:)]) {
        [self.delegate wya_goBackPressed:sender];
    }
}
- (void)customLeftButtonPressed:(UIButton *)sender {
    NSLog(@"%@", sender.titleLabel.text);
    //    sender.tag = sender.tag - LEFT_BASE_TAG;
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(wya_leftBarButtonItemPressed:)]) {
        [self.delegate wya_leftBarButtonItemPressed:sender];
    }
}
#pragma mark ======= rightAction
- (void)customRightButtonpressed:(UIButton *)sender {
    NSLog(@"%@", sender.titleLabel.text);
    //    sender.tag = sender.tag - RIGHT_BASE_TAG;
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(wya_rightBarButtonItemPressed:)]) {
        [self.delegate wya_rightBarButtonItemPressed:sender];
    }
}
@end
