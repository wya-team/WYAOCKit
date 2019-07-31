//
//  WYAImageBrowserAlertView.m
//  WYAKit
//
//  Created by 李世航 on 2019/5/31.
//

#import "WYAImageBrowserAlertView.h"

@interface WYAImageBrowserAlertView ()
@property (nonatomic, strong) UIView * outContainerView;
@property (nonatomic, strong) UIView * topContainerView;
@property (nonatomic, strong) UIView * bottomContainerView;
@property (nonatomic, strong) UIView * bottomView;
@property (nonatomic, strong) WYAAlertButton * cancelButton;
@end

@implementation WYAImageBrowserAlertView
{
    WYAAlertButton * lastButton;
}
#pragma mark - LifeCircle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        WeakSelf(weakSelf);
        [self wya_AddTapGesturesWithTapStyle:WYATapGesturesStyleSingle TapHandle:^(UITapGestureRecognizer * _Nonnull gesture) {
            [weakSelf hidden];
        }];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
//        [self configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//            layout.isEnabled = YES;
//            layout.flexDirection = YGFlexDirectionColumnReverse;
//            layout.alignItems = YGAlignFlexStart;
//        }];

//        [self.outContainerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//            layout.isEnabled = YES;
//            layout.flexDirection = YGFlexDirectionColumn;
//            layout.justifyContent = YGJustifySpaceBetween;
//            layout.alignItems = YGAlignStretch;
//            layout.minHeight = YGPointValue(0);
//            layout.minWidth = YGPointValue(frame.size.width);
//            layout.bottom = YGPointValue(200);
//        }];
        [self addSubview:self.outContainerView];

//        [self.topContainerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//            layout.isEnabled = YES;
//            layout.flexDirection = YGFlexDirectionColumn;
//            layout.justifyContent = YGJustifyCenter;
//            layout.alignSelf = YGAlignCenter;
//        }];
        [self.outContainerView addSubview:self.topContainerView];

//        [self.bottomContainerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//            layout.isEnabled = YES;
//            layout.marginTop = YGPointValue(10);
//            layout.flexDirection = YGFlexDirectionColumn;
//            layout.justifyContent = YGJustifyCenter;
//        }];
        [self.outContainerView addSubview:self.bottomContainerView];



//        [button configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//            layout.isEnabled = YES;
//            layout.height = YGPointValue(44);
//        }];
        [self.bottomContainerView addSubview:self.cancelButton];

//        [self.bottomView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//            layout.isEnabled = YES;
//            layout.height = YGPointValue(WYABottomHeight);
//        }];
        if (WYAStatusBarHeight > 20) {
            [self.bottomContainerView addSubview:self.bottomView];
        }
//        [self.yoga applyLayoutPreservingOrigin:YES];

        CGFloat outContainerView_x = 0;
        CGFloat outContainerView_y = self.cmam_height;
        CGFloat outContainerView_width = self.cmam_width;
        CGFloat outContainerView_height = 59 * SizeAdapter + WYABottomHeight;
        CGRect outContainerView_rect = CGRectMake(outContainerView_x, outContainerView_y,  outContainerView_width, outContainerView_height);
        self.outContainerView.frame = outContainerView_rect;

        CGFloat topContainerView_x = 0;
        CGFloat topContainerView_y = 0;
        CGFloat topContainerView_width = self.outContainerView.cmam_width;
        CGFloat topContainerView_height = self.topContainerView.subviews.count * 44 * SizeAdapter;
        CGRect topContainerView_rect = CGRectMake(topContainerView_x, topContainerView_y,  topContainerView_width, topContainerView_height);
        self.topContainerView.frame = topContainerView_rect;

        CGFloat bottomContainerView_x = 0;
        CGFloat bottomContainerView_y = self.outContainerView.cmam_height - 49 * SizeAdapter - WYABottomHeight;
        CGFloat bottomContainerView_width = self.outContainerView.cmam_width;
        CGFloat bottomContainerView_height = 49 * SizeAdapter - WYABottomHeight;
        CGRect bottomContainerView_rect = CGRectMake(bottomContainerView_x, bottomContainerView_y,  bottomContainerView_width, bottomContainerView_height);
        self.bottomContainerView.frame = bottomContainerView_rect;

        CGFloat cancelButton_x = 0;
        CGFloat cancelButton_y = 0;
        CGFloat cancelButton_width = self.bottomContainerView.cmam_width;
        CGFloat cancelButton_height = 49 * SizeAdapter;
        CGRect cancelButton_rect = CGRectMake(cancelButton_x, cancelButton_y,  cancelButton_width, cancelButton_height);
        self.cancelButton.frame = cancelButton_rect;

        CGFloat bottomView_x = 0;
        CGFloat bottomView_y = self.cancelButton.cmam_bottom;
        CGFloat bottomView_width = self.bottomContainerView.cmam_width;
        CGFloat bottomView_height = WYABottomHeight;
        CGRect bottomView_rect = CGRectMake(bottomView_x, bottomView_y,  bottomView_width, bottomView_height);
        self.bottomView.frame = bottomView_rect;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    [self.outContainerView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(self);
//        make.top.mas_equalTo(self.mas_bottom);
//        make.height.mas_greaterThanOrEqualTo(59 * SizeAdapter + WYABottomHeight);
//    }];
//
//    [self.topContainerView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.mas_equalTo(self.outContainerView);
//    }];
//
//    [self.bottomContainerView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.mas_equalTo(self.outContainerView);
//        if (WYAStatusBarHeight > 20) {
//            make.height.mas_equalTo(49 * SizeAdapter + WYABottomHeight);
//        } else {
//            make.height.mas_equalTo(49 * SizeAdapter);
//        }
//    }];
//
//    [self.cancelButton mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.mas_equalTo(self.bottomContainerView);
//        make.height.mas_equalTo(49 * SizeAdapter);
//    }];
//
//    if (WYAStatusBarHeight > 20) {
//        [self.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.bottom.mas_equalTo(self.bottomContainerView);
//            make.height.mas_equalTo(WYABottomHeight);
//        }];
//    }

}

