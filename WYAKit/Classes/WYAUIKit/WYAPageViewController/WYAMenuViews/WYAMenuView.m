//
//  WYAMenuView.m
//  FMDB
//
//  Created by 李俊恒 on 2018/11/14.
//

#import "WYAMenuView.h"
#define WYAMENUITEM_TAG_OFFSET 6250
#define WYABADGEVIEW_TAG_OFFSET 1212
#define WYADEFAULT_VALUE(value, defaultValue) (value != WYAUNDEFINED_VALUE ? value : defaultValue)

@interface WYAMenuView()

@property (nonatomic, weak) WYAMenuItem * selItem;

@property (nonatomic, strong) NSMutableArray * frames;

@property (nonatomic, assign) NSInteger  selectIndex;

@property (nonatomic,readonly) NSInteger titlesCount;

@end

@implementation WYAMenuView
@synthesize progressHeight = _progressHeight;
@synthesize progressViewCornerRadius = _progressViewCornerRadius;
#pragma mark ======= Setter
- (void)setLayoutMode:(WYAMenuViewLayoutMode)layoutMode{
    _layoutMode = layoutMode;
    if (!self.subviews) {return;}
    [self wya_reload];
}
- (void)setFrame:(CGRect)frame{
    // Adapt iOS 11 if is a titleView
    if (@available(ios  11.0, *)) {
        if (self.showOnNavigationBar) {frame.origin.x = 0;}
    }
    [super setFrame:frame];
    if (!self.scrollView) {return;}
    CGFloat leftMargin = self.contentMargin + self.leftView.frame.size.width;
    CGFloat rightMargin = self.contentMargin + self.rightView.frame.size.width;
    CGFloat contentWidth = self.scrollView.frame.size.width + leftMargin + rightMargin;
    CGFloat startX = self.leftView ? self.leftView.frame.origin.x : self.scrollView.frame.origin.x - self.contentMargin;
    // Make the contentView center, because system will change menuView's frame if it's a titleView.
    if (startX + contentWidth/2 != self.bounds.size.width/2) {
        CGFloat xOffset = (self.bounds.size.width/2);
        self.leftView.frame = ({
            CGRect frame = self.leftView.frame;
            frame.origin.x = xOffset;
            frame;
        });
        
        self.scrollView.frame = ({
            CGRect frame = self.scrollView.frame;
            frame.origin.x = self.leftView ? CGRectGetMaxX(self.leftView.frame) + self.contentMargin : xOffset;
            frame;
        });
        
        self.rightView.frame = ({
            CGRect frame = self.rightView.frame;
            frame.origin.x = CGRectGetMaxX(self.scrollView.frame) + self.contentMargin;
            frame;
        });
    }
}
- (void)setProgressViewCornerRadius:(CGFloat)progressViewCornerRadius{
    _progressViewCornerRadius = progressViewCornerRadius;
    if (self.progressView) {
        self.progressView.cornerRadius = _progressViewCornerRadius;
    }
}

- (void)setSpeedFactor:(CGFloat)speedFactor{
    _speedFactor = speedFactor;
    if (self.progressView) {
        self.progressView.speedFactor = _speedFactor;
    }
     __weak typeof(self) weakSelf = self;
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[WYAMenuItem class]]) {
            ((WYAMenuItem *)obj).speedFactor = weakSelf.speedFactor;
        }
    }];
}
- (void)setProgressWidths:(NSArray *)progressWidths{
    _progressWidths = progressWidths;
    if (!self.progressView.subviews) {return;}
//    [self resetFramesFromIndex:0];
}

