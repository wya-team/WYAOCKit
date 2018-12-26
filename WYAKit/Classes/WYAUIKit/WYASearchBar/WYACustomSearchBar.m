//
//  WYACustomSearchBar.m
//  AFNetworking
//
//  Created by 李俊恒 on 2018/12/26.
//

#import "WYACustomSearchBar.h"

@interface WYACustomSearchBar()

@property (nonatomic, assign) CGFloat  placeholderWidth;

@property (nonatomic, assign) CGFloat  searchIconHeight;

@property (nonatomic, assign) CGFloat  selfWidth;

@property (nonatomic, assign) CGFloat  selfHeight;

@end

@implementation WYACustomSearchBar
#pragma mark ======= Life Cycle
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
#pragma mark ======= private

- (void)setupUI{
    [self setBackgroundImage:[UIImage new]];
    self.searchBarStyle = UISearchBarStyleMinimal;
    self.searchTextPositionAdjustment = UIOffsetMake(3, 0);
    _customBgColor = [UIColor whiteColor];
    _roundRate = 8;
    
    self.searchIconHeight = self.bounds.size.height-8;
    self.selfWidth = self.bounds.size.width;
    self.selfHeight = self.bounds.size.height;
    UIImage * image = [UIImage wya_imageWithColor:_customBgColor size:CGSizeMake(self.selfWidth, self.selfHeight) rate:_roundRate];
    [self setSearchFieldBackgroundImage:image forState:UIControlStateNormal];
    [self sizeToFit];
}

#pragma mark ======= public
- (void)wya_shouldBeginEditingState{
    [self setPositionAdjustment:UIOffsetMake(0, 0) forSearchBarIcon:UISearchBarIconSearch];
}
- (void)wya_touchesBeganState{
    if (self.text.length == 0) {
        CGFloat offsetX = (self.selfWidth - self.placeholderWidth - self.searchIconHeight)*0.5;
        [self setPositionAdjustment:UIOffsetMake(offsetX, 0) forSearchBarIcon:UISearchBarIconSearch];
    }
}
- (void)wya_cancleButtonClickedState{
    if (self.text.length == 0) {
        CGFloat offsetX = (self.selfWidth - self.placeholderWidth - self.searchIconHeight)*0.5;
        [self setPositionAdjustment:UIOffsetMake(offsetX, 0) forSearchBarIcon:UISearchBarIconSearch];
    }
}

- (void)wya_searchButtonClickedState{
    if (self.text.length == 0) {
        CGFloat offsetX = (self.selfWidth - self.placeholderWidth - self.searchIconHeight)*0.5;
        [self setPositionAdjustment:UIOffsetMake(offsetX, 0) forSearchBarIcon:UISearchBarIconSearch];
    }
}

#pragma mark ======= setter
- (void)setPlaceholderString:(NSString *)placeholderString{
    _placeholderString = placeholderString;
    self.placeholder = placeholderString;
    self.placeholderWidth = [placeholderString wya_widthWithFontSize:15 height:self.bounds.size.height];
    CGFloat offsetX = (self.selfWidth - self.placeholderWidth - self.searchIconHeight)*0.5;
    [self setPositionAdjustment:UIOffsetMake(offsetX, 0) forSearchBarIcon:UISearchBarIconSearch];
  
}

- (void)setRoundRate:(CGFloat)roundRate{
    _roundRate = roundRate;
    UIImage * image = [UIImage wya_imageWithColor:self.customBgColor size:CGSizeMake(self.bounds.size.width, self.searchIconHeight) rate:roundRate];
    [self setSearchFieldBackgroundImage:image forState:UIControlStateNormal];
}

- (void)setCustomBgColor:(UIColor *)customBgColor{
    _customBgColor = customBgColor;
    UIImage * image = [UIImage wya_imageWithColor:_customBgColor size:CGSizeMake(self.selfWidth, self.searchIconHeight) rate:self.roundRate];
    [self setSearchFieldBackgroundImage:image forState:UIControlStateNormal];
}
@end
