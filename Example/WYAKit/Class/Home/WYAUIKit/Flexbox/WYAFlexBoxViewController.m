//
//  WYAFlexBoxViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/5/30.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYAFlexBoxViewController.h"
#import <WYAKit/WYAAdaptiveLatticeView.h>
@interface WYAFlexBoxViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * table;
@end

@implementation WYAFlexBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.flexDirection = YGFlexDirectionColumn;
//        layout.justifyContent =  YGJustifySpaceAround;
//        layout.alignItems = YGAlignAuto;
//    }];
//
//    UIView * redView = [[UIView alloc]init];
//    redView.backgroundColor = [UIColor redColor];
//    [redView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.minWidth = YGPointValue(100);
//        layout.minHeight = YGPointValue(100);
//    }];
//
//    UIView * blueView = [[UIView alloc]init];
//    blueView.backgroundColor = [UIColor blueColor];
//    [blueView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.minWidth = YGPointValue(100);
//        layout.minHeight = YGPointValue(100);
//    }];
//
//    UIView * yellowView = [[UIView alloc]init];
//    yellowView.backgroundColor = [UIColor yellowColor];
//    [yellowView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.minWidth = YGPointValue(100);
//        layout.minHeight = YGPointValue(100);
//    }];
//
//    [self.view addSubview:redView];
//    [self.view addSubview:blueView];
//    [self.view addSubview:yellowView];
//    [self.view.yoga applyLayoutPreservingOrigin:YES];

//    [self.table configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//    }];
//
//    [self.view addSubview:self.table];


    WYAAdaptiveLatticeView * alview = [[WYAAdaptiveLatticeView alloc]init];
    alview.frame = CGRectMake(0, WYATopHeight, ScreenWidth, 200);
    [self.view addSubview:alview];
    alview.updateFrame = ^(WYAAdaptiveLatticeView * _Nonnull view, CGRect rect) {
        view.frame = rect;
    };
    [alview addTitles:@[@"sds",@"第三方",@"dsd",@"废弃物",@"他人个人",@"去",@"突然有好感",@"一体化个",@"去为",@"开发就是拉开距离发卡机是",@"份额",@"阿斯顿",@"得分",@"凄凄切切群群",@"热到付第三方",@"大",@"稳稳地",@"凡人歌",@"韩国人",@"阿斯顿",@"全文",@"撒大声地",]];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


- (UITableView *)table{
    if(!_table){
        _table = ({
            UITableView * object = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            object.delegate       = self;
            object.dataSource     = self;
            object.separatorStyle = UITableViewCellSeparatorStyleNone;
            [object registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
            object;
       });
    }
    return _table;
}
@end
