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
        
        self.imageV = [[UIImageView alloc]init];
//        _imageV.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.imageV];

        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.button setImage:[UIImage loadBundleImage:@"对号" ClassName:NSStringFromClass([self class])] forState:UIControlStateNormal];
        [self.button setImage:[UIImage loadBundleImage:@"对号_blue" ClassName:NSStringFromClass([self class])] forState:UIControlStateSelected];
        [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.button.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.button];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageV.frame = CGRectMake(CGRectGetMinX(self.contentView.frame),CGRectGetMinY(self.contentView.frame), self.frame.size.width,self.frame.size.height);
    self.button.frame = CGRectMake(self.frame.size.width-30, 0, 30, 30);
}

-(void)setModel:(WYAPhotoBrowserModel *)model{
    _model = model;
    if (model) {
        if (model.cacheImage) {
            self.imageV.image = model.cacheImage;
        }else{
            PHAsset * asset = (PHAsset *)model.asset;
            CGFloat ratio = asset.pixelWidth/asset.pixelHeight;
            CGFloat width =  self.cmam_width*3;
            CGFloat height = width/ratio;
            PHImageManager * manager = [PHImageManager defaultManager];
            PHImageRequestOptions * opi = [[PHImageRequestOptions alloc]init];
            //        opi.synchronous = YES; //默认no，异步加载
            opi.resizeMode = PHImageRequestOptionsResizeModeFast;
//            opi.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
            
            [manager requestImageForAsset:model.asset targetSize:CGSizeMake(width, height) contentMode:PHImageContentModeAspectFit options:opi resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                self.imageV.image = result;
                model.cacheImage = result;
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
    self.button.selected = NO;
}

@end
