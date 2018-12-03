//
//  WYAPhotoEditViewController.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import "WYAPhotoEditViewController.h"
#import "WYAPhotoPreviewCell.h"
#import "WYAPhotoBrowserModel.h"
#import "WYAPhotoEditControlView.h"
#import <Photos/Photos.h>
#import "WYAPhotoBrowser.h"
#import "WYAImageCropViewController.h"

@interface WYAPhotoEditViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, WYAPhotoEditControlViewDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) WYAPhotoEditControlView * controlView;
@property (nonatomic, strong) NSMutableArray * images;
@end

@implementation WYAPhotoEditViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor lightGrayColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.controlView];
}

#pragma mark --- Getter
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor blackColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.contentOffset = CGPointMake(0, 0);
        _collectionView.scrollsToTop = NO;
        [_collectionView registerClass:[WYAPhotoPreviewCell class] forCellWithReuseIdentifier:@"image"];
    }
    return _collectionView;
}

- (WYAPhotoEditControlView *)controlView{
    if(!_controlView){
        _controlView = ({
            WYAPhotoEditControlView * object = [[WYAPhotoEditControlView alloc]initWithFrame:CGRectMake(0, ScreenHeight-WYABottomHeight-49, ScreenWidth, 49)];
            object.delegate = self;
            object;
        });
    }
    return _controlView;
}
- (NSMutableArray *)images{
    if(!_images){
        _images = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
        });
    }
    return _images;
}
#pragma mark --- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.models.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WYAPhotoPreviewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"image" forIndexPath:indexPath];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    WYAPhotoPreviewCell * imageCell = (WYAPhotoPreviewCell *)cell;
    imageCell.model = self.models[indexPath.item];
    [imageCell.scrollV setZoomScale:1 animated:NO];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.cmam_width, self.view.cmam_height);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0*SizeAdapter, 0 * SizeAdapter, 0*SizeAdapter, 0 * SizeAdapter);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0 * SizeAdapter;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0 * SizeAdapter;
}

#pragma mark ---WYAPhotoEditControlViewDelegate
-(void)edit{
    NSInteger index = self.collectionView.contentOffset.x/self.collectionView.cmam_width;
    WYAPhotoBrowserModel * model = self.models[index];
    
    WYAImageCropViewController * imageCrop = [[WYAImageCropViewController alloc]initWithImage:model.cacheImage];
    [self presentViewController:imageCrop animated:YES completion:nil];
}

-(void)originalImage{
    WYAPhotoBrowserModel * model = self.models[(NSUInteger)(self.collectionView.contentOffset.x/self.collectionView.cmam_width)];
    PHImageManager * manager = [PHImageManager defaultManager];
    PHImageRequestOptions * opi = [[PHImageRequestOptions alloc]init];
   
    [manager requestImageForAsset:model.asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeAspectFill options:opi resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        [self.images addObject:result];
    }];
}

-(void)done{
    WYAPhotoBrowser * photo = (WYAPhotoBrowser *)self.navigationController;
    if (photo.callBackBlock) {
        [self dismissViewControllerAnimated:YES completion:^{
            photo.callBackBlock(self.images);
        }];
    }
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
