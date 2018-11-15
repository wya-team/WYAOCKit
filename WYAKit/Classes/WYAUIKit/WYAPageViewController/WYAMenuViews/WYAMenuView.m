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
#pragma mark ======= setter
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
    if (startX + contentWidth/2 != self.bounds.size.width - contentWidth/2) {
        
    }
}

@end
