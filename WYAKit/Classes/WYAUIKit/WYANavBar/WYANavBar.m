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
#define ITEMSPACE_DEFAULT (0.f * SizeAdapter)
#define LEFT_OR_RIGHT_SPACE (15.0 * SizeAdapter)
#define LEFT_BASE_TAG 1000
#define RIGHT_BASE_TAG 2000

@interface WYANavBar ()
/// 标题label
@property (nonatomic, strong) UILabel * titleLabel;
/// 背景图片
@property (nonatomic, strong) UIImageView * backgroundImageView;
/// 导航栏视图44
@property (nonatomic, strong) UIView * navBarView;
/// 底部分割线
@property (nonatomic, strong) UIView * lineView;
/// 左边第一个按钮（返回）
@property (nonatomic, strong) UIButton * leftButtonOne;
/// 左边第二个按钮
@property (nonatomic, strong) UIButton * leftButtonTwo;
/// 右边第一个按钮
@property (nonatomic, strong) UIButton * rightButtonOne;
/// 右边第二个按钮
@property (nonatomic, strong) UIButton * rightButtonTwo;

@end

@implementation WYANavBar
#pragma mark ======= LifeCircle
- (instancetype)init {
    if (self = [super init]) {
        [self setDefaultVConfig];
        self.frame           = CGRectMake(0, 0, ScreenWidth, WYATopHeight);
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.backgroundImageView];
        [self.backgroundImageView addSubview:self.navBarView];
        [self.navBarView addSubview:self.pageItemView];
        [self.navBarView addSubview:self.titleLabel];
        [self.navBarView addSubview:self.lineView];
        [self.navBarView addSubview:self.leftButtonOne];
        [self.navBarView addSubview:self.leftButtonTwo];
        [self.navBarView addSubview:self.rightButtonOne];
        [self.navBarView addSubview:self.rightButtonTwo];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setDefaultVConfig];
        self.frame           = CGRectMake(0, 0, ScreenWidth, WYATopHeight);
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.backgroundImageView];
        [self.backgroundImageView addSubview:self.navBarView];
        [self.navBarView addSubview:self.pageItemView];
        [self.navBarView addSubview:self.titleLabel];
        [self.navBarView addSubview:self.lineView];
        [self.navBarView addSubview:self.leftButtonOne];
        [self.navBarView addSubview:self.leftButtonTwo];
        [self.navBarView addSubview:self.rightButtonOne];
        [self.navBarView addSubview:self.rightButtonTwo];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];

    if ([self.cmam_viewController isKindOfClass:[UITableViewController class]]) {
        self.frame = CGRectMake(0, -WYAStatusBarHeight, ScreenWidth, WYATopHeight);
    }

    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.top.bottom.mas_equalTo(self);
    }];

    [self.navBarView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.top.equalTo(self.backgroundImageView.mas_top).offset(WYAStatusBarHeight);
        make.left.mas_equalTo(self.backgroundImageView);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, WYANavBarHeight));
    }];

    [self.pageItemView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.navBarView.mas_left).offset(46);
        make.right.equalTo(self.navBarView.mas_right).offset(-46);
        make.top.equalTo(self.navBarView.mas_top).offset(0);
        make.height.mas_equalTo(WYANavBarHeight);
    }];

    [self.leftButtonOne mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.navBarView.mas_left).offset(LEFT_OR_RIGHT_SPACE);
        make.top.bottom.mas_equalTo(self.navBarView);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];

    [self.leftButtonTwo mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.leftButtonOne.mas_right).offset(self->_space);
        make.top.bottom.mas_equalTo(self.navBarView);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];


    [self.rightButtonOne mas_makeConstraints:^(MASConstraintMaker * make) {
        make.right.equalTo(self.navBarView.mas_right).offset(-LEFT_OR_RIGHT_SPACE);
        make.top.bottom.mas_equalTo(self.navBarView);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];

    [self.rightButtonTwo mas_makeConstraints:^(MASConstraintMaker * make) {
        make.right.equalTo(self.rightButtonOne.mas_left).offset(-self->_space);
        make.top.bottom.mas_equalTo(self.navBarView);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(self.navBarView.mas_top);
        make.left.mas_equalTo(self.leftButtonTwo.mas_right);
        make.right.mas_equalTo(self.rightButtonTwo.mas_left);
        make.height.mas_equalTo(44);
    }];

    [_lineView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.bottom.mas_equalTo(self.navBarView);
        make.height.mas_equalTo(0.5);
    }];
}

