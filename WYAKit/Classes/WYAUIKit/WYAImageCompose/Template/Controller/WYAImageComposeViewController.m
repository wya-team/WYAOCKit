//
//  WYAImageComposeViewController.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/8.
//

#import "WYAImageComposeViewController.h"

#import "WYANavBar.h"
#import "WYAImageComposeTemplateListHeaderView.h"
#import "WYAImageTemplateCell.h"

#import "WYAImageComposeTemplate.h"
#import "WYAImageComposeTemplatePoints.h"
#import <objc/runtime.h>

@interface WYAImageComposeViewController () <UICollectionViewDelegate, UICollectionViewDataSource, WYASliderDelegate>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong) WYAImageComposeTemplate * superImageComposeTemplateView;
@property (nonatomic, strong) UILabel * sliderLabel;
@property (nonatomic, strong) WYASlider * slider;
@property (nonatomic, strong) NSArray * selectors;
@end

@implementation WYAImageComposeViewController {
    NSIndexPath * lastIndexPath;
}
#pragma mark - LifeCircle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.sliderLabel];
    [self.view addSubview:self.slider];
    [self.view addSubview:self.templateSuperView];
    [self.view addSubview:self.collectionView];
}

- (void)injected
{
    [self loadView];
    [self viewDidLoad];
    [self viewWillAppear:true];
    [self viewDidAppear:YES];
    [self viewWillDisappear:YES];
    [self viewDidDisappear:YES];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    CGFloat label_X        = 10;
    CGFloat label_Y        = 20 * SizeAdapter;
    CGFloat label_Width    = ScreenWidth - 20;
    CGFloat label_Height   = 20 * SizeAdapter;
    self.sliderLabel.frame = CGRectMake(label_X, label_Y, label_Width, label_Height);

    CGFloat slider_X      = 30;
    CGFloat slider_Y      = CGRectGetMaxY(self.sliderLabel.frame) + 20 * SizeAdapter;
    CGFloat slider_Width  = self.view.frame.size.width - 60;
    CGFloat slider_Height = 30;
    self.slider.frame     = CGRectMake(slider_X, slider_Y, slider_Width, slider_Height);

    CGFloat collectionView_X      = 0;
    CGFloat collectionView_Y      = self.view.cmam_height - 49;
    CGFloat collectionView_Width  = self.view.cmam_width;
    CGFloat collectionView_Height = 49;
    self.collectionView.frame =
    CGRectMake(collectionView_X, collectionView_Y, collectionView_Width, collectionView_Height);

    CGFloat view_x               = 0;
    CGFloat view_y               = (self.view.cmam_height - self.view.cmam_width) / 2;
    CGFloat view_width           = ScreenWidth;
    CGFloat view_height          = ScreenWidth;
    CGRect view_rect             = CGRectMake(view_x, view_y, view_width, view_height);
    self.templateSuperView.frame = view_rect;
}

#pragma mark - Private Method
- (WYAImageComposeTemplate *)templatePathWithPoints:(NSArray *)points images:(NSArray *)images
{
    WYAImageComposeTemplate * template = [[WYAImageComposeTemplate alloc] initWithPoints:points images:images];
    template.frame                     = CGRectMake(0, 0, self.templateSuperView.cmam_width, self.templateSuperView.cmam_height);
    [template wya_templatePath];
    return template;
}

- (WYAImageComposeTemplate *)templateViewWithPoints:(NSArray *)points images:(NSArray *)images
{
    WYAImageComposeTemplate * template = [[WYAImageComposeTemplate alloc] initWithPoints:points images:images];
    template.frame                     = CGRectMake(0, 0, ScreenWidth, self.templateSuperView.cmam_size.height);
    [template wya_templateView];
    return template;
}

- (UIImage *)templateImageWithView:(WYAImageComposeTemplate *) template
{
    return [UIImage wya_createViewImage:template];
}

#pragma mark - WYASliderDelegate
- (void)wya_slider:(WYASlider *)slider MinValueChange:(CGFloat)value
{
    NSLog(@"最小的值==%f", value);
    NSString * string = self.selectors[lastIndexPath.section][lastIndexPath.item];

    NSArray * arr                             = [WYAImageComposeTemplatePoints performSelector:NSSelectorFromString(string) withObject:NSStringFromCGSize(self.templateSuperView.cmam_size) withObject:[NSNumber numberWithFloat:value * 20]];
    self.superImageComposeTemplateView.points = arr;
    [self.superImageComposeTemplateView wya_templateView];
}

- (void)wya_slider:(WYASlider *)slider MaxValueChange:(CGFloat)value
{
    NSLog(@"最大的值==%f", value);
}

