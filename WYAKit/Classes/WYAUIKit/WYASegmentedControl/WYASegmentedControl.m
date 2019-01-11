//
//  WYASegmentedControl.m
//  AFNetworking
//
//  Created by 李俊恒 on 2018/12/19.
//

#import "WYASegmentedControl.h"

#define SEGMENTEDBASEITEMSTAG 1001

@interface WYASegmentedControl ()
/**
 设置item普通图片
 */
@property (nonatomic, strong) NSArray<NSString *> * imagesNormalArray;

/**
 设置item选中图片
 */
@property (nonatomic, strong) NSArray<NSString *> * imagesSelectlArray;

/**
 设置item标题
 */
@property (nonatomic, strong) NSArray<NSString *> * itemsTitleArray;

@property (nonatomic, assign) NSInteger selectTag;

@property (nonatomic, assign, readwrite) NSInteger getSelectedIndex;

@end

@implementation WYASegmentedControl
#pragma mark ======= Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) { [self setDefaultValue]; }
    return self;
}
#pragma mark ======= setter
- (void)setItemsFont:(CGFloat)itemsFont {
    _itemsFont = itemsFont;
    for (UIView * tempView in self.subviews) {
        if ([tempView isKindOfClass:[UIButton class]]) {
            UIButton * button      = (UIButton *)tempView;
            button.titleLabel.font = FONT(_itemsFont);
        }
    }
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius            = cornerRadius;
    self.layer.cornerRadius  = _cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex {
    if (selectedSegmentIndex != self.selectTag) {
        UIButton * tempButton = [self viewWithTag:self.selectTag + SEGMENTEDBASEITEMSTAG];

        tempButton.selected = NO;

        _selectedSegmentIndex     = selectedSegmentIndex;
        UIButton * selectedButton = [self viewWithTag:selectedSegmentIndex + SEGMENTEDBASEITEMSTAG];
        selectedButton.selected   = !selectedButton.isSelected;
        _selectTag                = selectedSegmentIndex;
    }
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor           = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
    for (UIView * tempView in self.subviews) {
        if ([tempView isKindOfClass:[UIButton class]]) {
            UIButton * button        = (UIButton *)tempView;
            button.layer.borderColor = _borderColor.CGColor;
        }
    }
}

- (void)setItemNormalColor:(UIColor *)itemNormalColor {
    _itemNormalColor = itemNormalColor;
    for (UIView * tempView in self.subviews) {
        if ([tempView isKindOfClass:[UIButton class]]) {
            UIButton * button = (UIButton *)tempView;
            [button setTitleColor:_itemNormalColor forState:UIControlStateNormal];
            [button wya_setBackgroundColor:_itemNormalColor forState:UIControlStateSelected];
            [button wya_setBackgroundColor:_itemNormalColor forState:UIControlStateHighlighted];
        }
    }
}

- (void)setItemSelectColor:(UIColor *)itemSelectColor {
    _itemSelectColor = itemSelectColor;
    for (UIView * tempView in self.subviews) {
        if ([tempView isKindOfClass:[UIButton class]]) {
            UIButton * button = (UIButton *)tempView;
            [button setTitleColor:_itemSelectColor forState:UIControlStateSelected];
            [button wya_setBackgroundColor:_itemSelectColor forState:UIControlStateNormal];
        }
    }
}

- (void)setItemHighlightedColor:(UIColor *)itemHighlightedColor {
    _itemHighlightedColor = itemHighlightedColor;
    for (UIView * tempView in self.subviews) {
        if ([tempView isKindOfClass:[UIButton class]]) {
            UIButton * button = (UIButton *)tempView;
            [button setTitleColor:_itemHighlightedColor forState:UIControlStateHighlighted];
        }
    }
}
- (void)setItemsIsEnable:(BOOL)itemsIsEnable {
    _itemsIsEnable              = itemsIsEnable;
    self.backgroundColor        = [UIColor whiteColor];
    self.userInteractionEnabled = _itemsIsEnable;
    self.alpha                  = 0.5;
}
#pragma mark ======= private method
// 设置默认值
- (void)setDefaultValue {
    self.cornerRadius         = 8 * SizeAdapter;
    self.selectTag            = 0;
    self.borderColor          = [UIColor wya_hex:@"#108DE7"];
    self.itemsFont            = 15;
    self.itemNormalColor      = [UIColor wya_hex:@"#108DE7"];
    self.itemSelectColor      = [UIColor wya_hex:@"#FFFFFF"];
    self.itemHighlightedColor = [UIColor wya_hex:@"#FFFFFF"];
}

// 标题按钮
- (void)addItemsWithTitleArray:(NSArray *)array {
    CGFloat width  = self.frame.size.width / array.count;
    CGFloat height = self.frame.size.height;

    for (int i = 0; i < array.count; i++) {
        NSString * title       = [array wya_safeObjectAtIndex:i];
        UIButton * itemsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        itemsButton.tag        = SEGMENTEDBASEITEMSTAG + i;
        itemsButton.frame      = CGRectMake(i * (width), 0, width, height);

        [itemsButton setTitle:title forState:UIControlStateNormal];
        [itemsButton setTitleColor:self.itemSelectColor forState:UIControlStateSelected];
        [itemsButton setTitleColor:self.itemNormalColor forState:UIControlStateNormal];
        [itemsButton setTitleColor:self.itemSelectColor forState:UIControlStateHighlighted];
        itemsButton.layer.borderColor = self.borderColor.CGColor;
        itemsButton.layer.borderWidth = 0.5;
        itemsButton.titleLabel.font   = FONT(self.itemsFont);

        [itemsButton wya_setBackgroundColor:self.itemSelectColor forState:UIControlStateNormal];
        [itemsButton wya_setBackgroundColor:self.itemNormalColor forState:UIControlStateSelected];
        [itemsButton wya_setBackgroundColor:self.itemNormalColor
                                   forState:UIControlStateHighlighted];
        itemsButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        if (i == self.selectTag) { itemsButton.selected = YES; }
        [self addSubview:itemsButton];
        [itemsButton addTarget:self
                        action:@selector(itemClicked:)
              forControlEvents:UIControlEventTouchUpInside];
    }
}

// 图片按钮
- (void)addItemsWithNormalImgsArray:(NSArray *)normalArray selectedArray:(NSArray *)selectedArray {
    CGFloat width  = self.frame.size.width / (normalArray.count);
    CGFloat height = self.frame.size.height;

    for (int i = 0; i < normalArray.count; i++) {
        UIImage * normalImg    = [UIImage imageNamed:[normalArray wya_safeObjectAtIndex:i]];
        UIImage * selectImg    = [UIImage imageNamed:[selectedArray wya_safeObjectAtIndex:i]];
        UIButton * itemsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        itemsButton.tag        = SEGMENTEDBASEITEMSTAG + i;
        itemsButton.frame      = CGRectMake(i * (width), 0, width, height);
        [itemsButton setBackgroundImage:normalImg forState:UIControlStateNormal];
        [itemsButton setBackgroundImage:selectImg forState:UIControlStateSelected];
        itemsButton.layer.borderColor = self.borderColor.CGColor;
        itemsButton.layer.borderWidth = 0.5;
        itemsButton.titleLabel.font   = FONT(self.itemsFont);
        if (i == self.selectTag) { itemsButton.selected = YES; }
        [self addSubview:itemsButton];
        [itemsButton addTarget:self
                        action:@selector(itemClicked:)
              forControlEvents:UIControlEventTouchUpInside];
    }
}
#pragma mark ======= methods
+ (instancetype)wya_initWithFrame:(CGRect)frame
                  itemsTitleArray:(NSArray<NSString *> *)itemsTitleArray {
    WYASegmentedControl * segmentedControl = [[WYASegmentedControl alloc] initWithFrame:frame];
    segmentedControl.itemsTitleArray       = itemsTitleArray;
    segmentedControl.layer.borderColor     = segmentedControl.borderColor.CGColor;
    segmentedControl.layer.borderWidth     = 0.5;
    segmentedControl.layer.cornerRadius    = segmentedControl.cornerRadius;
    segmentedControl.layer.masksToBounds   = YES;
    [segmentedControl addItemsWithTitleArray:itemsTitleArray];
    return segmentedControl;
}

+ (instancetype)wya_initWithFrame:(CGRect)frame
                imagesNormalArray:(NSArray<NSString *> *)imagesNormalArray
               imagesSelectlArray:(NSArray<NSString *> *)imagesSelectlArray {
    WYASegmentedControl * segmentedControl = [[WYASegmentedControl alloc] initWithFrame:frame];
    segmentedControl.imagesNormalArray     = imagesNormalArray;
    segmentedControl.imagesSelectlArray    = imagesSelectlArray;
    segmentedControl.layer.borderColor     = segmentedControl.borderColor.CGColor;
    segmentedControl.layer.borderWidth     = 0.5;
    segmentedControl.layer.cornerRadius    = segmentedControl.cornerRadius;
    segmentedControl.layer.masksToBounds   = YES;
    [segmentedControl addItemsWithNormalImgsArray:imagesNormalArray
                                    selectedArray:imagesSelectlArray];
    return segmentedControl;
}

#pragma mark ======= action
- (void)itemClicked:(UIButton *)sender {
    NSInteger tag = sender.tag - SEGMENTEDBASEITEMSTAG;

    if (tag != self.selectTag) {
        UIButton * tempButton = [self viewWithTag:self.selectTag + SEGMENTEDBASEITEMSTAG];
        tempButton.selected   = NO;

        self.selectTag = tag;

        sender.selected = !sender.isSelected;
    }
    self.getSelectedIndex = self.selectTag;
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(wya_segmentedControlChangeValue:)]) {
        [self.delegate wya_segmentedControlChangeValue:self];
    }
}
@end
