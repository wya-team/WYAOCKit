//
//  WYAImageCropToolBar.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/3.
//

#import "WYAImageCropToolBar.h"

@interface WYAImageCropToolBar ()
@property (nonatomic, strong) UIView * line;
@property (nonatomic, strong) UIButton * rotatingButton;
@property (nonatomic, strong) UIButton * cancelButton;
@property (nonatomic, strong) UIButton * doneButton;
@property (nonatomic, strong) UIButton * originalButton;

@end

@implementation WYAImageCropToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];
        
        self.rotatingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.rotatingButton setImage:[UIImage loadBundleImage:@"xuanzhuan" ClassName:NSStringFromClass(self.class)] forState:UIControlStateNormal];
        [self.rotatingButton addTarget:self action:@selector(rotatingClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.rotatingButton];
        
        self.line = [[UIView alloc]init];
        self.line.backgroundColor = random(233, 233, 233, 1);
        [self addSubview:self.line];
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cancelButton setImage:[UIImage loadBundleImage:@"mistake" ClassName:NSStringFromClass(self.class)] forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancelButton];
        
        self.doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.doneButton setImage:[UIImage loadBundleImage:@"correct" ClassName:NSStringFromClass(self.class)] forState:UIControlStateNormal];
        [self.doneButton addTarget:self action:@selector(doneClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.doneButton];
        
        self.originalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.originalButton setTitle:@"还原" forState:UIControlStateNormal];
        [self.originalButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.originalButton.titleLabel.font = FONT(15);
        [self.originalButton addTarget:self action:@selector(originalClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.originalButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.rotatingButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).with.offset(16*SizeAdapter);
        make.top.mas_equalTo(self.mas_top).with.offset(10*SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(30*SizeAdapter, 30*SizeAdapter));
    }];
    
    [self.line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.cancelButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.rotatingButton.mas_left);
        make.bottom.mas_equalTo(self.mas_bottom).with.offset(-10*SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(30*SizeAdapter, 30*SizeAdapter));
    }];
    
    [self.doneButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).with.offset(-16*SizeAdapter);
        make.bottom.mas_equalTo(self.mas_bottom).with.offset(-10*SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(30*SizeAdapter, 30*SizeAdapter));
    }];
    
    [self.originalButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.cancelButton.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(50*SizeAdapter, 30*SizeAdapter));
    }];
}

#pragma mark --- Private Method
- (void)rotatingClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(rotatingAction)]) {
        [self.delegate rotatingAction];
    }
}

- (void)cancelClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(cancelAction)]) {
        [self.delegate cancelAction];
    }
}

- (void)doneClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(doneAction)]) {
        [self.delegate doneAction];
    }
}

- (void)originalClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(originalAction)]) {
        [self.delegate originalAction];
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
