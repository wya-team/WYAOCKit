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

@interface WYAPhotoEditViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, WYAPhotoEditControlViewDelegate, WYAImageCropViewControllerDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) WYAPhotoEditControlView * controlView;
@property (nonatomic, strong) NSMutableArray * images;
@end

@implementation WYAPhotoEditViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.controlView];
    
    UIButton * cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancelButton.titleLabel.font = FONT(15);
    [cancelButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(5*SizeAdapter);
        make.top.mas_equalTo(self.view.mas_top).with.offset(WYAStatusBarHeight +20*SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(40*SizeAdapter, 30*SizeAdapter));
    }];
    
//    UIButton * doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [doneButton setTitle:@"完成" forState:UIControlStateNormal];
//    [doneButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
//    doneButton.titleLabel.font = FONT(15);
//    [doneButton addTarget:self action:@selector(doneClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:doneButton];
//    [doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(self.view.mas_right).with.offset(-5*SizeAdapter);
//        make.top.mas_equalTo(self.view.mas_top).with.offset(20*SizeAdapter);
//        make.size.mas_equalTo(CGSizeMake(40*SizeAdapter, 30*SizeAdapter));
//    }];
    
    [self loadImages];
}

#pragma mark - Private Method -
-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)loadImages{
    
    for (WYAPhotoBrowserModel * model in self.models) {
        PHImageManager * manager = [PHImageManager defaultManager];
        PHImageRequestOptions * opi = [[PHImageRequestOptions alloc]init];
        
        [manager requestImageForAsset:model.asset targetSize:CGSizeMake(self.view.cmam_width, self.view.cmam_height) contentMode:PHImageContentModeAspectFill options:opi resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            BOOL downloadFinined = ![[info objectForKey:PHImageCancelledKey] boolValue] && ![info objectForKey:PHImageErrorKey] && ![[info objectForKey:PHImageResultIsDegradedKey] boolValue];
            if (downloadFinined) {
                //获取的高清图
                [self.images addObject:result];
            }
            
        }];
    }
}

-(void)cancelClick{
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)doneClick{
    
}

#pragma mark - Getter -
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
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [_collectionView registerClass:[WYAPhotoPreviewCell class] forCellWithReuseIdentifier:@"image"];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
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
    
//    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    WYAPhotoPreviewCell * imageCell = (WYAPhotoPreviewCell *)cell;
    imageCell.model = self.models[indexPath.item];
    [imageCell setScrollZoom];
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
    imageCrop.delegate = self;
    [self presentViewController:imageCrop animated:YES completion:nil];
}

-(void)originalImage{
    WYAPhotoBrowserModel * model = self.models[(NSUInteger)(self.collectionView.contentOffset.x/self.collectionView.cmam_width)];
    PHImageManager * manager = [PHImageManager defaultManager];
    PHImageRequestOptions * opi = [[PHImageRequestOptions alloc]init];
   
    [manager requestImageForAsset:model.asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeAspectFill options:opi resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        [self.images replaceObjectAtIndex:(NSUInteger)(self.collectionView.contentOffset.x/self.collectionView.cmam_width) withObject:result];
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

#pragma mark - WYAImageCropViewControllerDelegate  -
- (void)cropViewController:(nonnull WYAImageCropViewController *)cropViewController didCropToImage:(nonnull UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle{
    [cropViewController dismissViewControllerAnimated:YES completion:nil];
    NSInteger index = self.collectionView.contentOffset.x/self.collectionView.cmam_width;
    WYAPhotoPreviewCell * cell = (WYAPhotoPreviewCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    cell.preview.imageView.image = image;
    [self.images replaceObjectAtIndex:index withObject:image];
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
