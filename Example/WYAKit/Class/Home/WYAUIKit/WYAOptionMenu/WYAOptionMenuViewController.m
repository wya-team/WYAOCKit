//
//  WYAOptionMenuViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/20.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAOptionMenuViewController.h"

@interface WYAOptionMenuViewController () <WYAOptionMenuDelegate>
@property (nonatomic, strong) UIButton * menuSuperView;
@property (nonatomic, strong) NSArray<WYAOptionMenuModel *> * titles;
@property (nonatomic, strong) WYAOptionMenu * singleMenu;
@property (nonatomic, strong) WYAOptionMenu * menu;
@property (nonatomic, strong) WYAOptionMenu * otherMenu;
@end

@implementation WYAOptionMenuViewController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender {
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
    vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/"
                   @"WYAOptionMenu/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navTitle             = @"WYAOptionMenu";
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];

    [self configUI];

    [self.view addSubview:self.menuSuperView];
}

- (void)configUI {
    UILabel * label = [[UILabel alloc] init];
    label.text      = @"菜单";
    label.textColor = random(51, 51, 51, 1);
    label.font      = FONT(15);
    [self.view addSubview:label];

    CGFloat label_X      = 10;
    CGFloat label_Y      = WYATopHeight + 20 * SizeAdapter;
    CGFloat label_Width  = ScreenWidth - 20;
    CGFloat label_Height = 44 * SizeAdapter;
    label.frame          = CGRectMake(label_X, label_Y, label_Width, label_Height);

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"menu" forState:UIControlStateNormal];
    button.titleLabel.font = FONT(15);
    [button setBackgroundImage:[UIImage wya_createImageWithColor:BLUECOLOR]
                      forState:UIControlStateNormal];
    [button addCallBackAction:^(UIButton * button) {
        self.menuSuperView.hidden = NO;
        [UIView animateWithDuration:0.5 animations:^{ self.menu.cmam_height = 300; }];
    }];
    [self.view addSubview:button];

    CGFloat button_X      = 0;
    CGFloat button_Y      = CGRectGetMaxY(label.frame);
    CGFloat button_Width  = ScreenWidth;
    CGFloat button_Height = 44;
    button.frame          = CGRectMake(button_X, button_Y, button_Width, button_Height);

    [self.menuSuperView addSubview:self.menu];
    CGFloat menu_X      = 0;
    CGFloat menu_Y      = CGRectGetMaxY(button.frame);
    CGFloat menu_Width  = ScreenWidth;
    CGFloat menu_Height = 0;
    self.menu.frame     = CGRectMake(menu_X, menu_Y, menu_Width, menu_Height);

    UILabel * label1 = [[UILabel alloc] init];
    label1.text      = @"单级菜单";
    label1.textColor = random(51, 51, 51, 1);
    label1.font      = FONT(15);
    [self.view addSubview:label1];

    CGFloat label1_X      = 10;
    CGFloat label1_Y      = CGRectGetMaxY(button.frame) + 20 * SizeAdapter;
    CGFloat label1_Width  = ScreenWidth - 20;
    CGFloat label1_Height = 44 * SizeAdapter;
    label1.frame          = CGRectMake(label1_X, label1_Y, label1_Width, label1_Height);

    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"OneLevel menu" forState:UIControlStateNormal];
    button1.titleLabel.font = FONT(15);
    [button1 setBackgroundImage:[UIImage wya_createImageWithColor:BLUECOLOR]
                       forState:UIControlStateNormal];
    [button1 addCallBackAction:^(UIButton * button) {
        self.menuSuperView.hidden = NO;
        [UIView animateWithDuration:0.5 animations:^{ self.singleMenu.cmam_height = 88; }];
    }];
    [self.view addSubview:button1];

    CGFloat button1_X      = 0;
    CGFloat button1_Y      = CGRectGetMaxY(label1.frame);
    CGFloat button1_Width  = ScreenWidth;
    CGFloat button1_Height = 44;
    button1.frame          = CGRectMake(button1_X, button1_Y, button1_Width, button1_Height);

    [self.menuSuperView addSubview:self.singleMenu];
    CGFloat singleMenu_X      = 0;
    CGFloat singleMenu_Y      = CGRectGetMaxY(button1.frame);
    CGFloat singleMenu_Width  = ScreenWidth;
    CGFloat singleMenu_Height = 0;
    self.singleMenu.frame =
        CGRectMake(singleMenu_X, singleMenu_Y, singleMenu_Width, singleMenu_Height);

    UILabel * label2 = [[UILabel alloc] init];
    label2.text      = @"其他类型菜单";
    label2.textColor = random(51, 51, 51, 1);
    label2.font      = FONT(15);
    [self.view addSubview:label2];

    CGFloat label2_X      = 10;
    CGFloat label2_Y      = CGRectGetMaxY(button1.frame) + 20 * SizeAdapter;
    CGFloat label2_Width  = ScreenWidth - 20;
    CGFloat label2_Height = 44 * SizeAdapter;
    label2.frame          = CGRectMake(label2_X, label2_Y, label2_Width, label2_Height);

    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"Other menu" forState:UIControlStateNormal];
    button2.titleLabel.font = FONT(15);
    [button2 setBackgroundImage:[UIImage wya_createImageWithColor:BLUECOLOR]
                       forState:UIControlStateNormal];
    [button2 addCallBackAction:^(UIButton * button) {
        self.menuSuperView.hidden = NO;
        [UIView animateWithDuration:0.5 animations:^{ self.otherMenu.cmam_height = 200; }];
    }];
    [self.view addSubview:button2];

    CGFloat button2_X      = 0;
    CGFloat button2_Y      = CGRectGetMaxY(label2.frame);
    CGFloat button2_Width  = ScreenWidth;
    CGFloat button2_Height = 44;
    button2.frame          = CGRectMake(button2_X, button2_Y, button2_Width, button2_Height);

    [self.menuSuperView addSubview:self.otherMenu];
    CGFloat otherMenu_X      = 0;
    CGFloat otherMenu_Y      = CGRectGetMaxY(button2.frame);
    CGFloat otherMenu_Width  = ScreenWidth;
    CGFloat otherMenu_Height = 0;
    self.otherMenu.frame     = CGRectMake(otherMenu_X, otherMenu_Y, otherMenu_Width, otherMenu_Height);
}

