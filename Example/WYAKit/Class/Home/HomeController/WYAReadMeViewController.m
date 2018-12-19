//
//  WYAReadMeViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/19.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAReadMeViewController.h"
#import <WebKit/WebKit.h>
@interface WYAReadMeViewController ()<WKNavigationDelegate>
@property (nonatomic, strong) WKWebView * webView;
@property (nonatomic, strong) UIProgressView * myProgressView;
@end

@implementation WYAReadMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"README";
    [self.view addSubview:self.webView];
    [self.view addSubview:self.myProgressView];
}

- (void)setReadMeUrl:(NSString *)readMeUrl{
    [self.webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:readMeUrl]]];
}

- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (WKWebView *)webView{
    if(!_webView){
        _webView = ({
            WKWebView * object = [[WKWebView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight)];
            object.allowsBackForwardNavigationGestures = YES;
            object.navigationDelegate = self;
            [object addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
            object.opaque = NO;
            object.multipleTouchEnabled = YES;
            object;
       });
    }
    return _webView;
}

- (UIProgressView *)myProgressView{
    if(!_myProgressView){
        _myProgressView = ({
            UIProgressView * object = [[UIProgressView alloc]initWithFrame:CGRectMake(0, WYATopHeight-1, ScreenWidth, 1)];
            object.tintColor = BLUECOLOR;
            object.trackTintColor = WHITECOLOR;
            object;
       });
    }
    return _myProgressView;
}

// 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        self.myProgressView.alpha = 1.0f;
        [self.myProgressView setProgress:newprogress animated:YES];
        if (newprogress >= 1.0f) {
            [UIView animateWithDuration:0.3f
                                  delay:0.3f
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 self.myProgressView.alpha = 0.0f;
                             }
                             completion:^(BOOL finished) {
                                 [self.myProgressView setProgress:0 animated:NO];
                             }];
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
