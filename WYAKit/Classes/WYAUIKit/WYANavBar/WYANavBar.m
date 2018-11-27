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
@interface WYANavBar()
@property (nonatomic, strong) UILabel * titleLabel;// 标题
@property (nonatomic, strong) UIImageView * backgroundImageView;// 背景图片
@property (nonatomic, strong) UIView * navBarView;// 导航栏View
@property (nonatomic, strong) UIView * lineView;
@end
@implementation WYANavBar

- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, ScreenWidth, WYATopHeight);
        _titleLabel = [[UILabel alloc]init];
        _backgroundImageView = [[UIImageView alloc]init];
        _navBarView = [[UIView alloc]init];
        _lineView = [[UIView alloc]init];
        
        [self addSubview:_backgroundImageView];
        [_backgroundImageView addSubview:_navBarView];
        [_navBarView addSubview:_titleLabel];
        [_navBarView addSubview:_lineView];
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:CGRectMake(0, 0, ScreenWidth, WYATopHeight)]) {
        self.frame = CGRectMake(0, 0, ScreenWidth, WYATopHeight);
        _titleLabel = [[UILabel alloc]init];
        _backgroundImageView = [[UIImageView alloc]init];
        _navBarView = [[UIView alloc]init];
        _lineView = [[UIView alloc]init];
        
        [self addSubview:_backgroundImageView];
        [_backgroundImageView addSubview:_navBarView];
        [_navBarView addSubview:_titleLabel];
        [_navBarView addSubview:_lineView];
        [self setUp];

    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self);
    }];
    
    [_navBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backgroundImageView.mas_top).offset(WYAStatusBarHeight);
        make.left.mas_equalTo(self.backgroundImageView);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, WYANavBarHeight));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.navBarView);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.navBarView);
        make.height.mas_equalTo(1);
    }];
}
#pragma mark ======= private methods
- (void)setUp{
    self.backgroundColor = [UIColor whiteColor];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:TITLEFONT];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    _lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}
