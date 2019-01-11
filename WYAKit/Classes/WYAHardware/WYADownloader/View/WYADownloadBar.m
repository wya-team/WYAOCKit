//
//  WYADownloadBar.m
//  WYAKit
//
//  Created by 李世航 on 2019/1/10.
//

#import "WYADownloadBar.h"

@interface WYADownloadBar ()
@property (nonatomic, strong) UIButton * selectButton;
@property (nonatomic, strong) UIButton * deleteButton;
@property (nonatomic, strong) UIView * line;
@end

@implementation WYADownloadBar

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.selectButton];
        [self addSubview:self.line];
        [self addSubview:self.deleteButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat selectButton_X      = 0;
    CGFloat selectButton_Y      = 0;
    CGFloat selectButton_Width  = (self.cmam_width - 1) / 2;
    CGFloat selectButton_Height = self.cmam_height;
    self.selectButton.frame =
        CGRectMake(selectButton_X, selectButton_Y, selectButton_Width, selectButton_Height);

    CGFloat line_X      = CGRectGetMaxX(self.selectButton.frame);
    CGFloat line_Y      = self.cmam_height * 0.2;
    CGFloat line_Width  = 1;
    CGFloat line_Height = self.cmam_height * 0.6;
    self.line.frame     = CGRectMake(line_X, line_Y, line_Width, line_Height);

    CGFloat deleteButton_X      = CGRectGetMaxX(self.line.frame);
    CGFloat deleteButton_Y      = 0;
    CGFloat deleteButton_Width  = (self.cmam_width - 1) / 2;
    CGFloat deleteButton_Height = self.cmam_height;
    self.deleteButton.frame =
        CGRectMake(deleteButton_X, deleteButton_Y, deleteButton_Width, deleteButton_Height);
}

- (void)setArrayCount:(NSUInteger)arrayCount {
    if (arrayCount > 0) {
        [self.deleteButton setTitle:[NSString stringWithFormat:@"删除(%d)", arrayCount]
                           forState:UIControlStateNormal];
        self.selectButton.enabled = YES;
    } else if (arrayCount == 0) {
        [self.deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        self.selectButton.enabled = NO;
    }
}

- (void)setAllSelect:(BOOL)allSelect {
    self.selectButton.selected = allSelect;
}

#pragma mark - Getter -
- (UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = ({
            UIButton * object = [[UIButton alloc] init];
            [object setTitle:@"全选" forState:UIControlStateNormal];
            [object setTitle:@"取消全选" forState:UIControlStateSelected];
            [object setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            object.titleLabel.font = FONT(15);
            WeakSelf(weakSelf);
            [object addCallBackAction:^(UIButton * button) {
                button.selected = !button.selected;
                if (weakSelf.selectCallback) { weakSelf.selectCallback(weakSelf, button.selected); }
            }];
            object;
        });
    }
    return _selectButton;
}

- (UIButton *)deleteButton {
    if (!_deleteButton) {
        _deleteButton = ({
            UIButton * object = [[UIButton alloc] init];
            [object setTitle:@"删除" forState:UIControlStateNormal];
            [object setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            object.titleLabel.font = FONT(15);
            WeakSelf(weakSelf);
            [object addCallBackAction:^(UIButton * button) {
                if (weakSelf.deleteCallback) { weakSelf.deleteCallback(weakSelf); }
            }];
            object;
        });
    }
    return _deleteButton;
}

- (UIView *)line {
    if (!_line) {
        _line = ({
            UIView * object        = [[UIView alloc] init];
            object.backgroundColor = random(153, 153, 153, 1);
            object;
        });
    }
    return _line;
}
@end