#pragma mark ======= setter
- (void)setNavTitle:(NSString *)navTitle{
    _navTitle = navTitle;
    self.titleLabel.text = navTitle;
}
- (void)setNavTitleFont:(CGFloat)navTitleFont{
    _navTitleFont = navTitleFont;
    self.titleLabel.font = FONT(_navTitleFont);
}
- (void)setNavTitleColor:(UIColor *)navTitleColor{
    _navTitleColor = navTitleColor;
    self.titleLabel.textColor = _navTitleColor;
}
- (void)setLeftBarButtonItemTitleFont:(CGFloat)leftBarButtonItemTitleFont{
    _leftBarButtonItemTitleFont = leftBarButtonItemTitleFont;
    self.leftButtonOne.titleLabel.font = FONT(_leftBarButtonItemTitleFont);
    self.leftButtonTwo.titleLabel.font = FONT(_leftBarButtonItemTitleFont);
}
- (void)setRightBarButtonItemTitleFont:(CGFloat)rightBarButtonItemTitleFont{
    _rightBarButtonItemTitleFont = rightBarButtonItemTitleFont;
    self.rightButtonOne.titleLabel.font = FONT(_rightBarButtonItemTitleFont);
    self.rightButtonTwo.titleLabel.font = FONT(_rightBarButtonItemTitleFont);
}

