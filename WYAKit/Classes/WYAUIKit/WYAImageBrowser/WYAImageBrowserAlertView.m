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
@end

@implementation WYAImageBrowserAlertView
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
        [self configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.flexDirection = YGFlexDirectionColumnReverse;
            layout.alignItems = YGAlignFlexStart;
        }];

        [self.outContainerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.flexDirection = YGFlexDirectionColumn;
            layout.justifyContent = YGJustifySpaceBetween;
            layout.alignItems = YGAlignStretch;
            layout.minHeight = YGPointValue(0);
            layout.minWidth = YGPointValue(frame.size.width);
            layout.bottom = YGPointValue(200);
        }];
        [self addSubview:self.outContainerView];

        [self.topContainerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.flexDirection = YGFlexDirectionColumn;
            layout.justifyContent = YGJustifyCenter;
            layout.alignSelf = YGAlignCenter;
        }];
        [self.outContainerView addSubview:self.topContainerView];

        [self.bottomContainerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.marginTop = YGPointValue(10);
            layout.flexDirection = YGFlexDirectionColumn;
            layout.justifyContent = YGJustifyCenter;
        }];
        [self.outContainerView addSubview:self.bottomContainerView];

        WYAAlertButton * button = [[WYAAlertButton alloc] initWithTitle:@"取消" titleFont:FONT(15) titleColor:[UIColor grayColor] image:nil backgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] clickBlock:^(WYAAlertButton * _Nonnull button) {

        }];

        [button configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.height = YGPointValue(44);
        }];
        [self.bottomContainerView addSubview:button];

        [self.bottomView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.height = YGPointValue(WYABottomHeight);
        }];
        if (WYAStatusBarHeight > 20) {
            [self.bottomContainerView addSubview:self.bottomView];
        }
        [self.yoga applyLayoutPreservingOrigin:YES];
    }
    return self;
}

#pragma mark - Public Method
- (void)addAlertButton:(WYAAlertButton *)button{
    button.alertView = self;
    [button configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(self.frame.size.width);
        layout.height = YGPointValue(44);
    }];
    [self.topContainerView addSubview:button];
    [self.yoga applyLayoutPreservingOrigin:YES];
}

- (void)show{

    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        [self.outContainerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.bottom = YGPointValue(0);
        }];
        [self.yoga applyLayoutPreservingOrigin:YES];
    }];

}

- (void)hidden{
    [UIView animateWithDuration:0.25 animations:^{
        [self.outContainerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.bottom = YGPointValue(200);
        }];
        [self.yoga applyLayoutPreservingOrigin:YES];
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
@end

@implementation WYAAlertButton
- (instancetype)initWithTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)titleColor image:(UIImage *)image backgroundImage:(UIImage *)backgroundImage clickBlock:(void(^)(WYAAlertButton *))block{
    self = [super init];
    if (self) {
        WeakSelf(weakSelf);
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        [self setImage:image forState:UIControlStateNormal];
        [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];

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