#pragma mark - Public Method
- (void)addAlertButton:(WYAAlertButton *)button{
    button.alertView = self;
//    [button configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.top = YGPointValue(1);
//        layout.width = YGPointValue(self.frame.size.width);
//        layout.height = YGPointValue(44);
//    }];
    [self.topContainerView addSubview:button];
//    [self.yoga applyLayoutPreservingOrigin:YES];
//    [button mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(self.topContainerView);
//        make.top.mas_equalTo(lastButton ? lastButton.mas_bottom : self.topContainerView.mas_top);
//        make.height.mas_equalTo(44 * SizeAdapter);
//    }];

//    [self layoutIfNeeded];

//    [self.topContainerView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(self.topContainerView.subviews.count * 44 * SizeAdapter);
//    }];

//    [self layoutIfNeeded];
//    [self setNeedsLayout];

    CGFloat button_x = 0;
    CGFloat button_y = lastButton ? lastButton.cmam_bottom : 0;
    CGFloat button_width = self.cmam_width;
    CGFloat button_height = 44 * SizeAdapter;
    CGRect button_rect = CGRectMake(button_x, button_y,  button_width, button_height);
    button.frame = button_rect;
    lastButton = button;
    self.topContainerView.cmam_height = self.topContainerView.subviews.count * 44 * SizeAdapter;
    self.outContainerView.cmam_height = self.outContainerView.cmam_height + self.topContainerView.subviews.count * 44 * SizeAdapter;
    self.bottomContainerView.cmam_top = self.outContainerView.cmam_height - 49 * SizeAdapter - WYABottomHeight;
}

- (void)show{

    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
//        [self.outContainerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//            layout.bottom = YGPointValue(0);
//        }];
//        [self.yoga applyLayoutPreservingOrigin:YES];

//        [self layoutIfNeeded];
//        [self.outContainerView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(self.mas_bottom);
//        }];

        self.outContainerView.cmam_top = self.cmam_height - self.outContainerView.cmam_height;
    }];

}

- (void)hidden{
    [UIView animateWithDuration:0.25 animations:^{
//        [self.outContainerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//            layout.bottom = YGPointValue(200);
//        }];
//        [self.yoga applyLayoutPreservingOrigin:YES];

//        [self layoutIfNeeded];
//        [self.outContainerView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.mas_bottom);
//        }];
        self.outContainerView.cmam_top = self.cmam_height;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - Setter


#pragma mark - Getter
- (UIView *)outContainerView{
    if(!_outContainerView){
        _outContainerView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor grayColor];
            object;
        });
    }
    return _outContainerView;
}

- (UIView *)topContainerView{
    if(!_topContainerView){
        _topContainerView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor whiteColor];
            object;
       });
    }
    return _topContainerView;
}

- (UIView *)bottomContainerView{
    if(!_bottomContainerView){
        _bottomContainerView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor whiteColor];
            object;
       });
    }
    return _bottomContainerView;
}

- (UIView *)bottomView{
    if(!_bottomView){
        _bottomView = ({
            UIView * object = [[UIView alloc]init];
            object;
       });
    }
    return _bottomView;
}

- (WYAAlertButton *)cancelButton{
    if(!_cancelButton){
        _cancelButton = ({
            WYAAlertButton * object = [[WYAAlertButton alloc] initWithTitle:@"取消" titleFont:FONT(15) titleColor:[UIColor grayColor] image:nil backgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] clickBlock:^(WYAAlertButton * _Nonnull button) {

            }];
            object;
       });
    }
    return _cancelButton;
}
@end

@implementation WYAAlertButton
- (instancetype)initWithTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)titleColor image:(UIImage *)image backgroundImage:(UIImage *)backgroundImage clickBlock:(void(^)(WYAAlertButton *))block{
    self = [super init];
    if (self) {
        WeakSelf(weakSelf);
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
//        [self setImage:image forState:UIControlStateNormal];
//        [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];

        [self addCallBackAction:^(UIButton *button) {
            [weakSelf.alertView removeFromSuperview];
            if (block) {
                block(button);
            }
        }];
    }
    return self;
}

@end