#pragma mark--- WYAOptionMenuDelegate
- (void)wya_leftTableDidSelectedRow:(NSIndexPath *)indexPath {
}

- (void)wya_rightViewDidSelectedItem:(NSIndexPath *)indexPath {
    NSLog(@"section==%ld,item==%ld", (long)indexPath.section, (long)indexPath.row);
}

#pragma mark - Getter -
- (UIButton *)menuSuperView {
    if (!_menuSuperView) {
        _menuSuperView = ({
            UIButton * object      = [[UIButton alloc] initWithFrame:self.view.frame];
            object.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.3];
            object.hidden          = YES;
            [object addCallBackAction:^(UIButton * button) {
                button.hidden               = YES;
                self.menu.cmam_height       = 0;
                self.singleMenu.cmam_height = 0;
                self.otherMenu.cmam_height  = 0;
            }];
            object;
        });
    }
    return _menuSuperView;
}

- (WYAOptionMenu *)singleMenu {
    if (!_singleMenu) {
        _singleMenu = ({
            WYAOptionMenu * object = [[WYAOptionMenu alloc] initWithFrame:CGRectZero
                                                          optionMenuStyle:WYAOptionMenuStyleTable];
            object.titleArray          = [self.titles mutableCopy];
            object.wya_delegate        = self;
            object.leftTableProportion = 1;
            object;
        });
    }
    return _singleMenu;
}

- (WYAOptionMenu *)menu {
    if (!_menu) {
        _menu = ({
            WYAOptionMenu * object = [[WYAOptionMenu alloc] initWithFrame:CGRectZero
                                                          optionMenuStyle:WYAOptionMenuStyleTable];
            object.titleArray          = [self.titles mutableCopy];
            object.wya_delegate        = self;
            object.leftTableProportion = 0.5;
            object;
        });
    }
    return _menu;
}

- (WYAOptionMenu *)otherMenu {
    if (!_otherMenu) {
        _otherMenu = ({
            WYAOptionMenu * object =
                [[WYAOptionMenu alloc] initWithFrame:CGRectZero
                                     optionMenuStyle:WYAOptionMenuStyleTableAndCollection];
            object.titleArray          = [self.titles mutableCopy];
            object.wya_delegate        = self;
            object.leftTableProportion = 0.5;
            object;
        });
    }
    return _otherMenu;
}

- (NSArray<WYAOptionMenuModel *> *)titles {
    if (!_titles) {
        WYAOptionMenuSecondLevelModel * item1 = [[WYAOptionMenuSecondLevelModel alloc] init];
        item1.title                           = @"All Foods";
        item1.enableCell                      = NO;
        item1.select                          = YES;

        WYAOptionMenuSecondLevelModel * item2 = [[WYAOptionMenuSecondLevelModel alloc] init];
        item2.title                           = @"Chinese Foods";
        item2.enableCell                      = NO;
        item2.select                          = NO;

        WYAOptionMenuSecondLevelModel * item3 = [[WYAOptionMenuSecondLevelModel alloc] init];
        item3.title                           = @"Hot Pot";
        item3.enableCell                      = NO;
        item3.select                          = NO;

        WYAOptionMenuSecondLevelModel * item4 = [[WYAOptionMenuSecondLevelModel alloc] init];
        item4.title                           = @"Buffet";
        item4.enableCell                      = NO;
        item4.select                          = NO;

        WYAOptionMenuSecondLevelModel * item5 = [[WYAOptionMenuSecondLevelModel alloc] init];
        item5.title                           = @"Fast Food";
        item5.enableCell                      = NO;
        item5.select                          = NO;

        WYAOptionMenuModel * model1 = [[WYAOptionMenuModel alloc] init];
        model1.select               = YES;
        model1.title                = @"Food";
        model1.secondLevelModels    = @[ item1, item2, item3, item4, item5 ];

        WYAOptionMenuSecondLevelModel * item6 = [[WYAOptionMenuSecondLevelModel alloc] init];
        item6.title                           = @"All SuperMarket";
        item6.enableCell                      = NO;
        item6.select                          = YES;

        WYAOptionMenuSecondLevelModel * item7 = [[WYAOptionMenuSecondLevelModel alloc] init];
        item7.title                           = @"SuperMarket";
        item7.enableCell                      = YES;
        item7.select                          = NO;

        WYAOptionMenuSecondLevelModel * item8 = [[WYAOptionMenuSecondLevelModel alloc] init];
        item8.title                           = @"C-Store";
        item8.enableCell                      = NO;
        item8.select                          = NO;

        WYAOptionMenuModel * model2 = [[WYAOptionMenuModel alloc] init];
        model2.select               = NO;
        model2.title                = @"SuperMarket";
        model2.secondLevelModels    = @[ item6, item7, item8 ];

        _titles = @[ model1, model2 ];
    }
    return _titles;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before
navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
