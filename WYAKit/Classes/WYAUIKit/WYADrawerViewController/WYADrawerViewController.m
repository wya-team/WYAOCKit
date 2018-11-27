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
{
    NSInteger fristTouchX;
}
- (instancetype)initWithCenterViewController:(UIViewController * _Nonnull)centerViewController
                          LeftViewController:(UIViewController * _Nullable)leftViewController
                         RightViewController:(UIViewController * _Nullable)rightViewController
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
//    [self.navigationController.navigationBar setTranslucent:NO];

//    NSLog(@"self.view.frame==%@",NSStringFromCGRect(self.view.frame));
    
//    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.containerView = [[WYAContainerView alloc]init];
    self.containerView.frame = self.view.frame;
    self.containerView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    [self.view addSubview:self.containerView];
    [self.view sendSubviewToBack:self.containerView];
    self.leftViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width-padding, self.view.frame.size.height);
    self.rightViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width-padding, self.view.frame.size.height);
    
//    if (self.leftViewController) {
//        [self addChildVC:self.leftViewController];
//    }
//
//    if (self.rightViewController) {
//        [self addChildVC:self.rightViewController];
//    }
    
    if (self.centerViewController) {
        [self addChildVC:self.centerViewController];
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
-(void)wya_leftViewControllerMove{
    
    if (!self.leftViewController) { return; }
    [self addChildVC:self.leftViewController];
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

-(void)wya_rightViewControllerMove{
    
    if (!self.rightViewController) { return; }
    [self addChildVC:self.rightViewController];
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
-(void)addChildVC:(UIViewController *)vc{
    [self addChildViewController:vc];
    if (vc == self.leftViewController) {
        vc.view.frame = CGRectMake(-padding, self.view.cmam_top, padding, self.view.cmam_height);
    }else if (vc == self.centerViewController) {
        vc.view.frame = self.view.frame;
    }else if (vc == self.rightViewController) {
        vc.view.frame = CGRectMake(self.view.cmam_right+padding, self.view.cmam_top, padding, self.view.cmam_height);
    }
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
}

-(void)removeChildVC:(UIViewController *)vc{
    [vc willMoveToParentViewController:nil];
    [vc.view removeFromSuperview];
    [vc removeFromParentViewController];
}

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
            [self removeChildVC:self.leftViewController];
        }];
    }else if (self.viewStyle == WYAViewStyleRight) {
        [self.view sendSubviewToBack:self.containerView];
        
        [UIView animateWithDuration:0.5 animations:^{
            self.rightViewController.view.frame = CGRectMake(ScreenWidth, 0, self.rightViewController.view.cmam_width, self.rightViewController.view.cmam_height);
            self.centerViewController.view.frame = CGRectMake(0, 0, self.centerViewController.view.cmam_width, self.centerViewController.view.cmam_height);
            self.containerView.center = self.centerViewController.view.center;
        } completion:^(BOOL finished) {
            self.viewStyle = WYAViewStyleCenter;
            [self removeChildVC:self.rightViewController];
        }];
    }
}

-(void)panView:(UIPanGestureRecognizer *)pan{
    if (fristTouchX>ScreenWidth-padding) {
        return;
    }
    
    CGPoint point = [pan translationInView:self.view];
    
    if ([pan.view isEqual:self.view]) {
        
        if (self.viewStyle == WYAViewStyleCenter) {
            if (point.x>0) {
                if (!self.leftViewController) { return; }
                [self addChildVC:self.leftViewController];
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
                            [self removeChildVC:self.leftViewController];
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
                [self addChildVC:self.rightViewController];
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
                        [self removeChildVC:self.rightViewController];
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
                    [self removeChildVC:self.leftViewController];
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
                        [self removeChildVC:self.rightViewController];
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    fristTouchX = point.x;
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
