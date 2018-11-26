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
#define LEFTMARGIN
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
    if (itemsSpace==0.0f) {
        _itemsSpace = 10.f;
    }else{
        _itemsSpace = itemsSpace;
    }
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
@end
