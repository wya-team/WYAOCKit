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

        [self addSubview:self.previewButton];
        [self addSubview:self.originalButton];
        [self addSubview:self.doneButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.previewButton.frame = CGRectMake(15, 0, 45, self.frame.size.height);
    self.originalButton.frame = CGRectMake((self.cmam_width - 60)/2, 0 , 60, self.cmam_height);
    self.doneButton.frame = CGRectMake(ScreenWidth - 85, 15, 70, self.frame.size.height - 30);
}

#pragma mark - Private Method

#pragma mark - Lazy
- (UIButton *)previewButton{
    if(!_previewButton){
        _previewButton = ({
            UIButton * object = [UIButton buttonWithType:UIButtonTypeCustom];
            [object setTitle:@"预览" forState:UIControlStateNormal];
            [object setTitle:@"预览" forState:UIControlStateDisabled];
            [object setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [object setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
            object.enabled = NO;
            object.titleLabel.font = FONT(15);
            WeakSelf(weakSelf);
            [object addCallBackAction:^(UIButton *button) {
                if (weakSelf.previewBlock) { weakSelf.previewBlock(); }
            }];
            object;
       });
    }
    return _previewButton;
}

- (UIButton *)originalButton{
    if(!_originalButton){
        _originalButton = ({
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"原图" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setImage:[UIImage loadBundleImage:@"icon_cameraOriginal_normal"
                                            ClassName:NSStringFromClass(self.class)]
                    forState:UIControlStateNormal];
            [button setImage:[UIImage loadBundleImage:@"icon_radio_selected"
                                            ClassName:NSStringFromClass(self.class)]
                    forState:UIControlStateSelected];
            button.titleLabel.font = FONT(15);
            button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20 * SizeAdapter);
            WeakSelf(weakSelf);
            [button addCallBackAction:^(UIButton *button) {
                button.selected = !button.selected;
                if (weakSelf.originalBlock) {
                    weakSelf.originalBlock(button.selected);
                }
            }];
            button;
       });
    }
    return _originalButton;
}

- (UIButton *)doneButton{
    if(!_doneButton){
        _doneButton = ({
            UIButton * object = [UIButton buttonWithType:UIButtonTypeCustom];
            [object setTitle:@"完成" forState:UIControlStateDisabled];
            [object setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [object setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
            object.enabled = NO;
            object.titleLabel.font = FONT(15);
            WeakSelf(weakSelf);
            [object addCallBackAction:^(UIButton *button) {
                if (weakSelf.doneBlock) { weakSelf.doneBlock(); }
            }];;
            object;
       });
    }
    return _doneButton;
}
@end
