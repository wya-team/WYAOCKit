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
#define BASE_TAG 1000
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
- (void)addLeftBarButton:(NSArray *)leftArray isImg:(BOOL)isImg isTitleAndImg:(BOOL)isTitleAndImg{
    CGFloat startX = LEFT_OR_RIGHT_SPACE;
    CGFloat startY = 4.0f;
    CGFloat width = 36;
    CGFloat height = 36;
    CGFloat space = ITEMSPACE_DEFAULT;
    for (int i = 0; i < leftArray; i++) {
        if (!isImg) {
            width = [[leftArray wya_safeObjectAtIndex:i] wya_widthWithFontSize:BUTTON_TITLEFONT height:height];
        }
        int column = i%leftArray.count;
        UIButton * customButton = [UIButton buttonWithType:UIButtonTypeCustom];
        customButton.frame = CGRectMake(startX + column*(width + space), startY, width, height);
        customButton.tag = BASE_TAG + i;
        customButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        customButton.titleLabel.font = [UIFont systemFontOfSize:BUTTON_TITLEFONT];
//        [customButton setTitleColor:normalColors[i] forState:UIControlStateNormal];
//        [customButton setTitleColor:highlightedColors[i] forState:UIControlStateHighlighted];
        if (!isTitleAndImg) {
            
        }else{
           
        }
        
        [customButton addTarget:self action:@selector (customRightButtonsClicked:) forControlEvents:UIControlEventTouchUpInside];
    
        [customButton sizeToFit];
    }
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


@end
