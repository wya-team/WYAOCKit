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

#import "WYAImageComposeTemplateStyleOneForOne.h"
#import "WYAImageComposeTemplateStyleTwoForOne.h"

#import "WYAImageComposeTemplateStyleOneForTwo.h"
#import "WYAImageComposeTemplateStyleTwoForTwo.h"
@interface WYAImageComposeViewController ()<WYANavBarDelegate,UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) WYANavBar * navBar;
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong) UIView * superImageComposeTemplateView;
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

    CGFloat collectionView_X      = 0;
    CGFloat collectionView_Y      = ScreenHeight-WYABottomHeight-49;
    CGFloat collectionView_Width  = self.view.cmam_width;
    CGFloat collectionView_Height = 49;
    self.collectionView.frame =
    CGRectMake(collectionView_X, collectionView_Y, collectionView_Width, collectionView_Height);
    [self.view addSubview:self.collectionView];

    WYAImageComposeTemplateStyleOneForOne * view = [self wya_templateOneOfOneView];
    [view wya_templateView];
    [self.view addSubview:view];
    self.superImageComposeTemplateView = view;
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
    }
    if (indexPath.section == 0) {
        if (indexPath.item == 0) {
            WYAImageComposeTemplateStyleOneForOne * view = [self wya_templateOneOfOneView];
            [view wya_templateView];
            [self.view addSubview:view];
            self.superImageComposeTemplateView = view;
        }else{
            WYAImageComposeTemplateStyleTwoForOne * view = [self wya_templateTwoOfOneView];
            [view wya_templateView];
            [self.view addSubview:view];
            self.superImageComposeTemplateView = view;
        }
    }else if (indexPath.section == 1) {
        if (indexPath.item == 0) {
            WYAImageComposeTemplateStyleOneForTwo * view = [self wya_templateOneOfTwoView];
            [view wya_templateView];
            [self.view addSubview:view];
            self.superImageComposeTemplateView = view;
        }else{
            WYAImageComposeTemplateStyleTwoForTwo * view = [self wya_templateTwoOfTwoView];
            [view wya_templateView];
            [self.view addSubview:view];
            self.superImageComposeTemplateView = view;
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
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30 * SizeAdapter, 49)];
    label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.section + 1];
    label.textColor = [UIColor blackColor];
    label.font = FONT(15);
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
//            [object wya_addRightNavBarButtonWithNormalTitle:@[ @"保存" ]];
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
    return @[
             @[
                 [self templateOneOfOneImage],
                 [self templateTwoOfOneImage],
                 ],
             @[
                 [self templateOneOfTwoImage],
                 [self templateTwoOfTwoImage],
               ],
             ];

}

- (UIImage *)templateOneOfOneImage{
    WYAImageComposeTemplateStyleOneForOne * view = [self wya_templateOneOfOneView];
    [view wya_templatePath];
    UIImage * image = [UIImage wya_createViewImage:view];
    return image;
}

- (UIImage *)templateTwoOfOneImage{
    WYAImageComposeTemplateStyleTwoForOne * view = [self wya_templateTwoOfOneView];
    [view wya_templatePath];
    UIImage * image = [UIImage wya_createViewImage:view];
    return image;
}

- (UIImage *)templateOneOfTwoImage{
    WYAImageComposeTemplateStyleOneForTwo * view = [self wya_templateOneOfTwoView];
    [view wya_templatePath];
    UIImage * image = [UIImage wya_createViewImage:view];
    return image;
}

- (UIImage *)templateTwoOfTwoImage{
    WYAImageComposeTemplateStyleTwoForTwo * view = [self wya_templateTwoOfTwoView];
    [view wya_templatePath];
    UIImage * image = [UIImage wya_createViewImage:view];
    return image;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (WYAImageComposeTemplateStyleOneForOne *)wya_templateOneOfOneView{
    WYAImageComposeTemplateStyleOneForOne * object = [[WYAImageComposeTemplateStyleOneForOne alloc]init];
    CGFloat view_x = 0;
    CGFloat view_y = (ScreenHeight - ScreenWidth) / 2;
    CGFloat view_width = ScreenWidth;
    CGFloat view_height = ScreenWidth;
    CGRect view_rect = CGRectMake(view_x, view_y,  view_width, view_height);
    object.frame = view_rect;
    object.image = [UIImage loadBundleImage:@"0.png" ClassName:NSStringFromClass(self.class)];
    object.backgroundColor = [UIColor whiteColor];
    return object;
}

- (WYAImageComposeTemplateStyleTwoForOne *)wya_templateTwoOfOneView{
    WYAImageComposeTemplateStyleTwoForOne * object = [[WYAImageComposeTemplateStyleTwoForOne alloc]init];
    CGFloat view_x = 0;
    CGFloat view_y = (ScreenHeight - ScreenWidth) / 2;
    CGFloat view_width = ScreenWidth;
    CGFloat view_height = ScreenWidth;
    CGRect view_rect = CGRectMake(view_x, view_y,  view_width, view_height);
    object.frame = view_rect;
    object.image = [UIImage loadBundleImage:@"0.png" ClassName:NSStringFromClass(self.class)];
    object.backgroundColor = [UIColor whiteColor];
    return object;
}

- (WYAImageComposeTemplateStyleOneForTwo *)wya_templateOneOfTwoView{
    WYAImageComposeTemplateStyleOneForTwo * object = [[WYAImageComposeTemplateStyleOneForTwo alloc]init];
    CGFloat view_x = 0;
    CGFloat view_y = (ScreenHeight - ScreenWidth) / 2;
    CGFloat view_width = ScreenWidth;
    CGFloat view_height = ScreenWidth;
    CGRect view_rect = CGRectMake(view_x, view_y,  view_width, view_height);
    object.frame = view_rect;
    object.leftImage = [UIImage loadBundleImage:@"0.png" ClassName:NSStringFromClass(self.class)];
    object.rightImage = [UIImage loadBundleImage:@"1.png" ClassName:NSStringFromClass(self.class)];
    object.backgroundColor = [UIColor whiteColor];
    return object;
}

- (WYAImageComposeTemplateStyleTwoForTwo *)wya_templateTwoOfTwoView{
    WYAImageComposeTemplateStyleTwoForTwo * object = [[WYAImageComposeTemplateStyleTwoForTwo alloc]init];
    CGFloat view_x = 0;
    CGFloat view_y = (ScreenHeight - ScreenWidth) / 2;
    CGFloat view_width = ScreenWidth;
    CGFloat view_height = ScreenWidth;
    CGRect view_rect = CGRectMake(view_x, view_y,  view_width, view_height);
    object.frame = view_rect;
    object.topImage = [UIImage loadBundleImage:@"0.png" ClassName:NSStringFromClass(self.class)];
    object.bottomImage = [UIImage loadBundleImage:@"1.png" ClassName:NSStringFromClass(self.class)];
    object.backgroundColor = [UIColor whiteColor];
    return object;
}
@end
