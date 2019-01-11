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

@interface WYAMenuView ()

@property (nonatomic, weak) WYAMenuItem * selItem;

@property (nonatomic, strong) NSMutableArray * frames;

@property (nonatomic, assign) NSInteger selectIndex;

@property (nonatomic, readonly) NSInteger titlesCount;

@end

@implementation WYAMenuView
@synthesize progressHeight           = _progressHeight;
@synthesize progressViewCornerRadius = _progressViewCornerRadius;
#pragma mark ======= Setter
- (void)setLayoutMode:(WYAMenuViewLayoutMode)layoutMode {
    _layoutMode = layoutMode;
    if (!self.subviews) { return; }
    [self wya_reload];
}
- (void)setFrame:(CGRect)frame {
    // Adapt iOS 11 if is a titleView
    if (@available(ios 11.0, *)) {
        if (self.showOnNavigationBar) { frame.origin.x = 0; }
    }
    [super setFrame:frame];
    if (!self.scrollView) { return; }
    CGFloat leftMargin   = self.contentMargin + self.leftView.frame.size.width;
    CGFloat rightMargin  = self.contentMargin + self.rightView.frame.size.width;
    CGFloat contentWidth = self.scrollView.frame.size.width + leftMargin + rightMargin;
    CGFloat startX       = self.leftView ? self.leftView.frame.origin.x
                                   : self.scrollView.frame.origin.x - self.contentMargin;
    // Make the contentView center, because system will change menuView's frame if it's a titleView.
    if (startX + contentWidth / 2 != self.bounds.size.width / 2) {
        CGFloat xOffset     = (self.bounds.size.width / 2);
        self.leftView.frame = ({
            CGRect frame   = self.leftView.frame;
            frame.origin.x = xOffset;
            frame;
        });

        self.scrollView.frame = ({
            CGRect frame = self.scrollView.frame;
            frame.origin.x =
                self.leftView ? CGRectGetMaxX(self.leftView.frame) + self.contentMargin : xOffset;
            frame;
        });

        self.rightView.frame = ({
            CGRect frame   = self.rightView.frame;
            frame.origin.x = CGRectGetMaxX(self.scrollView.frame) + self.contentMargin;
            frame;
        });
    }
}
- (void)setProgressViewCornerRadius:(CGFloat)progressViewCornerRadius {
    _progressViewCornerRadius = progressViewCornerRadius;
    if (self.progressView) { self.progressView.cornerRadius = _progressViewCornerRadius; }
}

- (void)setSpeedFactor:(CGFloat)speedFactor {
    _speedFactor = speedFactor;
    if (self.progressView) { self.progressView.speedFactor = _speedFactor; }
    __weak typeof(self) weakSelf                           = self;
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj,
                                                           NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[WYAMenuItem class]]) {
            ((WYAMenuItem *)obj).speedFactor = weakSelf.speedFactor;
        }
    }];
}
- (void)setProgressWidths:(NSArray *)progressWidths {
    _progressWidths = progressWidths;
    if (!self.progressView.subviews) { return; }
    [self resetFramesFormIndex:0];
}

- (void)setLeftView:(UIView *)leftView {
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
- (void)setRightView:(UIView *)rightView {
    if (self.rightView) {
        [self.rightView removeFromSuperview];
        _rightView = nil;
    }
    if (rightView) {
        [self addSubview:rightView];
        _rightView = rightView;
    }
    [self wya_resetFrames];
}
- (void)setContentMargin:(CGFloat)contentMargin {
    _contentMargin = contentMargin;
    if (self.scrollView) { [self wya_resetFrames]; }
}
#pragma mark ======= Getter
- (CGFloat)progressHeight {
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
- (CGFloat)progressViewCornerRadius {
    return WYADEFAULT_VALUE(_progressViewCornerRadius, self.progressHeight / 2.0);
}
- (UIColor *)lineColor {
    if (!_lineColor) { _lineColor = [self colorForState:WYAMenuItemStateSelected atIndex:0]; }
    return _lineColor;
}
- (NSMutableArray *)frames {
    if (_frames == nil) { _frames = [NSMutableArray array]; }
    return _frames;
}
// 当前index的颜色
- (UIColor *)colorForState:(WYAMenuItemState)state atIndex:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(wya_menuView:titleColorForState:atIndex:)]) {
        return [self.delegate wya_menuView:self titleColorForState:state atIndex:index];
    }
    return [UIColor blackColor];
}
// index字体大小
- (CGFloat)sizeForState:(WYAMenuItemState)state atIndex:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(wya_menuView:titleSizeForState:atIndex:)]) {
        return [self.delegate wya_menuView:self titleSizeForState:state atIndex:index];
    }
    return 15.0;
}

