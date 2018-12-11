//
//  WYADownloadCell.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/10.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYADownloadCell.h"
#import "WYADownloadModel.h"
@interface WYADownloadCell ()
@property (nonatomic, strong) UILabel * speedLabel;
@property (nonatomic, strong) UIProgressView * progressView;
@property (nonatomic, strong) UIButton * button;//开始或暂停
@property (nonatomic, strong) UIButton * suspendButton;
@property (nonatomic, assign) NSInteger  index;
@end

@implementation WYADownloadCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.speedLabel];
        [self.contentView addSubview:self.progressView];
        [self.contentView addSubview:self.button];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(-16*SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(80*SizeAdapter, 40*SizeAdapter));
    }];
    
    [self.speedLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).with.offset(20*SizeAdapter);
        make.top.mas_equalTo(self.contentView.mas_top).with.offset(5*SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(100*SizeAdapter, 20*SizeAdapter));
    }];
    
    [self.progressView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset(-5*SizeAdapter);
        make.left.mas_equalTo(self.contentView.mas_left).with.offset(20*SizeAdapter);
        make.right.mas_equalTo(self.button.mas_left).with.offset(-20*SizeAdapter);
        make.height.mas_equalTo(5*SizeAdapter);
    }];
    
    
}

- (void)buttonClick{

    if (self.actionHandle) {
        self.actionHandle(self.index);
    }
}

-(void)setModel:(WYADownloadModel *)model{
    if (_model) {
        [_model removeObserver:self forKeyPath:@"progress"];
        [_model removeObserver:self forKeyPath:@"downloadState"];
        [_model removeObserver:self forKeyPath:@"speed"];
    }
    _model = model;
    if (model) {
        [model addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
        [model addObserver:self forKeyPath:@"downloadState" options:NSKeyValueObservingOptionNew context:nil];
        [model addObserver:self forKeyPath:@"speed" options:NSKeyValueObservingOptionNew context:nil];
    }
}

-(void)configButton:(WYADownloadState)state{
    switch (state) {
        case WYADownloadStateNormal:
            [self.button setTitle:@"下载" forState:UIControlStateNormal];
            break;
        case WYADownloadStateWait:
            [self.button setTitle:@"等待" forState:UIControlStateNormal];
            break;
        case WYADownloadStateDownloading:
            [self.button setTitle:@"下载中" forState:UIControlStateNormal];
            break;
        case WYADownloadStateSuspend:
            [self.button setTitle:@"暂停" forState:UIControlStateNormal];
            break;
        case WYADownloadStateComplete:
            [self.button setTitle:@"完成" forState:UIControlStateNormal];
            break;
        case WYADownloadStateFail:
            [self.button setTitle:@"失败" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"progress"]) {
        CGFloat progress = [change[@"new"] floatValue];
//        NSLog(@"进度传出来了==%f",progress);
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.progressView.progress = progress;
        });
    } else if ([keyPath isEqualToString:@"downloadState"]) {
        WYADownloadState state = [change[@"new"] integerValue];
        self.index = state;
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self configButton:state];
        });
        
        
    } else if ([keyPath isEqualToString:@"speed"]) {
        NSString * speed = change[@"new"];
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.speedLabel.text = speed;
        });
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (UIProgressView *)progressView{
    if(!_progressView){
        _progressView = ({
            UIProgressView * object = [[UIProgressView alloc]init];
            object.trackTintColor = [UIColor grayColor];
            object.progressTintColor = [UIColor redColor];

            object;
       });
    }
    return _progressView;
}

- (UIButton *)button{
    if(!_button){
        _button = ({
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONT(15);
            [button setBackgroundColor:[UIColor redColor]];
            [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];

            button;
       });
    }
    return _button;
}

- (UIButton *)suspendButton{
    if(!_suspendButton){
        _suspendButton = ({
            UIButton * object = [[UIButton alloc]init];
            object;
        });
    }
    return _suspendButton;
}

- (UILabel *)speedLabel{
    if(!_speedLabel){
        _speedLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = [UIColor redColor];
            object.font = FONT(15);
            object;
       });
    }
    return _speedLabel;
}
@end
