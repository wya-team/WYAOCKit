//
//  WYAImageComposeViewController.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/8.
//

#import "WYAImageComposeViewController.h"
//#import "WYAImageComposeView.h"
//#import "WYAImageClipTemplate.h"
#import "TestViewController.h"
#import "WYANavBar.h"
#import "WYAImageComposeTemplateListHeaderView.h"
#import "WYAImageTemplateCell.h"

#import "WYAImageComposeTemplate.h"
#import "WYAImageComposeTemplatePoints.h"
@interface WYAImageComposeViewController ()<WYANavBarDelegate,UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) WYANavBar * navBar;
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong) UIView * templateSuperView;
@property (nonatomic, strong) WYAImageComposeTemplate * superImageComposeTemplateView;
@end

@implementation WYAImageComposeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.navBar];

    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    [self.view addSubview:self.templateSuperView];

    CGFloat collectionView_X      = 0;
    CGFloat collectionView_Y      = ScreenHeight-WYABottomHeight-49;
    CGFloat collectionView_Width  = self.view.cmam_width;
    CGFloat collectionView_Height = 49;
    self.collectionView.frame =
    CGRectMake(collectionView_X, collectionView_Y, collectionView_Width, collectionView_Height);
    [self.view addSubview:self.collectionView];

    WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfOneWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)]]];

    [self.templateSuperView addSubview:template];
    self.superImageComposeTemplateView = template;
}

- (WYAImageComposeTemplate *)templatePathWithPoints:(NSArray *)points images:(NSArray *)images{
    WYAImageComposeTemplate * template = [[WYAImageComposeTemplate alloc]initWithPoints:points images:images];
    template.frame = CGRectMake(0, 0, self.templateSuperView.cmam_width, self.templateSuperView.cmam_height);
    [template wya_templatePath];
    return template;
}

- (WYAImageComposeTemplate *)templateViewWithPoints:(NSArray *)points images:(NSArray *)images{
    WYAImageComposeTemplate * template = [[WYAImageComposeTemplate alloc]initWithPoints:points images:images];
    template.frame = CGRectMake(0, 0, ScreenWidth, self.templateSuperView.cmam_size.height);
    [template wya_templateView];
    return template;
}

- (UIImage *)templateImageWithView:(WYAImageComposeTemplate *)template{
    return [UIImage wya_createViewImage:template];
}

#pragma mark - WYANavBarDelegate -
- (void)wya_goBackPressed:(UIButton *)sender {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)wya_rightBarButtonItemPressed:(UIButton *)sender {
    TestViewController * test = [[TestViewController alloc]init];
    test.image = [UIImage wya_createViewImage:self.superImageComposeTemplateView];
    [self.navigationController pushViewController:test animated:YES];
}

#pragma mark--- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource[section] count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WYAImageTemplateCell * cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:@"template"
                                              forIndexPath:indexPath];
    
    cell.image = self.dataSource[indexPath.section][indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath {

}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(49, 49);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0 * SizeAdapter, 5, 0 * SizeAdapter, 5);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0 * SizeAdapter;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (self.superImageComposeTemplateView) {
        [self.superImageComposeTemplateView removeFromSuperview];
        self.superImageComposeTemplateView = nil;
    }
    if (indexPath.section == 0) {
        NSArray * arr = @[
                          [UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],
                          ];
        if (indexPath.item == 0) {

            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfOneWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }else{
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfOneWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    }else if (indexPath.section == 1) {
        NSArray * arr = @[
                          [UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],
                          ];
        if (indexPath.item == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 1) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 2){
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThreeOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 3){
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 4){
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFiveOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 5){
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSixOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 6){
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSevenOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 7){
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateEightOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 8){
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateNineOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 9){
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTenOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 2) {
        NSArray * arr = @[
                          [UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)],
                          ];
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 1) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 2) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThreeOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 3) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 4) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFiveOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 5) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSixOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 6) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSevenOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 7) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateEightOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 8) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateNineOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 9) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTenOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 10) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateElevenOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 11) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 12) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 13) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourteenOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 14) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFifteenOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 3) {
        NSArray * arr = @[
                          [UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"3" ClassName:NSStringFromClass(self.class)],
                          ];
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfFourWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 4) {
        NSArray * arr = @[
                          [UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"3" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"4" ClassName:NSStringFromClass(self.class)],
                          ];
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfFiveWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 5) {
        NSArray * arr = @[
                          [UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"3" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"4" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"5" ClassName:NSStringFromClass(self.class)],
                          ];
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfSixWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 6) {
        NSArray * arr = @[
                          [UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"3" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"4" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"5" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"6" ClassName:NSStringFromClass(self.class)],
                          ];
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfSevenWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 7) {
        NSArray * arr = @[
                          [UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"3" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"4" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"5" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"6" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"7" ClassName:NSStringFromClass(self.class)],
                          ];
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfEightWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 8) {
        NSArray * arr = @[
                          [UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"3" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"4" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"5" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"6" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"7" ClassName:NSStringFromClass(self.class)],
                          [UIImage loadBundleImage:@"8" ClassName:NSStringFromClass(self.class)]
                          ];
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfNineWithTemplateSize:self.templateSuperView.cmam_size] images:arr];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView * view =
    [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                       withReuseIdentifier:@"header"
                                              forIndexPath:indexPath];
    UIView * vi = [view viewWithTag:1];
    if (vi) {
        [vi removeFromSuperview];
    }
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30 * SizeAdapter, 49)];
    label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.section + 1];
    label.textColor = [UIColor blackColor];
    label.font = FONT(15);
    label.tag = 1;
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.borderColor = [UIColor grayColor].CGColor;
    label.layer.borderWidth = 1;
    [view addSubview:label];
    return view;
}

