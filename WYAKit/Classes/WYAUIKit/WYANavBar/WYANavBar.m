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
@interface WYANavBar()
@property (nonatomic, strong) UILabel * titleLabel;// 标题
@property (nonatomic, strong) UIImageView * backgroundImageView;// 背景图片
@property (nonatomic, strong) UIView * navBarView;// 导航栏View
@property (nonatomic, strong) UIView * leftView;
@property (nonatomic, strong) UIView * rightView;
@property (nonatomic, strong) UIView * lineView;
@end
@implementation WYANavBar
- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, ScreenWidth, WYATopHeight);
        _titleLabel = [[UILabel alloc]init];
        _backgroundImageView = [[UIImageView alloc]init];
        _navBarView = [[UIView alloc]init];
        _leftView = [[UIView alloc]init];
        _rightView = [[UIView alloc]init];
        _lineView = [[UIView alloc]init];
        
        [self addSubview:_backgroundImageView];
        [_backgroundImageView addSubview:_navBarView];
        [_navBarView addSubview:_titleLabel];
        [_navBarView addSubview:_leftView];
        [_navBarView addSubview:_rightView];
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
        _leftView = [[UIView alloc]init];
        _rightView = [[UIView alloc]init];
        _lineView = [[UIView alloc]init];
        
        [self addSubview:_backgroundImageView];
        [_backgroundImageView addSubview:_navBarView];
        [_navBarView addSubview:_titleLabel];
        [_navBarView addSubview:_leftView];
        [_navBarView addSubview:_rightView];
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
    
    if (_backBarButton) {
        CGFloat height = _backBarButton.cmam_height > WYANavBarHeight ? (WYANavBarHeight - 10.0) : _backBarButton.cmam_height;
        CGFloat top = (self.navBarView.cmam_height - height)*0.5;
        [_backBarButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.navBarView.mas_left).offset(LEFT_OR_RIGHT_SPACE);
            make.top.equalTo(self.navBarView.mas_top).offset(top);
            make.size.mas_equalTo(self.backBarButton.cmam_size);
        }];
    }else if(self.leftBarButtonItems.count>0){
        CGFloat width = 0;
        for (UIButton  * tempButton in self.leftBarButtonItems) {
            width += tempButton.cmam_width;
            width += self.itemsSpace;
        }
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.navBarView.mas_left).offset(LEFT_OR_RIGHT_SPACE);
            make.top.equalTo(self.navBarView.mas_top).offset(0);
            make.size.mas_equalTo(CGSizeMake(width, WYANavBarHeight));
        }];
    }
    
    if(self.rightBarButtonItems.count>0){
        CGFloat width = 0;
        for (UIButton  * tempButton in self.rightBarButtonItems) {
            width += tempButton.cmam_width;
            width += self.itemsSpace;
        }
        [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.navBarView.mas_right).offset(-LEFT_OR_RIGHT_SPACE);
            make.top.equalTo(self.navBarView.mas_top).offset(0);
            make.size.mas_equalTo(CGSizeMake(width, WYANavBarHeight));
        }];
    }
    
    if (self.titleView) {
        CGFloat left = 0;
        if (self.backBarButton) {
            left = CGRectGetMaxX(self.backBarButton.frame);
        }else if(self.leftBarButtonItems.count>0){
            left = CGRectGetMaxX(self.leftView.frame);
        }
        CGFloat right = 0;
        if(self.rightBarButtonItems.count>0){
            left = CGRectGetMaxX(self.rightView.frame);
        }
        
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.navBarView.mas_left).offset(left);
            make.right.equalTo(self.navBarView.mas_right).offset(-right);
        }];
    }else{
        
    }
}
#pragma mark ======= private methods
- (void)setUp{
    self.backgroundColor = [UIColor whiteColor];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = FONT(TITLEFONT);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    _lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}
#pragma mark ======= setter
- (void)setTitle:(NSString *)title{
    if (title) {
        _title = title;
        _titleLabel.text = _title;
    }
}
- (void)setTitleView:(UIView *)titleView{
    if (titleView) {
        _titleView = titleView;
        [self.navBarView addSubview:_titleView];
    }
}
- (void)setBackBarButton:(UIButton *)backBarButton{
    if (backBarButton) {
        _backBarButton = backBarButton;
        [self.leftView addSubview:_backBarButton];
    }
}

- (void)setIsShowLine:(BOOL)isShowLine{
    _isShowLine = isShowLine;
    if (!isShowLine) {
        [self.lineView removeFromSuperview];
        self.lineView = nil;
    }
}
- (void)setItemsSpace:(CGFloat)itemsSpace{
    
}

- (void)setBackgroundImage:(UIImage *)backgroundImage{
    if (backgroundImage) {
        _backgroundImage = backgroundImage;
        _backgroundImageView.image = backgroundImage;
    }
}
- (void)setLeftBarButtonItems:(NSArray<UIButton *> *)leftBarButtonItems{
    
}
- (void)setRightBarButtonItems:(NSArray<UIButton *> *)rightBarButtonItems{
    
}
#pragma mark ======= getter
- (CGFloat)itemsSpace{
    return self.itemsSpace == 0 ? ITEMSPACE_DEFAULT : self.itemsSpace;
}
@end