- (void)addLeftBarViewButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles
                                normalColor:(NSArray<UIColor *> *)normalColors
                           highlightedColor:(NSArray<UIColor *>*)highlightedColors
                                NormalImage:(NSArray<NSString *>*)normalImages
                             highlightedImg:(NSArray<NSString *> *)highlightedImgs{
    CGFloat startX = LEFT_OR_RIGHT_SPACE;
    CGFloat startY = 4.0f;
    CGFloat width = 36;
    CGFloat height = 36;
    CGFloat space = self.space;
    NSInteger count = normalTitles.count >0 ? normalTitles.count : normalImages.count;
    for (int i = 0; i < count; i++) {
        int column = i%count;

        UIButton * customButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        customButton.tag = LEFT_BASE_TAG + i;

        if (normalTitles) {
              width = [[normalTitles wya_safeObjectAtIndex:i] wya_widthWithFontSize:self.leftBarButtonItemTitleFont height:height];
            
            customButton.titleLabel.textAlignment = NSTextAlignmentCenter;
            
            customButton.titleLabel.font = [UIFont systemFontOfSize:self.leftBarButtonItemTitleFont];
            
            [customButton setTitle:[normalTitles wya_safeObjectAtIndex:i] forState:UIControlStateNormal];
            
            [customButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            if (normalColors.count) {
                
                [customButton setTitleColor:[normalColors wya_safeObjectAtIndex:i] forState:UIControlStateNormal];
                
            }
            if (highlightedColors.count) {
                [customButton setTitleColor:[highlightedColors wya_safeObjectAtIndex:i] forState:UIControlStateHighlighted];
            }
        }else if(normalImages.count>0){
            UIImage * image = [UIImage imageNamed:[normalImages wya_safeObjectAtIndex:i]];
            
            [customButton setImage:image forState:UIControlStateNormal];
            
            if (highlightedImgs.count>0) {
                UIImage * imageHighlighted = [UIImage imageNamed:[highlightedImgs wya_safeObjectAtIndex:i]];
                [customButton setImage:imageHighlighted forState:UIControlStateHighlighted];
            }
            
        }
    
        customButton.frame = CGRectMake(startX + column*(width + space), startY, width, height);
        
        [customButton addTarget:self action:@selector (customLeftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.navBarView addSubview:customButton];
    }
}

- (void)addRightBarViewButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles
                                normalColor:(NSArray<UIColor *> *)normalColors
                           highlightedColor:(NSArray<UIColor *>*)highlightedColors
                                NormalImage:(NSArray<NSString *>*)normalImages
                             highlightedImg:(NSArray<NSString *> *)highlightedImgs{
    CGFloat startX = LEFT_OR_RIGHT_SPACE;
    CGFloat startY = 4.0f;
    CGFloat width = 36;
    CGFloat height = 36;
    CGFloat space = self.space;
    NSInteger count = normalTitles.count >0 ? normalTitles.count : normalImages.count;
    for (int i = 0; i < count; i++) {
        int column = i%count;
        
        UIButton * customButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        customButton.tag = RIGHT_BASE_TAG + i;
        
        if (normalTitles) {
            width = [[normalTitles wya_safeObjectAtIndex:i] wya_widthWithFontSize:self.leftBarButtonItemTitleFont height:height];
            
            customButton.titleLabel.textAlignment = NSTextAlignmentCenter;
            
            customButton.titleLabel.font = [UIFont systemFontOfSize:self.leftBarButtonItemTitleFont];
            
            [customButton setTitle:[normalTitles wya_safeObjectAtIndex:i] forState:UIControlStateNormal];
            
            [customButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            if (normalColors.count) {
                
                [customButton setTitleColor:[normalColors wya_safeObjectAtIndex:i] forState:UIControlStateNormal];
                
            }
            if (highlightedColors.count) {
                [customButton setTitleColor:[highlightedColors wya_safeObjectAtIndex:i] forState:UIControlStateHighlighted];
            }
        }else if(normalImages.count>0){
            UIImage * image = [UIImage imageNamed:[normalImages wya_safeObjectAtIndex:i]];
            
            [customButton setImage:image forState:UIControlStateNormal];
            
            if (highlightedImgs.count>0) {
                UIImage * imageHighlighted = [UIImage imageNamed:[highlightedImgs wya_safeObjectAtIndex:i]];
                [customButton setImage:imageHighlighted forState:UIControlStateHighlighted];
            }
            
        }
        [self.navBarView addSubview:customButton];

        
        [customButton addTarget:self action:@selector (customRightButtonpressed::) forControlEvents:UIControlEventTouchUpInside];
        
        [customButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.navBarView.mas_right).offset(-startX - column*(width + space));
            make.size.mas_equalTo(CGSizeMake(width, height));
            make.top.equalTo(self.navBarView.mas_top).offset(startY);
        }];
    }

}

- (void)addLeftGoBackWithTitle:(NSString *)title
           normalColor:(UIColor * _Nonnull)normalColor
      highlightedColor:(UIColor *)highlightedColor
                     Image:(NSString *)imageNamed{
    UIButton * customButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    customButton.frame = CGRectMake(LEFT_OR_RIGHT_SPACE, 4, 36, 36);
    if (title) {
    customButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    customButton.titleLabel.font = [UIFont systemFontOfSize:BUTTON_TITLEFONT];
    
    [customButton setTitle:title forState:UIControlStateNormal];
    
    [customButton setTitleColor:normalColor forState:UIControlStateNormal];
    
    if (highlightedColor) {
        
        [customButton setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    }
    }else if(imageNamed){
     [customButton setImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
    }
    [customButton addTarget:self action:@selector (goBackPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navBarView addSubview:customButton];
}
#pragma mark ======= setter

- (void)setIsShowLine:(BOOL)isShowLine{
    _isShowLine = isShowLine;
    if (!isShowLine) {
        [self.lineView removeFromSuperview];
        self.lineView = nil;
    }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage{
    if (backgroundImage) {
        _backgroundImage = backgroundImage;
        _backgroundImageView.image = backgroundImage;
    }
}
- (void)setNavTitle:(NSString *)navTitle{
    _navTitle = navTitle;
    self.titleLabel.text = _navTitle;
}
- (void)setNavTitleFont:(CGFloat)navTitleFont{
    _navTitleFont = navTitleFont;
    self.titleLabel.font = [UIFont systemFontOfSize:_navTitleFont];
}
- (void)setNavTitleColor:(UIColor *)navTitleColor{
    _navTitleColor = navTitleColor;
    self.titleLabel.textColor = _navTitleColor;
}
#pragma mark ======= getter
- (CGFloat)space{
    if (!_space) {
        _space = ITEMSPACE_DEFAULT;
    }
    return _space;
}
- (CGFloat)leftBarButtonItemTitleFont{
    if (!_leftBarButtonItemTitleFont) {
        return BUTTON_TITLEFONT;
    }
    return _leftBarButtonItemTitleFont;
}
- (CGFloat)rightBarButtonItemTitleFont{
    if (!_rightBarButtonItemTitleFont) {
        return BUTTON_TITLEFONT;
    }
    return _leftBarButtonItemTitleFont;
}
#pragma mark ======= public methods
#pragma mark ======= left
#pragma mark --------- goBack
- (void)wya_goBackButtonWithImage:(NSString *)imageNamed{
    [self addLeftGoBackWithTitle:nil normalColor:nil highlightedColor:nil Image:imageNamed];
}

- (void)wya_goBackButtonWithTitle:(NSString *)title normalColor:(UIColor * _Nonnull)normalColor highlightedColor:(nonnull UIColor *)highlightedColor{
    
    [self addLeftGoBackWithTitle:title normalColor:normalColor highlightedColor:highlightedColor Image:nil];
}

#pragma mark ------------leftCustom
- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles{
    [self addLeftBarViewButtonWithNormalTitle:normalTitles normalColor:nil highlightedColor:nil NormalImage:nil highlightedImg:nil];
}
- (void)wya_addLeftNavBarButtonWithNormalImage:(NSArray<NSString *> *)normalImages highlightedImg:(NSArray<NSString *> *)highlightedImgs
{
    [self addLeftBarViewButtonWithNormalTitle:nil normalColor:nil highlightedColor:nil NormalImage:normalImages highlightedImg:highlightedImgs];
}

- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles normalColor:(NSArray<UIColor *> *)normalColors highlightedColor:(NSArray<UIColor *> *)highlightedColors{
    
    [self addLeftBarViewButtonWithNormalTitle:normalTitles normalColor:normalColors highlightedColor:highlightedColors NormalImage:nil highlightedImg:nil];
}
#pragma mark ======= right
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles{
    
}
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles normalColor:(NSArray<UIColor *> *)normalColors highlightedColor:(NSArray<UIColor *> *)highlightedColors{
    
}
- (void)wya_addRightNavBarButtonWithNormalImage:(NSArray<NSString *> *)normalImages highlightedImg:(NSArray<NSString *> *)highlightedImgs{
    
}
#pragma mark ======= leftAction
- (void)goBackPressed:(UIButton *)sender{
    NSLog(@"%@",sender.titleLabel.text);

    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_goBackPressed:)]) {
        [self.delegate wya_goBackPressed:sender];
    }
}
- (void)customLeftButtonPressed:(UIButton *)sender{
    NSLog(@"%@",sender.titleLabel.text);

    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_leftBarButtonItemPressed:)]) {
        [self.delegate wya_leftBarButtonItemPressed:sender];
    }
}
#pragma mark ======= rightAction
- (void)customRightButtonpressed:(UIButton *)sender{
    NSLog(@"%@",sender.titleLabel.text);
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_rightBarButtonItemPressed:)]) {
        [self.delegate wya_rightBarButtonItemPressed:sender];
    }
}
@end
