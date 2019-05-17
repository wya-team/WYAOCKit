//
//  controlView.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/15.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAPhotoBrowserBottomBar.h"

@interface WYAPhotoBrowserBottomBar ()



@end

@implementation WYAPhotoBrowserBottomBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:1];

        self.previewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.previewButton setTitle:@"预览" forState:UIControlStateNormal];
        [self.previewButton setTitle:@"预览" forState:UIControlStateDisabled];
        [self.previewButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.previewButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        self.previewButton.frame = CGRectMake(15, 0, 45, frame.size.height);
        self.previewButton.enabled = NO;
        [self.previewButton addTarget:self
                               action:@selector(previewClick)
                     forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.previewButton];

        self.doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.doneButton setTitle:@"完成" forState:UIControlStateDisabled];
        [self.doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.doneButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        self.doneButton.frame = CGRectMake(ScreenWidth - 85, 15, 70, frame.size.height - 30);
        self.doneButton.enabled = NO;
        [self.doneButton addTarget:self
                            action:@selector(doneClick)
                  forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.doneButton];
    }
    return self;
}

- (void)previewClick {
    if (self.previewBlock) { self.previewBlock(); }
}

- (void)doneClick {
    if (self.doneBlock) { self.doneBlock(); }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end