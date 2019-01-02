//
//  WYAPaginationViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/20.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPaginationViewController.h"

@interface WYAPaginationViewController () <WYAPaginationViewDelegate>
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) NSInteger imageIndex;
@property (nonatomic, strong) WYAPaginationView * pagination;
@property (nonatomic, strong) WYAPaginationView * imagepagination;
@property (nonatomic, strong) WYAPaginationView * textPagination;
@property (nonatomic, strong) WYAPaginationView * hiddentextPagination;
@property (nonatomic, strong) UIPageControl * pageControl;
@end

@implementation WYAPaginationViewController

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
    vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/tree/master/WYAKit/Classes/WYAUIKit/WYAPaginationView";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.index      = 0;
    self.imageIndex = 0;
    self.navTitle   = @"WYAPaginationView";

    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];

    [self configUI];
}

- (void)configUI
{
    UILabel * label = [[UILabel alloc] init];
    label.text      = @"基本";
    label.textColor = random(51, 51, 51, 1);
    label.font      = FONT(15);
    [self.view addSubview:label];

    CGFloat label_X      = 10;
    CGFloat label_Y      = WYATopHeight + 20 * SizeAdapter;
    CGFloat label_Width  = ScreenWidth - 20;
    CGFloat label_Height = 44;
    label.frame          = CGRectMake(label_X, label_Y, label_Width, label_Height);

    [self.view addSubview:self.pagination];
    CGFloat pagination_X      = 20 * SizeAdapter;
    CGFloat pagination_Y      = CGRectGetMaxY(label.frame);
    CGFloat pagination_Width  = ScreenWidth - 40 * SizeAdapter;
    CGFloat pagination_Height = 44 * SizeAdapter;
    self.pagination.frame     = CGRectMake(pagination_X, pagination_Y, pagination_Width, pagination_Height);
    [self changeNumber];

    UILabel * label1 = [[UILabel alloc] init];
    label1.text      = @"按钮带图";
    label1.textColor = random(51, 51, 51, 1);
    label1.font      = FONT(15);
    [self.view addSubview:label1];

    CGFloat label1_X      = 10;
    CGFloat label1_Y      = CGRectGetMaxY(self.pagination.frame) + 20 * SizeAdapter;
    CGFloat label1_Width  = ScreenWidth - 20;
    CGFloat label1_Height = 44;
    label1.frame          = CGRectMake(label1_X, label1_Y, label1_Width, label1_Height);

    [self.view addSubview:self.imagepagination];
    CGFloat imagepagination_X      = 20 * SizeAdapter;
    CGFloat imagepagination_Y      = CGRectGetMaxY(label1.frame);
    CGFloat imagepagination_Width  = ScreenWidth - 40 * SizeAdapter;
    CGFloat imagepagination_Height = 44 * SizeAdapter;
    self.imagepagination.frame     = CGRectMake(imagepagination_X, imagepagination_Y, imagepagination_Width, imagepagination_Height);
    [self.imagepagination.rightButton wya_setButtonImageLoctionRightWithSpace:0];
    [self changeImageNumber];

    UILabel * label2 = [[UILabel alloc] init];
    label2.text      = @"隐藏数字";
    label2.textColor = random(51, 51, 51, 1);
    label2.font      = FONT(15);
    [self.view addSubview:label2];

    CGFloat label2_X      = 10;
    CGFloat label2_Y      = CGRectGetMaxY(self.imagepagination.frame) + 20 * SizeAdapter;
    CGFloat label2_Width  = ScreenWidth - 20;
    CGFloat label2_Height = 44;
    label2.frame          = CGRectMake(label2_X, label2_Y, label2_Width, label2_Height);

    [self.view addSubview:self.hiddentextPagination];
    CGFloat hiddentextPagination_X      = 20 * SizeAdapter;
    CGFloat hiddentextPagination_Y      = CGRectGetMaxY(label2.frame);
    CGFloat hiddentextPagination_Width  = ScreenWidth - 40 * SizeAdapter;
    CGFloat hiddentextPagination_Height = 44 * SizeAdapter;
    self.hiddentextPagination.frame     = CGRectMake(hiddentextPagination_X, hiddentextPagination_Y, hiddentextPagination_Width, hiddentextPagination_Height);

    UILabel * label3 = [[UILabel alloc] init];
    label3.text      = @"只有数字";
    label3.textColor = random(51, 51, 51, 1);
    label3.font      = FONT(15);
    [self.view addSubview:label3];

    CGFloat label3_X      = 10;
    CGFloat label3_Y      = CGRectGetMaxY(self.hiddentextPagination.frame) + 20 * SizeAdapter;
    CGFloat label3_Width  = ScreenWidth - 20;
    CGFloat label3_Height = 44;
    label3.frame          = CGRectMake(label3_X, label3_Y, label3_Width, label3_Height);

    [self.view addSubview:self.textPagination];
    CGFloat textPagination_X            = 20 * SizeAdapter;
    CGFloat textPagination_Y            = CGRectGetMaxY(label3.frame);
    CGFloat textPagination_Width        = ScreenWidth - 40 * SizeAdapter;
    CGFloat textPagination_Height       = 44 * SizeAdapter;
    self.textPagination.frame           = CGRectMake(textPagination_X, textPagination_Y, textPagination_Width, textPagination_Height);
    self.textPagination.titleLabel.text = @"0/5";

    UILabel * label4 = [[UILabel alloc] init];
    label4.text      = @"系统UIPageControl";
    label4.textColor = random(51, 51, 51, 1);
    label4.font      = FONT(15);
    [self.view addSubview:label4];

    CGFloat label4_X      = 10;
    CGFloat label4_Y      = CGRectGetMaxY(self.textPagination.frame) + 20 * SizeAdapter;
    CGFloat label4_Width  = ScreenWidth - 20;
    CGFloat label4_Height = 44;
    label4.frame          = CGRectMake(label4_X, label4_Y, label4_Width, label4_Height);

    [self.view addSubview:self.pageControl];
    CGFloat pageControl_X      = (ScreenWidth - 100) / 2;
    CGFloat pageControl_Y      = CGRectGetMaxY(label4.frame);
    CGFloat pageControl_Width  = 100;
    CGFloat pageControl_Height = 30;
    self.pageControl.frame     = CGRectMake(pageControl_X, pageControl_Y, pageControl_Width, pageControl_Height);
}

