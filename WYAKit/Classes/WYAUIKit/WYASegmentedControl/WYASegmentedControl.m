//
//  WYASegmentedControl.m
//  AFNetworking
//
//  Created by 李俊恒 on 2018/12/19.
//

#import "WYASegmentedControl.h"

#define SEGMENTEDBASEITEMSTAG 1001

@interface WYASegmentedControl()
/**
 设置item普通图片
 */
@property (nonatomic, strong) NSArray <NSString *>* imagesNormalArray;

/**
 设置item选中图片
 */
@property (nonatomic, strong) NSArray <NSString *>* imagesSelectlArray;

/**
 设置item标题
 */
@property (nonatomic, strong) NSArray <NSString *>* itemsTitleArray;
@end

@implementation WYASegmentedControl
#pragma mark ======= Life Cycle

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setDefaultValue];
    }
    return self;
}
#pragma mark ======= private method
// 设置默认值
- (void)setDefaultValue{
    self.cornerRadius = 8*SizeAdapter;
    self.selectedSegmentIndex = 0;
    self.borderColor = [UIColor wya_hex:@"108DE7"];
    self.itemsFont = 15;
    self.itemNormalColor = [UIColor wya_hex:@"108DE7"];
    self.itemSelectColor = [UIColor wya_hex:@"FFFFFF"];
    self.itemHighlightedColor = [UIColor wya_hex:@"FFFFFF"];
    self.momentary = NO;
}

// 标题按钮
- (void)addItemsWithTitleArray:(NSArray *)array{
    CGFloat width = self.frame.size.width/array.count;
    CGFloat height = self.frame.size.height;
    
    for (int i = 0; i<array.count; i++) {
        NSString * title = [array wya_safeObjectAtIndex:i];
        UIButton * itemsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        itemsButton.tag = SEGMENTEDBASEITEMSTAG + i;
        itemsButton.frame = CGRectMake(i*(width), 0, width, height);
        
        [itemsButton setTitle:title forState:UIControlStateNormal];
        [itemsButton setTitleColor:self.itemSelectColor forState:UIControlStateSelected];
        [itemsButton setTitleColor:self.itemNormalColor forState:UIControlStateNormal];
        itemsButton.layer.borderColor = self.borderColor.CGColor;
        itemsButton.layer.borderWidth = 0.5;
        itemsButton.titleLabel.font = FONT(self.itemsFont);
        
        [itemsButton wya_setBackgroundColor:self.itemSelectColor forState:UIControlStateNormal];
        [itemsButton wya_setBackgroundColor:self.itemNormalColor forState:UIControlStateSelected];
        [itemsButton wya_setBackgroundColor:self.itemNormalColor forState:UIControlStateHighlighted];
        
        if (i == self.selectedSegmentIndex) {
            itemsButton.selected = YES;
        }
        [self addSubview:itemsButton];
        [itemsButton addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
}

// 图片按钮
- (void)addItemsWithNormalImgsArray:(NSArray *)normalArray selectedArray:(NSArray *)selectedArray{
    CGFloat width = self.frame.size.width/(normalArray.count);
    CGFloat height = self.frame.size.height;
}
#pragma mark ======= methods
+ (instancetype)wya_initWithFrame:(CGRect)frame itemsTitleArray:(NSArray<NSString *> *)itemsTitleArray{
    WYASegmentedControl * segmentedControl = [[WYASegmentedControl alloc]initWithFrame:frame];
    segmentedControl.itemsTitleArray = itemsTitleArray;
    segmentedControl.layer.borderColor = segmentedControl.borderColor.CGColor;
    segmentedControl.layer.borderWidth = 0.5;
    segmentedControl.layer.cornerRadius = segmentedControl.cornerRadius;
    segmentedControl.layer.masksToBounds = YES;
    [segmentedControl addItemsWithTitleArray:itemsTitleArray];
    return segmentedControl;
}

+ (instancetype)wya_initWithFrame:(CGRect)frame imagesNormalArray:(NSArray<NSString *> *)imagesNormalArray imagesSelectlArray:(NSArray<NSString *> *)imagesSelectlArray{
    
    WYASegmentedControl * segmentedControl = [[WYASegmentedControl alloc]initWithFrame:frame];
    segmentedControl.imagesNormalArray = imagesNormalArray;
    segmentedControl.imagesSelectlArray = imagesSelectlArray;
    segmentedControl.layer.borderColor = segmentedControl.borderColor.CGColor;
    segmentedControl.layer.borderWidth = 0.5;
    segmentedControl.layer.cornerRadius = segmentedControl.cornerRadius;
    segmentedControl.layer.masksToBounds = YES;
    [segmentedControl addItemsWithNormalImgsArray:imagesNormalArray selectedArray:imagesSelectlArray];
    return segmentedControl;
    
}

#pragma mark ======= action
- (void)itemClicked:(UIButton *)sender{
    NSInteger tag = sender.tag - SEGMENTEDBASEITEMSTAG;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_segmentedControlChangeValue:)]) {
        [self.delegate wya_segmentedControlChangeValue:self];
    }
}
@end