- (void)setLeftView:(UIView *)leftView{
    if (self.leftView) {
        [self.leftView removeFromSuperview];
        _leftView = nil;
    }
    if (leftView) {
        [self addSubview:leftView];
        _leftView = leftView;
    }
    [self wya_resetFrames];
}
- (void)setRightView:(UIView *)rightView{
    if (self.rightView) {
        [self.rightView removeFromSuperview];
        _rightView = nil;
    }
    if(rightView){
        [self addSubview:rightView];
        _rightView = rightView;
    }
    [self wya_resetFrames];
}
- (void)setContentMargin:(CGFloat)contentMargin{
    _contentMargin = contentMargin;
    if (self.scrollView) {
        [self wya_resetFrames];
    }
}
#pragma mark ======= Getter
- (CGFloat)progressHeight{
    switch (self.style) {
        case WYAMenuViewStyleLine:
        case WYAMenuViewStyleTriangle:
            return WYADEFAULT_VALUE(_progressHeight, 2);
            break;
        case WYAMenuViewStyleFlood:
        case WYAMenuViewStyleSegmented:
        case WYAMenuViewStyleFloodHollow:
            return WYADEFAULT_VALUE(_progressHeight, ceil(self.frame.size.height * 0.8));
            break;
        default:
            return _progressHeight;
    }
}
- (CGFloat)progressViewCornerRadius{
    return WYADEFAULT_VALUE(_progressViewCornerRadius, self.progressHeight/2.0);
}
- (UIColor *)lineColor{
    if (!_lineColor) {
        _lineColor = [self colorForState:WYAMenuItemStateSelected atindex:0];
    }
    return _lineColor;
}
- (NSMutableArray *)frames{
    if (_frames == nil) {
        _frames = [NSMutableArray array];
    }
    return _frames;
}
// 当前index的颜色
- (UIColor *)colorForState:(WYAMenuItemState)state atIndex:(NSInteger)index{
    if ([self.delegate respondsToSelector:@selector(wya_menuView:titleColorForState:atIndex:)]) {
        return [self.delegate wya_menuView:self titleColorForState:state atIndex:index];
    }
    return [UIColor blackColor];
}
// index字体大小
- (CGFloat)sizeForState:(WYAMenuItemState)state atIndex:(NSInteger)index{
    if ([self.delegate respondsToSelector:@selector(wya_menuView:titleSizeForState:atIndex:)]) {
        return [self.delegate wya_menuView:self titleSizeForState:state atIndex:index];
    }
    return 15.0;
}

- (UIView *)badgeViewAtIndex:(NSInteger)index{
    if (![self.dataSource respondsToSelector:@selector(menuView:badgeViewAtIndex:)]) {
        return nil;
    }
    UIView *badgeView = [self.dataSource menuView:self badgeViewAtIndex:index];
    if (!badgeView) {
        return nil;
    }
    badgeView.tag = index + WYABADGEVIEW_TAG_OFFSET;
    
    return badgeView;
}
#pragma mark ======= Public Methods
- (WYAMenuItem *)wya_itemAtIndex:(NSInteger)index{
    return (WYAMenuItem *)[self viewWithTag:(index + WYAMENUITEM_TAG_OFFSET)];
}
- (void)setProgressViewIsNaughty:(BOOL)progressViewIsNaughty{
    _progressViewIsNaughty = progressViewIsNaughty;
    if (self.progressView) {
        self.progressView.naughty = progressViewIsNaughty;
    }
}

- (void)wya_reload{
    [self.frames removeAllObjects];
    [self.progressView removeFromSuperview];
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [self addItems];
    [self makeStyle];
    [self addBadgeViews];
}

- (void)wya_slidMenuAtProgress:(CGFloat)progress{
    if (self.progressView) {
        self.progressView.progress = progress;
    }
    NSInteger tag = (NSInteger)progress + WYAMENUITEM_TAG_OFFSET;
    CGFloat rate = progress - tag + WYAMENUITEM_TAG_OFFSET;
    WYAMenuItem * currentItem = (WYAMenuItem *)[self viewWithTag:tag];
    WYAMenuItem * nextItem = (WYAMenuItem *)[self viewWithTag:tag +1];
    if (rate == 0.0) {
        [self.selItem wya_setSelected:NO withAnimation:NO];
        self.selItem = currentItem;
        [self.selItem wya_setSelected:YES withAnimation:NO];
        [self wya_refreshContentOffset];
        return;
    }
    currentItem.rate = 1 - rate;
    nextItem.rate = rate;
}

