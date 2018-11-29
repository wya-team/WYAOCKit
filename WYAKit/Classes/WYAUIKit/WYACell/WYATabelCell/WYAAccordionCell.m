//
//  WYAAccordionCell.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/27.
//

#import "WYAAccordionCell.h"

@interface WYAAccordionCell ()<UITextFieldDelegate>

@property (nonatomic, strong) UIView * line;
@property (nonatomic, strong) UIView * titleContainerView;
@property (nonatomic, strong) UIView * textContainerView;

@end

@implementation WYAAccordionCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.titleContainerView];
        [self.contentView addSubview:self.textContainerView];
        
        [self.titleContainerView addSubview:self.titleTextField];
        [self.titleContainerView addSubview:self.downButton];
        [self.titleContainerView addSubview:self.line];
        
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.titleContainerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.contentView);
        make.height.mas_equalTo(44*SizeAdapter).priorityHigh();
    }];
    
    [self.downButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.titleContainerView.mas_right).with.offset(-16*SizeAdapter);
        make.centerY.mas_equalTo(self.titleContainerView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20*SizeAdapter, 20*SizeAdapter));
    }];

    [self.titleTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.titleContainerView.mas_centerY);
        make.left.mas_equalTo(self.titleContainerView.mas_left).with.offset(16*SizeAdapter);
        make.right.mas_equalTo(self.downButton.mas_left);
        make.top.bottom.mas_equalTo(self.titleContainerView);
    }];

    [self.line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.titleContainerView);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.textContainerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.titleContainerView.mas_bottom);
    }];
    
    [self.textContainerView.subviews wya_mas_distributeSpecialSudokuViewsWithFixedItemWidths:nil
                                                                            fixedItemHeights:self.viewHeights
                                                                            fixedLineSpacing:0
                                                                       fixedInteritemSpacing:0
                                                                                   warpCount:1
                                                                                  topSpacing:0
                                                                               bottomSpacing:0
                                                                                 leadSpacing:0
                                                                                 tailSpacing:0];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark --- Setter
-(void)setViews:(NSMutableArray <UIView *>*)views{
    _views = views;
    if (views) {
        for (UIView * view in views) {
            [self.textContainerView addSubview:view];
        }
    }else{
        for (UIView * view in self.textContainerView.subviews) {
            [view removeFromSuperview];
        }
    }
    [self layoutIfNeeded];
}

-(void)setViewHeights:(NSMutableArray *)viewHeights{
    _viewHeights = viewHeights;
    [self layoutIfNeeded];
}

#pragma mark --- Getter
- (UIView *)titleContainerView{
    if(!_titleContainerView){
        _titleContainerView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor whiteColor];
            object;
        });
    }
    return _titleContainerView;
}
- (UIView *)textContainerView{
    if(!_textContainerView){
        _textContainerView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor yellowColor];
            object;
        });
    }
    return _textContainerView;
}

-(UITextField *)titleTextField{
    if (!_titleTextField) {
        _titleTextField = ({
            UITextField * object = [[UITextField alloc]init];
            object.delegate = self;
            object.placeholder = @"aaa";
            object;
        });
    }
    return _titleTextField;
}

-(UIButton *)downButton{
    if (!_downButton) {
        _downButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_downButton setBackgroundColor:[UIColor redColor]];
        WeakSelf(weakSelf);
        [_downButton addCallBackAction:^(UIButton *button) {
            StrongSelf(strongSelf);
            if (strongSelf.buttonClick) {
                strongSelf.buttonClick(button);
            }
        }];
    }
    return _downButton;
}

-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = random(153, 153, 153, 1);
    }
    return _line;
}

#pragma mark --- Public Method
+(CGFloat)wya_cellHeight{
//    WYAAccordionCell * cell = [[WYAAccordionCell alloc]init];
//    [cell layoutIfNeeded];
//
//    return cell.textContainerView.cmam_bottom;
    return 64;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





@end
