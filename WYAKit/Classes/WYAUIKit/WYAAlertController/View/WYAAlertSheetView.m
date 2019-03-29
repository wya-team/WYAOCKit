//
//  WYAAlertSheetView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/14.
//

#import "WYAAlertSheetView.h"
#import "WYAAlertAction.h"

@interface WYAAlertSheetView ()
@property (nonatomic, strong) UIView * containerView;
@property (nonatomic, strong) UIButton * cancelButton;
@property (nonatomic, strong) UIView * titleView;
@property (nonatomic, strong) UIView * buttonView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * messageLabel;
@property (nonatomic, strong) NSMutableArray * buttons;
@property (nonatomic, strong) NSMutableArray<WYAAlertAction *> * actions;

@property (nonatomic, assign) CGFloat labelPadding;

@end

@implementation WYAAlertSheetView

- (_Nonnull instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    self = [super init];
    if (self) {
        self.labelPadding = 30 * SizeAdapter;

        [self addSubview:self.containerView];
        [self.containerView addSubview:self.cancelButton];
        [self.containerView addSubview:self.titleView];

        self.titleLabel.text            = title;
        [self.titleView addSubview:self.titleLabel];

        self.messageLabel.text            = message;
        [self.titleView addSubview:self.messageLabel];
        [self.containerView addSubview:self.buttonView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.containerView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];

    [self.cancelButton mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.right.bottom.mas_equalTo(self.containerView);
        make.height.mas_equalTo(44 * SizeAdapter);
    }];

    [self.buttonView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.right.mas_equalTo(self.containerView);
        make.bottom.mas_equalTo(self.cancelButton.mas_top)
            .with.offset(self.buttons.count > 0 ? -5 : 0);
        make.height.mas_equalTo(self.buttons.count * 50 * SizeAdapter).priorityHigh();
    }];

    [self.buttonView.subviews wya_mas_distributeSudokuViewsWithFixedItemWidth:0
                                                              fixedItemHeight:0
                                                             fixedLineSpacing:0.5
                                                        fixedInteritemSpacing:0
                                                                    warpCount:1
                                                                   topSpacing:0
                                                                bottomSpacing:0
                                                                  leadSpacing:0
                                                                  tailSpacing:0];

    [self.titleView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.top.left.right.mas_equalTo(self.containerView);
        make.bottom.mas_equalTo(self.buttonView.mas_top).with.offset(-0.5);
    }];

    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(self.titleView.mas_left).with.offset(self.labelPadding);
        make.right.mas_equalTo(self.titleView.mas_right).with.offset(-self.labelPadding);

        if (self.titleLabel.text && self.titleLabel.text.length > 0) {
            CGFloat height =
                [self.titleLabel.text wya_heightWithFontSize:15
                                                       width:ScreenWidth - 2 * self.labelPadding];
            make.height.mas_equalTo(height);
            make.top.mas_equalTo(self.titleView.mas_top).with.offset(5 * SizeAdapter);
        } else {
            make.height.mas_equalTo(0);
            make.top.mas_equalTo(self.titleView.mas_top).with.offset(0);
        }

    }];

    [self.messageLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(self.titleView.mas_left).with.offset(self.labelPadding);
        make.right.mas_equalTo(self.titleView.mas_right).with.offset(-self.labelPadding);

        make.bottom.mas_equalTo(self.titleView.mas_bottom);
        if (self.messageLabel.text && self.messageLabel.text.length > 0) {
            CGFloat height =
                [self.messageLabel.text wya_heightWithFontSize:15
                                                         width:ScreenWidth - 2 * self.labelPadding];
            make.height.mas_equalTo(height);
            make.top.mas_equalTo(self.titleLabel.mas_bottom);
        } else {
            make.height.mas_equalTo(0);
            make.top.mas_equalTo(self.titleLabel.mas_bottom);
        }
    }];
}

