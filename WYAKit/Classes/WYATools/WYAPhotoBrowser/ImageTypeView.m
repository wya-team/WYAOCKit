
//
//  ImageTypeView.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/19.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "ImageTypeView.h"
#import <Photos/Photos.h>
@interface ImageTypeView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * table;
@property (nonatomic, strong) NSMutableArray * dataSource;
@end

@implementation ImageTypeView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _dataSource = [NSMutableArray arrayWithCapacity:0];
        self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height/2) style:UITableViewStylePlain];
        _table.dataSource = self;
        _table.delegate = self;
        _table.backgroundColor = [UIColor whiteColor];
        [self addSubview:_table];
        
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:1 reuseIdentifier:@"cell"];
    }
    if (_dataSource.count>0) {
        PHAssetCollection * collection = _dataSource[indexPath.row];
        PHFetchResult * smartSubResult = [PHAsset fetchAssetsInAssetCollection:collection options:nil];
        cell.textLabel.text = collection.localizedTitle;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",smartSubResult.count];
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(imageTypeView:didSelectData:)]) {
        self.hidden = YES;
        PHAssetCollection * collection = _dataSource[indexPath.row];
        [self.delegate imageTypeView:self didSelectData:collection];
        
    }
}

- (void)reload{
    if (self.delegate && [self.delegate respondsToSelector:@selector(imageTypeDatas)]) {
        _dataSource = [self.delegate imageTypeDatas];
        [self.table reloadData];
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.hidden = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
