//
//  WYAPhotoEditControlView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/30.
//

#import "WYAPhotoEditControlView.h"

@interface WYAPhotoEditControlView ()
@property (nonatomic, strong) UIButton * editButton;
@property (nonatomic, strong) UIButton * centerButton;
@property (nonatomic, strong) UIButton * doneButton;
@end

@implementation WYAPhotoEditControlView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.3];
        [self addSubview:self.editButton];
        [self addSubview:self.centerButton];
        [self addSubview:self.doneButton];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];

    [self.subviews wya_mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0 fixedLineSpacing:0 fixedInteritemSpacing:80 warpCount:self.subviews.count topSpacing:10 bottomSpacing:10 leadSpacing:20 tailSpacing:20];
}

#pragma mark --- Private Method
-(void)editClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(edit)]) {
        [self.delegate edit];
    }
}

-(void)centerClick:(UIButton *)button{
    button.selected = !button.selected;
    if (self.delegate && [self.delegate respondsToSelector:@selector(editWithOriginalImage:)]) {
        [self.delegate editWithOriginalImage:button.selected];
    }
}

-(void)doneClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(done)]) {
        [self.delegate done];
    }
}

#pragma mark --- Getter
- (UIButton *)editButton{
    if(!_editButton){
        _editButton = ({
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"编辑" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONT(13);
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [button addTarget:self action:@selector(editClick) forControlEvents:UIControlEventTouchUpInside];
            button;
       });
    }
    return _editButton;
}

- (UIButton *)centerButton{
    if(!_centerButton){
        _centerButton = ({
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"原图" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setImage:[UIImage loadBundleImage:@"icon_cameraOriginal_normal" ClassName:NSStringFromClass(self.class)] forState:UIControlStateNormal];
            [button setImage:[UIImage loadBundleImage:@"icon_radio_selected" ClassName:NSStringFromClass(self.class)] forState:UIControlStateSelected];
            button.titleLabel.font = FONT(13);
            [button addTarget:self action:@selector(centerClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
       });
    }
    return _centerButton;
}

- (UIButton *)doneButton{
    if(!_doneButton){
        _doneButton = ({
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"发送" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONT(13);
            
            [button setBackgroundColor:[UIColor greenColor]];
            [button addTarget:self action:@selector(doneClick) forControlEvents:UIControlEventTouchUpInside];
            button;
       });
    }
    return _doneButton;
}
@end
