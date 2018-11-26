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
//    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.containerView = [[WYAContainerView alloc]init];
    self.containerView.frame = self.view.frame;
    self.containerView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    [self.view addSubview:self.containerView];
    [self.view sendSubviewToBack:self.containerView];
    self.leftViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width-padding, self.view.frame.size.height);
    self.rightViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width-padding, self.view.frame.size.height);
    
    
    if (self.leftViewController) {
        [self addChildViewController:self.leftViewController];
        [self.view addSubview:self.leftViewController.view];
        self.leftViewController.view.frame = CGRectMake(-padding, 0, padding, ScreenHeight);
        self.leftViewController.view.alpha = 0;
    }
    
    if (self.rightViewController) {
        [self addChildViewController:self.rightViewController];
        [self.view addSubview:self.rightViewController.view];
        self.rightViewController.view.frame = CGRectMake(ScreenWidth+padding, 0, padding, ScreenHeight);
        self.rightViewController.view.alpha = 0;
    }
    
    if (self.centerViewController) {
        [self addChildViewController:self.centerViewController];
        [self.view addSubview:self.centerViewController.view];
        [self.view bringSubviewToFront:self.centerViewController.view];
        self.centerViewController.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    }
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backView)];
    [self.containerView addGestureRecognizer:tap];
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panView:)];
    [self.view addGestureRecognizer:pan];
    
    UIPanGestureRecognizer * pan1 = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panView:)];
    [self.containerView addGestureRecognizer:pan1];
    [pan requireGestureRecognizerToFail:pan1];
    
    
}

#pragma mark --- Public Method
-(void)leftViewControllerMove{
    
    if (!self.leftViewController) { return; }
    
    [self.view bringSubviewToFront:self.containerView];
    self.containerView.center = self.centerViewController.view.center;

    [UIView animateWithDuration:0.5 animations:^{
        self.leftViewController.view.frame = CGRectMake(0, 0, self.leftViewController.view.frame.size.width, self.leftViewController.view.frame.size.height);
        self.centerViewController.view.frame = CGRectMake(self.leftViewController.view.frame.size.width, 0, self.centerViewController.view.frame.size.width, self.centerViewController.view.frame.size.height);
        self.leftViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        self.viewStyle = WYAViewStyleLeft;
    }];
}

