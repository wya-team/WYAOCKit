#  WYANumberKeyboard

## 功能

- 实现类似支付宝数字键盘样式，可自由选择是否随机数键盘，给出两种初始化方法，分别返回两种不同的键盘。

## 属性

属性 | 说明 | 类型 | 默认值
--- | --- | --- | ---
bgColor | 键盘背景色 | UIColor | whiteColor
spaceNum | 由于输入的值紧贴着输入框左侧，不是很美观。光标位置由空格控制，该属性是空格数量 | NSInteger | 2


## 方法

```objective-c
/**
 必须用此方法初始化

 @param textFiled 传入一个textFiled
 @return 返回一个键盘对象 (高度为200 + 底部安全区域（0/34）的键盘)
 */
+ (instancetype)initWithTextFiled:(UITextField *)textFiled;

/**
 随机键盘必须用此方法初始化

 @param textFiled 传入一个textFiled
 @return 返回一个随机数字键盘对象 (高度为200 + 底部安全区域（0/34）的键盘)
 */
+(instancetype)initRandomKeyboardWithTextFiled:(UITextField *)textFiled;

/**
 输入框value改变的事件回调

 @param numberKeyboardChangeValue numberKeyboardChangeValue
 */
- (void)wya_numberKeyboadrDidChanged:(void(^)(NSString * value))numberKeyboardChangeValue;

/**
 确定按钮点击事件

 @param sureButtonBlock sureButtonBlock
 */
- (void)wya_numberKeyboadrSurePressed:(void (^)(void))sureButtonBlock;

```

## 基本用法

```objective-c
#import "WYANumberKeyBoardController.h"
#import <WYAKit/WYANumberKeyboard.h>

@interface WYANumberKeyBoardController ()
@property (nonatomic, strong) UITextField * textField1;
@property (nonatomic, strong) UITextField * textField2;
@property (nonatomic, strong) WYANumberKeyboard * randomKeyboard;
@property (nonatomic, strong) WYANumberKeyboard * numKeyboard;
@end

@implementation WYANumberKeyBoardController

- (void)viewDidLoad {
    [super viewDidLoad];
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

```

