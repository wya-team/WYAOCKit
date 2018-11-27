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

@end

@implementation WYAAccordionCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
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
