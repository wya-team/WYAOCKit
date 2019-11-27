//
//  WYAChooseMenu.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import "WYAOptionMenu.h"
#import "WYAOptionMenuCell.h"
#import "WYAOptionMenuModel.h"
#import "WYAOptionMenuSecondLevelCell.h"

#import "WYAOptionMenuCollectionCell.h"

@interface WYAOptionMenu () <UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate,
                             UICollectionViewDataSource>

@property (nonatomic, strong) UITableView * leftTableView;
@property (nonatomic, strong) UITableView * rightTableView;
@property (nonatomic, strong) UICollectionView * collectionView;

@property (nonatomic, assign) NSUInteger currentRow; //记录leftTableView当前点击的行

@end

@implementation WYAOptionMenu

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.menuStyle = WYAOptionMenuStyleTable;
        [self createUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame optionMenuStyle:(WYAOptionMenuStyle)optionMenuStyle
{
    self = [super initWithFrame:frame];
    if (self) {
        self.menuStyle = optionMenuStyle;
        [self createUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.leftTableView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.top.bottom.mas_equalTo(self);
        make.width.mas_equalTo(self.mas_width).multipliedBy(self.leftTableProportion);
    }];

    if (self.menuStyle == WYAOptionMenuStyleTable) {
        [self.rightTableView mas_remakeConstraints:^(MASConstraintMaker * make) {
            make.right.top.bottom.mas_equalTo(self);
            make.left.mas_equalTo(self.leftTableView.mas_right);
        }];
    }

    if (self.menuStyle == WYAOptionMenuStyleTableAndCollection) {
        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker * make) {
            make.right.top.bottom.mas_equalTo(self);
            make.left.mas_equalTo(self.leftTableView.mas_right);
        }];
    }
}

#pragma mark--- Setter
- (void)setMenuStyle:(WYAOptionMenuStyle)menuStyle
{
    _menuStyle = menuStyle;
    if (menuStyle == WYAOptionMenuStyleTable) {
        [self.collectionView removeFromSuperview];
        self.collectionView = nil;
    } else {
        [self.rightTableView removeFromSuperview];
        self.rightTableView = nil;
    }
}

- (void)setTitleArray:(NSMutableArray<WYAOptionMenuModel *> *)titleArray
{
    _titleArray = titleArray;
    if (titleArray) {
        [self.leftTableView reloadData];
        if (self.menuStyle == WYAOptionMenuStyleTable) {
            [self.rightTableView reloadData];
        } else {
            [self.collectionView reloadData];
        }
    }
}

- (void)setLeftTableProportion:(CGFloat)leftTableProportion
{
    _leftTableProportion = leftTableProportion;
    [self layoutIfNeeded];
}

#pragma mark--- Getter
- (UITableView *)leftTableView
{
    if (!_leftTableView) {
        _leftTableView                 = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _leftTableView.delegate        = self;
        _leftTableView.dataSource      = self;
        _leftTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        _leftTableView.backgroundColor = [UIColor wya_hex:@"#f6f6f6"];
        [_leftTableView registerClass:[WYAOptionMenuCell class] forCellReuseIdentifier:@"menu"];
    }
    return _leftTableView;
}

- (UITableView *)rightTableView
{
    if (!_rightTableView) {
        _rightTableView =
        [[UITableView alloc] initWithFrame:CGRectZero
                                     style:UITableViewStylePlain];
        _rightTableView.delegate   = self;
        _rightTableView.dataSource = self;
        [_rightTableView registerClass:[WYAOptionMenuSecondLevelCell class]
                forCellReuseIdentifier:@"secondLevel"];
        //        _rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //        _rightTableView.backgroundColor = random(203, 203, 203, 1);
    }
    return _rightTableView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView =
        [[UICollectionView alloc] initWithFrame:CGRectZero
                           collectionViewLayout:layout];
        _collectionView.dataSource      = self;
        _collectionView.delegate        = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[WYAOptionMenuCollectionCell class]
            forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}

#pragma mark--- Private Method
- (void)createUI
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.leftTableView];
    if (self.menuStyle == WYAOptionMenuStyleTable) {
        [self addSubview:self.rightTableView];
    } else {
        [self addSubview:self.collectionView];
    }

    self.leftTableProportion = 0.3;
}

#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView) {
        return self.titleArray.count;
    } else {
        WYAOptionMenuModel * model = self.titleArray[self.currentRow];
        return model.secondLevelModels.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView) {
        WYAOptionMenuCell * cell =
        [tableView dequeueReusableCellWithIdentifier:@"menu"
                                        forIndexPath:indexPath];
        cell.model = self.titleArray[indexPath.row];
        return cell;
    } else {
        WYAOptionMenuSecondLevelCell * cell =
        [tableView dequeueReusableCellWithIdentifier:@"secondLevel"
                                        forIndexPath:indexPath];
        WYAOptionMenuModel * model = self.titleArray[self.currentRow];
        cell.model                 = model.secondLevelModels[indexPath.row];
        return cell;
    }
}

#pragma mark - UITableViewDelegate -
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44 * SizeAdapter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (tableView == self.leftTableView) {
        self.currentRow = indexPath.row;
        if (self.wya_delegate &&
            [self.wya_delegate respondsToSelector:@selector(wya_optionMenu:leftTableDidSelectedRow:)]) {
            [self.wya_delegate wya_optionMenu:self leftTableDidSelectedRow:indexPath];
        }
        [tableView reloadData];
        if (self.menuStyle == WYAOptionMenuStyleTable) {
            [self.rightTableView reloadData];
        } else {
            [self.collectionView reloadData];
        }
    } else {
        WYAOptionMenuModel * model         = self.titleArray[self.currentRow];
        WYAOptionMenuSecondLevelModel * mo = model.secondLevelModels[indexPath.row];
        if (mo.enableCell) {
            return;
        }
        mo.select = !mo.select;
        if (self.wya_delegate &&
            [self.wya_delegate respondsToSelector:@selector(wya_optionMenu:rightViewDidSelectedItem:)]) {
            [self.wya_delegate wya_optionMenu:self rightViewDidSelectedItem:indexPath];
        }
        [tableView reloadData];
    }
}

#pragma mark - UICollectionViewDataSource  -
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    WYAOptionMenuModel * model = self.titleArray[self.currentRow];
    return model.secondLevelModels.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYAOptionMenuCollectionCell * cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
                                              forIndexPath:indexPath];
    WYAOptionMenuModel * model = self.titleArray[self.currentRow];
    cell.model                 = model.secondLevelModels[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate  -
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = collectionView.cmam_width / 3;
    return CGSizeMake(width, width);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0 * SizeAdapter, 0 * SizeAdapter, 0 * SizeAdapter, 0 * SizeAdapter);
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
    return 5 * SizeAdapter;
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.wya_delegate &&
        [self.wya_delegate respondsToSelector:@selector(wya_optionMenu:rightViewDidSelectedItem:)]) {
        [self.wya_delegate wya_optionMenu:self rightViewDidSelectedItem:indexPath];
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
