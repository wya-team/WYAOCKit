//
//  WYAAudioViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/2/28.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYAAudioViewController.h"

@interface WYAAudioViewController ()

@property(nonatomic, strong) WYAAudioRecoder * audioManager;

@end

@implementation WYAAudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configUI];
}

- (void)configUI{

    UIButton *  object = [[UIButton alloc]initWithFrame:CGRectMake( (ScreenWidth-200)/2, 100, 200, 50)];
    [object setTitle:@"录音WAV格式" forState:UIControlStateNormal];
    [object setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [object setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [object setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor grayColor]] forState:UIControlStateSelected];
    object.titleLabel.font = [UIFont systemFontOfSize:15];
    [object addCallBackAction:^(UIButton *button) {
        NSString * string = [[NSString wya_docPath] stringByAppendingPathComponent:@"test.wav"];
        NSError * error;
        BOOL isSuccess = [self.audioManager wya_startRecorderWithUrl:[NSURL fileURLWithPath:string] error:error];
        NSLog(@"error==%@",[error localizedDescription]);
        NSLog(@"isSuccess==%d",isSuccess);
    }];
    [self.view addSubview:object];

    UIButton *  object1 = [[UIButton alloc]initWithFrame:CGRectMake( (ScreenWidth-200)/2, CGRectGetMaxY(object.frame)+20, 200, 50)];
    [object1 setTitle:@"暂停录音" forState:UIControlStateNormal];
    [object1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    object1.titleLabel.font = [UIFont systemFontOfSize:15];
    [object1 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [object1 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor grayColor]] forState:UIControlStateSelected];
    [object1 addCallBackAction:^(UIButton *button) {
        [self.audioManager wya_pauseRecorder];
    }];
    [self.view addSubview:object1];

    UIButton *  object2 = [[UIButton alloc]initWithFrame:CGRectMake( (ScreenWidth-200)/2, CGRectGetMaxY(object1.frame)+20, 200, 50)];
    [object2 setTitle:@"停止录音" forState:UIControlStateNormal];
    [object2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    object2.titleLabel.font = [UIFont systemFontOfSize:15];
    [object2 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [object2 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor grayColor]] forState:UIControlStateSelected];
    [object2 addCallBackAction:^(UIButton *button) {
        [self.audioManager wya_stopRecorder];
    }];
    [self.view addSubview:object2];

    UIButton *  object3 = [[UIButton alloc]initWithFrame:CGRectMake( (ScreenWidth-200)/2, CGRectGetMaxY(object2.frame)+20, 200, 50)];
    [object3 setTitle:@"开始播放" forState:UIControlStateNormal];
    [object3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    object3.titleLabel.font = [UIFont systemFontOfSize:15];
    [object3 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [object3 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor grayColor]] forState:UIControlStateSelected];
    [object3 addCallBackAction:^(UIButton *button) {
        NSString * string = [[NSString wya_docPath] stringByAppendingPathComponent:@"test.wav"];
        NSError * error;
        [self.audioManager wya_startPlayAudioWithUrl:[NSURL fileURLWithPath:string] volume:0.9 numberOfLoops:1 currentTime:0 error:error];
    }];
    [self.view addSubview:object3];

    UIButton *  object4 = [[UIButton alloc]initWithFrame:CGRectMake( (ScreenWidth-200)/2, CGRectGetMaxY(object3.frame)+20, 200, 50)];
    [object4 setTitle:@"停止播放" forState:UIControlStateNormal];
    [object4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    object4.titleLabel.font = [UIFont systemFontOfSize:15];
    [object4 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [object4 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor grayColor]] forState:UIControlStateSelected];
    [object4 addCallBackAction:^(UIButton *button) {
        [self.audioManager wya_stopPlayAudio];
    }];
    [self.view addSubview:object4];
}

-(WYAAudioRecoder *)audioManager{
    if (!_audioManager) {
        _audioManager = [WYAAudioRecoder sharedManager];
    }
    return _audioManager;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
