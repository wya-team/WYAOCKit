//
//  ImagePickerCollectionViewCell.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/14.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAPhotoBrowserCell.h"
#import "WYAPhotoBrowserModel.h"
#import <Photos/Photos.h>

@interface WYAPhotoBrowserCell ()



@end

@implementation WYAPhotoBrowserCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        _imageV = [[UIImageView alloc]init];
        [self.contentView addSubview:_imageV];
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setImage:[UIImage loadBundleImage:@"对号" ClassName:NSStringFromClass([self class])] forState:UIControlStateNormal];
        [_button setImage:[UIImage loadBundleImage:@"对号_blue" ClassName:NSStringFromClass([self class])] forState:UIControlStateSelected];
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

-(void)setModel:(WYAPhotoBrowserModel *)model{
    _model = model;
    if (model) {
        if (model.cacheImage) {
            self.imageV.image = model.cacheImage;
        }else{
            PHImageManager * manager = [PHImageManager defaultManager];
            PHImageRequestOptions * opi = [[PHImageRequestOptions alloc]init];
            //        opi.synchronous = YES; //默认no，异步加载
            opi.resizeMode = PHImageRequestOptionsResizeModeFast;
            opi.deliveryMode = PHImageRequestOptionsDeliveryModeFastFormat;
            [manager requestImageDataForAsset:model.asset options:opi resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
                UIImage * image = [UIImage imageWithData:imageData];
                self.imageV.image = image;
                model.cacheImage = image;
            }];
        }
        self.button.selected = model.selected;
    }
}

- (void)buttonClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    self.model.selected = sender.selected;
    if (self.selectImage) {
        self.selectImage(sender.selected);
    }
}

-(void)uncheckButton{
    self.model.selected = NO;
    _button.selected = NO;
}

@end
