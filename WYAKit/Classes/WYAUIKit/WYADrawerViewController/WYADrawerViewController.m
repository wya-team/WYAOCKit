//
//  WYADrawerViewController.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/16.
//

#import "WYADrawerViewController.h"

typedef NS_ENUM(NSUInteger, WYAViewStyle) {
    WYAViewStyleCenter,
    WYAViewStyleLeft,
    WYAViewStyleRight,
};

static CGFloat padding = 250;

@interface WYADrawerViewController ()
@property (nonatomic, strong) UIViewController * centerViewController;
@property (nonatomic, strong) UIViewController * leftViewController;
@property (nonatomic, strong) UIViewController * rightViewController;
@property (nonatomic, strong) WYAContainerView * containerView;
@property (nonatomic, assign) WYAViewStyle  viewStyle;
@end

@implementation WYADrawerViewController

- (instancetype)initWithCenterViewController:(UIViewController *)centerViewController
                          LeftViewController:(UIViewController *)leftViewController
                         RightViewController:(UIViewController *)rightViewController
{
    self = [super init];
    if (self) {

        self.centerViewController = centerViewController;
        self.leftViewController = leftViewController;
        self.rightViewController = rightViewController;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.containerView = [[WYAContainerView alloc]init];
    self.containerView.frame = self.view.frame;
    [self.view addSubview:self.containerView];
    [self.view sendSubviewToBack:self.containerView];
    self.leftViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width-padding, self.view.frame.size.height);
    self.rightViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width-padding, self.view.frame.size.height);
    [self addChildViewController:self.centerViewController];
    [self addChildViewController:self.leftViewController];
    [self addChildViewController:self.rightViewController];
    [self.view addSubview:self.centerViewController.view];
    [self.view addSubview:self.leftViewController.view];
    [self.view addSubview:self.rightViewController.view];
    [self.view bringSubviewToFront:self.centerViewController.view];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backView)];
    [self.containerView addGestureRecognizer:tap];
}

-(void)leftViewControllerMove{
    [self.view bringSubviewToFront:self.containerView];
    self.leftViewController.view.center = CGPointMake(-self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view bringSubviewToFront:self.leftViewController.view];
    [UIView animateWithDuration:0.5 animations:^{
        self.leftViewController.view.center = CGPointMake((self.view.frame.size.width-padding)/2, self.view.frame.size.height/2);
        self.centerViewController.view.center = CGPointMake(self.view.frame.size.width+(self.view.frame.size.width-padding)/2, self.view.frame.size.height/2);
        self.containerView.center = self.centerViewController.view.center;
        self.leftViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        self.viewStyle = WYAViewStyleLeft;
    }];
}

-(void)rightViewControllerMove{
    [self.view bringSubviewToFront:self.containerView];
    self.rightViewController.view.center = CGPointMake(self.view.frame.size.width+self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view bringSubviewToFront:self.rightViewController.view];
    [UIView animateWithDuration:0.5 animations:^{
        self.rightViewController.view.center = CGPointMake((self.view.frame.size.width+padding)/2, self.view.frame.size.height/2);
        self.rightViewController.view.alpha = 1;
        self.centerViewController.view.center = CGPointMake(-(self.view.frame.size.width-padding)/2, self.view.frame.size.height/2);
        self.containerView.center = self.centerViewController.view.center;
    } completion:^(BOOL finished) {
        self.viewStyle = WYAViewStyleRight;
    }];
}

-(void)backView{
    NSLog(@"1");
    if (self.viewStyle == WYAViewStyleLeft) {
        [self.view sendSubviewToBack:self.containerView];
        
        [self.view bringSubviewToFront:self.leftViewController.view];
        [UIView animateWithDuration:0.5 animations:^{
            self.leftViewController.view.center = CGPointMake(-self.view.frame.size.width/2, self.view.frame.size.height/2);
            self.centerViewController.view.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
            self.containerView.center = self.centerViewController.view.center;
            self.leftViewController.view.alpha = 0;
        } completion:^(BOOL finished) {
            self.viewStyle = WYAViewStyleCenter;
        }];
    }else if (self.viewStyle == WYAViewStyleRight) {
        [self.view sendSubviewToBack:self.containerView];
        
        [self.view bringSubviewToFront:self.rightViewController.view];
        [UIView animateWithDuration:0.5 animations:^{
            self.rightViewController.view.center = CGPointMake(self.view.frame.size.width+self.view.frame.size.width/2, self.view.frame.size.height/2);
            self.rightViewController.view.alpha = 0;
            self.centerViewController.view.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
            self.containerView.center = self.centerViewController.view.center;
        } completion:^(BOOL finished) {
            self.viewStyle = WYAViewStyleCenter;
        }];
    }
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


@interface WYAContainerView ()

@end

@implementation WYAContainerView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView * view = [super hitTest:point withEvent:event];
    if (![view isEqual:self]) {
        NSLog(@"aaa");
        view = nil;
    }
    return view;
}

@end
