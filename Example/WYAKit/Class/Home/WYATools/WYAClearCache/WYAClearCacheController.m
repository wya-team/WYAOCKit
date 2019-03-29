//
//  WYACleacheController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2019/1/5.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYAClearCacheController.h"

@interface WYAClearCacheController ()
@property (nonatomic, strong) UIView * bgView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIView * lineView;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UIButton * cleaButton;
@end

@implementation WYAClearCacheController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender {
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
    vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUtils/"
                   @"WYAClearCache/README.md";
    [self wya_pushViewController:vc animated:YES];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 获取缓存
    [WYAClearCache wya_defaultCachesFolderSizeBlock:^(NSString * folderSize) {
        NSLog(@"----%@", folderSize);
        self.contentLabel.text = folderSize;
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];

    [self.view addSubview:self.bgView];
}

#pragma mark ======= getter
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = ({
            UIView * object = [[UIView alloc]
                initWithFrame:CGRectMake(10 * SizeAdapter, WYATopHeight + 10 * SizeAdapter,
                                         ScreenWidth - 20 * SizeAdapter, 150 * SizeAdapter)];
            object.layer.cornerRadius  = 7 * SizeAdapter;
            object.layer.masksToBounds = YES;
            object.backgroundColor     = WHITECOLOR;
            [object addSubview:self.titleLabel];
            [object addSubview:self.lineView];
            [object addSubview:self.contentLabel];
            [object addSubview:self.cleaButton];

            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker * make) {
                make.top.equalTo(object.mas_top).offset(10 * SizeAdapter);
                make.centerX.mas_equalTo(object);
                make.size.mas_equalTo(CGSizeMake(ScreenWidth - 20 * SizeAdapter, 20 * SizeAdapter));
            }];

            [self.lineView mas_makeConstraints:^(MASConstraintMaker * make) {
                make.centerX.mas_equalTo(object);
                make.top.equalTo(self.titleLabel.mas_bottom).offset(5 * SizeAdapter);
                make.size.mas_equalTo(CGSizeMake(80 * SizeAdapter, 0.5));
            }];

            [self.contentLabel mas_makeConstraints:^(MASConstraintMaker * make) {
                make.centerX.mas_equalTo(object);
                make.top.equalTo(self.lineView.mas_bottom).offset(10 * SizeAdapter);
                make.size.mas_equalTo(CGSizeMake(ScreenWidth - 20 * SizeAdapter, 30 * SizeAdapter));
            }];

            [self.cleaButton mas_makeConstraints:^(MASConstraintMaker * make) {
                make.centerX.mas_equalTo(object);
                make.top.equalTo(self.contentLabel.mas_bottom).offset(20 * SizeAdapter);
                make.size.mas_equalTo(CGSizeMake(ScreenWidth - 20 * SizeAdapter - 150 * SizeAdapter,
                                                 36 * SizeAdapter));
            }];

            object;
        });
    }
    return _bgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel * object     = [[UILabel alloc] init];
            object.text          = @"Example已用空间";
            object.font          = FONT(14);
            object.textColor     = GRAYTITLECOLOR;
            object.textAlignment = NSTextAlignmentCenter;
            object;
        });
    }
    return _titleLabel;
}

- (UIButton *)cleaButton {
    if (!_cleaButton) {
        _cleaButton = ({
            UIButton * object      = [[UIButton alloc] init];
            object.titleLabel.font = FONT(16);
            [object wya_setBackgroundColor:GRAYBGCOLOR forState:UIControlStateNormal];
            [object wya_setBackgroundColor:[UIColor grayColor] forState:UIControlStateHighlighted];
            [object setTitle:@"清理缓存" forState:UIControlStateNormal];
            [object setTitleColor:BLACKTITLECOLOR forState:UIControlStateNormal];
            [object setTitleColor:BLACKTEXTCOLOR forState:UIControlStateHighlighted];
            object.layer.cornerRadius  = 5 * SizeAdapter;
            object.layer.masksToBounds = YES;
            [object addTarget:self
                          action:@selector(btnclicked:)
                forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _cleaButton;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = ({
            UILabel * object     = [[UILabel alloc] init];
            object.textColor     = BLACKTITLECOLOR;
            object.font          = FONT(36);
            object.textAlignment = NSTextAlignmentCenter;
            object;
        });
    }
    return _contentLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = ({
            UIView * object        = [[UIView alloc] init];
            object.backgroundColor = GRAYBGCOLOR;
            object;
        });
    }
    return _lineView;
}
#pragma mark ======= Action
- (void)btnclicked:(UIButton *)sender {
    [self showAlertWith:self.contentLabel.text];
}
// 缓存弹框提示
- (void)showAlertWith:(NSString *)size {
    WYAAlertController * alert = [WYAAlertController
        wya_alertWithTitle:@"清理缓存"
                   Message:[NSString stringWithFormat:@"当前缓存%@，是否清理", size]
          AlertLayoutStyle:WYAAlertLayoutStyleHorizontal];
    alert.backgroundButton.enabled = NO;
    // 创建 action
    WYAAlertAction * defaultAction = [WYAAlertAction wya_actionWithTitle:@"清理" textColor:nil textFont:nil handler:^{
        [WYAClearCache wya_clearCachesClearStatusBlock:^(BOOL status) {
            NSLog(@"清理成功");
            [WYAClearCache wya_defaultCachesFolderSizeBlock:^(
                                                              NSString * folderSize) {
                [UIView
                 wya_showBottomToastWithMessage:
                 [NSString stringWithFormat:@"清理成功，当前缓存%@",
                  folderSize]];
                self.contentLabel.text = folderSize;
            }];
        }];
    }];

    WYAAlertAction * cancelAction = [WYAAlertAction wya_actionWithTitle:@"取消" textColor:nil textFont:nil handler:^{

    }];
    [alert wya_addAction:cancelAction];
    [alert wya_addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
