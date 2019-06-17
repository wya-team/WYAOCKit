
#import "WYAAlertView.h"
#import "WYAAlertAction.h"

@interface WYAAlertView () <UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray<WYAAlertAction *> * actions; // 保存事件的数组
@property (nonatomic, strong) NSMutableArray<UIButton *> * buttons; // 保存按钮的数组
@property (nonatomic, strong) UIView * containerView; // scrollView 外层容器视图
@property (nonatomic, strong) UIView * buttonView; // 滚动视图
@property (nonatomic, strong) UILabel * titleLabel; // 标题
@property (nonatomic, strong) UILabel * messageLabel;  // 消息
@property (nonatomic, strong) UIView * textFieldView;
@property (nonatomic, strong) UIView * line;
@property (nonatomic, strong) UIImage * whiteImage; // 按钮白色背景
@property (nonatomic, strong) UIImage * grayImage; // 按钮灰色背景

@property (nonatomic, assign) CGFloat containerPadding; // containerView与屏幕之间的差值
@property (nonatomic, assign) CGFloat labelPadding; // label与containerView之间的差值
@property (nonatomic, assign) CGFloat textFieldPadding; // textField与containerView之间的差值
@end

@implementation WYAAlertView
#pragma mark - LifeCircle
- (_Nonnull instancetype)initWithTitle:(NSString * _Nullable)title
                               message:(NSString * _Nullable)message {
    self = [super init];
    if (self) {
        self.containerPadding = 100 * SizeAdapter;
        self.labelPadding     = 60 * SizeAdapter;
        self.textFieldPadding = 40 * SizeAdapter;

        self.layer.cornerRadius = 6;
        self.clipsToBounds      = YES;
        self.backgroundColor    = [UIColor colorWithWhite:0.9 alpha:1];

        // 添加到父视图
        [self addSubview:self.containerView];
        [self.containerView addSubview:self.buttonView];
        [self.containerView addSubview:self.titleLabel];
        [self.containerView addSubview:self.messageLabel];
        [self.containerView addSubview:self.textFieldView];
        [self.containerView addSubview:self.line];
        self.titleLabel.text            = title;
        self.messageLabel.text          = message;
    };

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self.containerView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(ScreenWidth - self.containerPadding);
        make.height.mas_lessThanOrEqualTo(ScreenHeight - 100 * SizeAdapter);
    }];

    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(self.containerView.mas_left).with.offset(self.labelPadding / 2);
        make.right.mas_equalTo(self.containerView.mas_right).with.offset(-(self.labelPadding / 2));

        if (self.titleLabel.text && self.titleLabel.text.length > 0) {
            make.top.mas_equalTo(self.containerView.mas_top).with.offset(15 * SizeAdapter);

            CGFloat titleHeight = [UILabel getHeightByWidth:ScreenWidth - self.containerPadding -
                                   self.labelPadding title:self.titleLabel.text font:self.titleLabel.font];
            make.height.mas_equalTo(titleHeight);

        } else {
            make.top.mas_equalTo(self.containerView.mas_top).with.offset(0 * SizeAdapter);
            make.height.mas_equalTo(0);
        }
    }];

    [self.messageLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(self.containerView.mas_left).with.offset(self.labelPadding / 2.0);
        make.right.mas_equalTo(self.containerView.mas_right).with.offset(-(self.labelPadding / 2.0));
        if (self.messageLabel.text && self.messageLabel.text.length > 0) {
            if (self.titleLabel.text && self.titleLabel.text.length > 0) {
                make.top.mas_equalTo(self.titleLabel.mas_bottom).with.offset(6.5 * SizeAdapter);
            } else {
                make.top.mas_equalTo(self.titleLabel.mas_bottom).with.offset(15 * SizeAdapter);
            }
            CGFloat titleHeight = [UILabel getHeightByWidth:ScreenWidth - self.containerPadding -
                                   self.labelPadding title:self.messageLabel.text font:self.messageLabel.font];
            make.height.mas_equalTo(titleHeight);
        } else {
            make.top.mas_equalTo(self.titleLabel.mas_bottom).with.offset(0 * SizeAdapter);
            make.height.mas_equalTo(0);
        }
    }];

    [self.textFieldView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(self.containerView.mas_left).with.offset(self.labelPadding / 2);
        make.right.mas_equalTo(self.containerView.mas_right).with.offset(-(self.labelPadding / 2));
        make.top.mas_equalTo(self.messageLabel.mas_bottom).with.offset(10 * SizeAdapter);
        if (self.textFieldView.subviews.count > 0) {
            make.height.mas_equalTo(36 * SizeAdapter);
        } else {
            make.height.mas_equalTo(0);
        }
    }];

    [self.line mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.right.mas_equalTo(self.containerView);
        make.top.mas_equalTo(self.textFieldView.mas_bottom).with.offset(10 * SizeAdapter);
        make.height.mas_equalTo(0.5);
    }];

    [self.buttonView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.right.bottom.mas_equalTo(self.containerView);
        make.top.mas_equalTo(self.line.mas_bottom).with.offset(0);
    }];
    NSInteger newLine;
    CGFloat lineSpacing;
    CGFloat itemSpecing;
    if (self.layoutStyle == WYAAlertLayoutStyleHorizontal) {
        newLine     = self.buttons.count;
        lineSpacing = 0;
        itemSpecing = 0.5;
    } else {
        newLine     = 1;
        lineSpacing = 0.5;
        itemSpecing = 0;
    }

    [self.buttonView.subviews wya_mas_distributeSudokuViewsWithFixedItemWidth:0
                                                              fixedItemHeight:50 * SizeAdapter
                                                             fixedLineSpacing:lineSpacing
                                                        fixedInteritemSpacing:itemSpecing
                                                                    warpCount:newLine
                                                                   topSpacing:0
                                                                bottomSpacing:0
                                                                  leadSpacing:0
                                                                  tailSpacing:0];
}