- (UIView *)badgeViewAtIndex:(NSInteger)index {
    if (![self.dataSource respondsToSelector:@selector(wya_menuView:badgeViewAtIndex:)]) {
        return nil;
    }
    UIView * badgeView = [self.dataSource wya_menuView:self badgeViewAtIndex:index];
    if (!badgeView) { return nil; }
    badgeView.tag = index + WYABADGEVIEW_TAG_OFFSET;

    return badgeView;
}
#pragma mark ======= Public Methods
- (WYAMenuItem *)wya_itemAtIndex:(NSInteger)index {
    return (WYAMenuItem *)[self viewWithTag:(index + WYAMENUITEM_TAG_OFFSET)];
}
- (void)setProgressViewIsNaughty:(BOOL)progressViewIsNaughty {
    _progressViewIsNaughty = progressViewIsNaughty;
    if (self.progressView) { self.progressView.naughty = progressViewIsNaughty; }
}

- (void)wya_reload {
    [self.frames removeAllObjects];
    [self.progressView removeFromSuperview];
    [self.scrollView.subviews
        enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx,
                                     BOOL * _Nonnull stop) { [obj removeFromSuperview]; }];

    [self addItems];
    [self makeStyle];
    [self addBadgeViews];
}

- (void)wya_slidMenuAtProgress:(CGFloat)progress {
    if (self.progressView) { self.progressView.progress = progress; }
    NSInteger tag             = (NSInteger)progress + WYAMENUITEM_TAG_OFFSET;
    CGFloat rate              = progress - tag + WYAMENUITEM_TAG_OFFSET;
    WYAMenuItem * currentItem = (WYAMenuItem *)[self viewWithTag:tag];
    WYAMenuItem * nextItem    = (WYAMenuItem *)[self viewWithTag:tag + 1];
    if (rate == 0.0) {
        [self.selItem wya_setSelected:NO withAnimation:NO];
        self.selItem = currentItem;
        [self.selItem wya_setSelected:YES withAnimation:NO];
        [self wya_refreshContentOffset];
        return;
    }
    currentItem.rate = 1 - rate;
    nextItem.rate    = rate;
}

