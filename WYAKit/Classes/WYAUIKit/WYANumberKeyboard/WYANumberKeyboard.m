//
//  WYANumberKeyboard.m
//  AFNetworking
//
//  Created by 李俊恒 on 2018/12/20.
//

#import "WYANumberKeyboard.h"
#import "WYANumberImage.h"
#import "WYANumberTitleCell.h"
#define TITLECELL @"titleCell"
#define FOOTER @"footer"
#define IMAGECELL @"imagecell"

@interface WYANumberKeyboard () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, WYANumberImageDelegate>
{
    void (^_numberKeyboardChangeValue)(NSString * value);
    void (^_sureButtonBlock)(void);
    BOOL _randomKeyboard;
}
@property (nonatomic, strong) UICollectionView * keybordView;
@property (nonatomic, strong) NSMutableArray * titleArray;
@property (nonatomic, strong) UITextField * textFiled;

@end

@implementation WYANumberKeyboard
#pragma mark ======= Life Cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:CGRectMake(0, ScreenHeight - 200, ScreenWidth, 200 + WYABottomHeight)]) {
        [self addSubview:self.keybordView];
        _bgColor = [UIColor whiteColor];
        //        _spaceNum = 2;
    }
    return self;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        //        _spaceNum = 2;
        self.frame = CGRectMake(0, ScreenHeight - 200, ScreenWidth, 200 + WYABottomHeight);
        [self addSubview:self.keybordView];
        _bgColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.keybordView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.mas_equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(-WYABottomHeight);
        make.height.mas_equalTo(200);
    }];
}

#pragma mark ======= public
+ (instancetype)initWithTextFiled:(UITextField *)textFiled
{
    WYANumberKeyboard * tempKeybord = [[WYANumberKeyboard alloc] initWithTextFiled:textFiled];
    return tempKeybord;
}
+ (instancetype)initRandomKeyboardWithTextFiled:(UITextField *)textFiled
{
    WYANumberKeyboard * tempKeybord = [[WYANumberKeyboard alloc] initRandomKeyboardWithTextFiled:textFiled];
    return tempKeybord;
}
- (void)wya_numberKeyboadrDidChanged:(void (^)(NSString * _Nonnull))numberKeyboardChangeValue
{
    _numberKeyboardChangeValue = numberKeyboardChangeValue;
}
- (void)wya_numberKeyboadrSurePressed:(void (^)(void))sureButtonBlock
{
    _sureButtonBlock = sureButtonBlock;
}

#pragma mark ======= setter
- (void)setBgColor:(UIColor *)bgColor
{
    _bgColor = bgColor;
    [self.keybordView reloadData];
}
#pragma mark ======= getter
- (UICollectionView *)keybordView
{
    if (!_keybordView) {
        _keybordView = ({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.scrollDirection              = UICollectionViewScrollDirectionHorizontal;
            layout.itemSize                     = CGSizeMake((ScreenWidth - 95) / 3, 200 / 4);
            layout.minimumLineSpacing           = 0;
            layout.minimumInteritemSpacing      = 0;
            UICollectionView * object           = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
            object.delegate                     = self;
            object.dataSource                   = self;
            object.backgroundColor              = [UIColor whiteColor];
            [object registerClass:[WYANumberTitleCell class] forCellWithReuseIdentifier:TITLECELL];
            [object registerClass:[WYANumberImageCell class] forCellWithReuseIdentifier:IMAGECELL];

            [object registerClass:[WYANumberImage class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FOOTER];
            object;
        });
    }
    return _keybordView;
}

#pragma mark ======= UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(95, 200);
}
#pragma mark ======= UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArray.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * string = [self.titleArray wya_safeObjectAtIndex:indexPath.row];
    if (![string isEqualToString:@"icon_keyboard"]) {
        WYANumberTitleCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:TITLECELL forIndexPath:indexPath];
        for (id subView in cell.subviews) {
            if ([subView isKindOfClass:[UIButton class]]) {
                [subView removeFromSuperview];
            }
        }
        cell.titleString = string;
        cell.bgColor     = _bgColor;
        return cell;
    } else {
        WYANumberImageCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:IMAGECELL forIndexPath:indexPath];
        cell.imageNamed           = string;
        cell.bgColor              = _bgColor;
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    WYANumberImage * view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FOOTER forIndexPath:indexPath];
    view.delegate         = self;
    return view;
}

