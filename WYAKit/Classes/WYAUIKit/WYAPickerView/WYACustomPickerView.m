//
//  WYACustomPickerView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/23.
//

#import "WYACustomPickerView.h"

@interface WYACustomPickerView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIView * containView;
@end

@implementation WYACustomPickerView
{
    NSInteger tableCount; // 记录table个数
}

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
    
    [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.containView.subviews wya_mas_distributeSudokuViewsWithFixedLineSpacing:0
                                                           fixedInteritemSpacing:0
                                                                       warpCount:tableCount
                                                                      topSpacing:0
                                                                   bottomSpacing:0
                                                                     leadSpacing:0
                                                                     tailSpacing:0];
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    if (self.wya_dataSource && [self.wya_dataSource respondsToSelector:@selector(numberOfComponentsInCustomPickerView:)]) {
        NSInteger count = [self.wya_dataSource numberOfComponentsInCustomPickerView:self];
        if (count>0) {
            tableCount = count;
            for (NSInteger index = 0; index<count; index++) {
                UITableView * table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
                table.delegate = self;
                table.dataSource = self;
                table.separatorStyle = UITableViewCellSeparatorStyleNone;
                table.tag = index+1;
                table.backgroundColor = randomColor;
                [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
                [self.containView addSubview:table];
            }
            [self setNeedsLayout];
            [self layoutIfNeeded];
        }
    }else{

        if (!self.wya_dataSource) {
            NSAssert(self.wya_dataSource, @"指定协议遵守者");
        }
        if (![self.wya_dataSource respondsToSelector:@selector(numberOfComponentsInCustomPickerView:)]) {
            NSAssert([self.wya_dataSource respondsToSelector:@selector(numberOfComponentsInCustomPickerView:)], @"必须实现方法- (NSInteger)numberOfComponentsInCustomPickerView:(UIView *)pickerView");
        }

    }
}

#pragma mark --- Private Method
-(void)createUI{
    tableCount = 0;
    
    [self addSubview:self.containView];
}

#pragma mark --- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableCount>0) {
        for (NSInteger index = 1; index<=tableCount; index++) {
            if (tableView.tag == index) {
                if (self.wya_dataSource && [self.wya_dataSource respondsToSelector:@selector(customPickerView:numberOfRowsInComponent:)]) {
                    return [self.wya_dataSource customPickerView:self numberOfRowsInComponent:index-1];
                }else{
                    NSAssert([self.wya_dataSource respondsToSelector:@selector(customPickerView:numberOfRowsInComponent:)], @"必须实现- (NSInteger)customPickerView:(UIView *)pickerView numberOfRowsInComponent:(NSInteger)component");
                }
            }
        }
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    for (UIView * view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    for (NSInteger index = 1; index<= tableCount; index++) {
        if (tableView.tag == index) {
            if (self.wya_delegate && [self.wya_delegate respondsToSelector:@selector(customPickerView:viewForRow:forComponent:reusingView:)]) {
               UIView * view = [self.wya_delegate customPickerView:self viewForRow:indexPath.row forComponent:index-1 reusingView:cell.contentView];
                [cell.contentView addSubview:view];
            }
        }
    }
    
    
    
    return cell;
}

#pragma mark --- UITableViewDelegate

#pragma mark --- Setter

#pragma mark --- Getter
-(UIView *)containView{
    if (!_containView) {
        _containView = [[UIView alloc]init];
        _containView.backgroundColor = [UIColor whiteColor];
    }
    return _containView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
