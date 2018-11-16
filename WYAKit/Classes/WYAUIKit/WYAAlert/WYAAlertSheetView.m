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

@property (nonatomic, assign) CGFloat  labelPadding;

@end

@implementation WYAAlertSheetView

- (_Nonnull instancetype)initWithTitle:(NSString *)title message:(NSString *)message
{
    self = [super init];
    if (self) {
        
        self.labelPadding = 30*SizeAdapter;
        
        self.containerView = [[UIView alloc]init];
        self.containerView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.1];
        self.containerView.layer.cornerRadius = 4.f;
        self.containerView.layer.masksToBounds = YES;
        [self addSubview:self.containerView];
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelButton setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1 alpha:1] forState:UIControlStateNormal];
        [self.cancelButton setBackgroundColor:[UIColor whiteColor]];
        [self.cancelButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
        self.cancelButton.layer.cornerRadius = 4.f;
        self.cancelButton.layer.masksToBounds = YES;
        [self.containerView addSubview:self.cancelButton];
        
        self.titleView = [[UIView alloc]init];
        self.titleView.backgroundColor = [UIColor whiteColor];
        [self.containerView addSubview:self.titleView];
        
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.text = title;
        self.titleLabel.textColor = [UIColor lightGrayColor];
        self.titleLabel.font = FONT(15);
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.backgroundColor = [UIColor whiteColor];
        [self.titleView addSubview:self.titleLabel];
        
        self.messageLabel = [[UILabel alloc]init];
        self.messageLabel.text = message;
        self.messageLabel.textColor = [UIColor lightGrayColor];
        self.messageLabel.font = FONT(13);
        self.messageLabel.numberOfLines = 0;
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        self.messageLabel.backgroundColor = [UIColor whiteColor];
        [self.titleView addSubview:self.messageLabel];
        
        self.buttonView = [[UIView alloc]init];
        self.buttonView.backgroundColor = [UIColor colorWithRed:203.0/255.0 green:203.0/255.0 blue:203.0/255.0 alpha:1];
        
        [self.containerView addSubview:self.buttonView];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.containerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.cancelButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.containerView);
        make.height.mas_equalTo(40*SizeAdapter);
    }];
    
    [self.buttonView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.containerView);
        make.bottom.mas_equalTo(self.cancelButton.mas_top).with.offset(-5);
        make.height.mas_equalTo(self.buttons.count*40*SizeAdapter).priorityHigh();
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
    
    [self.titleView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.containerView);
        make.bottom.mas_equalTo(self.buttonView.mas_top).with.offset(-0.5);
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleView.mas_left).with.offset(self.labelPadding);
        make.right.mas_equalTo(self.titleView.mas_right).with.offset(-self.labelPadding);
        make.top.mas_equalTo(self.titleView.mas_top).with.offset(0);
        if (self.titleLabel.text && self.titleLabel.text.length>0) {
            CGFloat height = [self.titleLabel.text wya_heightWithFontSize:15 width:ScreenWidth-2*self.labelPadding];
            make.height.mas_equalTo(height);
        }else{
            make.height.mas_equalTo(0);
        }
        
    }];
    
    [self.messageLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleView.mas_left).with.offset(self.labelPadding);
        make.right.mas_equalTo(self.titleView.mas_right).with.offset(-self.labelPadding);
        
        make.bottom.mas_equalTo(self.titleView.mas_bottom);
        if (self.messageLabel.text && self.messageLabel.text.length>0) {
            CGFloat height = [self.messageLabel.text wya_heightWithFontSize:15 width:ScreenWidth-2*self.labelPadding];
            make.height.mas_equalTo(height);
            make.top.mas_equalTo(self.titleLabel.mas_bottom);
        }else{
            make.height.mas_equalTo(0);
            make.top.mas_equalTo(self.titleLabel.mas_bottom);
        }
    }];
}

- (void)wya_AddAction:(WYAAlertAction * _Nonnull)action{
    
    for (UIView * view in self.buttonView.subviews) {
        [view removeFromSuperview];
    }
    
    // 添加到 action 数组
    [self.actions addObject:action];
    
    // 创建 button，设置它的属性
    UIButton *actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionButton setTag:[self.actions indexOfObject:action]];
    [actionButton setTitle:action.title forState:UIControlStateNormal];
    [actionButton setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1 alpha:1] forState:UIControlStateNormal];
    [actionButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [actionButton setBackgroundColor:[UIColor whiteColor]];
//    [actionButton setBackgroundImage:self.whiteImage forState:UIControlStateNormal];
//    [actionButton setBackgroundImage:self.grayImage forState:UIControlStateHighlighted];
    if (action.style == WYAAlertActionStyleDestructive) {
        [actionButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    } else if (action.style == WYAAlertActionStyleCancel) {
        actionButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    [actionButton addTarget:self action:@selector(actionButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    // 添加到 button数组
    [self.buttons addObject:actionButton];
    
    for (UIButton * button in self.buttons) {
        // 添加到父视图
        [self.buttonView addSubview:button];
    }
    
    // 因为可能添加多个 button，所以只要标记为需要更新，这样即使添加了多次也只会更新一次
    [self layoutIfNeeded];
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

-(void)cancelClick{
    // 点击button后自动dismiss
    if (_controller) {
        [_controller dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark --- Getter
-(NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray arrayWithCapacity:0];
    }
    return _buttons;
}

-(NSMutableArray<WYAAlertAction *> *)actions{
    if (!_actions) {
        _actions = [NSMutableArray arrayWithCapacity:0];
    }
    return _actions;
}

-(CGFloat)height{
    [self layoutIfNeeded];
    return self.containerView.wya_height;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
