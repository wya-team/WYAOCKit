//
//  WYAShareView.m
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/12/3.
//

#import "WYAShareView.h"
#import "WYAShareViewItem.h"
#import "WYAAlertController.h"
#define SHARECELL @"shareCell"
#define FOOTER @"footer"
@interface WYAShareView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UIButton * cancleButton;
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) WYAAlertController * alert;
@end
@implementation WYAShareView
#pragma mark ======= Life Cycle
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:CGRectMake(0, 0, ScreenWidth, 270*SizeAdapter)]) {
       [self addSubview:self.collectionView];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self);
    }];
}
#pragma mark ======= public methods
- (void)wya_showShareViewWithController:(UIViewController *)controller{
    _showController = controller;
    WYAShareView * view =  [[WYAShareView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, 270*SizeAdapter)];
    view.dataArray = @[@[@"发送给朋友",@"新浪微博",@"生活圈",@"微信好友",@"QQ"], @[@"字号",@"刷新",@"复制链接",@"投诉"]];
    self.alert = [WYAAlertController wya_AlertWithCustomView:view AlertStyle:WYAAlertStyleCustomSheet];
    [controller presentViewController:self.alert animated:YES completion:nil];
}

- (void)setDataArray:(NSArray<NSArray *> *)dataArray{
    _dataArray = dataArray;
    [self.collectionView reloadData];
}
#pragma mark ======= Action
- (void)cancleButtonPressed:(UIButton *)sender{
    NSLog(@"按钮标题------%@",sender.titleLabel.text);
    [self.alert dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark ======= UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(ScreenWidth/5, 110*SizeAdapter);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 0 ) {
        
        return  CGSizeMake(ScreenWidth, 1);
    }else if (section == 1 ){
        return CGSizeMake(ScreenWidth, 49);
    }
    return CGSizeZero;
}
#pragma mark ======= UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [[self.dataArray wya_safeObjectAtIndex:section] count];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WYAShareViewItem * cell = [collectionView dequeueReusableCellWithReuseIdentifier:SHARECELL forIndexPath:indexPath];
    cell.titleString = [[self.dataArray wya_safeObjectAtIndex:indexPath.section] wya_safeObjectAtIndex:indexPath.row];
 
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView * view =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FOOTER forIndexPath:indexPath];
    if (indexPath.section == 0 ) {
        view.backgroundColor = [UIColor groupTableViewBackgroundColor];
        return view;
    }else if (indexPath.section == 1 ){
        [view addSubview:self.cancleButton];
        return view;
    }
    return nil;
}
#pragma mark ======= UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * title = [[self.dataArray wya_safeObjectAtIndex:indexPath.section] wya_safeObjectAtIndex:indexPath.row];
    if (self.delegate && [self.delegate respondsToSelector:@selector(wya_shareView:didSelectItemAtIndexPath:itemTitle:)]) {
        [self.delegate wya_shareView:self didSelectItemAtIndexPath:indexPath itemTitle:title];
    }
    NSLog(@"indexPath.row%ld-------title%@",indexPath.row,title);
}
#pragma mark ======= getter
- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = ({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            UICollectionView * object = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
            object.delegate = self;
            object.dataSource = self;
            object.backgroundColor = WYA_RGB_COLOR(245, 245, 249);
            [object registerClass:[WYAShareViewItem class] forCellWithReuseIdentifier:SHARECELL];
            [object registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FOOTER];
            object;
       });
    }
    return _collectionView;
}


- (UIButton *)cancleButton{
    if(!_cancleButton){
        _cancleButton = ({
            UIButton * object = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 49)];
            [object setTitle:@"取消" forState:UIControlStateNormal];
            object.backgroundColor = [UIColor whiteColor];
            [object setTitleColor:[UIColor blackColor] forState:0];
            [object addTarget:self action:@selector(cancleButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            object.titleLabel.font = FONT(18);
            object;
       });
    }
    return _cancleButton;
}
@end
