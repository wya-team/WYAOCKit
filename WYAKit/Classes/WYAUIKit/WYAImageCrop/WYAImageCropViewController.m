//
//  WYAImageCropViewController.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/3.
//

#import "WYAImageCropViewController.h"
#import "WYAImageCropViewControllerTransitioning.h"
#import "WYAImageCropView.h"
#import "WYAImageCropToolBar.h"

@interface WYAImageCropViewController ()<UIViewControllerTransitioningDelegate, WYAImageCropToolBarDelegate>
@property (nonatomic, strong) WYAImageCropViewControllerTransitioning * transitioning;
@property (nonatomic, strong) WYAImageCropView *cropView;
@property (nonatomic, strong) WYAImageCropToolBar * toolBar;
@property (nonatomic, strong) UIImage * image;
@end

@implementation WYAImageCropViewController
{
    CGFloat toolHeight;
}
- (instancetype)initWithImage:(UIImage *)image
{
    NSParameterAssert(image);
    self = [super init];
    if (self) {
        //页面跳转样式
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        //view展示样式
        self.modalPresentationStyle = UIModalPresentationFullScreen;
        
        if (@available(iOS 11.0, *)) {
            
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _transitioning = [[WYAImageCropViewControllerTransitioning alloc]init];
        _transitioning.image = image;
        self.image = image;
        toolHeight = 100*SizeAdapter;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.transitioningDelegate = self;
    self.view.backgroundColor = self.cropView.backgroundColor;
    self.cropView.frame = [self frameforCropView];
    [self.view addSubview:self.cropView];
    
    self.toolBar.frame = [self frameForToolBar];
    [self.view addSubview:self.toolBar];
}

#pragma mark --- Private Method
- (CGRect)frameforCropView{
    UIView * view = nil;
    if (self.parentViewController == nil) {
        //nav
        view = self.view;
    }else{
        view = self.parentViewController.view;
    }
    
    CGRect bounds = view.bounds;
    CGRect frame = CGRectZero;
    
    frame.size.width = CGRectGetWidth(bounds);
    frame.size.height = CGRectGetHeight(bounds)-WYAStatusBarHeight-WYABottomHeight-toolHeight;
    frame.origin.y = WYAStatusBarHeight;
    return frame;
}

- (CGRect)frameForToolBar{
    CGRect frame = CGRectZero;
    frame.origin.x = 0.f;
    frame.origin.y = self.cropView.cmam_bottom;
    frame.size.width = CGRectGetWidth(self.view.bounds);
    frame.size.height = toolHeight;
    return frame;
}

#pragma mark --- WYAImageCropToolBarDelegate
- (void)rotatingAction{
    
}

- (void)originalAction{
    
}

- (void)cancelAction{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)doneAction{
    
}

#pragma mark ---UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    //如果是navPush
    if (self.navigationController || self.modalTransitionStyle == UIModalTransitionStyleCoverVertical) {
        return nil;
    }
    
    self.transitioning.dismiss = NO;
    return self.transitioning;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    //navDismiss
    if (self.navigationController || self.modalTransitionStyle == UIModalTransitionStyleCoverVertical) {
        return nil;
    }
    self.transitioning.dismiss = YES;
    return self.transitioning;
}
#pragma mark --- Getter
-(WYAImageCropView *)cropView{
    if (!_cropView) {
        _cropView = [[WYAImageCropView alloc]initWithImage:self.image];
        _cropView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _cropView;
}

-(WYAImageCropToolBar *)toolBar{
    if (!_toolBar) {
        _toolBar = [[WYAImageCropToolBar alloc]init];
        _toolBar.delegate = self;
    }
    return _toolBar;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    if (self.navigationController) {
        return UIStatusBarStyleLightContent;
    }
    
    return UIStatusBarStyleDefault;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
