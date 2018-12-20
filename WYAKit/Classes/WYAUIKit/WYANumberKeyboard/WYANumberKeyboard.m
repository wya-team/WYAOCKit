//
//  WYANumberKeyboard.m
//  AFNetworking
//
//  Created by 李俊恒 on 2018/12/20.
//

#import "WYANumberKeyboard.h"
#import "WYANumberTitleCell.h"
#import "WYANumberImage.h"

#define TITLECELL @"titleCell"
#define FOOTER @"footer"

@interface WYANumberKeyboard()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView * keybordView;
@property (nonatomic, strong) NSArray * titleArray;
@property (nonatomic,strong) UIColor * fontColor;
@property (nonatomic,assign) CGFloat fontSize;
@property (nonatomic,assign) CGFloat itemSpace;
@end
@implementation WYANumberKeyboard
#pragma mark ======= Life Cycle
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:CGRectMake(0, ScreenHeight - 400*SizeAdapter, ScreenWidth, 400*SizeAdapter)]) {
        [self addSubview:self.keybordView];
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, ScreenHeight - 400*SizeAdapter, ScreenWidth, 400*SizeAdapter);
        [self addSubview:self.keybordView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.keybordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self);
    }];
}
#pragma mark ======= getter
- (UICollectionView *)keybordView{
    if(!_keybordView){
        _keybordView = ({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            UICollectionView * object = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
            object.delegate = self;
            object.dataSource = self;
            [object registerClass:[WYANumberTitleCell class] forCellWithReuseIdentifier:TITLECELL];
            [object registerClass:[WYANumberImage class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FOOTER];
            object;
       });
    }
    return _keybordView;
}

- (NSArray *)titleArray{
    if(!_titleArray){
        _titleArray = ({
            NSArray * object = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@".",@"0",@"icon_keyboard"];
            object;
       });
    }
    return _titleArray;
}
#pragma mark ======= UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(186*SizeAdapter, 100*SizeAdapter);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
   
    return CGSizeMake(190*SizeAdapter, 400*SizeAdapter);
}

#pragma mark ======= UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titleArray.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WYANumberTitleCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:TITLECELL forIndexPath:indexPath];
    cell.backgroundColor = randomColor;
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    WYANumberImage * view =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FOOTER forIndexPath:indexPath];
        view.backgroundColor = randomColor;
        return view;
}
#pragma mark ======= UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}
@end