- (void)setIsShowLine:(BOOL)isShowLine{
    _isShowLine = isShowLine;
    self.lineView.hidden = _isShowLine;
}
- (void)setBackgroundImage:(UIImage *)backgroundImage{
    _backgroundImage = backgroundImage;
    self.backgroundImageView.image = _backgroundImage;
}
- (void)setLeftButtons:(NSArray<UIButton *> *)leftButtons{
    UIButton * tempButton = [leftButtons firstObject];
    NSString * title = tempButton.titleLabel.text;
    UIImage * image = tempButton.imageView.image;
    [self.leftButtonOne setTitle:title forState:0];
    [self.leftButtonOne setImage:image forState:0];
    UIButton * tempButton2 = [leftButtons lastObject];
    NSString * title2 = tempButton2.titleLabel.text;
    UIImage * image2 = tempButton2.imageView.image;
    [self.leftButtonTwo setTitle:title2 forState:0];
    [self.leftButtonTwo setImage:image2 forState:0];
}
- (void)setRightButtons:(NSArray<UIButton *> *)rightButtons{
    UIButton * tempButton = [rightButtons firstObject];
    NSString * title = tempButton.titleLabel.text;
    UIImage * image = tempButton.imageView.image;
    [self.rightButtonOne setTitle:title forState:0];
    [self.rightButtonOne setImage:image forState:0];
    UIButton * tempButton2 = [rightButtons lastObject];
    NSString * title2 = tempButton2.titleLabel.text;
    UIImage * image2 = tempButton2.imageView.image;
    [self.rightButtonTwo setTitle:title2 forState:0];
    [self.rightButtonTwo setImage:image2 forState:0];
}
#pragma mark ======= public methods
#pragma mark ======= right Button
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *> * _Nonnull)normalTitles{
    [self.rightButtonOne setImage:[UIImage imageNamed:@""] forState:0];
    [self.rightButtonOne setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    [self.rightButtonTwo setImage:[UIImage imageNamed:@""] forState:0];
    [self.rightButtonTwo setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    self.rightButtonTwo.hidden = YES;
    [self.rightButtonOne setTitle:[normalTitles firstObject] forState:0];
    if (normalTitles.count > 1) {
        self.rightButtonTwo.hidden = NO;
        [self.rightButtonTwo setTitle:[normalTitles lastObject] forState:0];
    }
}
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles
                                    normalColor:(NSArray<UIColor *> * _Nonnull)normalColors
                               highlightedColor:(NSArray<UIColor *> * _Nonnull)highlightedColors{
    [self.rightButtonOne setImage:[UIImage imageNamed:@""] forState:0];
    [self.rightButtonOne setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    [self.rightButtonTwo setImage:[UIImage imageNamed:@""] forState:0];
    [self.rightButtonTwo setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    self.rightButtonTwo.hidden = YES;
    if (normalTitles.count < 1) {
         self.rightButtonOne.hidden = YES;
    }else{
        self.rightButtonOne.hidden = NO;
    }
    [self.rightButtonOne setTitle:[normalTitles firstObject] forState:0];
    if (normalTitles.count > 1) {
        self.rightButtonTwo.hidden = NO;
        [self.rightButtonTwo setTitle:[normalTitles lastObject] forState:0];
    }

    if (normalColors.count > 0) {
        [self.rightButtonOne setTitleColor:[normalColors firstObject] forState:0];
        if (normalColors.count > 1) {
            self.rightButtonTwo.hidden = NO;
            [self.rightButtonTwo setTitleColor:[normalColors lastObject] forState:0];
        }
    }
    if (highlightedColors.count > 0) {
        [self.rightButtonOne setTitleColor:[highlightedColors firstObject] forState:UIControlStateHighlighted];
        if (highlightedColors.count > 1) {
            self.rightButtonTwo.hidden = NO;
            [self.rightButtonTwo setTitleColor:[highlightedColors lastObject] forState:UIControlStateHighlighted];
        }
    }
}
- (void)wya_addRightNavBarButtonWithNormalImage:(NSArray<NSString *> *)normalImages highlightedImg:(NSArray<NSString *> *)highlightedImgs{
    [self.rightButtonOne setTitle:@"" forState:0];
    [self.rightButtonOne setTitle:@"" forState:UIControlStateHighlighted];
    [self.rightButtonTwo setTitle:@"" forState:0];
    [self.rightButtonTwo setTitle:@"" forState:UIControlStateHighlighted];
    [self.rightButtonOne setImage:[UIImage imageNamed:[normalImages firstObject]] forState:0];
    if (normalImages.count < 1) {
        self.rightButtonOne.hidden = YES;
    }
    self.rightButtonTwo.hidden = YES;
    if (normalImages.count > 1) {
        self.rightButtonTwo.hidden = NO;
        [self.rightButtonTwo setImage:[UIImage imageNamed:[normalImages lastObject]] forState:0];
    }
    if (highlightedImgs.count > 0) {
        [self.rightButtonOne setImage:[UIImage imageNamed:[highlightedImgs firstObject]] forState:UIControlStateHighlighted];
        if (highlightedImgs.count > 1) {
            self.rightButtonTwo.hidden = NO;
            [self.rightButtonTwo setImage:[UIImage imageNamed:[highlightedImgs lastObject]] forState:UIControlStateHighlighted];
        }
    }
}
#pragma mark ======= left Button

- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles{
    [self.leftButtonOne setImage:[UIImage imageNamed:@""] forState:0];
    [self.leftButtonOne setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    [self.leftButtonTwo setImage:[UIImage imageNamed:@""] forState:0];
    [self.leftButtonTwo setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    self.leftButtonTwo.hidden = YES;
    [self.leftButtonOne setTitle:[normalTitles firstObject] forState:0];
    if (normalTitles.count > 1) {
        self.leftButtonTwo.hidden = NO;
        [self.leftButtonTwo setTitle:[normalTitles lastObject] forState:0];
    }
}

- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles normalColor:(NSArray<UIColor *> *)normalColors highlightedColor:(NSArray<UIColor *> *)highlightedColors{
    [self.leftButtonOne setImage:[UIImage imageNamed:@""] forState:0];
    [self.leftButtonOne setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    [self.leftButtonTwo setImage:[UIImage imageNamed:@""] forState:0];
    [self.leftButtonTwo setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    [self.leftButtonOne setTitle:[normalTitles firstObject] forState:0];
    self.leftButtonTwo.hidden = YES;
    if (normalTitles.count > 1) {
        self.leftButtonTwo.hidden = NO;
        [self.leftButtonTwo setTitle:[normalTitles lastObject] forState:0];
    }

    if (normalColors.count > 0) {
        [self.leftButtonOne setTitleColor:[normalColors firstObject] forState:0];
        if (normalColors.count > 1) {
            self.leftButtonTwo.hidden = NO;
            [self.leftButtonTwo setTitleColor:[normalColors lastObject] forState:0];
        }
    }
    if (highlightedColors.count > 0) {
        [self.leftButtonOne setTitleColor:[highlightedColors firstObject] forState:UIControlStateHighlighted];
        if (highlightedColors.count > 1) {
            self.leftButtonTwo.hidden = NO;
            [self.leftButtonTwo setTitleColor:[highlightedColors lastObject] forState:UIControlStateHighlighted];
        }
    }
}

- (void)wya_addLeftNavBarButtonWithNormalImage:(NSArray<NSString *> *)normalImages highlightedImg:(NSArray<NSString *> *)highlightedImgs{
    [self.leftButtonOne setTitle:@"" forState:0];
    [self.leftButtonOne setTitle:@"" forState:UIControlStateHighlighted];
    [self.leftButtonTwo setTitle:@"" forState:0];
    [self.leftButtonTwo setTitle:@"" forState:UIControlStateHighlighted];
    self.leftButtonTwo.hidden = YES;
    [self.leftButtonOne setImage:[UIImage imageNamed:[normalImages firstObject]] forState:0];
    if (normalImages.count > 1) {
        self.leftButtonTwo.hidden = NO;
        [self.leftButtonTwo setImage:[UIImage imageNamed:[normalImages lastObject]] forState:0];
    }
    if (highlightedImgs.count > 0) {
        [self.leftButtonOne setImage:[UIImage imageNamed:[highlightedImgs firstObject]] forState:UIControlStateHighlighted];
        if (highlightedImgs.count > 1) {
            self.leftButtonTwo.hidden = NO;
            [self.leftButtonTwo setImage:[UIImage imageNamed:[highlightedImgs lastObject]] forState:UIControlStateHighlighted];
        }
    }
}


- (void)wya_goBackButtonWithTitle:(NSString *)title
                      normalColor:(UIColor * _Nullable)normalColor
                 highlightedColor:(UIColor * _Nullable)highlightedColor{
    [self.leftButtonOne setTitle:@"" forState:0];
    [self.leftButtonOne setTitle:@"" forState:UIControlStateHighlighted];
    [self.leftButtonOne setTitle:title forState:0];
    [self.leftButtonOne setTitleColor:normalColor forState:0];
    [self.leftButtonOne setTitleColor:highlightedColor forState:UIControlStateHighlighted];
}

- (void)wya_goBackButtonWithImage:(NSString *)imageNamed{
    [self.leftButtonOne setTitle:@"" forState:0];
    [self.leftButtonOne setTitle:@"" forState:UIControlStateHighlighted];
    [self.leftButtonOne setImage:[UIImage imageNamed:imageNamed] forState:0];
}
- (void)wya_customGobackWithImage:(UIImage *)image{
    [self.leftButtonOne setTitle:@"" forState:0];
    [self.leftButtonOne setTitle:@"" forState:UIControlStateHighlighted];
    [self.leftButtonOne setImage:image forState:0];
}
#pragma mark ======= leftAction

/// 左侧第一个按钮点击事件
- (void)leftButtonPressed:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_leftBarButtonItemPressed:)]) {
        [self.delegate wya_leftBarButtonItemPressed:sender];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_goBackPressed:)]) {
                [self.delegate wya_goBackPressed:sender];
    }
}
#pragma mark ======= rightAction
- (void)rightButtonpressed:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_rightBarButtonItemPressed:)]) {
        [self.delegate wya_rightBarButtonItemPressed:sender];
    }
}
#pragma mark ======= Lazy
- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor                   = [UIColor blackColor];
            object.font                        = [UIFont systemFontOfSize:TITLEFONT];
            object.adjustsFontSizeToFitWidth   = YES;
            object.textAlignment               = NSTextAlignmentCenter;
            object;
        });
    }
    return _titleLabel;
}

