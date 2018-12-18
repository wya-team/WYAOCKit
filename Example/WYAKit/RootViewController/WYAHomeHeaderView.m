//
//  WYAHomeHeaderView.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/17.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAHomeHeaderView.h"
#import "WYAHomeModel.h"
@interface WYAHomeHeaderView ()
@property (nonatomic, strong) UIButton * backgroundButton;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIButton * arrowButton;
@end

@implementation WYAHomeHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.backgroundButton];
        [self.backgroundButton addSubview:self.arrowButton];
        [self.backgroundButton addSubview:self.titleLabel];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.backgroundButton.frame = CGRectMake(10*SizeAdapter, 0, self.cmam_width-20*SizeAdapter, self.cmam_height);
    self.titleLabel.frame = CGRectMake(16*SizeAdapter, (self.backgroundButton.cmam_height-30*SizeAdapter)/2, 200*SizeAdapter, 30*SizeAdapter);
    self.arrowButton.frame = CGRectMake(self.backgroundButton.cmam_width-54*SizeAdapter, (self.backgroundButton.cmam_height-44*SizeAdapter)/2, 44*SizeAdapter, 44*SizeAdapter);
}

#pragma mark - Private Method -
- (void)buttonClick{
    if (self.headerHandle) {
        self.headerHandle();
    }
}

#pragma mark - Setter -
-(void)setModel:(WYAHomeModel *)model{
    _model = model;
    if (model) {
        self.arrowButton.selected = model.select;
        self.titleLabel.text = model.sectionName;
    }
}

#pragma mark - Getter -
- (UIButton *)backgroundButton{
    if(!_backgroundButton){
        _backgroundButton = ({
            UIButton * object = [[UIButton alloc]init];
            [object addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
            [object setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
            object;
        });
    }
    return _backgroundButton;
}

- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = [UIColor blackColor];
            object.font = FONT(15);
            object;
       });
    }
    return _titleLabel;
}

- (UIButton *)arrowButton{
    if(!_arrowButton){
        _arrowButton = ({
            UIButton * object = [[UIButton alloc]init];
            [object setImage:[UIImage imageNamed:@"icon_down"] forState:UIControlStateNormal];
            [object setImage:[UIImage imageNamed:@"icon_up"] forState:UIControlStateSelected];
            [object addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
            object;
       });
    }
    return _arrowButton;
}


@end