#pragma mark ======= Public Method
- (void)wya_addAction:(WYAAlertAction * _Nonnull)action {
    for (UIView * view in self.buttonView.subviews) { [view removeFromSuperview]; }

    // 添加到 action 数组
    [self.actions addObject:action];

    // 创建 button，设置它的属性
    UIButton * actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionButton setTag:[self.actions indexOfObject:action]];
    [actionButton setTitle:action.title forState:UIControlStateNormal];
    [actionButton setTitleColor:action.textColor
                       forState:UIControlStateNormal];
    actionButton.titleLabel.font = action.textFont;
    [actionButton setBackgroundColor:[UIColor whiteColor]];
    [actionButton addTarget:self
                     action:@selector(actionButtonDidClicked:)
           forControlEvents:UIControlEventTouchUpInside];

    // 添加到 button数组
    [self.buttons addObject:actionButton];

    for (UIButton * button in self.buttons) {
        // 添加到父视图
        [self.buttonView addSubview:button];
    }

    // 因为可能添加多个 button，所以只要标记为需要更新，这样即使添加了多次也只会更新一次
    [self layoutIfNeeded];
}

- (void)wya_addCornerRadiusWithNumber:(CGFloat)number{
    [self layoutIfNeeded];
    [self.containerView addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight withRadii:CGSizeMake(number, number) viewRect:self.containerView.bounds];
}

/** 点击按钮事件 */
- (void)actionButtonDidClicked:(UIButton *)sender {
    // 点击button后自动dismiss
    if (_controller) { [_controller dismissViewControllerAnimated:YES completion:nil]; }

    // 根据 tag 取到 handler
    void (^handler)(void) = self.actions[sender.tag].handler;
    if (handler) { handler(); }
}

- (void)cancelClick {
    // 点击button后自动dismiss
    if (_controller) { [_controller dismissViewControllerAnimated:YES completion:nil]; }
}

#pragma mark--- Getter
- (CGFloat)height {
    [self layoutIfNeeded];
    return self.containerView.cmam_height;
}

#pragma mark ======= Lazy
- (UIView *)containerView{
    if(!_containerView){
        _containerView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [[UIColor wya_hex:@"#F5F5F7"] colorWithAlphaComponent:1];
            object;
       });
    }
    return _containerView;
}

- (UIButton *)cancelButton{
    if(!_cancelButton){
        _cancelButton = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitle:@"取消" forState:UIControlStateNormal];
            [object setTitleColor:[UIColor wya_hex:@"#4787F2"] forState:UIControlStateNormal];
            object.titleLabel.font = FONT(16);
            [object setBackgroundColor:[UIColor whiteColor]];
            [object addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
            object;
       });
    }
    return _cancelButton;
}

- (UIView *)titleView{
    if(!_titleView){
        _titleView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor whiteColor];
            object;
       });
    }
    return _titleView;
}

- (UIView *)buttonView{
    if(!_buttonView){
        _buttonView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor =
            [UIColor colorWithRed:203.0 / 255.0
                            green:203.0 / 255.0
                             blue:203.0 / 255.0
                            alpha:1];
            object;
       });
    }
    return _buttonView;
}

- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object                 = [[UILabel alloc] init];
            object.textColor       = [UIColor lightGrayColor];
            object.font            = FONT(15);
            object.textAlignment   = NSTextAlignmentCenter;
            object.backgroundColor = [UIColor whiteColor];
            object;
       });
    }
    return _titleLabel;
}

- (UILabel *)messageLabel{
    if(!_messageLabel){
        _messageLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor       = [UIColor lightGrayColor];
            object.font            = FONT(13);
            object.numberOfLines   = 0;
            object.textAlignment   = NSTextAlignmentCenter;
            object.backgroundColor = [UIColor whiteColor];
            object;
       });
    }
    return _messageLabel;
}

- (NSMutableArray *)buttons{
    if(!_buttons){
        _buttons = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _buttons;
}

- (NSMutableArray<WYAAlertAction *> *)actions {
    if (!_actions) { _actions = [NSMutableArray arrayWithCapacity:0]; }
    return _actions;
}

@end
