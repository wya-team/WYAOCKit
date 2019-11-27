//
//  WYAFreedomViewController.m
//  WYAKit
//
//  Created by 李世航 on 2019/7/27.
//

#import "WYAFreedomViewController.h"
#import "WYAFreedomCell.h"
#import "WYAImageComposeView.h"

@interface WYAFreedomViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataSource;
@end

@implementation WYAFreedomViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    [self.view addSubview:self.freedomSuperView];
    [self.view addSubview:self.collectionView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGFloat collectionView_X      = 0;
    CGFloat collectionView_Y      = self.view.cmam_height - 49;
    CGFloat collectionView_Width  = self.view.cmam_width;
    CGFloat collectionView_Height = 49;
    self.collectionView.frame =
    CGRectMake(collectionView_X, collectionView_Y, collectionView_Width, collectionView_Height);

    CGFloat view_x              = 40;
    CGFloat view_y              = 80;
    CGFloat view_width          = self.view.cmam_width - 80;
    CGFloat view_height         = self.view.cmam_height - 160;
    CGRect view_rect            = CGRectMake(view_x, view_y, view_width, view_height);
    self.freedomSuperView.frame = view_rect;

    [self autoRandomNumber];
}

#pragma mark - Private Method
- (void)autoRandomNumber
{
    for (NSInteger index = 0; index < self.images.count; index++) {
        UIImage * image            = self.images[index];
        WYAImageComposeView * view = [[WYAImageComposeView alloc] init];
        view.image                 = image;
        view.needPan               = YES;
        [self fetchImageRectWithImage:image composeView:view index:index];
        [self.freedomSuperView addSubview:view];
    }
}

