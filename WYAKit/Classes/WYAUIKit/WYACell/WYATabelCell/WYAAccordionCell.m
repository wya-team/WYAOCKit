//
//  WYAAccordionCell.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/27.
//

#import "WYAAccordionCell.h"

@interface WYAAccordionCell ()
@property (nonatomic, strong) UITextField * titleTextField;
@property (nonatomic, strong) UIButton * downButton;
@property (nonatomic, strong) UIView * line;
@property (nonatomic, strong) UIView * titleContainerView;
@property (nonatomic, strong) UIView * textContainerView;
@end

@implementation WYAAccordionCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleTextField = [[UITextField alloc]init];
        self.titleTextField.delegate = self;
        [self.contentView addSubview:self.titleTextField];
        
        self.downButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.downButton setBackgroundColor:[UIColor redColor]];
        [self.downButton addCallBackAction:^(UIButton *button) {
            
        }];
        
        self.line = [[UIView alloc]init];
        self.line.backgroundColor = random(153, 153, 153, 1);
        [self.contentView addSubview:self.line];
        
        self.titleContainerView = [[UIView alloc]init];
        self.titleContainerView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleContainerView];
        
        self.textContainerView = [[UIView alloc]init];
        self.textContainerView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.textContainerView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.titleContainerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.contentView);
        make.height.mas_equalTo(44*SizeAdapter);
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
                                                                            fixedItemHeights:@[@(2)]
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