- (UIImageView *)backgroundImageView{
    if(!_backgroundImageView){
        _backgroundImageView = ({
            UIImageView * object = [[UIImageView alloc]init];
            object.userInteractionEnabled = YES;
            object.contentMode = UIViewContentModeScaleAspectFill;
            object;
        });
    }
    return _backgroundImageView;
}

- (UIView *)navBarView{
    if(!_navBarView){
        _navBarView = ({
            UIView * object = [[UIView alloc]init];
            object;
        });
    }
    return _navBarView;
}
- (UIView *)pageItemView{
    if(!_pageItemView){
        _pageItemView = ({
            UIView * object = [[UIView alloc]init];
            object;
        });
    }
    return _pageItemView;
}
- (UIView *)lineView{
    if(!_lineView){
        _lineView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor                   = [UIColor groupTableViewBackgroundColor];
            object;
        });
    }
    return _lineView;
}

- (UIButton *)leftButtonOne{
    if(!_leftButtonOne){
        _leftButtonOne = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            object.imageView.contentMode = UIViewContentModeScaleAspectFill;
            object.titleLabel.font = FONT(_leftBarButtonItemTitleFont);
            object.tag = LEFT_BASE_TAG;
            object.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [object addTarget:self action:@selector(leftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _leftButtonOne;
}

- (UIButton *)leftButtonTwo{
    if(!_leftButtonTwo){
        _leftButtonTwo = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            object.imageView.contentMode = UIViewContentModeScaleAspectFill;
            object.titleLabel.font = FONT(_leftBarButtonItemTitleFont);
            object.tag = LEFT_BASE_TAG + 1;
            object.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [object addTarget:self action:@selector(leftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _leftButtonTwo;
}

- (UIButton *)rightButtonOne{
    if(!_rightButtonOne){
        _rightButtonOne = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            object.imageView.contentMode = UIViewContentModeScaleAspectFill;
            object.titleLabel.font = FONT(_rightBarButtonItemTitleFont);
            object.tag = RIGHT_BASE_TAG;
            object.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            [object addTarget:self action:@selector(rightButtonpressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _rightButtonOne;
}

- (UIButton *)rightButtonTwo{
    if(!_rightButtonTwo){
        _rightButtonTwo = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            object.imageView.contentMode = UIViewContentModeScaleAspectFill;
            object.titleLabel.font = FONT(_rightBarButtonItemTitleFont);
            object.tag = RIGHT_BASE_TAG + 1;
            object.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            [object addTarget:self action:@selector(rightButtonpressed:) forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _rightButtonTwo;
}
#pragma mark ======= private methods
/// 设置默认的字体大小按钮z标题大小等属性
- (void)setDefaultVConfig {
    _navTitleFont                               = TITLEFONT;
    _space                                  = ITEMSPACE_DEFAULT;
    _leftBarButtonItemTitleFont = BUTTON_TITLEFONT;
    _rightBarButtonItemTitleFont = BUTTON_TITLEFONT;
}
@end
