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
    
    CGFloat width = self.cmam_width/3;
    
    CGFloat editButton_X = (width-50*SizeAdapter)/2;
    CGFloat editButton_Y = 0;
    CGFloat editButton_Width = 50*SizeAdapter;
    CGFloat editButton_Height = self.cmam_height;
    self.editButton.frame = CGRectMake(editButton_X, editButton_Y, editButton_Width, editButton_Height);
    
    CGFloat centerButton_X = width;
    CGFloat centerButton_Y = 0;
    CGFloat centerButton_Width = width;
    CGFloat centerButton_Height = self.cmam_height;
    self.centerButton.frame = CGRectMake(centerButton_X, centerButton_Y, centerButton_Width, centerButton_Height);
    
    CGFloat doneButton_X = width*2+(width-30*SizeAdapter)/2;
    CGFloat doneButton_Y = (self.cmam_height-30*SizeAdapter)/2;
    CGFloat doneButton_Width = 50*SizeAdapter;
    CGFloat doneButton_Height = 30*SizeAdapter;
    self.doneButton.frame = CGRectMake(doneButton_X, doneButton_Y, doneButton_Width, doneButton_Height);
    
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

#pragma mark - Setter -
- (void)setVideoHidden:(BOOL)videoHidden{
    self.editButton.hidden = videoHidden;
    self.centerButton.hidden = videoHidden;
}

#pragma mark --- Getter
- (UIButton *)editButton{
    if(!_editButton){
        _editButton = ({
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"编辑" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONT(13);
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
            button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20*SizeAdapter);
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
            
            [button setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor wya_hex:@"#108DE7"]] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(doneClick) forControlEvents:UIControlEventTouchUpInside];
            button;
       });
    }
    return _doneButton;
}
@end