#pragma mark - WYAPaginationViewDelegate  -
/**
 左按钮点击事件
 */
- (void)wya_leftActionWithPaginationView:(UIView *)view button:(UIButton *)button
{
    if (view == self.pagination) {
        if (self.index < 1) {
            return;
        } else if (self.index == 1) {
            self.pagination.leftButton.enabled = NO;
        } else {
            self.pagination.leftButton.enabled  = YES;
            self.pagination.rightButton.enabled = YES;
        }
        self.index--;
        [self changeNumber];
    } else if (view == self.imagepagination) {
        if (self.imageIndex < 1) {
            return;
        } else if (self.imageIndex == 1) {
            self.imagepagination.leftButton.enabled = NO;
        } else {
            self.imagepagination.leftButton.enabled  = YES;
            self.imagepagination.rightButton.enabled = YES;
        }
        self.imageIndex--;
        [self changeImageNumber];
    }
}

/**
 右按钮点击事件
 */
- (void)wya_rightActionWithPaginationView:(UIView *)view button:(UIButton *)button
{
    if (view == self.pagination) {
        if (self.index > 9) {
            return;
        } else if (self.index == 9) {
            self.pagination.rightButton.enabled = NO;
        } else {
            self.pagination.rightButton.enabled = YES;
            self.pagination.leftButton.enabled  = YES;
        }
        self.index++;
        [self changeNumber];
    } else if (view == self.imagepagination) {
        if (self.imageIndex > 4) {
            return;
        } else if (self.imageIndex == 4) {
            self.imagepagination.rightButton.enabled = NO;
        } else {
            self.imagepagination.rightButton.enabled = YES;
            self.imagepagination.leftButton.enabled  = YES;
        }
        self.imageIndex++;
        [self changeImageNumber];
    }
}

