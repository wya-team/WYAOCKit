//
//  WYADrawerViewController.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/16.
//

#import "WYADrawerViewController.h"

@interface WYADrawerViewController ()

@end

@implementation WYADrawerViewController

- (instancetype)initWithCenterViewController:(UIViewController *)centerViewController
                          LeftViewController:(UIViewController *)leftViewController
                         RightViewController:(UIViewController *)rightViewController
{
    self = [super init];
    if (self) {
        [self addChildViewController:centerViewController];
        [self addChildViewController:leftViewController];
        [self addChildViewController:rightViewController];
        [self.view addSubview:centerViewController.view];
        [self.view addSubview:leftViewController.view];
        [self.view addSubview:rightViewController.view];
        [self.view bringSubviewToFront:centerViewController.view];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