- (void)wya_selectItemAtIndex:(NSInteger)index {
    NSInteger tag          = index + WYAMENUITEM_TAG_OFFSET;
    NSInteger currentIndex = self.selItem.tag - WYAMENUITEM_TAG_OFFSET;
    self.selectIndex       = index;
    if (index == currentIndex || !self.selItem) { return; }
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

- (void)wya_updateTitle:(NSString *)title atIndex:(NSInteger)index anWidth:(BOOL)update {
    if (index >= self.titlesCount || index < 0) { return; }
    WYAMenuItem * item = (WYAMenuItem *)[self viewWithTag:(WYAMENUITEM_TAG_OFFSET + index)];
    item.text          = title;
    if (!update) { return; }
    [self wya_resetFrames];
}

- (void)wya_updateAttributeTitle:(NSAttributedString *)title
                         atIndex:(NSInteger)index
                        andWidth:(BOOL)update {
    if (index >= self.titlesCount || index < 0) { return; }
    WYAMenuItem * item  = (WYAMenuItem *)[self viewWithTag:(WYAMENUITEM_TAG_OFFSET + index)];
    item.attributedText = title;
    if (!update) { return; }
    [self wya_resetFrames];
}
- (void)wya_updateBadgeViewAtIndex:(NSInteger)index {
    UIView * oldBadgeView = [self.scrollView viewWithTag:WYABADGEVIEW_TAG_OFFSET + index];
    if (oldBadgeView) { [oldBadgeView removeFromSuperview]; }
    [self addBadgeViewAtIndex:index];
    [self resetBadgeFrame:index];
}

// 让选中的item居中
- (void)wya_refreshContentOffset {
    CGRect frame       = self.selItem.frame;
    CGFloat itemX      = frame.origin.x;
    CGFloat width      = self.scrollView.frame.size.width;
    CGSize contentSize = self.scrollView.contentSize;
    if (itemX > width / 2) {
        CGFloat targetX;
        if ((contentSize.width - itemX) <= width / 2) {
            targetX = contentSize.width - width;
        } else {
            targetX = frame.origin.x - width / 2 + frame.size.width / 2;
        }
        // 暂时这么解决，应该会有更好的方法
        if ((targetX + width) > contentSize.width) { targetX = contentSize.width - width; }
        [self.scrollView setContentOffset:CGPointMake(targetX, 0) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}

#pragma mark ======= Data source
- (NSInteger)titlesCount {
    return [self.dataSource wya_numberOfTitlesInMenuView:self];
}

#pragma mark ======= Private Methods
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.progressViewCornerRadius = WYAUNDEFINED_VALUE;
        self.progressHeight           = WYAUNDEFINED_VALUE;
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    if (self.scrollView) { return; }
    [self addScrollView];
    [self addItems];
    [self makeStyle];
    [self addBadgeViews];
    [self resetSelectionIfNeeded];
}
- (void)resetSelectionIfNeeded {
    if (self.selectIndex == 0) { return; }
    [self wya_selectItemAtIndex:self.selectIndex];
}

- (void)wya_resetFrames {
    CGRect frame = self.bounds;
    if (self.rightView) {
        CGRect rightFrame    = self.rightView.frame;
        rightFrame.origin.x  = frame.size.width - rightFrame.size.width;
        self.rightView.frame = rightFrame;
        frame.size.width -= rightFrame.size.width;
    }

    if (self.leftView) {
        CGRect leftFrame    = self.leftView.frame;
        leftFrame.origin.x  = 0;
        self.leftView.frame = leftFrame;
        frame.origin.x += leftFrame.size.width;
        frame.size.width -= leftFrame.size.width;
    }

    frame.origin.x += self.contentMargin;
    frame.size.width -= self.contentMargin * 2;
    self.scrollView.frame = frame;
    [self resetFramesFormIndex:0];
}

- (void)resetFramesFormIndex:(NSInteger)index {
    [self.frames removeAllObjects];
    [self caclculateItemFrames];
    for (NSInteger i = index; i < self.titlesCount; i++) {
        [self resetItemFrame:i];
        [self resetBadgeFrame:i];
    }
    if (!self.progressView.superview) { return; }

    self.progressView.frame        = [self calculateProgressViewFrame];
    self.progressView.cornerRadius = self.progressViewCornerRadius;
    self.progressView.itemFrames   = [self convertProgressWidthsToFrames];
    [self.progressView setNeedsDisplay];
}

- (CGRect)calculateProgressViewFrame {
    switch (self.style) {
        case WYAMenuViewStyleDefault: {
            return CGRectZero;
        }
        case WYAMenuViewStyleLine:
        case WYAMenuViewStyleTriangle: {
            return CGRectMake(0, self.frame.size.height - self.progressHeight -
                                     self.progressViewBottomSpace,
                              self.scrollView.contentSize.width, self.progressHeight);
        }
        case WYAMenuViewStyleFloodHollow:
        case WYAMenuViewStyleSegmented:
        case WYAMenuViewStyleFlood: {
            return CGRectMake(0, (self.frame.size.height - self.progressHeight) / 2,
                              self.scrollView.contentSize.width, self.progressHeight);
        }
    }
}
- (void)resetItemFrame:(NSInteger)index {
    WYAMenuItem * item = (WYAMenuItem *)[self viewWithTag:(WYAMENUITEM_TAG_OFFSET + index)];
    CGRect frame       = [self.frames[index] CGRectValue];
    item.frame         = frame;
    if ([self.delegate respondsToSelector:@selector(wya_menuView:didLayoutItemFrame:atIndex:)]) {
        [self.delegate wya_menuView:self didLayoutItemFrame:item atIndex:index];
    }
}

- (void)resetBadgeFrame:(NSInteger)index {
    CGRect frame       = [self.frames[index] CGRectValue];
    UIView * badgeView = [self.scrollView viewWithTag:(WYABADGEVIEW_TAG_OFFSET + index)];
    if (badgeView) {
        CGRect badgeFrame = [self badgeViewAtIndex:index].frame;
        badgeFrame.origin.x += frame.origin.x;
        badgeView.frame = badgeFrame;
    }
}

- (NSArray *)convertProgressWidthsToFrames {
    if (!self.frames.count) { NSAssert(NO, @"BUG SHOULDN'T COME HERE!"); }

    if (self.progressWidths.count < self.titlesCount) { return self.frames; }

    NSMutableArray * progressFrames = [NSMutableArray array];
    NSInteger count                 = (self.frames.count < self.progressWidths.count) ? self.frames.count
                                                                      : self.progressWidths.count;
    for (int i = 0; i < count; i++) {
        CGRect itemFrame      = [self.frames[i] CGRectValue];
        CGFloat progressWidth = [self.progressWidths[i] floatValue];
        CGFloat x             = itemFrame.origin.x + (itemFrame.size.width - progressWidth) / 2;
        CGRect progressFrame  = CGRectMake(x, itemFrame.origin.y, progressWidth, 0);
        [progressFrames addObject:[NSValue valueWithCGRect:progressFrame]];
    }
    return progressFrames.copy;
}

- (void)addBadgeViews {
    for (int i = 0; i < self.titlesCount; i++) { [self addBadgeViewAtIndex:i]; }
}
- (void)addBadgeViewAtIndex:(NSInteger)index {
    UIView * badgeView = [self badgeViewAtIndex:index];
    if (badgeView) { [self.scrollView addSubview:badgeView]; }
}

- (void)makeStyle {
    CGRect frame = [self calculateProgressViewFrame];
    if (CGRectEqualToRect(frame, CGRectZero)) { return; }
    [self addProgressViewWithFrame:frame
                        isTriangle:(self.style == WYAMenuViewStyleTriangle)
                         hasBorder:(self.style == WYAMenuViewStyleSegmented)
                            hollow:(self.style == WYAMenuViewStyleFloodHollow)
                      cornerRadius:self.progressViewCornerRadius];
}
- (void)wya_deselectedItemsIfNeeded {
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj,
                                                           NSUInteger idx, BOOL * _Nonnull stop) {
        if (![obj isKindOfClass:[WYAMenuItem class]] || obj == self.selItem) { return; }
        [(WYAMenuItem *)obj wya_setSelected:NO withAnimation:NO];
    }];
}

