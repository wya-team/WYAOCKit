//
//  WYANumberKeyBoardController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/21.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYANumberKeyBoardController.h"

@interface WYANumberKeyBoardController ()
@property (nonatomic, strong) UITextField * textField1;
@property (nonatomic, strong) UITextField * textField2;
@property (nonatomic, strong) WYANumberKeyboard * randomKeyboard;
@property (nonatomic, strong) WYANumberKeyboard * numKeyboard;
@end

@implementation WYANumberKeyBoardController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
    vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/WYANumberKeyboard/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self wya_addRightNavBarButtonWithNormalImage:@[@"icon_help"] highlightedImg:@[]];
    [self.view addSubview:self.textField1];
    [self.view addSubview:self.textField2];

    [self.randomKeyboard wya_numberKeyboadrDidChanged:^(NSString * _Nonnull value) {
    // 值发生改变的回调
        
    }];
    
    [self.randomKeyboard wya_numberKeyboadrSurePressed:^{
       // 点击确定按钮回调
        
    }];
    
    [self.numKeyboard wya_numberKeyboadrDidChanged:^(NSString * _Nonnull value) {
        // 值发生改变的回调

    }];
    [self.numKeyboard wya_numberKeyboadrSurePressed:^{
        // 点击确定按钮回调

    }];
    // Do any additional setup after loading the view.
}

- (UITextField *)textField2{
    if(!_textField2){
        _textField2 = ({
            UITextField * object = [[UITextField alloc]initWithFrame:CGRectMake(20*SizeAdapter, WYATopHeight + 20*SizeAdapter, ScreenWidth - 40*SizeAdapter, 44*SizeAdapter)];
            object.placeholder = @"  点击弹出随机数字键盘";
            object.layer.cornerRadius = 8*SizeAdapter;
            object.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
            object.layer.borderWidth = 0.5;
            object.layer.masksToBounds = YES;
            object.backgroundColor = WHITECOLOR;
            object;
       });
    }
    return _textField2;
}

- (UITextField *)textField1{
    if(!_textField1){
        _textField1 = ({
            UITextField * object = [[UITextField alloc]initWithFrame:CGRectMake(20*SizeAdapter, CGRectGetMaxY(self.textField2.frame)+20*SizeAdapter, ScreenWidth - 40*SizeAdapter, 44*SizeAdapter)];
            object.placeholder = @"  点击弹出数字键盘";
            object.layer.cornerRadius = 8*SizeAdapter;
            object.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
            object.layer.borderWidth = 0.5;
            object.layer.masksToBounds = YES;
            object.backgroundColor = WHITECOLOR;
            object;
       });
    }
    return _textField1;
}

- (WYANumberKeyboard *)randomKeyboard{
    if(!_randomKeyboard){
        _randomKeyboard = ({
            WYANumberKeyboard * object = [WYANumberKeyboard initRandomKeyboardWithTextFiled:self.textField2];
            object;
       });
    }
    return _randomKeyboard;
}

- (WYANumberKeyboard *)numKeyboard{
    if(!_numKeyboard){
        _numKeyboard = ({
            WYANumberKeyboard * object = [WYANumberKeyboard initWithTextFiled:self.textField1];
            object;
       });
    }
    return _numKeyboard;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textField1 resignFirstResponder];
    [self.textField2 resignFirstResponder];

}
@end
