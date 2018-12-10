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
@property (nonatomic, strong) UIProgressView * progressView;
@property (nonatomic, strong) UIButton * button;//开始或暂停
@property (nonatomic, strong) UIButton * suspendButton;
@end

@implementation WYADownloadCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
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
        make.size.mas_equalTo(CGSizeMake(40*SizeAdapter, 40*SizeAdapter));
    }];
    [self.progressView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.contentView.mas_left).with.offset(20*SizeAdapter);
        make.right.mas_equalTo(self.button.mas_left).with.offset(-20*SizeAdapter);
        make.height.mas_equalTo(5*SizeAdapter);
    }];
    
    
}

- (void)buttonClick{
    self.button.selected = !self.button.selected;
    if (self.actionHandle) {
        self.actionHandle(self.button.selected);
    }
}

-(void)setModel:(WYADownloadModel *)model{
    if (_model) {
        [_model removeObserver:self forKeyPath:@"progress"];
    }
    _model = model;
    if (model) {
        [model addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"progress"]) {
        CGFloat progress = [change[@"new"] floatValue];
        NSLog(@"进度传出来了==%f",progress);
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.progressView.progress = progress;
        });
    } else {
        
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
            [button setTitle:@"开始" forState:UIControlStateNormal];
            [button setTitle:@"暂停" forState:UIControlStateSelected];
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

@end