- (void)changeNumber
{
    NSString * string                = [NSString stringWithFormat:@"%ld/10", (long)self.index];
    NSMutableAttributedString * text = [[NSMutableAttributedString alloc] initWithString:string];
    [text addAttribute:NSForegroundColorAttributeName value:random(58, 149, 226, 1) range:[string rangeOfString:[NSString stringWithFormat:@"%ld", (long)self.index]]];
    self.pagination.titleLabel.attributedText = text;
}

- (void)changeImageNumber
{
    NSString * string                = [NSString stringWithFormat:@"%ld/5", (long)self.imageIndex];
    NSMutableAttributedString * text = [[NSMutableAttributedString alloc] initWithString:string];
    [text addAttribute:NSForegroundColorAttributeName value:random(58, 149, 226, 1) range:[string rangeOfString:[NSString stringWithFormat:@"%ld", (long)self.imageIndex]]];
    self.imagepagination.titleLabel.attributedText = text;
}

#pragma mark - Getter -
- (WYAPaginationView *)pagination
{
    if (!_pagination) {
        _pagination = ({
            WYAPaginationView * object           = [[WYAPaginationView alloc] init];
            object.wya_Delegate                  = self;
            object.leftButton.layer.borderColor  = [UIColor clearColor].CGColor;
            object.rightButton.layer.borderColor = [UIColor clearColor].CGColor;
            [object.leftButton setTitle:@"减" forState:UIControlStateNormal];
            object.leftButton.enabled = NO;
            [object.rightButton setTitle:@"加" forState:UIControlStateNormal];
            object;
        });
    }
    return _pagination;
}

- (WYAPaginationView *)imagepagination
{
    if (!_imagepagination) {
        _imagepagination = ({
            WYAPaginationView * object           = [[WYAPaginationView alloc] init];
            object.wya_Delegate                  = self;
            object.leftButton.layer.borderColor  = [UIColor clearColor].CGColor;
            object.rightButton.layer.borderColor = [UIColor clearColor].CGColor;
            [object.leftButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
            [object.rightButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
            object.leftButton.enabled              = NO;
            object.rightButton.imageView.transform = CGAffineTransformMakeRotation(M_PI);
            object;
        });
    }
    return _imagepagination;
}

- (WYAPaginationView *)textPagination
{
    if (!_textPagination) {
        _textPagination = ({
            WYAPaginationView * object           = [[WYAPaginationView alloc] init];
            object.wya_Delegate                  = self;
            object.leftButton.layer.borderColor  = [UIColor clearColor].CGColor;
            object.rightButton.layer.borderColor = [UIColor clearColor].CGColor;
            object.leftButton.hidden             = YES;
            object.rightButton.hidden            = YES;
            object;
        });
    }
    return _textPagination;
}

- (WYAPaginationView *)hiddentextPagination
{
    if (!_hiddentextPagination) {
        _hiddentextPagination = ({
            WYAPaginationView * object           = [[WYAPaginationView alloc] init];
            object.wya_Delegate                  = self;
            object.leftButton.layer.borderColor  = [UIColor clearColor].CGColor;
            object.rightButton.layer.borderColor = [UIColor clearColor].CGColor;
            object.titleLabel.hidden             = YES;
            object;
        });
    }
    return _hiddentextPagination;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = ({
            UIPageControl * object               = [[UIPageControl alloc] init];
            object.numberOfPages                 = 5;
            object.currentPage                   = 2;
            object.pageIndicatorTintColor        = [UIColor grayColor];
            object.currentPageIndicatorTintColor = [UIColor blackColor];
            object;
        });
    }
    return _pageControl;
}
@end