- (void)wya_selectItemAtIndex:(NSInteger)index{
    NSInteger tag = index + WYAMENUITEM_TAG_OFFSET;
    NSInteger currentIndex = self.selItem.tag - WYAMENUITEM_TAG_OFFSET;
    self.selectIndex = index;
    if (index == currentIndex || !self.selItem) {return;}
    WYAMenuItem * item = (WYAMenuItem *)[self viewWithTag:tag];
    [self.selItem wya_setSelected:NO withAnimation:NO];
    self.selItem = item;
    [self.selItem wya_setSelected:YES withAnimation:NO];
    [self.progressView wya_setProgressWithOutAnimate:index];
    if ([self.delegate respondsToSelector:@selector(wya_menuView:didSelectedIndex:currentINdex:)]) {
        [self.delegate wya_menuView:self didSelectedIndex:index currentINdex:currentIndex];
    }
    [self wya_refreshContentOffset];
}

- (void)wya_updateTitle:(NSString *)title atIndex:(NSInteger)index anWidth:(BOOL)update{
    if (index >= self.titlesCount || index < 0) {return;}
    WYAMenuItem * item = (WYAMenuItem *)[self viewWithTag:(WYAMENUITEM_TAG_OFFSET + index)];
    item.text = title;
    if (!update) {return;}
    [self wya_resetFrames];
}

- (void)wya_updateAttributeTitle:(NSAttributedString *)title atIndex:(NSInteger)index andWidth:(BOOL)update{
    if (index >= self.titlesCount || index < 0) {return;}
    WYAMenuItem * item = (WYAMenuItem*)[self viewWithTag:(WYAMENUITEM_TAG_OFFSET + index)];
    item.attributedText = title;
    if (!update) {return;}
    [self wya_resetFrames];
}
- (void)wya_updateBadgeViewAtIndex:(NSInteger)index{
    UIView * oldBadgeView = [self.scrollView viewWithTag:WYABADGEVIEW_TAG_OFFSET + index];
    if (oldBadgeView) {
        [oldBadgeView removeFromSuperview];
    }
//    [self addBadgeViewAtIndex:index];
//    [self restBadgeFrame:index];
}

// 让选中的item居中
- (void)wya_refreshContentOffset{
    CGRect frame = self.selItem.frame;
    CGFloat itemX = frame.origin.x;
    CGFloat width = self.scrollView.frame.size.width;
    CGSize contentSize = self.scrollView.contentSize;
    if (itemX > width / 2) {
        CGFloat targetX;
        if ((contentSize.width - itemX) <= width/2) {
            targetX = contentSize.width - width;
        }else{
            targetX = frame.origin.x - width/2 + frame.size.width/2;
        }
        // 暂时这么解决，应该会有更好的方法
        if ((targetX + width) > contentSize.width) {
            targetX = contentSize.width - width;
        }
        [self.scrollView setContentOffset:CGPointMake(targetX, 0) animated:YES];
    }else{
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}

#pragma mark ======= Data source
- (NSInteger)titlesCount{
    return [self.dataSource wya_numberOfTitlesInMenuView:self];
}

#pragma mark ======= Private Methods
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.progressViewCornerRadius = WYAUNDEFINED_VALUE;
        self.progressHeight = WYAUNDEFINED_VALUE;
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    if (self.scrollView) {return;}
//    [self addScrollView];
//    [self addItems];
//    [self makeStyle];
//    [self addBadgeViews];
    [self resetSelectionIfNeeded];
}
- (void)resetSelectionIfNeeded{
    if (self.selectIndex == 0) {return;}
    [self wya_selectItemAtIndex:self.selectIndex];
}

@end
