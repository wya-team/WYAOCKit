//
//  WYAShareView.m
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/11/30.
//

#import "WYAShareView.h"
#define CMScale(a) (SizeAdapter*a)
@interface WYAShareView ()
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *shareView;
@property (nonatomic, strong) NSArray *shareItemsArray;
@end
@implementation WYAShareView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _backGroundView = [[UIView alloc]init];
        _titleLabel = [[UILabel alloc]init];
        _cancelButton = [[UIButton alloc]init];
        _lineView = [[UIView alloc]init];
        _shareView = [[UIView alloc]init];
        
        
        [_backGroundView addSubview:_titleLabel];
        [_backGroundView addSubview:_lineView];
        [_backGroundView addSubview:_shareView];
        [_backGroundView addSubview:_cancelButton];
        [self addSubview:_backGroundView];
        
    }
    [self setUI];
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _backGroundView.cmam_bottom = self.cmam_bottom;
    _backGroundView.cmam_width = ScreenWidth;
    _backGroundView.cmam_height = 205*SizeAdapter;
    
    _titleLabel.cmam_top = 0;
    _titleLabel.cmam_width = ScreenWidth;
    _titleLabel.cmam_height = 38*SizeAdapter;
    
    _lineView.cmam_width = ScreenWidth;
    _lineView.cmam_top = _titleLabel.cmam_bottom;
    _lineView.cmam_height = 1;
    
    _shareView.cmam_top = _lineView.cmam_bottom;
    _shareView.cmam_width = ScreenWidth;
    _shareView.cmam_height = 123*SizeAdapter;
    
    _cancelButton.cmam_top = _shareView.cmam_bottom;
    _cancelButton.cmam_width = ScreenWidth;
    _cancelButton.cmam_height = 44;
}

#pragma mark ====== Action
// cancel
- (void)cancelButtonClicked:(UIButton *)sender{
    NSLog(@"取消");
    [self disappear];
}
- (void)disappear{
    self.backgroundColor = [UIColor clearColor];
    [UIView animateWithDuration:0.25f animations:^{
        self.backGroundView.cmam_bottom = self.cmam_bottom+205*SizeAdapter;
        self.backGroundView.cmam_width = ScreenWidth;
        self.backGroundView.cmam_height = 205*SizeAdapter;
    }];
    [self removeFromSuperview];
    self.hidden = YES;
}
// share Button Clicked
- (void)shareItemClicked:(UIButton *)sender
{
    NSInteger index = sender.tag - 1000;
    NSString * itemsNamed = _shareItemsArray[index];
    if ([itemsNamed isEqualToString:@"微信"])
    {
        [self aleartControllerWith:@"微信好友" openType:WYAShareViewItemWeChat];
    }
    if ([itemsNamed isEqualToString:@"朋友圈"])
    {
        [self aleartControllerWith:@"朋友圈" openType:WYAShareViewItemWeChatFriends];
    }
    if ([itemsNamed isEqualToString:@"QQ好友"])
    {
        [self aleartControllerWith:@"QQ好友" openType:WYAShareViewItemQQ];
    }
    if ([itemsNamed isEqualToString:@"QQ空间"])
    {
        [self aleartControllerWith:@"QQ空间" openType:WYAShareViewItemQQZone];
    }
    if ([itemsNamed isEqualToString:@"微博"])
    {
        [self aleartControllerWith:@"微博" openType:WYAShareViewItemSina];
    }
    
}
#pragma mark ====== Custom method
/**
 Sets the color and text events of the view control
 */
