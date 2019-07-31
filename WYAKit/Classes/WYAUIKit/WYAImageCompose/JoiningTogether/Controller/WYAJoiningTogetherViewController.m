//
//  WYAJoiningTogetherViewController.m
//  WYAKit
//
//  Created by 李世航 on 2019/7/27.
//

#import "WYAJoiningTogetherViewController.h"
#import "WYAJoiningTogetherCell.h"
@interface WYAJoiningTogetherViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView; /// 展示使用的tableView

@end

@implementation WYAJoiningTogetherViewController
#pragma mark - LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.screenshotsTableView];
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = CGRectMake(0, 0, self.view.cmam_width, self.view.cmam_height);
    CGFloat height = 0.0;
    for (UIImage * image in self.images) {
        height = height + image.size.height;
    }
    self.screenshotsTableView.frame = CGRectMake(0, 0, self.view.cmam_width, height);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.images.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIImage * image = self.images[indexPath.row];
    return image.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WYAJoiningTogetherCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.imgView.image = self.images[indexPath.row];
    return cell;
}

#pragma mark - Lazy
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = ({
            UITableView * object = [[UITableView alloc]init];
            object.estimatedRowHeight = 0;
            object.estimatedSectionFooterHeight = 0;
            object.estimatedSectionHeaderHeight = 0;
            object.delegate = self;
            object.dataSource = self;
            [object registerClass:[WYAJoiningTogetherCell class] forCellReuseIdentifier:@"cell"];
            object.separatorStyle = UITableViewCellSeparatorStyleNone;

            object;
       });
    }
    return _tableView;
}

- (UITableView *)screenshotsTableView{
    if(!_screenshotsTableView){
        _screenshotsTableView = ({
            UITableView * object = [[UITableView alloc]init];
            object.estimatedRowHeight = 0;
            object.estimatedSectionFooterHeight = 0;
            object.estimatedSectionHeaderHeight = 0;
            object.delegate = self;
            object.dataSource = self;
            [object registerClass:[WYAJoiningTogetherCell class] forCellReuseIdentifier:@"cell"];
            object.separatorStyle = UITableViewCellSeparatorStyleNone;
            object;
       });
    }
    return _screenshotsTableView;
}
@end