- (void)fetchImageRectWithImage:(UIImage *)image composeView:(UIView *)view index:(NSInteger)index
{
    CGSize size = image.size;
    // 判断是否是横图，否则就是竖图
    BOOL widthPixelImage;
    if (size.width > size.height) {
        widthPixelImage = YES;
    }
    // 旋转角度
    CGFloat rotating;
    // 放大倍数
    CGFloat scale;
    CGFloat x;
    CGFloat y;
    CGFloat width;
    CGFloat height;
    switch (self.images.count) {
        case 1: {
            scale    = 1.2;
            rotating = -0.2;
            width    = self.freedomSuperView.cmam_width / 2;
            height   = width * size.height / size.width;
            x        = (self.freedomSuperView.cmam_width - width) / 2;
            y        = (self.freedomSuperView.cmam_height - height) / 2;
        } break;
        case 2: {
            switch (index) {
                case 0: {
                    if (widthPixelImage) {
                        scale = 1.5;
                    } else {
                        scale = 1.2;
                    }
                    rotating = -0.2;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 2 - height) / 2;
                } break;
                case 1: {
                    if (widthPixelImage) {
                        scale = 0.8;
                    } else {
                        scale = 0.8;
                    }
                    rotating = 0.2;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 2;
                } break;
                default:
                    break;
            }
        } break;
        case 3:
            switch (index) {
                case 0: {
                    if (widthPixelImage) {
                        scale = 1.5;
                    } else {
                        scale = 1.2;
                    }
                    rotating = -0.2;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 2 - height) / 2;
                } break;
                case 1: {
                    if (widthPixelImage) {
                        scale = 0.8;
                    } else {
                        scale = 1.2;
                    }
                    rotating = -0.2;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 2 + (self.freedomSuperView.cmam_height / 2 - height) / 2;
                } break;
                case 2: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0.2;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 2 + (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 2 + (self.freedomSuperView.cmam_height / 2 - height) / 2;
                } break;
                default:
                    break;
            }
            break;
        case 4:
            switch (index) {
                case 0: {
                    if (widthPixelImage) {
                        scale = 1.5;
                    } else {
                        scale = 1.2;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 1: {
                    if (widthPixelImage) {
                        scale = 0.8;
                    } else {
                        scale = 1.2;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 2: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 2 + (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 3: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                default:
                    break;
            }
            break;
        case 5:
            switch (index) {
                case 0: {
                    if (widthPixelImage) {
                        scale = 1.5;
                    } else {
                        scale = 1.2;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 1: {
                    if (widthPixelImage) {
                        scale = 0.8;
                    } else {
                        scale = 1.2;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 2 + (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 2: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 3: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 2 + (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 4: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width - width) / 2;
                    y        = (self.freedomSuperView.cmam_height - height) / 2;
                } break;
                default:
                    break;
            }
            break;
        case 6:
            switch (index) {
                case 0: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 1: {
                    if (widthPixelImage) {
                        scale = 0.8;
                    } else {
                        scale = 1.2;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 2: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 3: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 2 + (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 4: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 2 + (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 5: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 2 + (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                default:
                    break;
            }
            break;
        case 7:
            switch (index) {
                case 0: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 1: {
                    if (widthPixelImage) {
                        scale = 0.8;
                    } else {
                        scale = 1.2;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 2: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 * 2 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 3: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 4: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 5: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 * 2 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 6: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width - width) / 2;
                    y        = (self.freedomSuperView.cmam_height - height) / 2;
                } break;
                default:
                    break;
            }
            break;
        case 8:
            switch (index) {
                case 0: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 1: {
                    if (widthPixelImage) {
                        scale = 0.8;
                    } else {
                        scale = 1.2;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 2: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 * 2 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 3: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 4: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 5: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 * 2 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 6: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height - height) / 2;
                } break;
                case 7: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 2 + (self.freedomSuperView.cmam_width / 2 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height - height) / 2;
                } break;
                default:
                    break;
            }
            break;
        case 9:
            switch (index) {
                case 0: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 1: {
                    if (widthPixelImage) {
                        scale = 0.8;
                    } else {
                        scale = 1.2;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 2: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 * 2 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 3: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 4: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 5: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 * 2 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 6: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 7: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                case 8: {
                    if (widthPixelImage) {
                        scale = 1;
                    } else {
                        scale = 1;
                    }
                    rotating = 0;
                    width    = self.freedomSuperView.cmam_width / 3;
                    height   = width * size.height / size.width;
                    x        = self.freedomSuperView.cmam_width / 3 * 2 + (self.freedomSuperView.cmam_width / 3 - width) / 2;
                    y        = self.freedomSuperView.cmam_height / 3 * 2 + (self.freedomSuperView.cmam_height / 3 - height) / 2;
                } break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    view.frame     = CGRectMake(x, y, width, height);
    view.transform = CGAffineTransformRotate(view.transform, M_PI_2 * rotating);
    view.transform = CGAffineTransformScale(view.transform, scale, scale);
}

#pragma mark - Event
//- (void)panClick:(UIPanGestureRecognizer *)gesture {
//
//    UIImageView * piece = (UIImageView *)[gesture view];
//    CGPoint point                = [gesture locationInView:self.freedomSuperView];
//    if ([gesture state] == UIGestureRecognizerStateBegan || [gesture state] == UIGestureRecognizerStateChanged) {
////        if (self.panClick) {
////            self.panClick(point, self, YES);
////        }
//        CGPoint translation = [gesture translationInView:self.freedomSuperView];
//        //        NSLog(@"translation==%@",NSStringFromCGPoint(translation));
//        piece.center = CGPointMake(piece.center.x + translation.x, piece.center.y + translation.y);
//
//        [gesture setTranslation:CGPointZero inView:piece];
//    } else {
////        if (self.panClick) {
////            self.panClick(point, self, NO);
////        }
////        if (self.resetImageFrame) {
////            self.composeView.frame = self.bounds;
////        }
//    }
//}

#pragma mark--- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYAFreedomCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.image            = self.dataSource[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(49, 49);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0 * SizeAdapter, 5, 0 * SizeAdapter, 5);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                                  layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0 * SizeAdapter;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                             layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    self.freedomSuperView.image = self.dataSource[indexPath.item];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView * view =
    [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                       withReuseIdentifier:@"header"
                                              forIndexPath:indexPath];
    UIView * vi = [view viewWithTag:1];
    if (vi) {
        [vi removeFromSuperview];
    }
    UILabel * label         = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30 * SizeAdapter, 49)];
    label.text              = [NSString stringWithFormat:@"%ld", (long)indexPath.section + 1];
    label.textColor         = [UIColor blackColor];
    label.font              = FONT(15);
    label.tag               = 1;
    label.textAlignment     = NSTextAlignmentCenter;
    label.layer.borderColor = [UIColor grayColor].CGColor;
    label.layer.borderWidth = 1;
    [view addSubview:label];
    return view;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Lazy
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection              = UICollectionViewScrollDirectionHorizontal;
        layout.headerReferenceSize          = CGSizeMake(30 * SizeAdapter, 49);
        _collectionView                     = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource      = self;
        _collectionView.delegate        = self;
        if (@available(iOS 11, *)) {
            _collectionView.contentInset = UIEdgeInsetsZero;
        } else {
            _collectionView.contentInset = UIEdgeInsetsMake(WYATopHeight, 0, 0, 0);
        }
        [_collectionView registerClass:[WYAFreedomCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerClass:[UICollectionReusableView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"header"];
    }
    return _collectionView;
}
- (UIImageView *)freedomSuperView
{
    if (!_freedomSuperView) {
        _freedomSuperView = ({
            UIImageView * object          = [[UIImageView alloc] init];
            object.userInteractionEnabled = YES;
            object.clipsToBounds          = YES;
            object.image                  = [self.dataSource firstObject];
            //            UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panClick:)];
            //            [object addGestureRecognizer:pan];
            object;
        });
    }
    return _freedomSuperView;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = ({
            NSMutableArray * object = [[NSMutableArray alloc] init];
            [object addObject:[UIImage loadBundleImage:@"8"
                                             ClassName:NSStringFromClass(self.class)]];
            object;
        });
    }
    return _dataSource;
}
@end
