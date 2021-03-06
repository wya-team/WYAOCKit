//
//  WYAAudioViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/2/28.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYAAudioViewController.h"
#import "WYAAudioSettingViewController.h"
@interface WYAAudioViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) WYAAudioRecoder * audioManager;
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataSources;
@property (nonatomic, assign) CGFloat sound;
@property (nonatomic, assign) CGFloat speed;
@property (nonatomic, assign) NSInteger numLoop;
@end

@implementation WYAAudioViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configUI];
}

- (void)configUI
{
    UIButton * object = [[UIButton alloc] initWithFrame:CGRectMake(0, WYATopHeight + 20, ScreenWidth / 3, 50)];
    [object setTitle:@"录音WAV格式" forState:UIControlStateNormal];
    [object setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [object setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [object setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor grayColor]] forState:UIControlStateSelected];
    object.titleLabel.font = [UIFont systemFontOfSize:15];
    [object addCallBackAction:^(UIButton * button) {
        NSString * nowDate = [NSDate wya_getNowTimeTimes];
        NSString * string  = [[NSString wya_docPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.wav", nowDate]];
        NSError * error;
        BOOL isSuccess = [self.audioManager wya_startRecorderWithUrl:[NSURL fileURLWithPath:string] error:error];
        if (isSuccess) {
            [self.dataSources addObject:nowDate];
        }
        NSLog(@"error==%@", [error localizedDescription]);
        NSLog(@"isSuccess==%d", isSuccess);
    }];
    [self.view addSubview:object];

    UIButton * object1 = [[UIButton alloc] initWithFrame:CGRectMake(object.cmam_right, WYATopHeight + 20, ScreenWidth / 3, 50)];
    [object1 setTitle:@"暂停录音" forState:UIControlStateNormal];
    [object1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    object1.titleLabel.font = [UIFont systemFontOfSize:15];
    [object1 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [object1 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor grayColor]] forState:UIControlStateSelected];
    [object1 addCallBackAction:^(UIButton * button) {
        [self.audioManager wya_pauseRecorder];
    }];
    [self.view addSubview:object1];

    UIButton * object2 = [[UIButton alloc] initWithFrame:CGRectMake(object1.cmam_right, WYATopHeight + 20, ScreenWidth / 3, 50)];
    [object2 setTitle:@"停止录音" forState:UIControlStateNormal];
    [object2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    object2.titleLabel.font = [UIFont systemFontOfSize:15];
    [object2 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [object2 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor grayColor]] forState:UIControlStateSelected];
    [object2 addCallBackAction:^(UIButton * button) {
        [self.audioManager wya_stopRecorder];
        [self.tableView reloadData];
    }];
    [self.view addSubview:object2];

    //    UIButton * object3 = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth - 200) / 2, CGRectGetMaxY(object2.frame) + 20, 200, 50)];
    //    [object3 setTitle:@"开始播放" forState:UIControlStateNormal];
    //    [object3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //    object3.titleLabel.font = [UIFont systemFontOfSize:15];
    //    [object3 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    //    [object3 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor grayColor]] forState:UIControlStateSelected];
    //    [object3 addCallBackAction:^(UIButton * button) {
    //        NSString * string = [[NSString wya_docPath] stringByAppendingPathComponent:@"test.wav"];
    //        NSError * error;
    //        [self.audioManager wya_startPlayAudioWithUrl:[NSURL fileURLWithPath:string] volume:0.9 numberOfLoops:1 currentTime:0 error:error];
    //    }];
    //    [self.view addSubview:object3];
    //
    //    UIButton * object4 = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth - 200) / 2, CGRectGetMaxY(object3.frame) + 20, 200, 50)];
    //    [object4 setTitle:@"停止播放" forState:UIControlStateNormal];
    //    [object4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //    object4.titleLabel.font = [UIFont systemFontOfSize:15];
    //    [object4 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    //    [object4 setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor grayColor]] forState:UIControlStateSelected];
    //    [object4 addCallBackAction:^(UIButton * button) {
    //        [self.audioManager wya_stopPlayAudio];
    //    }];
    //    [self.view addSubview:object4];

    [self wya_addRightNavBarButtonWithNormalImage:@[@"setting"] highlightedImg:@[@""]];
    [self.view addSubview:self.tableView];
}

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    WeakSelf(weakSelf);
    WYAAudioSettingViewController * setting = [[WYAAudioSettingViewController alloc] init];
    setting.infoCallback = ^(NSString * _Nonnull sound, NSString * _Nonnull speed, NSString * _Nonnull numberLoop) {
        weakSelf.sound = [sound floatValue];
        weakSelf.speed = [speed floatValue];
        weakSelf.numLoop = [numberLoop integerValue];
    };
    [self.navigationController pushViewController:setting animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    UITableViewCell * cell       = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"播放" forState:UIControlStateNormal];
    [button setTitle:@"暂停" forState:UIControlStateSelected];
    button.titleLabel.font = FONT(15);
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    button.frame = CGRectMake(0, 0, 50, 40);
    [button addCallBackAction:^(UIButton * button) {
        button.selected = !button.selected;
        if (button.selected) {
            NSError * error;
            NSString * string = [[NSString wya_docPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.wav", self.dataSources[indexPath.row]]];
            [self.audioManager wya_startPlayAudioWithUrl:[NSURL fileURLWithPath:string] volume:self.sound speed:self.speed > 0 ? self.speed-1 : 0 numberOfLoops:self.numLoop currentTime:0 error:error];
            NSLog(@"error==%@", [error localizedDescription]);
        } else {
            [self.audioManager wya_stopPlayAudio];
        }
    }];
    cell.accessoryView  = button;
    cell.textLabel.text = self.dataSources[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (WYAAudioRecoder *)audioManager
{
    if (!_audioManager) {
        _audioManager = [WYAAudioRecoder sharedManager];
    }
    return _audioManager;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = ({
            UITableView * object = [[UITableView alloc] initWithFrame:CGRectMake(0, WYATopHeight + 90, ScreenWidth, ScreenHeight - WYATopHeight + 90) style:UITableViewStylePlain];
            object.delegate      = self;
            object.dataSource    = self;
            object;
        });
    }
    return _tableView;
}

- (NSMutableArray *)dataSources
{
    if (!_dataSources) {
        _dataSources = ({
            NSMutableArray * object = [[NSMutableArray alloc] init];
            object;
        });
    }
    return _dataSources;
}
@end