- (void)setUI{
    
    
    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(disappear)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGestureRecognizer];
    
    // Add a blackColor mask
    UIColor *color = [UIColor blackColor];
    self.backgroundColor = [color colorWithAlphaComponent:0.5];
    
    _titleLabel.text = @"分享到";
    _titleLabel.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
    _titleLabel.font = FONT(15);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor colorWithRed:118/255.0 green:118/255.0 blue:118/255.0 alpha:1];
    
    _lineView.backgroundColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    
    _shareView.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
    
    _cancelButton.backgroundColor = [UIColor whiteColor];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    UIColor * cancelButtonTitleColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [_cancelButton setTitleColor:cancelButtonTitleColor forState:UIControlStateNormal];
    _cancelButton.titleLabel.font = FONT(17);
    _cancelButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_cancelButton addTarget:self
                      action:@selector(cancelButtonClicked:)
            forControlEvents:UIControlEventTouchUpInside];
}
// add show share Items on self
- (void)showShareViewItems:(NSArray *)items{
    CGFloat X = ((ScreenWidth)-(items.count)*(45*SizeAdapter))/(items.count+1);
    CGFloat buttonX = X;
    CGFloat buttonY = CMScale(27);
    CGFloat buttonW = CMScale(45);
    CGFloat buttonH = CMScale(45);
    CGFloat Width_Space = buttonX;
    CGFloat labelH = CMScale(12.5);
    CGFloat labelW = CMScale(45);
    CGFloat labelY= CMScale(80);
    for (int i=0; i<items.count; i++) {
        NSInteger column = i%items.count;
        
        UIButton * shareItem = [[UIButton alloc]initWithFrame:CGRectMake(column * (buttonW + Width_Space) + buttonX,buttonY, buttonW, buttonH)];
        NSString * imageNamed = items[i];
        UIImage * image = [UIImage loadBundleImage:imageNamed ClassName:NSStringFromClass([self class])];
        // 设置r图片
        shareItem.tag = 1000 + i;
        [shareItem addTarget:self action:@selector(shareItemClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [shareItem setBackgroundImage:image forState:UIControlStateNormal];
        
        UILabel * shareLabel = [[UILabel alloc] init];
        shareLabel.frame = CGRectMake(column * (labelW + Width_Space) + buttonX,labelY, labelW, labelH);
        shareLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        shareLabel.font = FONT(15);
        shareLabel.textAlignment = NSTextAlignmentCenter;
        shareLabel.adjustsFontSizeToFitWidth = YES;
        shareLabel.text = items[i];
        
        [_shareView addSubview:shareItem];
        [_shareView addSubview:shareLabel];
    }
    [self layoutIfNeeded];
}

+ (instancetype)showShareViewController:(UIViewController *)onViewController withItems:(WYAShareViewItemType) WYAShareViewItems
{
   WYAShareView * shareView = [[WYAShareView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    shareView.controller = onViewController;
    [shareView showShareViewItems:[shareView getShowShareItems: WYAShareViewItems]];
    [onViewController.view addSubview:shareView];
    return shareView;
}
// get needShow share items
- (NSArray *)getShowShareItems:(WYAShareViewItemType)itemTypes{
    NSMutableArray * shareItems = [NSMutableArray array];
    if (itemTypes & WYAShareViewItemWeChat) {
        [shareItems addObject:@"微信"];
    }
    if (itemTypes & WYAShareViewItemWeChatFriends) {
        [shareItems addObject:@"朋友圈"];
    }
    if (itemTypes & WYAShareViewItemQQ) {
        [shareItems addObject:@"QQ好友"];
    }
    if (itemTypes & WYAShareViewItemQQZone) {
        [shareItems addObject:@"QQ空间"];
    }
    if (itemTypes & WYAShareViewItemSina) {
        [shareItems addObject:@"微博"];
    }
    if (itemTypes == WYAShareViewAllItems) {
        
        [shareItems addObjectsFromArray:@[@"微信",@"朋友圈",@"QQ好友",@"QQ空间",@"微博"]];
    }
    _shareItemsArray = [shareItems copy];
    return [shareItems copy];
}
/**
 * @Description aleart ask if it is open shareApp
 * @param message tip message
 * @param type shareApp type PS: WeChat/QQ/Sina....
 */
- (void)aleartControllerWith:(NSString *)message openType:(WYAShareViewItemType)type
{
    __weak typeof(self)weakSelf = self;
    
    [UIView animateWithDuration:0.25f animations:^{
        self->_backGroundView.cmam_bottom = weakSelf.cmam_bottom+WYABottomHeight;
        self->_backGroundView.cmam_width = ScreenWidth;
        self->_backGroundView.cmam_height = WYABottomHeight;
    }];
    
    NSString * title = [NSString stringWithFormat:@"是否支持打开“%@”",message];
    UIAlertController *aleart = [UIAlertController alertControllerWithTitle:title
                                                                    message:nil
                                                             preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         if (weakSelf.WYAShareDekegate && [weakSelf.WYAShareDekegate
                                                                                                  respondsToSelector:@selector(shareButtonClicked:)]) {
                                                             [weakSelf disappear];
                                                             [weakSelf.WYAShareDekegate shareButtonClicked:type];
                                                         }
                                                     }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             
                                                             [UIView animateWithDuration:0.25f animations:^{
                                                                 self->_backGroundView.cmam_bottom = weakSelf.cmam_bottom;
                                                                 self->_backGroundView.cmam_width = ScreenWidth;
                                                                 self->_backGroundView.cmam_height = WYABottomHeight;
                                                             }];
                                                             
                                                         }];
    [aleart addAction:cancelAction];
    [aleart addAction:okAction];
    [[self cmam_viewController] presentViewController:aleart animated:YES completion:^{}];
}
@end
