//
//  WYAChooseMenu.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import "WYAChooseMenu.h"
#import "WYAChooseMenuCell.h"
#import "WYAChooseMenuModel.h"
#import "WYAChooseMenuSecondLevelCell.h"
#import "WYAChooseMenuSecondLevelModel.h"
@interface WYAChooseMenu ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView * leftTableView;
@property (nonatomic, strong) UITableView * rightTableView;

@end

@implementation WYAChooseMenu

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.leftTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(self);
        make.width.mas_equalTo(self.mas_width).multipliedBy(self.leftTableProportion);
    }];
    
    [self.rightTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self.leftTableView.mas_right);
    }];
}

#pragma mark --- Setter
-(void)setTitleArray:(NSMutableArray <WYAChooseMenuModel *>*)titleArray{
    _titleArray = titleArray;
    if (titleArray) {
        [self.leftTableView reloadData];
    }
}

-(void)setContentArray:(NSMutableArray <WYAChooseMenuSecondLevelModel *>*)contentArray{
    _contentArray = contentArray;
    if (contentArray) {
        [self.rightTableView reloadData];
    }
}

-(void)setLeftTableProportion:(CGFloat)leftTableProportion{
    _leftTableProportion = leftTableProportion;
    [self layoutIfNeeded];
}

#pragma mark --- Getter
-(UITableView *)leftTableView{
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _leftTableView.backgroundColor = random(248, 248, 248, 1);
        [_leftTableView registerClass:[WYAChooseMenuCell class] forCellReuseIdentifier:@"menu"];
    }
    return _leftTableView;
}

-(UITableView *)rightTableView{
    if (!_rightTableView) {
        _rightTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        [_rightTableView registerClass:[WYAChooseMenuSecondLevelCell class] forCellReuseIdentifier:@"secondLevel"];
//        _rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _rightTableView.backgroundColor = random(203, 203, 203, 1);
    }
    return _rightTableView;
}

#pragma mark --- Private Method
-(void)createUI{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.leftTableView];
    [self addSubview:self.rightTableView];
    self.leftTableProportion = 0.3;
}

#pragma mark --- Public Method

#pragma mark --- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.leftTableView) {
        return self.titleArray.count;
    }else{
        return self.contentArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTableView) {
        WYAChooseMenuCell * cell = [tableView dequeueReusableCellWithIdentifier:@"menu" forIndexPath:indexPath];
        return cell;
    }else{
        
        WYAChooseMenuSecondLevelCell * cell = [tableView dequeueReusableCellWithIdentifier:@"secondLevel" forIndexPath:indexPath];
        return cell;
    }
    
}
#pragma mark --- UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTableView) {
        WYAChooseMenuCell * menuCell = (WYAChooseMenuCell *)cell;
        menuCell.model = self.titleArray[indexPath.row];
    }else{
        WYAChooseMenuSecondLevelCell * menuCell = (WYAChooseMenuSecondLevelCell *)cell;
        menuCell.model = self.contentArray[indexPath.row];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44*SizeAdapter;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.leftTableView) {
        WYAChooseMenuCell * cell = [tableView cellForRowAtIndexPath:indexPath];
        for (WYAChooseMenuModel * model in self.titleArray) {
            if (model == cell.model) {
                model.select = YES;
            }else{
                model.select = NO;
            }
        }
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        if (self.wya_delegate && [self.wya_delegate respondsToSelector:@selector(wya_leftTableDidSelectedRow:)]) {
            [self.wya_delegate wya_leftTableDidSelectedRow:indexPath];
        }
    }else{
        WYAChooseMenuSecondLevelModel * mo = self.contentArray[indexPath.row];
        if (mo.enableCell) {
            return;
        }
        WYAChooseMenuSecondLevelCell * cell = [tableView cellForRowAtIndexPath:indexPath];
        for (WYAChooseMenuSecondLevelModel * model in self.contentArray) {
            if (model == cell.model) {
                model.select = YES;
            }else{
                model.select = NO;
            }
        }
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
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