//
//  WYACameraPreviewImageView.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/8.
//

#import "WYACameraPreviewImageView.h"

@interface WYACameraPreviewImageView ()
@property (nonatomic, strong) UIButton * cancelButton;
@property (nonatomic, strong) UIButton * finishButton;
@property (nonatomic, strong) UIButton * editButton;
@end

@implementation WYACameraPreviewImageView

- (instancetype)init {
    self = [super init];
    if (self) { [self setup]; }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) { [self setup]; }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self.editButton mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.mas_centerY).with.offset(230 * SizeAdapter);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(60 * SizeAdapter, 60 * SizeAdapter));
    }];

    [self.cancelButton mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.editButton.mas_centerY);
        make.right.mas_equalTo(self.editButton.mas_left)
            .with.offset(-(self.cmam_width - 180 * SizeAdapter) / 4);
        make.size.mas_equalTo(CGSizeMake(60 * SizeAdapter, 60 * SizeAdapter));
    }];

    [self.finishButton mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.editButton.mas_centerY);
        make.left.mas_equalTo(self.editButton.mas_right)
            .with.offset((self.cmam_width - 180 * SizeAdapter) / 4);
        make.size.mas_equalTo(CGSizeMake(60 * SizeAdapter, 60 * SizeAdapter));
    }];
}

#pragma mark - Private Method -
- (void)setup {
    [self addSubview:self.cancelButton];
    [self addSubview:self.editButton];
    [self addSubview:self.finishButton];
}

#pragma mark - Getter -
- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = ({
            UIButton * object = [[UIButton alloc] init];
            [object setImage:[UIImage loadBundleImage:@"icon_camera_back"
                                            ClassName:NSStringFromClass([self class])]
                    forState:UIControlStateNormal];
            [object addCallBackAction:^(UIButton * button) {
                if (self.cancelHandle) { self.cancelHandle(); }
            }];
            object;
        });
    }
    return _cancelButton;
}

- (UIButton *)finishButton {
    if (!_finishButton) {
        _finishButton = ({
            UIButton * object = [[UIButton alloc] init];
            [object setImage:[UIImage loadBundleImage:@"icon_camera_save"
                                            ClassName:NSStringFromClass([self class])]
                    forState:UIControlStateNormal];
            [object addCallBackAction:^(UIButton * button) {
                if (self.finishHandle) { self.finishHandle(self.image); }
            }];
            object;
        });
    }
    return _finishButton;
}

- (UIButton *)editButton {
    if (!_editButton) {
        _editButton = ({
            UIButton * object = [[UIButton alloc] init];
            [object setImage:[UIImage loadBundleImage:@"icon_camera_list"
                                            ClassName:NSStringFromClass([self class])]
                    forState:UIControlStateNormal];
            WeakSelf(weakSelf);
            [object addCallBackAction:^(UIButton * button) {
                StrongSelf(strongSelf);
                if (strongSelf.editHandle) { strongSelf.editHandle(strongSelf.image); }
            }];
            object;
        });
    }
    return _editButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