#pragma mark - Public Method
- (void)wya_addAction:(WYAAlertAction * _Nonnull)action {
    for (UIView * view in self.buttonView.subviews) { [view removeFromSuperview]; }

    // 添加到 action 数组
    [self.actions addObject:action];

    // 创建 button，设置它的属性
    UIButton * actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionButton setTag:[self.actions indexOfObject:action]];
    [actionButton setTitle:action.title forState:UIControlStateNormal];
    [actionButton setTitleColor:action.textColor forState:UIControlStateNormal];
    actionButton.titleLabel.font = action.textFont;
    [actionButton setBackgroundImage:self.whiteImage forState:UIControlStateNormal];
    [actionButton setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor colorWithRed:234.0 / 255.0 green:234.0 / 255.0 blue:234.0 / 255.0 alpha:1]] forState:UIControlStateHighlighted];

    [actionButton addTarget:self
                     action:@selector(actionButtonDidClicked:)
           forControlEvents:UIControlEventTouchUpInside];

    [self.buttons addObject:actionButton];

    for (UIButton * button in self.buttons) {
        [self.buttonView addSubview:button];
    }

    [self layoutIfNeeded];
}

- (void)wya_addTextField:(UITextField *)textField {
    [self.textFieldView addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker * make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];

    [self layoutIfNeeded];
}

#pragma mark - Event
- (void)actionButtonDidClicked:(UIButton *)sender {

    if (_controller) { [_controller dismissViewControllerAnimated:YES completion:nil]; }

    // 根据 tag 取到 handler
    void (^handler)(void) = self.actions[sender.tag].handler;
    if (handler) { handler(); }
}

#pragma mark - Setter
- (void)setLayoutStyle:(WYAAlertLayoutStyle)layoutStyle {
    _layoutStyle = layoutStyle;
    [self layoutIfNeeded];
}

#pragma mark - Getter
- (UIView *)containerView{
    if(!_containerView){
        _containerView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor whiteColor];
            object;
        });
    }
    return _containerView;
}

- (UIView *)buttonView{
    if(!_buttonView){
        _buttonView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = random(203, 203, 203, 1);
            object;
        });
    }
    return _buttonView;
}

- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object.textAlignment = NSTextAlignmentCenter;
            object.numberOfLines = 0;
            object.font          = FONT(17);
            object.textColor     = random(51, 51, 51, 1);
            object;
        });
    }
    return _titleLabel;
}

- (UILabel *)messageLabel{
    if(!_messageLabel){
        _messageLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object.textAlignment = NSTextAlignmentCenter;
            object.numberOfLines = 0;
            object.font          = FONT(13);
            object.textColor     = random(103, 103, 103, 1);
            object;
        });
    }
    return _messageLabel;
}

- (UIView *)textFieldView{
    if(!_textFieldView){
        _textFieldView = ({
            UIView * object = [[UIView alloc]init];
            object;
        });
    }
    return _textFieldView;
}

- (UIView *)line{
    if(!_line){
        _line = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor       = random(203, 203, 203, 1);
            object;
        });
    }
    return _line;
}

- (NSMutableArray<UIButton *> *)buttons {
    if (!_buttons) { _buttons = [NSMutableArray array]; }
    return _buttons;
}

- (NSMutableArray<WYAAlertAction *> *)actions {
    if (!_actions) { _actions = [NSMutableArray array]; }
    return _actions;
}

- (UIImage *)whiteImage {
    if (!_whiteImage) {
        _whiteImage = [UIImage loadBundleImage:@"white" ClassName:NSStringFromClass([self class])];
    }
    return _whiteImage;
}

- (UIImage *)grayImage {
    if (!_grayImage) {
        _grayImage = [UIImage loadBundleImage:@"gray" ClassName:NSStringFromClass([self class])];
    }
    return _grayImage;
}

- (CGFloat)width {
    return ScreenWidth - self.containerPadding;
}

- (CGFloat)height {
    [self layoutIfNeeded];
    return self.containerView.cmam_height;
}

@end