- (void)addScrollView {
    CGFloat width                             = self.frame.size.width - self.contentMargin * 2;
    CGFloat height                            = self.frame.size.height;
    CGRect frame                              = CGRectMake(self.contentMargin, 0, width, height);
    UIScrollView * scrollView                 = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.showsVerticalScrollIndicator   = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor                = [UIColor clearColor];
    scrollView.scrollsToTop                   = NO;
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self addSubview:scrollView];
    self.scrollView = scrollView;
}

- (void)addItems {
    [self caclculateItemFrames];
    for (int i = 0; i < self.titlesCount; i++) {
        CGRect frame                = [self.frames[i] CGRectValue];
        WYAMenuItem * item          = [[WYAMenuItem alloc] initWithFrame:frame];
        item.tag                    = (i + WYAMENUITEM_TAG_OFFSET);
        item.delegate               = self;
        item.text                   = [self.dataSource wya_menuView:self titleAtIndex:i];
        item.textAlignment          = NSTextAlignmentCenter;
        item.userInteractionEnabled = YES;
        item.backgroundColor        = [UIColor clearColor];
        item.normalSize             = [self sizeForState:WYAMenuItemStateNormal atIndex:i];
        item.selectedSize           = [self sizeForState:WYAMenuItemStateSelected atIndex:i];
        item.normalColor            = [self colorForState:WYAMenuItemStateNormal atIndex:i];
        item.selectedColor          = [self colorForState:WYAMenuItemStateSelected atIndex:i];
        item.speedFactor            = self.speedFactor;
        if (self.fontName) {
            item.font = [UIFont fontWithName:self.fontName size:item.selectedSize];
        } else {
            item.font = [UIFont systemFontOfSize:item.selectedSize];
        }
        if ([self.dataSource respondsToSelector:@selector(wya_menuView:initialMenuItem:atIndex:)]) {
            item = [self.dataSource wya_menuView:self initialMenuItem:item atIndex:i];
        }
        if (i == 0) {
            [item wya_setSelected:YES withAnimation:NO];
            self.selItem = item;
        } else {
            [item wya_setSelected:NO withAnimation:NO];
        }
        [self.scrollView addSubview:item];
    }
}
// 计算所有item的frame值，主要是为了是适配所有的item的宽度和小于屏幕宽的情况
// （这里与上面的-addItems做了重复的操作 不是很合理）
- (void)caclculateItemFrames {
    CGFloat contentWidth = [self itemMarginAtIndex:0];
    for (int i = 0; i < self.titlesCount; i++) {
        CGFloat itemW = 60.0;
        if ([self.delegate respondsToSelector:@selector(wya_menuView:widthForItemAtIndex:)]) {
            itemW = [self.delegate wya_menuView:self widthForItemAtIndex:i];
        }
        CGRect frame = CGRectMake(contentWidth, 0, itemW, self.frame.size.height);
        // 记录frame
        [self.frames addObject:[NSValue valueWithCGRect:frame]];
        contentWidth += itemW + [self itemMarginAtIndex:i + 1];
    }
    // 如果总宽度小于屏幕宽度，重新计算frame,为Item间添加间距
    if (contentWidth < self.scrollView.frame.size.width) {
        CGFloat distance = self.scrollView.frame.size.width - contentWidth;
        CGFloat (^shiftDis)(int);
        switch (self.layoutMode) {
            case WYAMenuViewLayoutModeScatter: {
                CGFloat gap = distance / (self.titlesCount + 1);
                shiftDis    = ^CGFloat(int index) { return gap * (index + 1); };
                break;
            }
            case WYAMenuViewLayoutModeLeft: {
                shiftDis = ^CGFloat(int index) { return 0.0; };
                break;
            }
            case WYAMenuViewLayoutModeRight: {
                shiftDis = ^CGFloat(int index) { return distance; };
                break;
            }
            case WYAMenuViewLayoutModeCenter: {
                shiftDis = ^CGFloat(int index) { return distance / 2; };
                break;
            }
        }
        for (int i = 0; i < self.frames.count; i++) {
            CGRect frame = [self.frames[i] CGRectValue];
            frame.origin.x += shiftDis(i);
            self.frames[i] = [NSValue valueWithCGRect:frame];
        }
        contentWidth = self.scrollView.frame.size.width;
    }
    self.scrollView.contentSize = CGSizeMake(contentWidth, self.frame.size.height);
}
- (CGFloat)itemMarginAtIndex:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(wya_menuView:itemMarginAtIndex:)]) {
        return [self.delegate wya_menuView:self itemMarginAtIndex:index];
    }
    return 0.0;
}
#pragma mark ======= progress View
- (void)addProgressViewWithFrame:(CGRect)frame
                      isTriangle:(BOOL)isTriangle
                       hasBorder:(BOOL)hasBorder
                          hollow:(BOOL)isHollow
                    cornerRadius:(CGFloat)cornerRadius {
    WYAPageProgressView * pView = [[WYAPageProgressView alloc] initWithFrame:frame];
    pView.itemFrames            = [self convertProgressWidthsToFrames];
    pView.color                 = self.lineColor.CGColor;
    pView.isTriangle            = isTriangle;
    pView.hasBorder             = hasBorder;
    pView.hollow                = isHollow;
    pView.cornerRadius          = cornerRadius;
    pView.naughty               = self.progressViewIsNaughty;
    pView.speedFactor           = self.speedFactor;
    pView.backgroundColor       = [UIColor clearColor];
    self.progressView           = pView;
    [self.scrollView insertSubview:self.progressView atIndex:0];
}
#pragma mark ======= Menum item delegate
- (void)wya_didPressedMenuItem:(WYAMenuItem *)menuItem {
    if ([self.delegate respondsToSelector:@selector(wya_menuView:shouldSelectedIndex:)]) {
        BOOL should = [self.delegate wya_menuView:self
                              shouldSelectedIndex:(menuItem.tag - WYAMENUITEM_TAG_OFFSET)];
        if (!should) { return; }
    }
    CGFloat progress = menuItem.tag - WYAMENUITEM_TAG_OFFSET;
    [self.progressView wya_moveToPostion:progress];

    NSInteger currentIndex = self.selItem.tag - WYAMENUITEM_TAG_OFFSET;
    if ([self.delegate respondsToSelector:@selector(wya_menuView:didSelectedIndex:currentINdex:)]) {
        [self.delegate wya_menuView:self
                   didSelectedIndex:(menuItem.tag - WYAMENUITEM_TAG_OFFSET)
                       currentINdex:currentIndex];
    }

    [self.selItem wya_setSelected:NO withAnimation:YES];
    [menuItem wya_setSelected:YES withAnimation:YES];
    self.selItem = menuItem;

    NSTimeInterval delay = self.style == WYAMenuViewStyleDefault ? 0 : 0.3f;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{ [self wya_refreshContentOffset]; });
}
@end
