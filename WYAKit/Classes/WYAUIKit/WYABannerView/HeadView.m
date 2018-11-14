//
//  HeadView.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/19.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "HeadView.h"
#import "UIImage+Catagory.h"
@interface HeadView ()

@property (nonatomic, strong) UIButton * rightButton;

@end

@implementation HeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1];

        UIImage * image = [UIImage loadBundleImage:@"back" ClassName:NSStringFromClass([HeadView class])];
        UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:image forState:UIControlStateNormal];
        backButton.frame = CGRectMake(15, 20+(frame.size.height-20 - 30)/2, 30, 30);
        [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backButton];
        
        
        self.rightButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
//        [self.rightButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        self.rightButton.frame = CGRectMake(frame.size.width-45, 20+(frame.size.height -20 - 30)/2, 30, 30);
        [self.rightButton addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.rightButton];
    }
    return self;
}

- (void)setRightImage:(UIImage *)rightImage{
    [self.rightButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
}

- (void)backAction{
    if (self.backBlock) {
        self.backBlock();
    }
}

- (void)rightAction{
    if (self.rightBlock) {
        self.rightBlock();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
