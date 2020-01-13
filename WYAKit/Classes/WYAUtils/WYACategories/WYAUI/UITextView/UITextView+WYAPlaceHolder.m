//
//  UITextView+WYAPlaceHolder.m

#import "UITextView+WYAPlaceHolder.h"
#import <objc/runtime.h>
static const void * wya_placeHolderKey;

@interface UITextView ()
@property (nonatomic, readonly) UILabel * wya_placeHolderLabel;
@end

@implementation UITextView (WYAPlaceHolder)

+ (void)load
{
    [super load];
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"layoutSubviews")),
                                   class_getInstanceMethod(self.class, @selector(wyaPlaceHolder_swizzling_layoutSubviews)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(wyaPlaceHolder_swizzled_dealloc)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"setText:")),
                                   class_getInstanceMethod(self.class, @selector(wyaPlaceHolder_swizzled_setText:)));
}

#pragma mark - swizzled
- (void)wyaPlaceHolder_swizzled_dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self wyaPlaceHolder_swizzled_dealloc];
}

- (void)wyaPlaceHolder_swizzling_layoutSubviews
{
    if (self.wya_placeHolder) {
        UIEdgeInsets textContainerInset = self.textContainerInset;
        CGFloat lineFragmentPadding     = self.textContainer.lineFragmentPadding;
        CGFloat x                       = lineFragmentPadding + textContainerInset.left + self.layer.borderWidth;
        CGFloat width                   = CGRectGetWidth(self.bounds) - x - textContainerInset.right - 2 * self.layer.borderWidth;
        CGFloat height                  = [self.wya_placeHolderLabel sizeThatFits:CGSizeMake(width, 0)].height;
        CGFloat y                       = textContainerInset.top + self.layer.borderWidth;
//        CGFloat y                       = (self.frame.size.height - height) / 2;
        self.wya_placeHolderLabel.frame = CGRectMake(x, y, width, height);
    }
    [self wyaPlaceHolder_swizzling_layoutSubviews];
}

- (void)wyaPlaceHolder_swizzled_setText:(NSString *)text
{
    [self wyaPlaceHolder_swizzled_setText:text];
    if (self.wya_placeHolder) {
        [self updatePlaceHolder];
    }
}

#pragma mark - associated
- (NSString *)wya_placeHolder
{
    return objc_getAssociatedObject(self, &wya_placeHolderKey);
}

- (void)setWya_placeHolder:(NSString *)wya_placeHolder
{
    objc_setAssociatedObject(self, &wya_placeHolderKey, wya_placeHolder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updatePlaceHolder];
}

- (UIColor *)wya_placeHolderColor
{
    return self.wya_placeHolderLabel.textColor;
}

- (void)setWya_placeHolderColor:(UIColor *)wya_placeHolderColor
{
    self.wya_placeHolderLabel.textColor = wya_placeHolderColor;
}

- (NSString *)placeholder
{
    return self.wya_placeHolder;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    self.wya_placeHolder = placeholder;
}

#pragma mark - update
- (void)updatePlaceHolder
{
    if (self.text.length) {
        [self.wya_placeHolderLabel removeFromSuperview];
        return;
    }
    self.wya_placeHolderLabel.font          = self.font ? self.font : self.cacutDefaultFont;
    self.wya_placeHolderLabel.textAlignment = self.textAlignment;
    self.wya_placeHolderLabel.text          = self.wya_placeHolder;
    [self insertSubview:self.wya_placeHolderLabel atIndex:0];
}

#pragma mark - lazzing
- (UILabel *)wya_placeHolderLabel
{
    UILabel * placeHolderLab = objc_getAssociatedObject(self, @selector(wya_placeHolderLabel));
    if (!placeHolderLab) {
        placeHolderLab               = [[UILabel alloc] init];
        placeHolderLab.numberOfLines = 0;
        placeHolderLab.textColor     = [UIColor lightGrayColor];
        objc_setAssociatedObject(self, @selector(wya_placeHolderLabel), placeHolderLab, OBJC_ASSOCIATION_RETAIN);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePlaceHolder) name:UITextViewTextDidChangeNotification object:self];
    }
    return placeHolderLab;
}

- (UIFont *)cacutDefaultFont
{
    static UIFont * font = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextView * textview = [[UITextView alloc] init];
        textview.text         = @" ";
        font                  = textview.font;
    });
    return font;
}
@end
