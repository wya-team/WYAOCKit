//
//  WYABannerView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/27.
//

#import "WYABannerView.h"

@interface WYABannerView ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIPageControl * pageControl;
@property (nonatomic, strong) UIImageView * leftImageView;
@property (nonatomic, strong) UIImageView * middleImageView;
@property (nonatomic, strong) UIImageView * rightImageView;
@property (nonatomic, strong) NSTimer * timer;
@property (nonatomic, assign) NSInteger  currentIndex;
@property (nonatomic, assign) WYABannerSourceStyle  style;
@property (nonatomic, assign) CGFloat  time;
@end

@implementation WYABannerView

- (instancetype)initWithFrame:(CGRect)frame BannerSourceStyle:(WYABannerSourceStyle)sourceStyle TimeInterval:(CGFloat)time
{
    self = [super initWithFrame:frame];
    if (self) {
        self.style = sourceStyle;
        self.time = time;
        [self createUI];
    }
    return self;
}

#pragma mark --- Private Method
-(void)createUI{
    
    [self.scrollView addSubview:self.leftImageView];
    [self.scrollView addSubview:self.middleImageView];
    [self.scrollView addSubview:self.rightImageView];
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    
    self.scrollView.frame = CGRectMake(0, 0, self.cmam_width, self.cmam_height);
    self.pageControl.frame = CGRectMake(0, CGRectGetMaxY(self.bounds) - 30.f, CGRectGetWidth(self.bounds), 20.f);
    CGFloat imageWidth = CGRectGetWidth(self.scrollView.bounds);
    CGFloat imageHeight = CGRectGetHeight(self.scrollView.bounds);
    self.leftImageView.frame    = CGRectMake(imageWidth * 0, 0, imageWidth, imageHeight);
    self.middleImageView.frame  = CGRectMake(imageWidth * 1, 0, imageWidth, imageHeight);
    self.rightImageView.frame   = CGRectMake(imageWidth * 2, 0, imageWidth, imageHeight);
    self.scrollView.contentSize = CGSizeMake(imageWidth * 3, 0);
    
    [self setScrollViewContentOffsetCenter];
    [self addObservers];

    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.time>0 ? self.time : 2 target:self selector:@selector(scrollTimerDidFired:) userInfo:nil repeats:true];
}

- (void)setScrollViewContentOffsetCenter {
    self.scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.scrollView.bounds), 0);
}

- (void)addObservers {
    [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeObservers {
    [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

#pragma mark -  KVO -
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self caculateCurIndex];
    }
}

- (void)caculateCurIndex {
    if (self.images && self.images.count > 0) {
        CGFloat pointX = self.scrollView.contentOffset.x;
        CGFloat criticalValue = .2f;
        if (pointX > 2 * CGRectGetWidth(self.scrollView.bounds) - criticalValue) {
            self.currentIndex = (self.currentIndex + 1) % self.images.count;
        } else if (pointX < criticalValue) {
            
            self.currentIndex = (self.currentIndex + self.images.count - 1) % self.images.count;
        }
    }
}

- (void)scrollTimerDidFired:(NSTimer *)timer {
    CGFloat criticalValue = .2f;
    if (self.scrollView.contentOffset.x < CGRectGetWidth(self.scrollView.bounds) - criticalValue || self.scrollView.contentOffset.x > CGRectGetWidth(self.scrollView.bounds) + criticalValue) {
        [self setScrollViewContentOffsetCenter];
    }
    CGPoint newOffset = CGPointMake(self.scrollView.contentOffset.x + CGRectGetWidth(self.scrollView.bounds), self.scrollView.contentOffset.y);
    [self.scrollView setContentOffset:newOffset animated:YES];
}

- (void)imageClicked:(UITapGestureRecognizer *)tap {
    if (self.touchImageHandle) {
        self.touchImageHandle(self.currentIndex);
    }
}

- (void)swipeImageView:(UISwipeGestureRecognizer *)gesture{
    CGPoint newOffset;
    switch (gesture.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            newOffset = CGPointMake(self.scrollView.contentOffset.x + CGRectGetWidth(self.scrollView.bounds), self.scrollView.contentOffset.y);
            break;
         case UISwipeGestureRecognizerDirectionRight:
            newOffset = CGPointMake(self.scrollView.contentOffset.x - CGRectGetWidth(self.scrollView.bounds), self.scrollView.contentOffset.y);
            break;
        default:
            return;
    }
    
    [self.scrollView setContentOffset:newOffset animated:YES];
}
#pragma mark - Setter -

- (void)setCurrentIndex:(NSInteger)currentIndex{
    if (_currentIndex >= 0) {
        _currentIndex = currentIndex;
        
        NSInteger imageCount = self.images.count;
        NSInteger leftIndex = (currentIndex + imageCount - 1) % imageCount;
        NSInteger rightIndex= (currentIndex + 1) % imageCount;
        
        
        if (self.style == WYABannerSourceStyleLocal) {
            self.leftImageView.image = [UIImage imageNamed:self.images[leftIndex]];
            self.middleImageView.image = [UIImage imageNamed:self.images[currentIndex]];
            self.rightImageView.image = [UIImage imageNamed:self.images[rightIndex]];
        }else{
            NSString * string = self.images[currentIndex];
            if ([string hasSuffix:@"jpg"] || [string hasSuffix:@"jpeg"] || [string hasSuffix:@"png"]) {
                [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:self.images[leftIndex]] placeholderImage:self.placeholdImage];
                [self.middleImageView sd_setImageWithURL:[NSURL URLWithString:self.images[currentIndex]] placeholderImage:self.placeholdImage];
                [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:self.images[rightIndex]] placeholderImage:self.placeholdImage];
            }
#warning 暂未处理svg和gif图片
        }
        
        [self setScrollViewContentOffsetCenter];
        
        self.pageControl.currentPage = currentIndex;
    }
}

