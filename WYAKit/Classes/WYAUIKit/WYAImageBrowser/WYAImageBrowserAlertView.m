//
//  WYAImageBrowserAlertView.m
//  WYAKit
//
//  Created by 李世航 on 2019/5/31.
//

#import "WYAImageBrowserAlertView.h"

@interface WYAImageBrowserAlertView ()
@property (nonatomic, strong) UIView * outContainerView;
@property (nonatomic, strong) UIView * inContainerView;
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
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
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
            layout.height = YGPointValue(0);
            layout.minWidth = YGPointValue(frame.size.width);
        }];
        [self addSubview:self.outContainerView];

        [self.inContainerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.flexDirection = YGFlexDirectionColumn;
            layout.justifyContent = YGJustifyCenter;
            layout.alignSelf = YGAlignCenter;
        }];
        [self.outContainerView addSubview:self.inContainerView];

        WYAAlertButton * button = [[WYAAlertButton alloc] initWithTitle:@"取消" titleFont:FONT(15) titleColor:[UIColor grayColor] image:nil backgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] clickBlock:^(WYAAlertButton * _Nonnull button) {

        }];

        [button configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.height = YGPointValue(44);
            layout.marginTop = YGPointValue(10);
            layout.marginBottom = YGPointValue(WYABottomHeight);
        }];
        [self.outContainerView addSubview:button];

        [self.yoga applyLayoutPreservingOrigin:YES];
    }
    return self;
}

#pragma mark - Public Method
- (void)addAlertButton:(WYAAlertButton *)button{
    [button configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(self.frame.size.width);
        layout.height = YGPointValue(44);
    }];
    [self.inContainerView addSubview:button];
    [self.yoga applyLayoutPreservingOrigin:YES];
}

- (void)show{
    [UIView animateWithDuration:0.5 animations:^{
        [self.outContainerView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.minHeight = YGPointValue(0);
        }];
        [self.yoga applyLayoutPreservingOrigin:YES];
    }];
}

- (void)hidden{
    
}

#pragma mark - Setter


#pragma mark - Getter
- (UIView *)outContainerView{
    if(!_outContainerView){
        _outContainerView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor redColor];
            object;
        });
    }
    return _outContainerView;
}

- (UIView *)inContainerView{
    if(!_inContainerView){
        _inContainerView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor whiteColor];
            object;
       });
    }
    return _inContainerView;
}

@end

@implementation WYAAlertButton
- (instancetype)initWithTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)titleColor image:(UIImage *)image backgroundImage:(UIImage *)backgroundImage clickBlock:(void(^)(WYAAlertButton *))block{
    self = [super init];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        [self setImage:image forState:UIControlStateNormal];
        [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
        
        [self addCallBackAction:^(UIButton *button) {
            if (block) {
                block(button);
            }
        }];
    }
    return self;
}

@end
