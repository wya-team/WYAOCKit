
#import "WYAAlertView.h"
#import "WYAAlertAction.h"


@interface WYAAlertView ()<UITextFieldDelegate>
{
    CGFloat containerPadding;//containerView与屏幕之间的差值
    CGFloat labelPadding;//label与containerView之间的差值
    CGFloat textFieldPadding; //textField与containerView之间的差值
}
/** 保存事件的数组 */
@property (nonatomic, strong)NSMutableArray<WYAAlertAction *> *actions;

/** 保存按钮的数组 */
@property (nonatomic, strong)NSMutableArray<UIButton *> *buttons;

/** scrollView 外层容器视图 */
@property (nonatomic, strong)UIView *containerView;

/** 滚动视图 */
@property (nonatomic, strong)UIView * buttonView;

/** 标题 */
@property (nonatomic, strong)UILabel *titleLabel;

/** 消息 */
@property (nonatomic, strong)UILabel *messageLabel;

@property (nonatomic, strong)UITextField * textField;

/** 按钮白色背景 */
@property (nonatomic, strong)UIImage *whiteImage;

/** 按钮灰色背景 */
@property (nonatomic, strong)UIImage *grayImage;

@end

@implementation WYAAlertView

/** 初始化方法 */
- (_Nonnull instancetype)initWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message {
    self = [super init];
    if (!self) { return nil; };
    
    containerPadding = 100*SizeAdapter;
    labelPadding = 60*SizeAdapter;
    textFieldPadding = 40*SizeAdapter;
    
    self.layer.cornerRadius = 6;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    // 初始化
    self.containerView = [[UIView alloc] init];
    self.titleLabel = [[UILabel alloc] init];
    self.messageLabel = [[UILabel alloc] init];
    self.textField = [[UITextField alloc]init];
    self.buttonView = [[UIView alloc] init];
    // 添加到父视图
    [self addSubview:self.containerView];
    [self.containerView addSubview:self.buttonView];
    [self.containerView addSubview:self.titleLabel];
    [self.containerView addSubview:self.messageLabel];
    [self.containerView addSubview:self.textField];
    // 设置 containerView
    self.containerView.backgroundColor = [UIColor whiteColor];
    
    // 设置 titleLabel
    self.titleLabel.text = title;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = FONT(17);
    
    // 设置 messageLabel
    self.messageLabel.text = message;
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.numberOfLines = 0;
    self.messageLabel.font = FONT(13);
    
    self.textField.delegate = self;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.containerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.center);
        make.width.mas_equalTo(ScreenWidth-self->containerPadding);
        make.height.mas_lessThanOrEqualTo(ScreenHeight-100*SizeAdapter);
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containerView.mas_left).with.offset(self->labelPadding/2);
        make.right.mas_equalTo(self.containerView.mas_right).with.offset(-(self->labelPadding/2));
        make.top.mas_equalTo(self.containerView.mas_top).with.offset(20*SizeAdapter);
        CGFloat titleHeight = [self.titleLabel.text wya_heightWithFontSize:17 width:ScreenWidth-self->containerPadding-self->labelPadding];
        make.height.mas_equalTo(titleHeight);
    }];
    
    [self.messageLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containerView.mas_left).with.offset(self->labelPadding/2);
        make.right.mas_equalTo(self.containerView.mas_right).with.offset(-(self->labelPadding/2));
        make.top.mas_equalTo(self.titleLabel.mas_bottom).with.offset(0*SizeAdapter);
        CGFloat titleHeight = [self.messageLabel.text wya_heightWithFontSize:13 width:ScreenWidth-self->containerPadding-self->labelPadding];
        make.height.mas_equalTo(titleHeight);
    }];
    
    [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [self.buttonView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [self.buttonView.subviews wya_mas_distributeSudokuViewsWithFixedItemWidth:0
                                                              fixedItemHeight:0
                                                             fixedLineSpacing:0
                                                        fixedInteritemSpacing:0
                                                                    warpCount:0
                                                                   topSpacing:0
                                                                bottomSpacing:0
                                                                  leadSpacing:0
                                                                  tailSpacing:0];
}

#pragma mark --- Lazy
- (NSMutableArray<UIButton *> *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (NSMutableArray<WYAAlertAction *> *)actions {
    if (!_actions) {
        _actions = [NSMutableArray array];
    }
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

/** 添加 action */
- (void)wya_AddAction:(WYAAlertAction * _Nonnull)action {

    // 添加到 action 数组
    [self.actions addObject:action];
    
    // 创建 button，设置它的属性
    UIButton *actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionButton setTag:[self.actions indexOfObject:action]];
    [actionButton setTitle:action.title forState:UIControlStateNormal];
    [actionButton setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1 alpha:1] forState:UIControlStateNormal];
    [actionButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [actionButton setBackgroundImage:self.whiteImage forState:UIControlStateNormal];
    [actionButton setBackgroundImage:self.grayImage forState:UIControlStateHighlighted];
    if (action.style == WYAAlertActionStyleDestructive) {
        [actionButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    } else if (action.style == WYAAlertActionStyleCancel) {
        actionButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    [actionButton addTarget:self action:@selector(actionButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    // 添加到父视图
    [self addSubview:actionButton];
    
    // 添加到 button数组
    [self.buttons addObject:actionButton];
    
    // 因为可能添加多个 button，所以只要标记为需要更新，这样即使添加了多次也只会更新一次
    [self setNeedsUpdateConstraints];
    
}

/** 点击按钮事件 */
- (void)actionButtonDidClicked:(UIButton *)sender {
    
    // 根据 tag 取到 handler
    void (^handler) (void) = self.actions[sender.tag].handler;
    if (handler) {
        handler();
    }
    
    // 点击button后自动dismiss
    if (_controller) {
        [_controller dismissViewControllerAnimated:YES completion:nil];
    }
    
}



@end
