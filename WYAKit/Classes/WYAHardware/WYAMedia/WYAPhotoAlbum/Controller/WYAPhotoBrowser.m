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

- (instancetype)init
{
    WYAPhotoBrowserAlbum * album = [[WYAPhotoBrowserAlbum alloc] init];
    self                         = [super initWithRootViewController:album];
    if (self) {
        _config = [WYAPhotoBrowserConfig defaultPhotoBrowserConfig];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
//    [[WYAPhotoBrowserManager sharedPhotoBrowserManager] stopAllCacheAsset];
}

- (void)dealloc{
    NSLog(@"调用了图片viewcontroll----0");
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
