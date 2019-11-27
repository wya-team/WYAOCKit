//
//  WYAJoiningTogetherViewController.m
//  WYAKit
//
//  Created by 李世航 on 2019/7/27.
//

#import "WYAJoiningTogetherViewController.h"
#import "WYAJoiningTogetherCell.h"

@interface WYAJoiningTogetherViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;         /// 展示使用的tableView
@property (nonatomic, strong) NSMutableArray * zoomImageArray; // 缩放后的图片数组

@end

@implementation WYAJoiningTogetherViewController
#pragma mark - LifeCircle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.screenshotsTableView];
    [self.view addSubview:self.tableView];
    for (UIImage * image in self.images) {
        CGSize size         = image.size;
        CGFloat height      = ScreenWidth * size.height / size.width;
        UIImage * zoomImage = [UIImage wya_ImageCompressFitSizeScale:image targetSize:CGSizeMake(ScreenWidth, height)];
        [self.zoomImageArray addObject:zoomImage];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.frame = CGRectMake(0, 0, self.view.cmam_width, self.view.cmam_height);
    CGFloat height       = 0.0;
    for (UIImage * image in self.zoomImageArray) {
        height = height + image.size.height;
    }
    self.screenshotsTableView.frame = CGRectMake(0, 0, self.view.cmam_width, height);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.zoomImageArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage * image = self.zoomImageArray[indexPath.row];
    return image.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WYAJoiningTogetherCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.imgView.image            = self.zoomImageArray[indexPath.row];
    return cell;
}

#pragma mark - Lazy
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = ({
            UITableView * object                = [[UITableView alloc] init];
            object.estimatedRowHeight           = 0;
            object.estimatedSectionFooterHeight = 0;
            object.estimatedSectionHeaderHeight = 0;
            object.delegate                     = self;
            object.dataSource                   = self;
            [object registerClass:[WYAJoiningTogetherCell class] forCellReuseIdentifier:@"cell"];
            object.separatorStyle = UITableViewCellSeparatorStyleNone;

            object;
        });
    }
    return _tableView;
}

- (UITableView *)screenshotsTableView
{
    if (!_screenshotsTableView) {
        _screenshotsTableView = ({
            UITableView * object                = [[UITableView alloc] init];
            object.estimatedRowHeight           = 0;
            object.estimatedSectionFooterHeight = 0;
            object.estimatedSectionHeaderHeight = 0;
            object.delegate                     = self;
            object.dataSource                   = self;
            [object registerClass:[WYAJoiningTogetherCell class] forCellReuseIdentifier:@"cell"];
            object.separatorStyle = UITableViewCellSeparatorStyleNone;
            object;
        });
    }
    return _screenshotsTableView;
}

- (NSMutableArray *)zoomImageArray
{
    if (!_zoomImageArray) {
        _zoomImageArray = [NSMutableArray array];
    }
    return _zoomImageArray;
}
@end
