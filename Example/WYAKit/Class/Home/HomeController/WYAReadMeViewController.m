//
//  WYAReadMeViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/19.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAReadMeViewController.h"
#import <WebKit/WebKit.h>

@interface WYAReadMeViewController () <WKNavigationDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) WKWebView * webView;
@property (nonatomic, strong) UIProgressView * myProgressView;
@end

@implementation WYAReadMeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navTitle = @"README";
    [self wya_addRightNavBarButtonWithNormalTitle:@[ @"复制链接" ]];
    [self.view addSubview:self.webView];
    [self.view addSubview:self.myProgressView];
}

- (void)wya_goBack
{
    if (self.webView.canGoBack) {
        //返回上级页面
        [self.webView goBack];

    } else {
        WYAFloatBallManager * manager = [WYAFloatBallManager shared];
        [manager wya_showBallBtnWith:self];
        [super wya_goBack];
    }
}

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    [UIView wya_showCenterToastWithMessage:@"复制成功!"];
    // 复制链接
    UIPasteboard * pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string         = self.readMeUrl;
}

- (void)setReadMeUrl:(NSString *)readMeUrl
{
    _readMeUrl = readMeUrl;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_readMeUrl]]];
}

- (void)dealloc
{
    self.webView.navigationDelegate = nil;
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView removeFromSuperview];
    self.webView = nil;
}

- (WKWebView *)webView
{
    if (!_webView) {
        _webView = ({

            //禁止选择 css 配置相关

            NSString * css = @"body{-webkit-user-select:none;-webkit-user-drag:none;}";

            // css 选中样式取消

            NSMutableString * javascript = [NSMutableString string];

            [javascript appendString:@"var style = document.createElement('style');"];

            [javascript appendString:@"style.type = 'text/css';"];

            [javascript appendFormat:@"var cssContent = document.createTextNode('%@');", css];

            [javascript appendString:@"style.appendChild(cssContent);"];

            [javascript appendString:@"document.body.appendChild(style);"];

            [javascript
            appendString:@"document.documentElement.style.webkitUserSelect='none';"]; //禁止选择

            [javascript
            appendString:
            @"document.documentElement.style.webkitTouchCallout='none';"]; //禁止长按

            // javascript 注入

            WKUserScript * noneSelectScript =
            [[WKUserScript alloc] initWithSource:javascript

                                   injectionTime:WKUserScriptInjectionTimeAtDocumentEnd

                                forMainFrameOnly:YES];

            WKUserContentController * userContentController =
            [[WKUserContentController alloc] init];

            [userContentController addUserScript:noneSelectScript];

            WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc] init];

            configuration.userContentController = userContentController;

            WKWebView * object = [[WKWebView alloc]
            initWithFrame:CGRectMake(1, WYATopHeight, ScreenWidth - 2, ScreenHeight - WYATopHeight)
            configuration:configuration];
            object.allowsBackForwardNavigationGestures = YES;
            object.navigationDelegate                  = self;
            [object addObserver:self
                     forKeyPath:@"estimatedProgress"
                        options:NSKeyValueObservingOptionNew
                        context:nil];
            object.opaque                                    = NO;
            object.multipleTouchEnabled                      = YES;
            object.scrollView.alwaysBounceVertical           = YES;
            object.scrollView.showsHorizontalScrollIndicator = NO;
            object.scrollView.bouncesZoom                    = NO;
            object.scrollView.delegate                       = self;
            object;
        });
    }
    return _webView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
}

- (UIProgressView *)myProgressView
{
    if (!_myProgressView) {
        _myProgressView = ({
            UIProgressView * object = [[UIProgressView alloc]
            initWithFrame:CGRectMake(0, WYATopHeight - 1, ScreenWidth, 1)];
            object.tintColor      = BLUECOLOR;
            object.trackTintColor = WHITECOLOR;
            object;
        });
    }
    return _myProgressView;
}

- (void)webView:(WKWebView *)webView
decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
                decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSLog(@"navigationAction = %@, request = %@", navigationAction, navigationAction.request.URL);

    if ([[navigationAction.request.URL absoluteString] isEqualToString:self.readMeUrl] ||
        self.isAllowPush) {
        decisionHandler(WKNavigationActionPolicyAllow);
    } else {
        [UIView wya_showCenterToastWithMessage:@"当前页面不支持跳转"];
        decisionHandler(WKNavigationActionPolicyCancel);
    }
}

// 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress       = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        self.myProgressView.alpha = 1.0f;
        [self.myProgressView setProgress:newprogress animated:YES];
        if (newprogress >= 1.0f) {
            [UIView animateWithDuration:0.3f
            delay:0.3f
            options:UIViewAnimationOptionCurveEaseOut
            animations:^{ self.myProgressView.alpha = 0.0f; }
            completion:^(BOOL finished) { [self.myProgressView setProgress:0 animated:NO]; }];
        }

    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
