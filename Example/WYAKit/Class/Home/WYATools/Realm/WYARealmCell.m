//
//  WYARealmCell.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/5.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYARealmCell.h"

@interface WYARealmCell ()
@property (nonatomic, strong) UILabel * name;
@property (nonatomic, strong) UILabel * age;
@property (nonatomic, strong) UILabel * height;
@property (nonatomic, strong) UILabel * weight;
@property (nonatomic, strong) UILabel * score;
@property (nonatomic, strong) UILabel * grade;
@property (nonatomic, strong) UILabel * studentId;
@end

@implementation WYARealmCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.name];
        [self addSubview:self.age];
        [self addSubview:self.height];
        [self addSubview:self.weight];
        [self addSubview:self.score];
        [self addSubview:self.grade];
        [self addSubview:self.studentId];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat margin = 0 * SizeAdapter;
    CGFloat width  = (ScreenWidth) / 7;
    CGFloat height = 44;

    [self.name mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.mas_left).offset(margin);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(width, height));
    }];

    [self.age mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.name.mas_right).offset(margin);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(width, height));
    }];

    [self.height mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.age.mas_right).offset(margin);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(width, height));
    }];

    [self.weight mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.height.mas_right).offset(margin);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(width, height));
    }];

    [self.score mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.weight.mas_right).offset(margin);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(width, height));
    }];

    [self.grade mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.score.mas_right).offset(margin);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(width, height));
    }];

    [self.studentId mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.equalTo(self.grade.mas_right).offset(margin);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(width, height));
    }];
}
#pragma mark ======= setter
- (void)setModel:(Student *)model
{
    if (model) {
        _model           = model;
        self.name.text   = model.name;
        self.age.text    = [NSString stringWithFormat:@"%d", model.age];
        self.height.text = [NSString stringWithFormat:@"%.2f", model.height];
        self.weight.text = [NSString stringWithFormat:@"%.2f", model.weight];

        self.score.text = [NSString stringWithFormat:@"%.2f", model.score];

        self.grade.text = model.grade;

        self.studentId.text = model.studentId;
    }
}
#pragma mark ======= getter
- (UILabel *)name
{
    if (!_name) {
        _name = ({
            UILabel * object     = [[UILabel alloc] init];
            object.textColor     = [UIColor grayColor];
            object.numberOfLines = 0;
            object.font          = FONT(12);
            object.textAlignment = NSTextAlignmentCenter;

            object;
        });
    }
    return _name;
}

- (UILabel *)age
{
    if (!_age) {
        _age = ({
            UILabel * object     = [[UILabel alloc] init];
            object.numberOfLines = 0;
            object.textColor     = [UIColor grayColor];
            object.font          = FONT(12);
            object.textAlignment = NSTextAlignmentCenter;

            object;
        });
    }
    return _age;
}

- (UILabel *)height
{
    if (!_height) {
        _height = ({
            UILabel * object     = [[UILabel alloc] init];
            object.numberOfLines = 0;
            object.textColor     = [UIColor grayColor];
            object.font          = FONT(12);
            object.textAlignment = NSTextAlignmentCenter;

            object;
        });
    }
    return _height;
}

- (UILabel *)weight
{
    if (!_weight) {
        _weight = ({
            UILabel * object     = [[UILabel alloc] init];
            object.numberOfLines = 0;
            object.textColor     = [UIColor grayColor];
            object.font          = FONT(12);
            object.textAlignment = NSTextAlignmentCenter;

            object;
        });
    }
    return _weight;
}

- (UILabel *)score
{
    if (!_score) {
        _score = ({
            UILabel * object     = [[UILabel alloc] init];
            object.numberOfLines = 0;
            object.textColor     = [UIColor grayColor];
            object.font          = FONT(12);
            object.textAlignment = NSTextAlignmentCenter;

            object;
        });
    }
    return _score;
}

- (UILabel *)grade
{
    if (!_grade) {
        _grade = ({
            UILabel * object                 = [[UILabel alloc] init];
            object.numberOfLines             = 0;
            object.textColor                 = [UIColor grayColor];
            object.font                      = FONT(12);
            object.textAlignment             = NSTextAlignmentCenter;
            object.adjustsFontSizeToFitWidth = YES;
            object;
        });
    }
    return _grade;
}

- (UILabel *)studentId
{
    if (!_studentId) {
        _studentId = ({
            UILabel * object     = [[UILabel alloc] init];
            object.numberOfLines = 0;
            object.textColor     = [UIColor grayColor];
            object.font          = FONT(12);
            object.textAlignment = NSTextAlignmentCenter;
            object;
        });
    }
    return _studentId;
}
@end