-(void)setImages:(NSMutableArray <NSString *>*)images{
    _images = images;
    if (images) {
        self.currentIndex = 0;
        
        if (images.count > 1) {
            [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:2]];
            self.pageControl.numberOfPages = images.count;
            self.pageControl.currentPage = 0;
            self.pageControl.hidden = NO;
        } else {
            self.pageControl.hidden = YES;
            [self.leftImageView removeFromSuperview];
            [self.rightImageView removeFromSuperview];
            self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.bounds), 0);
        }
    }
}

-(void)setContentMode:(UIViewContentMode)contentMode{
    self.leftImageView.contentMode = contentMode;
    self.middleImageView.contentMode = contentMode;
    self.rightImageView.contentMode = contentMode;
}

-(void)setPlaceholdImage:(UIImage *)placeholdImage{
    _placeholdImage = placeholdImage;
}

#pragma mark --- Getter
- (UIScrollView *)scrollView{
    if(!_scrollView){
        _scrollView = ({
            UIScrollView * object = [[UIScrollView alloc]init];
            object.delegate = self;
            object.pagingEnabled = YES;//分页
            object.showsHorizontalScrollIndicator = NO;//隐藏水平滚动条
            object.bounces = NO;
            object;
        });
    }
    return _scrollView;
}

-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.hidesForSinglePage = YES;
        _pageControl.defersCurrentPageDisplay = YES;
//        [_pageControl addTarget:self action:@selector(valueChanged:) forControlEvents:(UIControlEventValueChanged)];
    }
    return _pageControl;
}

- (UIImageView *)leftImageView {
    if (!_leftImageView) {
        _leftImageView = [UIImageView new];
//        _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        
    }
    
    return _leftImageView;
}

- (UIImageView *)middleImageView {
    if (!_middleImageView) {
        _middleImageView = [UIImageView new];
        _middleImageView.userInteractionEnabled = YES;
//        _middleImageView.contentMode = UIViewContentModeScaleAspectFit;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClicked:)];
        [_middleImageView addGestureRecognizer:tap];
        
        UISwipeGestureRecognizer * leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeImageView:)];
        leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
        [_middleImageView addGestureRecognizer:leftSwipe];
        
        UISwipeGestureRecognizer * rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeImageView:)];
        [_middleImageView addGestureRecognizer:rightSwipe];
    }
    
    return _middleImageView;
}

- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        _rightImageView = [UIImageView new];
//        _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _rightImageView;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.images.count > 1) {
        [self.timer setFireDate:[NSDate distantFuture]];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.images.count > 1) {
        [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:3]];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/








@end
