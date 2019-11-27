//
//  TestViewController.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/12.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    CGFloat view_x       = 0;
    CGFloat view_y       = (ScreenHeight - ScreenWidth) / 2;
    CGFloat view_width   = ScreenWidth;
    CGFloat view_height  = ScreenWidth;
    CGRect view_rect     = CGRectMake(view_x, view_y, view_width, view_height);
    UIImageView * object = [[UIImageView alloc] init];
    object.frame         = view_rect;
    object.image         = self.image;
    [self.view addSubview:object];
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
