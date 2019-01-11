//
//  WYANumberImage.m
//  AFNetworking
//
//  Created by 李俊恒 on 2018/12/20.
//

#import "WYANumberImage.h"

@interface WYANumberImage ()
@property (nonatomic, strong) UIButton * deleteButton;
@property (nonatomic, strong) UIButton * sureButton;
@end
;

@implementation WYANumberImage
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.deleteButton];
        [self addSubview:self.sureButton];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.top.mas_equalTo(self);
        make.height.mas_equalTo(100);
    }];
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(100);
    }];
}
- (UIButton *)deleteButton {
    if (!_deleteButton) {
        _deleteButton = ({
            UIButton * object = [[UIButton alloc] init];
            [object setImage:[UIImage loadBundleImage:@"icon_delete2"
                                            ClassName:NSStringFromClass(self.class)]
                    forState:UIControlStateNormal];
            object.layer.borderColor   = [UIColor groupTableViewBackgroundColor].CGColor;
            object.layer.borderWidth   = 0.5;
            object.layer.masksToBounds = YES;
            // button长按事件
            UILongPressGestureRecognizer * longPress =
                [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                              action:@selector(deleteBtnLong:)];
            [object addGestureRecognizer:longPress];
            [object addTarget:self
                          action:@selector(deleteButtonClicked:)
                forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _deleteButton;
}

- (UIButton *)sureButton {
    if (!_sureButton) {
        _sureButton = ({
            UIButton * object          = [[UIButton alloc] init];
            object.titleLabel.font     = FONT(27);
            object.layer.borderColor   = [UIColor groupTableViewBackgroundColor].CGColor;
            object.layer.borderWidth   = 0.5;
            object.layer.masksToBounds = YES;
            [object setTitle:@"确定" forState:UIControlStateNormal];
            [object setTitleColor:[UIColor wya_hex:@"#FFFFFF"] forState:UIControlStateNormal];
            object.backgroundColor = [UIColor wya_hex:@"#108DE7"];
            [object addTarget:self
                          action:@selector(sureButtonClicked:)
                forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _sureButton;
}
#pragma mark ======= action
- (void)deleteButtonClicked:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_deletePressed:)]) {
        [self.delegate wya_deletePressed:@"删除"];
    }
}
- (void)deleteBtnLong:(UIGestureRecognizer *)gestureRecognizer {
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_deletePressed:)]) {
        [self.delegate wya_deletePressed:@"删除"];
    }
}
- (void)sureButtonClicked:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_surePressed:)]) {
        [self.delegate wya_surePressed:@"确定"];
    }
}
@end
