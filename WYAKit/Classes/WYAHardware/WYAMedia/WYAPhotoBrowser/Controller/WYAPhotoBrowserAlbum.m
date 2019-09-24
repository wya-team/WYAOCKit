//
//  WYAPhotoBrowser.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import "WYAPhotoBrowserAlbum.h"
#import "WYAPhotoBrowserAlbumCell.h"
#import "WYAPhotoBrowserManager.h"
#import "WYAPhotoBrowserViewController.h"
#import <Photos/Photos.h>
#import "WYAPhotoBrowserModel.h"
@interface WYAPhotoBrowserAlbum () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * table;
@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation WYAPhotoBrowserAlbum
#pragma mark ======= LifeCircle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    [self photoAlbum];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    WYAPhotoBrowserViewController * photoB = [[WYAPhotoBrowserViewController alloc] init];
    [self.navigationController pushViewController:photoB animated:NO];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDarkContent;
}

- (void)dealloc{
    NSLog(@"调用了图片viewcontroll----1");
    self.dataSource = nil;
}

#pragma mark ======= UI
-(void)setupUI{
    self.title                 = @"照片";
    self.view.backgroundColor  = [UIColor colorWithWhite:0.2 alpha:0.5];

    [self.view addSubview:self.table];

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    button.frame           = CGRectMake(0, 0, 40, 30);
    button.titleLabel.font = FONT(15);
    WeakSelf(weakSelf);
    [button addCallBackAction:^(UIButton * button) {
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

#pragma mark ======= Private Method
- (void)photoAlbum {
    WeakSelf(weakSelf);
    [[WYAPhotoBrowserManager sharedPhotoBrowserManager] getPhotoAblumList:[self config].allowSelectVideo allowSelectImage:[self config].allowSelectImage complete:^(NSArray<WYAPhotoBrowserAlbumModel *> * arr) {
        StrongSelf(strongSelf);
        strongSelf.dataSource = arr;
        [strongSelf.table reloadData];
    }];
}

#pragma mark ======= UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WYAPhotoBrowserAlbumCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    WYAPhotoBrowserViewController * vc = [[WYAPhotoBrowserViewController alloc] init];
    vc.album                     = self.dataSource[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ======= Getter
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _dataSource;
}

- (UITableView *)table{
    if(!_table){
        _table = ({
            UITableView * object       = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
            object.dataSource      = self;
            object.delegate        = self;
            object.backgroundColor = [UIColor whiteColor];
            object.rowHeight       = 60 * SizeAdapter;
            [object registerClass:[WYAPhotoBrowserAlbumCell class] forCellReuseIdentifier:@"cell"];
            object;
       });
    }
    return _table;
}

- (WYAPhotoBrowserConfig *)config{
    WYAPhotoBrowser * photoBrowser = (WYAPhotoBrowser *)self.navigationController;
    return photoBrowser.config;
}

@end
