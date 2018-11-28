//
//  WYABannerView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/27.
//

#import "WYABannerView.h"

@interface WYABannerView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView * scorllView;
@property (nonatomic, strong) UIView * scrollContainerView;
@property (nonatomic, strong) UIPageControl * pageControl;
@property (nonatomic, strong) NSTimer * timer;
@property (nonatomic, strong) NSMutableArray<UIView *> * views;
@end

@implementation WYABannerView
{
    NSInteger currentPage;
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
    [self.scorllView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [self.scrollContainerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.scorllView);
        make.height.mas_equalTo(self.scorllView.mas_height);
        if (self.views.count>0) {
            UIView * view = [self.views lastObject];
            make.right.mas_equalTo(view.mas_right);
        }
    }];
    
    [self.pageControl mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(self.mas_bottom).with.offset(-30);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
}

#pragma mark --- Private Method
-(void)createUI{
    [self addSubview:self.scorllView];
    [self.scorllView addSubview:self.scrollContainerView];
    [self addSubview:self.pageControl];
    
    currentPage = 0;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(imageRolling) userInfo:nil repeats:true];
}

-(void)valueChanged:(UIPageControl *)control{
    NSLog(@"%ld",control.currentPage);
    [self.scorllView setContentOffset:CGPointMake(control.currentPage*self.cmam_width, 0) animated:YES];
}

-(void)imageRolling{
    currentPage ++;
    if (currentPage == self.images.count) {
        [self.scorllView setContentOffset:CGPointMake(0, 0) animated:NO];
        currentPage = 0;
    }else{
        [self.scorllView setContentOffset:CGPointMake(currentPage * self.cmam_width, 0) animated:YES];
    }
    self.pageControl.currentPage = currentPage;
    NSLog(@"开始");
}

#pragma mark --- Public Method

#pragma mark --- Setter
//-(void)setUrls:(NSMutableArray *)urls{
//
//}



-(void)setImages:(NSMutableArray *)images{
    _images = images;
    if (images) {
        self.pageControl.numberOfPages = images.count;
        self.pageControl.currentPage = 0;
        for (NSInteger index = 0; index<images.count; index++) {
            UIImageView * imageV = [[UIImageView alloc]init];
            imageV.image = [UIImage imageNamed:images[index]];
            imageV.contentMode = UIViewContentModeScaleAspectFit;
            [self.scrollContainerView addSubview:imageV];
            [self.views addObject:imageV];
            [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.mas_equalTo(self.scrollContainerView);
                make.width.mas_equalTo(self.cmam_width);
                make.left.mas_equalTo(self.scrollContainerView.mas_left).with.offset(self.cmam_width*index);
            }];
        }
        [self layoutIfNeeded];
        
    }
}

#pragma mark --- Getter
- (UIScrollView *)scorllView{
    if(!_scorllView){
        _scorllView = ({
            UIScrollView * object = [[UIScrollView alloc]init];
            object.delegate = self;
            object.pagingEnabled = YES;//分页
            object.showsHorizontalScrollIndicator = NO;//隐藏水平滚动条
            object.bounces = NO;
            object;
        });
    }
    return _scorllView;
}

- (UIView *)scrollContainerView{
    if(!_scrollContainerView){
        _scrollContainerView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor whiteColor];
            
            object;
        });
    }
    return _scrollContainerView;
}

-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.hidesForSinglePage = YES;
        _pageControl.defersCurrentPageDisplay = YES;
        [_pageControl addTarget:self action:@selector(valueChanged:) forControlEvents:(UIControlEventValueChanged)];
    }
    return _pageControl;
}
- (NSMutableArray<UIView *> *)views{
    if(!_views){
        _views = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
        });
    }
    return _views;
}

#pragma mark - UIScrollViewDelegate
//停止滑动图片(scrollView)时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    currentPage = floor((scrollView.contentOffset.x-self.cmam_width/2)/self.cmam_width)+1;
    self.pageControl.currentPage = currentPage;
    NSLog(@"当前处于第%ld页",currentPage);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_timer invalidate];
    _timer = nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/








@end
