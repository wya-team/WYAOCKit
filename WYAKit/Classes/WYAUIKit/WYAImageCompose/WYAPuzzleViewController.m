//
//  WYAPuzzleViewController.m
//  WYAKit
//
//  Created by 李世航 on 2019/7/27.
//

#import "WYAPuzzleViewController.h"
#import "WYAImageComposeViewController.h"
#import "WYAPostersViewController.h"
#import "WYAFreedomViewController.h"
#import "WYAJoiningTogetherViewController.h"
#import "TestViewController.h"

@interface WYAPuzzleViewController () <WYANavBarDelegate>
@property (nonatomic, strong) WYAImageComposeViewController * template;
@property (nonatomic, strong) WYAPostersViewController * posters;
@property (nonatomic, strong) WYAFreedomViewController * freedom;
@property (nonatomic, strong) WYAJoiningTogetherViewController * joiningTogether;
@end

@implementation WYAPuzzleViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navBar          = [[WYANavBar alloc] init];
    self.navBar.navTitle = @"拼图制作";
    [self.navBar wya_goBackButtonWithImage:@"返回"];
    [self.navBar wya_addRightNavBarButtonWithNormalTitle:@[ @"预览" ]];
    self.navBar.delegate = self;
    [self.view addSubview:self.navBar];
    if (!self.images) {
        self.images = @[
            [UIImage loadBundleImage:@"0"
                           ClassName:NSStringFromClass(self.class)],
            [UIImage loadBundleImage:@"1"
                           ClassName:NSStringFromClass(self.class)],
            [UIImage loadBundleImage:@"2"
                           ClassName:NSStringFromClass(self.class)],
            [UIImage loadBundleImage:@"8"
                           ClassName:NSStringFromClass(self.class)],
            [UIImage loadBundleImage:@"4"
                           ClassName:NSStringFromClass(self.class)],
            [UIImage loadBundleImage:@"5"
                           ClassName:NSStringFromClass(self.class)],
            [UIImage loadBundleImage:@"6"
                           ClassName:NSStringFromClass(self.class)],
            [UIImage loadBundleImage:@"7"
                           ClassName:NSStringFromClass(self.class)],
            [UIImage loadBundleImage:@"3"
                           ClassName:NSStringFromClass(self.class)],
        ];
    }

    self.template.images        = self.images;
    self.freedom.images         = self.images;
    self.joiningTogether.images = self.images;
}

- (void)wya_goBackPressed:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)wya_rightBarButtonItemPressed:(UIButton *)sender
{
    TestViewController * test = [[TestViewController alloc] init];
    UIImage * image;
    switch (self.selectIndex) {
        case 0:
            image = [UIImage wya_createViewImage:self.template.templateSuperView];
            break;
        case 1:

            break;
        case 2:
            image = [UIImage wya_createViewImage:self.freedom.freedomSuperView];
            break;
        case 3: {
            image = [self.joiningTogether.screenshotsTableView wya_captureScrollView];
        } break;
    }
    if (image) {
        NSLog(@"image==%@", image);
        test.image = image;
    }
    [self.navigationController pushViewController:test animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ======= delegate
- (NSInteger)wya_numberOfTitlesInMenuView:(WYAMenuView *)menu
{
    return 4;
}
- (NSInteger)wya_numbersOfChildControllersInPageController:(WYAPageController *)pageController
{
    return 4;
}
- (NSString *)wya_pageController:(WYAPageController *)pageController titleAtIndex:(NSInteger)index
{
    switch (index % 4) {
        case 0:
            return @"模板";
        case 1:
            return @"海报";
        case 2:
            return @"自由";
        case 3:
            return @"拼接";
    }
    return @"NONE";
}

- (UIViewController *)wya_pageController:(WYAPageController *)pageController
                   viewControllerAtIndex:(NSInteger)index
{
    switch (index % 4) {
        case 0:
            return self.template;
        case 1:
            return self.posters;
        case 2:
            return self.freedom;
        case 3:
            return self.joiningTogether;
    }
    return [[UIViewController alloc] init];
}

- (CGFloat)wya_menuView:(WYAMenuView *)menu widthForItemAtIndex:(NSInteger)index
{
    CGFloat width = [super wya_menuView:menu widthForItemAtIndex:index];
    return width + 20;
}
- (CGRect)wya_pageController:(WYAPageController *)pageController
   preferredFrameForMenuView:(WYAMenuView *)menuView
{
    menuView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    return CGRectMake(0, self.view.frame.size.height - WYATabBarHeight, ScreenWidth,
                      WYATabBarHeight);
}

- (CGRect)wya_pageController:(WYAPageController *)pageController
   preferredFrameContentView:(WYAPageScrollView *)contentView
{
    return CGRectMake(0, WYATopHeight, self.view.frame.size.width,
                      self.view.frame.size.height - WYATopHeight - WYATabBarHeight);
}

- (WYAImageComposeViewController *) template
{
    if (!_template) {
        _template = ({
            WYAImageComposeViewController * object = [[WYAImageComposeViewController alloc] init];
            object;
        });
    }
    return _template;
}

- (WYAPostersViewController *)posters
{
    if (!_posters) {
        _posters = ({
            WYAPostersViewController * object = [[WYAPostersViewController alloc] init];
            object;
        });
    }
    return _posters;
}

- (WYAFreedomViewController *)freedom
{
    if (!_freedom) {
        _freedom = ({
            WYAFreedomViewController * object = [[WYAFreedomViewController alloc] init];
            object;
        });
    }
    return _freedom;
}

- (WYAJoiningTogetherViewController *)joiningTogether
{
    if (!_joiningTogether) {
        _joiningTogether = ({
            WYAJoiningTogetherViewController * object = [[WYAJoiningTogetherViewController alloc] init];
            object;
        });
    }
    return _joiningTogether;
}
@end