#pragma mark ======= UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * numberStr = [self.titleArray wya_safeObjectAtIndex:indexPath.row];
    [self showInputWithNumberStr:numberStr];
}

#pragma mark - collectionViewCell点击高亮
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYANumberTitleCell * cell = (WYANumberTitleCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.bgColor              = [UIColor groupTableViewBackgroundColor];
}
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYANumberTitleCell * cell = (WYANumberTitleCell *)[collectionView cellForItemAtIndexPath:indexPath];
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 /*延迟执行时间*/ * NSEC_PER_SEC));

    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        cell.bgColor = self->_bgColor;
    });
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark ======= WYANumberImageDelegate
- (void)wya_surePressed:(NSString *)senderTitle
{
    // 确定
    [_textFiled resignFirstResponder];
    _sureButtonBlock ? _sureButtonBlock() : nil;
}

- (void)wya_deletePressed:(NSString *)senderTitle
{
    // 删除
    [self showInputWithNumberStr:senderTitle];
}

#pragma mark ======= private

- (void)showInputWithNumberStr:(NSString *)numStr
{
    if ([@"icon_keyboard" isEqualToString:numStr]) {
        _numberKeyboardChangeValue ? _numberKeyboardChangeValue(_textFiled.text) : nil;
        [_textFiled resignFirstResponder];
    } else if ([@"删除" isEqualToString:numStr]) {
        //        if (_textFiled.text.length == _spaceNum) {
        //
        //        }else{
        [_textFiled deleteBackward];
        //        }
    } else if ([@"." isEqualToString:numStr]) {
        if (![_textFiled.text containsString:@"."]) {
            [_textFiled insertText:numStr];
        }
    } else {
        [_textFiled insertText:numStr];
    }
}

- (void)refresh
{
    if (_randomKeyboard) {
        [_titleArray removeAllObjects];
        NSMutableArray * startArray  = [[NSMutableArray alloc] initWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
        NSMutableArray * resultArray = [[NSMutableArray alloc] initWithCapacity:0];
        NSInteger m                  = 10;
        for (int i = 0; i < m; i++) {
            int t          = arc4random() % startArray.count;
            resultArray[i] = startArray[t];
            startArray[t]  = [startArray lastObject];
            [startArray removeLastObject];
        }
        [resultArray wya_safeInsertObject:@"." atIndex:3];
        [resultArray wya_safeInsertObject:@"icon_keyboard" atIndex:11];
        _titleArray = resultArray;
    } else {
        _titleArray = [NSMutableArray arrayWithArray:@[ @"1", @"4", @"7", @".", @"2", @"5", @"8", @"0", @"3", @"6", @"9", @"icon_keyboard" ]];
    }
    [_keybordView reloadData];
}

- (instancetype)initWithTextFiled:(UITextField *)textFiled
{
    if (self = [super init]) {
        _textFiled           = textFiled;
        _textFiled.inputView = self;
        _randomKeyboard      = NO;
        [_textFiled addTarget:self action:@selector(textFiedChangedEditing) forControlEvents:UIControlEventEditingChanged];
        [_textFiled addTarget:self action:@selector(textFiedBeginEditing) forControlEvents:UIControlEventEditingDidBegin];
    }
    return self;
}

- (instancetype)initRandomKeyboardWithTextFiled:(UITextField *)textFiled
{
    if (self = [super init]) {
        _textFiled           = textFiled;
        _textFiled.inputView = self;
        _randomKeyboard      = YES;
        [_textFiled addTarget:self action:@selector(textFiedChangedEditing) forControlEvents:UIControlEventEditingChanged];
        [_textFiled addTarget:self action:@selector(textFiedBeginEditing) forControlEvents:UIControlEventEditingDidBegin];
    }
    return self;
}

#pragma mark =======  TextFiled Action Methods
- (void)textFiedBeginEditing
{
    // 每次重新生成数据源
    [self refresh];
    //    if (_textFiled.text.length < _spaceNum) {
    //        for (int i = 0; i < _spaceNum; i++) {
    //            [_textFiled insertText:@" "];
    //        }
    //    }

    //如果用到了IQKeyboardManager
    //    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

- (void)textFiedChangedEditing
{
    _numberKeyboardChangeValue ? _numberKeyboardChangeValue(_textFiled.text) : nil;
}
@end
