//
//  WYAEditCameraCell.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAEditCameraCell.h"

@interface WYAEditCameraCell ()
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UIButton * button;
@end

@implementation WYAEditCameraCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.button];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.imageView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.edges.mas_equalTo(self.contentView);
    }];

    [self.button mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerX.mas_equalTo(self.contentView.mas_right);
        make.centerY.mas_equalTo(self.contentView.mas_top);
        make.size.mas_equalTo(CGSizeMake(20 * SizeAdapter, 20 * SizeAdapter));
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView * view = [super hitTest:point withEvent:event];

    if (view == nil) {
        for (UIView * subView in self.contentView.subviews) {
            CGPoint myPoint = [subView convertPoint:point fromView:self];

            if (CGRectContainsPoint(subView.bounds, myPoint)) { return subView; }
        }
    }

    return view;
}

#pragma mark - Private Method -
- (void)buttonClick {
    if (self.editBlock) { self.editBlock(); }
}

#pragma mark - Setter -
- (void)setImage:(UIImage *)image {
    _image = image;
    if (image) { self.imageView.image = image; }
}

#pragma mark - Getter -
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = ({
            UIImageView * object       = [[UIImageView alloc] init];
            object.contentMode         = UIViewContentModeScaleAspectFill;
            object.layer.masksToBounds = YES;
            object;
        });
    }
    return _imageView;
}

- (UIButton *)button {
    if (!_button) {
        _button = ({
            UIButton * object = [[UIButton alloc] init];
            [object setImage:[UIImage loadBundleImage:@"icon_delete"
                                            ClassName:NSStringFromClass(self.class)]
                    forState:UIControlStateNormal];
            [object addTarget:self
                          action:@selector(buttonClick)
                forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _button;
}

@end