-(void)rightViewControllerMove{
    
    if (!self.rightViewController) { return; }
    
    [self.view bringSubviewToFront:self.containerView];
    self.containerView.center = self.centerViewController.view.center;
    [UIView animateWithDuration:0.5 animations:^{
        self.rightViewController.view.frame = CGRectMake(ScreenWidth-self.rightViewController.view.frame.size.width, 0, self.rightViewController.view.frame.size.width, self.rightViewController.view.frame.size.height);
        self.centerViewController.view.frame = CGRectMake(-self.rightViewController.view.frame.size.width, 0, self.centerViewController.view.frame.size.width, self.centerViewController.view.frame.size.height);
        self.rightViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        self.viewStyle = WYAViewStyleRight;
    }];
}
#pragma mark --- Private Method
-(void)backView{
    self.containerView.center = self.centerViewController.view.center;
    if (self.viewStyle == WYAViewStyleLeft) {
        [self.view sendSubviewToBack:self.containerView];
        
        [UIView animateWithDuration:0.5 animations:^{
            self.leftViewController.view.frame = CGRectMake(-self.leftViewController.view.cmam_width, 0, self.leftViewController.view.cmam_width, self.leftViewController.view.cmam_height);
            self.centerViewController.view.frame = CGRectMake(0, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
            self.leftViewController.view.alpha = 0;
        } completion:^(BOOL finished) {
            self.viewStyle = WYAViewStyleCenter;
        }];
    }else if (self.viewStyle == WYAViewStyleRight) {
        [self.view sendSubviewToBack:self.containerView];
        
        [UIView animateWithDuration:0.5 animations:^{
            self.rightViewController.view.frame = CGRectMake(ScreenWidth, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
            self.centerViewController.view.frame = CGRectMake(0, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
            self.containerView.center = self.centerViewController.view.center;
        } completion:^(BOOL finished) {
            self.viewStyle = WYAViewStyleCenter;
        }];
    }
}

-(void)panView:(UIPanGestureRecognizer *)pan{
    CGPoint point = [pan translationInView:self.view];
//    NSLog(@"x=%.2lf y=%.2lf",point.x,point.y);
    if ([pan.view isEqual:self.view]) {
        
        if (self.viewStyle == WYAViewStyleCenter) {
            if (point.x>0) {
                if (!self.leftViewController) { return; }
                CGFloat minX = MIN(self.leftViewController.view.cmam_width, point.x);
                
                self.leftViewController.view.frame = CGRectMake(-self.leftViewController.view.cmam_width+minX, 0, self.leftViewController.view.cmam_width, self.leftViewController.view.cmam_height);
                self.centerViewController.view.frame = CGRectMake(self.leftViewController.view.cmam_right, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
                self.rightViewController.view.frame = CGRectMake(self.centerViewController.view.cmam_right, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
                self.leftViewController.view.alpha = 1;
                
                if (pan.state == UIGestureRecognizerStateEnded) {
                    if (point.x<self.leftViewController.view.cmam_width/2) {
                        [UIView animateWithDuration:0.3 animations:^{
                            self.leftViewController.view.frame = CGRectMake(-self.leftViewController.view.cmam_width, 0, self.leftViewController.view.cmam_width, self.leftViewController.view.cmam_height);
                            self.centerViewController.view.frame = CGRectMake(self.leftViewController.view.cmam_right, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
                            self.rightViewController.view.frame = CGRectMake(self.centerViewController.view.cmam_right, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
                        } completion:^(BOOL finished) {
                            
                        }];
                        
                    }else{
                        [UIView animateWithDuration:0.3 animations:^{
                            self.leftViewController.view.frame = CGRectMake(0, 0, self.leftViewController.view.cmam_width, self.leftViewController.view.cmam_height);
                            self.centerViewController.view.frame = CGRectMake(self.leftViewController.view.cmam_right, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
                            self.rightViewController.view.frame = CGRectMake(self.centerViewController.view.cmam_right, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
                        } completion:^(BOOL finished) {
                            [self.view bringSubviewToFront:self.containerView];
                            self.containerView.center = self.centerViewController.view.center;
                            self.viewStyle = WYAViewStyleLeft;
                        }];
                        
                    }
                    
                }
                
            }else{
                if (!self.rightViewController) { return; }
                CGFloat maxX = MAX(-self.leftViewController.view.cmam_width, point.x);
                self.leftViewController.view.frame = CGRectMake(-self.leftViewController.view.cmam_width+maxX, 0, self.leftViewController.view.cmam_width, self.leftViewController.view.cmam_height);
                self.centerViewController.view.frame = CGRectMake(maxX, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
                self.rightViewController.view.frame = CGRectMake(self.centerViewController.view.cmam_right, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
                self.rightViewController.view.alpha = 1;
                
                if (pan.state == UIGestureRecognizerStateEnded) {
                    if (point.x>-self.leftViewController.view.cmam_width/2) {
                        self.leftViewController.view.frame = CGRectMake(-self.leftViewController.view.cmam_width, 0, self.leftViewController.view.cmam_width, self.leftViewController.view.cmam_height);
                        self.centerViewController.view.frame = CGRectMake(self.leftViewController.view.cmam_right, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
                        self.rightViewController.view.frame = CGRectMake(self.centerViewController.view.cmam_right, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
                    }else{
                        self.leftViewController.view.frame = CGRectMake(-self.leftViewController.view.cmam_width*2, 0, self.leftViewController.view.cmam_width, self.leftViewController.view.cmam_height);
                        self.centerViewController.view.frame = CGRectMake(self.leftViewController.view.cmam_right, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
                        self.rightViewController.view.frame = CGRectMake(self.centerViewController.view.cmam_right, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
                        [self.view bringSubviewToFront:self.containerView];
                        self.containerView.center = self.centerViewController.view.center;
                        self.viewStyle = WYAViewStyleRight;
                    }
                }
            }
            
        }
    }else if ([pan.view isEqual:self.containerView]){
        if (self.viewStyle == WYAViewStyleLeft) {
            CGFloat maxX = MAX(-self.leftViewController.view.cmam_width, point.x);
            self.leftViewController.view.frame = CGRectMake(maxX, 0, self.leftViewController.view.cmam_width, self.leftViewController.view.cmam_height);
            self.centerViewController.view.frame = CGRectMake(self.leftViewController.view.cmam_right, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
            self.rightViewController.view.frame = CGRectMake(self.centerViewController.view.cmam_right, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
            self.leftViewController.view.alpha = 1;
            self.containerView.center = self.centerViewController.view.center;
            if (pan.state == UIGestureRecognizerStateEnded) {
                if (point.x<-self.leftViewController.view.cmam_width/2) {
                    self.leftViewController.view.frame = CGRectMake(-self.leftViewController.view.cmam_width, 0, self.leftViewController.view.cmam_width, self.leftViewController.view.cmam_height);
                    self.centerViewController.view.frame = CGRectMake(self.leftViewController.view.cmam_right, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
                    self.rightViewController.view.frame = CGRectMake(self.centerViewController.view.cmam_right, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
                    [self.view sendSubviewToBack:self.containerView];
                    self.containerView.center = self.centerViewController.view.center;
                    self.viewStyle = WYAViewStyleCenter;
                    self.containerView.center = self.centerViewController.view.center;
                }else{
                    self.leftViewController.view.frame = CGRectMake(0, 0, self.leftViewController.view.cmam_width, self.leftViewController.view.cmam_height);
                    self.centerViewController.view.frame = CGRectMake(self.leftViewController.view.cmam_right, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
                    self.rightViewController.view.frame = CGRectMake(self.centerViewController.view.cmam_right, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
                    self.containerView.center = self.centerViewController.view.center;
                }
            }
        }else if (self.viewStyle == WYAViewStyleRight) {
            CGFloat minX = MIN(self.leftViewController.view.cmam_width, point.x);
//            NSLog(@"x==%f",minX);
//            NSLog(@"left==%f",self.leftViewController.view.cmam_left);
            self.leftViewController.view.frame = CGRectMake(-self.leftViewController.view.cmam_width*2+minX, 0, self.leftViewController.view.cmam_width, self.leftViewController.view.cmam_height);
            self.centerViewController.view.frame = CGRectMake(self.leftViewController.view.cmam_right, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
            self.rightViewController.view.frame = CGRectMake(self.centerViewController.view.cmam_right, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
//            NSLog(@"left.frame==%@",NSStringFromCGRect(self.leftViewController.view.frame));
//            NSLog(@"center.frame==%@",NSStringFromCGRect(self.centerViewController.view.frame));
//            NSLog(@"right.frame==%@",NSStringFromCGRect(self.rightViewController.view.frame));
            self.rightViewController.view.alpha = 1;
            self.containerView.center = self.centerViewController.view.center;
            if (pan.state == UIGestureRecognizerStateEnded) {
                if (point.x>self.leftViewController.view.cmam_width/2) {
                    [UIView animateWithDuration:0.3 animations:^{
                        self.leftViewController.view.frame = CGRectMake(-self.leftViewController.view.cmam_width, 0, self.leftViewController.view.cmam_width, self.leftViewController.view.cmam_height);
                        self.centerViewController.view.frame = CGRectMake(self.leftViewController.view.cmam_right, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
                        self.rightViewController.view.frame = CGRectMake(self.centerViewController.view.cmam_right, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
                    } completion:^(BOOL finished) {
                        [self.view sendSubviewToBack:self.containerView];
                        self.containerView.center = self.centerViewController.view.center;
                        self.viewStyle = WYAViewStyleCenter;
                    }];
                    
                }else{
                    [UIView animateWithDuration:0.3 animations:^{
                        self.leftViewController.view.frame = CGRectMake(-self.leftViewController.view.cmam_width*2, 0, self.leftViewController.view.cmam_width, self.leftViewController.view.cmam_height);
                        self.centerViewController.view.frame = CGRectMake(self.leftViewController.view.cmam_right, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
                        self.rightViewController.view.frame = CGRectMake(self.centerViewController.view.cmam_right, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
                        self.containerView.center = self.centerViewController.view.center;
                    } completion:^(BOOL finished) {
                        
                    }];
                }

            }
        }
    }
    
//    [pan setTranslation:CGPointZero inView:self.view];
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

-(UINavigationBar*)navigationBarContainedWithinSubviewsOfView:(UIView*)view{
    UINavigationBar * navBar = nil;
    for(UIView * subview in [view subviews]){
        if([view isKindOfClass:[UINavigationBar class]]){
            navBar = (UINavigationBar*)view;
            break;
        }
        else {
            navBar = [self navigationBarContainedWithinSubviewsOfView:subview];
            if (navBar != nil) {
                break;
            }
        }
    }
    return navBar;
}

@end
