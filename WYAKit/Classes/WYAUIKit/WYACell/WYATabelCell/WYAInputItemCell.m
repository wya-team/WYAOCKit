//
//  WYAInputItemCell.m
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/11/29.
//

#import "WYAInputItemCell.h"

@interface WYAInputItemCell()
/// 输入框
@property (nonatomic, strong) UITextField * inputTextFiled;
@end
@implementation WYAInputItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (UITextField *)inputTextFiled{
    if(!_inputTextFiled){
        _inputTextFiled = ({
            UITextField * object = [[UITextField alloc]init];
            object;
       });
    }
    return _inputTextFiled;
}
@end
