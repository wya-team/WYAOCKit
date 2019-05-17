//
//  WYAPhotoBrowserNav.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import "WYAPhotoBrowser.h"
#import "WYAPhotoBrowserAlbum.h"
#import "WYAPhotoBrowserManager.h"
@interface WYAPhotoBrowser ()

@end

@implementation WYAPhotoBrowser

- (instancetype)initWithMaxCount:(NSInteger)maxCount photoBrowserType:(WYAPhotoBrowserType)type {
    WYAPhotoBrowserAlbum * album = [[WYAPhotoBrowserAlbum alloc] init];
    album.maxCount               = maxCount;
    album.photoBrowserType       = type;
    self                         = [super initWithRootViewController:album];
    if (self) {}
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[WYAPhotoBrowserManager sharedPhotoBrowserManager] stopAllCacheAsset];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before
navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
