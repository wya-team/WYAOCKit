//
//  WYAPhotoEditViewController.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import "WYAPhotoEditViewController.h"
#import "WYAImageBrowser.h"
@interface WYAPhotoEditViewController ()

@end

@implementation WYAPhotoEditViewController

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
    
    WYAImageBrowser * view = [[WYAImageBrowser alloc]initWithFrame:self.view.frame];
//    NSMutableArray * images = [[NSMutableArray alloc]init];
//    for (NSInteger index = 0; index<array.count; index++) {
//        UIImage * image = [UIImage imageNamed:array[index]];
//        [images addObject:image];
//    }
    view.images = @[self.image];
    [self.view addSubview:view];
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