#pragma mark ======= Getter
- (WYANavBar *)navBar {
    if (!_navBar) {
        _navBar = ({
            WYANavBar * object =
            [[WYANavBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, WYATopHeight)];
            object.delegate = self;
            object.navTitle = @"拼图制作";
            
            [object wya_customGobackWithImage:[UIImage loadBundleImage:@"返回"
                                                             ClassName:NSStringFromClass(self.class)]];
            [object wya_addRightNavBarButtonWithNormalTitle:@[ @"预览" ]];
            object;
        });
    }
    return _navBar;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.headerReferenceSize = CGSizeMake(30 * SizeAdapter, 49);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                           collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource      = self;
        _collectionView.delegate        = self;
        if (@available(iOS 11, *)) {
            _collectionView.contentInset = UIEdgeInsetsZero;
        } else {
            _collectionView.contentInset = UIEdgeInsetsMake(WYATopHeight, 0, 0, 0);
        }
        [_collectionView registerClass:[WYAImageTemplateCell class] forCellWithReuseIdentifier:@"template"];
        [_collectionView registerClass:[UICollectionReusableView class]
     forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
            withReuseIdentifier:@"header"];
    }
    return _collectionView;
}

-(NSArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = @[
                        @[
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfOneWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwoOfOneWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)]]]],
                            ],
                        @[
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwoOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThreeOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFiveOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSixOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSevenOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateEightOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateNineOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTenOfTwoWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],]]]
                            ],
                        @[
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwoOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThreeOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFiveOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSixOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSevenOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateEightOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateNineOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTenOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateElevenOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourteenOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFifteenOfThreeWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)]]]],
                            ],
                        @[
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfFourWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"3" ClassName:NSStringFromClass(self.class)]]]],
                            ],
                        @[
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfFiveWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"3" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"4" ClassName:NSStringFromClass(self.class)]]]],
                            ],
                        @[
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfSixWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"3" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"4" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"5" ClassName:NSStringFromClass(self.class)]]]],
                            ],
                        @[
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfSevenWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"3" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"4" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"5" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"6" ClassName:NSStringFromClass(self.class)]]]],
                            ],
                        @[
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfEightWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"3" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"4" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"5" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"6" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"7" ClassName:NSStringFromClass(self.class)]]]],
                            ],
                        @[
                            [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwoOfNineWithTemplateSize:self.templateSuperView.cmam_size] images:@[[UIImage loadBundleImage:@"0" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"1" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"2" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"3" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"4" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"5" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"6" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"7" ClassName:NSStringFromClass(self.class)],[UIImage loadBundleImage:@"8" ClassName:NSStringFromClass(self.class)]]]],
                            ],
                        ];
    }
    return _dataSource;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIView *)templateSuperView{
    if(!_templateSuperView){
        _templateSuperView = ({
            CGFloat view_x = 0;
            CGFloat view_y = (ScreenHeight - ScreenWidth) / 2;
            CGFloat view_width = ScreenWidth;
            CGFloat view_height = ScreenWidth;
            CGRect view_rect = CGRectMake(view_x, view_y,  view_width, view_height);
            UIView * object = [[UIView alloc]init];
            object.frame = view_rect;
            object.backgroundColor = [UIColor whiteColor];
            object;
       });
    }
    return _templateSuperView;
}
@end
