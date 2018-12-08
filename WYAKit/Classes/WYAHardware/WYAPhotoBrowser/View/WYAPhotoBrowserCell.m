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

@property (nonatomic, strong) UIButton * videoButton;//只是用来显示图片和文字的，没有其他用

@end

@implementation WYAPhotoBrowserCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        self.imageV = [[UIImageView alloc]init];
        self.imageV.contentMode = UIViewContentModeScaleAspectFill;
        self.imageV.layer.masksToBounds = YES;
        [self.contentView addSubview:self.imageV];

        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.button setImage:[UIImage loadBundleImage:@"对号" ClassName:NSStringFromClass([self class])] forState:UIControlStateNormal];
        [self.button setImage:[UIImage loadBundleImage:@"对号_blue" ClassName:NSStringFromClass([self class])] forState:UIControlStateSelected];
        [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.button.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.button];
        
        self.videoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.videoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.videoButton.titleLabel.font = FONT(15);
        self.videoButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.videoButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 15*SizeAdapter);
        self.videoButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10*SizeAdapter, 0, 0);
        [self.contentView addSubview:self.videoButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageV.frame = CGRectMake(CGRectGetMinX(self.contentView.frame),CGRectGetMinY(self.contentView.frame), self.contentView.frame.size.width,self.contentView.frame.size.height);
    self.button.frame = CGRectMake(self.contentView.frame.size.width*0.8, 0, self.contentView.frame.size.width*0.2, self.contentView.frame.size.width*0.2);
    self.videoButton.frame = CGRectMake(0, self.contentView.cmam_height*0.7, self.contentView.cmam_width, self.contentView.cmam_height*0.3);
}

-(void)setModel:(WYAPhotoBrowserModel *)model{
    _model = model;
    if (model) {
        [self.videoButton setImage:nil forState:UIControlStateNormal];
        [self.videoButton setTitle:nil forState:UIControlStateNormal];
        PHAsset * asset = (PHAsset *)model.asset;
        if (asset.mediaType == PHAssetMediaTypeVideo) {
            [self.videoButton setImage:[UIImage loadBundleImage:@"video" ClassName:NSStringFromClass(self.class)] forState:UIControlStateNormal];
            NSInteger time = (NSInteger)asset.duration;
            NSInteger dur = time%60;
            NSInteger due = time/60;
            NSString * string = [NSString stringWithFormat:@"%ld:%ld",(long)due,(long)dur];
            NSLog(@"string==%@",string);
            [self.videoButton setTitle:string forState:UIControlStateNormal];
        }
        
        if (model.cacheImage) {
            self.imageV.image = model.cacheImage;
        }else{
            
            
            
            CGFloat ratio = asset.pixelWidth/(CGFloat)asset.pixelHeight;
            CGFloat width =  self.cmam_width*[UIScreen mainScreen].scale*3;
            // 超宽图片
            if (ratio > 1.8) {
                width = width * ratio;
            }
            // 超高图片
            if (ratio < 0.2) {
                width = width * 0.5;
            }
            CGFloat height = width/ratio;

            PHImageManager * manager = [PHImageManager defaultManager];
            PHImageRequestOptions * opi = [[PHImageRequestOptions alloc]init];
            //        opi.synchronous = YES; //默认no，异步加载
            opi.resizeMode = PHImageRequestOptionsResizeModeFast;
            //            opi.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
            
            [manager requestImageForAsset:model.asset targetSize:CGSizeMake(width, height) contentMode:PHImageContentModeAspectFill options:opi resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
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