#pragma mark--- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return [self.dataSource[section] count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYAImageTemplateCell * cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:@"template"
                                              forIndexPath:indexPath];

    cell.image = self.dataSource[indexPath.section][indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(49, 49);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0 * SizeAdapter, 5, 0 * SizeAdapter, 5);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                                  layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0 * SizeAdapter;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                             layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    lastIndexPath               = indexPath;
    self.slider.currentMinValue = 0.0;
    if (self.superImageComposeTemplateView) {
        [self.superImageComposeTemplateView removeFromSuperview];
        self.superImageComposeTemplateView = nil;
    }
    if (indexPath.section == 0) {
        if (indexPath.item == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfOneWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfOneWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 1) {
        if (indexPath.item == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 1) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 2) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThreeOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 3) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 4) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFiveOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 5) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSixOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 6) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSevenOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 7) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateEightOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 8) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateNineOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.item == 9) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTenOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 1) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 2) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThreeOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 3) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 4) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFiveOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 5) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSixOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 6) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSevenOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 7) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateEightOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 8) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateNineOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 9) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTenOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 10) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateElevenOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 11) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 12) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 13) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourteenOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 14) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFifteenOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 1) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 2) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThreeOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 3) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 4) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFiveOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 5) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSixOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 6) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSevenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 7) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateEightOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 8) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateNineOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 9) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 10) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateElevenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 11) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 12) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 13) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourteenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 14) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFifteenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 15) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSixteenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 1) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 2) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThreeOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 3) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 4) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFiveOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 5) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSixOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 6) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSevenOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 7) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateEightOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 8) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateNineOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 9) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTenOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 10) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateElevenOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 11) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 12) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 13) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourteenOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 5) {
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 1) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 2) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThreeOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 3) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 4) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFiveOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 5) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSixOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 6) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSevenOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 7) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateEightOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 8) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateNineOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 9) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTenOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 6) {
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 1) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 2) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThreeOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 3) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 4) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFiveOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 5) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSixOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 6) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSevenOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 7) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateEightOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 8) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateNineOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 9) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTenOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 10) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateElevenOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 11) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 12) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 7) {
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 1) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 2) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThreeOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 3) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 4) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFiveOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 5) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSixOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 6) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSevenOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 7) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateEightOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 8) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateNineOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 9) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTenOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 10) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateElevenOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 11) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 12) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    } else if (indexPath.section == 8) {
        if (indexPath.row == 0) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateOneOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 1) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwoOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 2) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThreeOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 3) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFourOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 4) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateFiveOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 5) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSixOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 6) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateSevenOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 7) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateEightOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 8) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateNineOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 9) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTenOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 10) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateElevenOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 11) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        } else if (indexPath.row == 12) {
            WYAImageComposeTemplate * template = [self templateViewWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, indexPath.section + 1)]];
            [self.templateSuperView addSubview:template];
            self.superImageComposeTemplateView = template;
        }
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView * view =
    [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                       withReuseIdentifier:@"header"
                                              forIndexPath:indexPath];
    UIView * vi = [view viewWithTag:1];
    if (vi) {
        [vi removeFromSuperview];
    }
    UILabel * label         = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30 * SizeAdapter, 49)];
    label.text              = [NSString stringWithFormat:@"%ld", (long)indexPath.section + 1];
    label.textColor         = [UIColor blackColor];
    label.font              = FONT(15);
    label.tag               = 1;
    label.textAlignment     = NSTextAlignmentCenter;
    label.layer.borderColor = [UIColor grayColor].CGColor;
    label.layer.borderWidth = 1;
    [view addSubview:label];
    return view;
}

#pragma mark ======= Getter

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection              = UICollectionViewScrollDirectionHorizontal;
        layout.headerReferenceSize          = CGSizeMake(30 * SizeAdapter, 49);
        _collectionView                     = [[UICollectionView alloc] initWithFrame:CGRectZero
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

- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[
            @[
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfOneWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 1)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwoOfOneWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 1)]]],
            ],
            @[
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 2)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwoOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 2)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThreeOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 2)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 2)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFiveOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 2)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSixOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 2)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSevenOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 2)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateEightOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 2)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateNineOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 2)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTenOfTwoWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 2)]]]
            ],
            @[
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwoOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThreeOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFiveOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSixOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSevenOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateEightOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateNineOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTenOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateElevenOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourteenOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFifteenOfThreeWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 3)]]],
            ],
            @[
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwoOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThreeOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFiveOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSixOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSevenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateEightOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateNineOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateElevenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourteenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFifteenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSixteenOfFourWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 4)]]],
            ],
            @[
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwoOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThreeOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFiveOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSixOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSevenOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateEightOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateNineOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTenOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateElevenOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourteenOfFiveWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 5)]]],
            ],
            @[
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 6)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwoOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 6)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThreeOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 6)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 6)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFiveOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 6)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSixOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 6)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSevenOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 6)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateEightOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 6)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateNineOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 6)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTenOfSixWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 6)]]],
            ],
            @[
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 7)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwoOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 7)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThreeOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 7)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 7)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFiveOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 7)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSixOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 7)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSevenOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 7)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateEightOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 7)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateNineOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 7)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTenOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 7)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateElevenOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 7)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 7)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfSevenWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 7)]]],
            ],
            @[
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 8)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwoOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 8)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThreeOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 8)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 8)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFiveOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 8)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSixOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 8)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSevenOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 8)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateEightOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 8)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateNineOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 8)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTenOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 8)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateElevenOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 8)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 8)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfEightWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 8)]]],
            ],
            @[
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateOneOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 9)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwoOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 9)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThreeOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 9)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFourOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 9)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateFiveOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 9)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSixOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 9)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateSevenOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 9)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateEightOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 9)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateNineOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 9)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTenOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 9)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateElevenOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 9)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateTwelveOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 9)]]],
               [self templateImageWithView:[self templatePathWithPoints:[WYAImageComposeTemplatePoints templateThirteenOfNineWithTemplateSize:self.templateSuperView.cmam_size margin:0] images:[self.images wya_safeSubarrayWithRange:NSMakeRange(0, 9)]]],
            ],
        ];
    }
    return _dataSource;
}

