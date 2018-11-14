//
//  ImagePickerCollectionViewCell.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/14.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "ImagePickerCollectionViewCell.h"

@interface ImagePickerCollectionViewCell ()

@property (nonatomic, strong) UIButton * button;

@end

@implementation ImagePickerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        _imageV = [[UIImageView alloc]init];
        [self.contentView addSubview:_imageV];
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setImage:[UIImage imageNamed:@"对号"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"对号_blue"] forState:UIControlStateSelected];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _button.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_button];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _imageV.frame = CGRectMake(CGRectGetMinX(self.contentView.frame),CGRectGetMinY(self.contentView.frame), self.frame.size.width,self.frame.size.height);
    _button.frame = CGRectMake(self.frame.size.width-30, 0, 30, 30);
}

- (void)buttonClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (self.selectImage) {
        self.selectImage(sender.selected);
    }
}

-(void)uncheckButton{
    _button.selected = NO;
}

@end
