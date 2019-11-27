//
//  WYAVideoNetWorkView.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/21.
//

#import "WYAVideoNetWorkView.h"

@interface WYAVideoNetWorkView ()

@end

@implementation WYAVideoNetWorkView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.button];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.right.top.mas_equalTo(self);
        make.height.mas_equalTo(20 * SizeAdapter);
    }];

    [self.button mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(self.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60 * SizeAdapter, 25 * SizeAdapter));
    }];
}

#pragma mark - Public Method -
- (void)netWorkStatus:(void (^)(AFNetworkReachabilityStatus status))handle
{
    AFNetworkReachabilityManager * manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");

                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                self.hidden          = NO;
                self.titleLabel.text = @"当前没有网络";
                [self.button setTitle:@"重试" forState:UIControlStateNormal];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"数据网络");
                self.hidden          = NO;
                self.titleLabel.text = @"当前是数据网络";
                [self.button setTitle:@"继续播放" forState:UIControlStateNormal];
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi");
                self.hidden = YES;
                break;
            default:
                break;
        }
        if (handle) {
            handle(status);
        }

    }];
}

#pragma mark - Getter -
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel * object     = [[UILabel alloc] init];
            object.textColor     = [UIColor whiteColor];
            object.font          = FONT(15);
            object.textAlignment = NSTextAlignmentCenter;
            object;
        });
    }
    return _titleLabel;
}

- (UIButton *)button
{
    if (!_button) {
        _button = ({
            UIButton * object          = [[UIButton alloc] init];
            object.layer.borderColor   = [UIColor whiteColor].CGColor;
            object.layer.borderWidth   = 0.5;
            object.layer.cornerRadius  = 4.f;
            object.layer.masksToBounds = YES;
            object.titleLabel.font     = FONT(13);
            WeakSelf(weakSelf);
            [object addCallBackAction:^(UIButton * button) {
                if ([button.titleLabel.text isEqualToString:@"重试"]) {
                    if (weakSelf.retryHandle) {
                        weakSelf.retryHandle();
                    }
                } else if ([button.titleLabel.text isEqualToString:@"继续播放"]) {
                    if (weakSelf.goOnHandle) {
                        weakSelf.goOnHandle();
                    }
                }
                weakSelf.hidden = YES;
            }];
            object;
        });
    }
    return _button;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