- (UIView *)templateSuperView
{
    if (!_templateSuperView) {
        _templateSuperView = ({

            UIView * object        = [[UIView alloc] init];
            object.backgroundColor = [UIColor whiteColor];
            object;
        });
    }
    return _templateSuperView;
}

- (UILabel *)sliderLabel
{
    if (!_sliderLabel) {
        _sliderLabel = ({
            UILabel * object = [[UILabel alloc] init];
            object.text      = @"间距";
            object.textColor = random(51, 51, 51, 1);
            object.font      = FONT(15);
            object;
        });
    }
    return _sliderLabel;
}

- (WYASlider *)slider
{
    if (!_slider) {
        _slider = ({
            WYASlider * object   = [[WYASlider alloc] init];
            object.showNoteLabel = NO;
            object.mainTintColor = [UIColor wya_hex:@"#DEDEDE"];
            object.minTintColor  = [UIColor wya_hex:@"#108DE7"];
            object.delegate      = self;
            object;
        });
    }
    return _slider;
}

- (NSArray *)selectors
{
    if (!_selectors) {
        _selectors = ({
            NSArray * object = @[
                @[
                   NSStringFromSelector(@selector(templateOneOfOneWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwoOfOneWithTemplateSizeString:marginNumber:)),
                ],
                @[
                   NSStringFromSelector(@selector(templateOneOfTwoWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwoOfTwoWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThreeOfTwoWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFourOfTwoWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFiveOfTwoWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSixOfTwoWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSevenOfTwoWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateEightOfTwoWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateNineOfTwoWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTenOfTwoWithTemplateSizeString:marginNumber:))
                ],
                @[
                   NSStringFromSelector(@selector(templateOneOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwoOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThreeOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFourOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFiveOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSixOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSevenOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateEightOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateNineOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTenOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateElevenOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwelveOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThirteenOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFourteenOfThreeWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFifteenOfThreeWithTemplateSizeString:marginNumber:)),
                ],
                @[
                   NSStringFromSelector(@selector(templateOneOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwoOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThreeOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFourOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFiveOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSixOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSevenOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateEightOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateNineOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTenOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateElevenOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwelveOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThirteenOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFourteenOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFifteenOfFourWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSixteenOfFourWithTemplateSizeString:marginNumber:)),
                ],
                @[
                   NSStringFromSelector(@selector(templateOneOfFiveWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwoOfFiveWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThreeOfFiveWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFourOfFiveWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFiveOfFiveWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSixOfFiveWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSevenOfFiveWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateEightOfFiveWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateNineOfFiveWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTenOfFiveWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateElevenOfFiveWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwelveOfFiveWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThirteenOfFiveWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFourteenOfFiveWithTemplateSizeString:marginNumber:)),
                ],
                @[
                   NSStringFromSelector(@selector(templateOneOfSixWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwoOfSixWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThreeOfSixWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFourOfSixWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFiveOfSixWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSixOfSixWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSevenOfSixWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateEightOfSixWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateNineOfSixWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTenOfSixWithTemplateSizeString:marginNumber:)),
                ],
                @[
                   NSStringFromSelector(@selector(templateOneOfSevenWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwoOfSevenWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThreeOfSevenWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFourOfSevenWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFiveOfSevenWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSixOfSevenWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSevenOfSevenWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateEightOfSevenWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateNineOfSevenWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTenOfSevenWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateElevenOfSevenWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwelveOfSevenWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThirteenOfSevenWithTemplateSizeString:marginNumber:)),
                ],
                @[
                   NSStringFromSelector(@selector(templateOneOfEightWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwoOfEightWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThreeOfEightWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFourOfEightWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFiveOfEightWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSixOfEightWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSevenOfEightWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateEightOfEightWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateNineOfEightWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTenOfEightWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateElevenOfEightWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwelveOfEightWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThirteenOfEightWithTemplateSizeString:marginNumber:)),
                ],
                @[
                   NSStringFromSelector(@selector(templateOneOfNineWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwoOfNineWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThreeOfNineWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFourOfNineWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateFiveOfNineWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSixOfNineWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateSevenOfNineWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateEightOfNineWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateNineOfNineWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTenOfNineWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateElevenOfNineWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateTwelveOfNineWithTemplateSizeString:marginNumber:)),
                   NSStringFromSelector(@selector(templateThirteenOfNineWithTemplateSizeString:marginNumber:)),
                ],
            ];
            object;
        });
    }
    return _selectors;
}
@end
