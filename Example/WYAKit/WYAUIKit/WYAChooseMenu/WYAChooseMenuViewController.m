//
//  WYAChooseMenuViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/20.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAChooseMenuViewController.h"

@interface WYAChooseMenuViewController ()<WYAChooseMenuDelegate>
@property (nonatomic, strong) NSArray * titles;
@property (nonatomic, strong) NSArray * contents;
@property (nonatomic, strong) WYAChooseMenu * menu;
@end

@implementation WYAChooseMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass([self class]);
    
    
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray * content = [NSMutableArray arrayWithCapacity:0];
    self.menu = [[WYAChooseMenu alloc]initWithFrame:self.view.frame];
    for (NSString * string in self.titles) {
        WYAChooseMenuModel * model = [[WYAChooseMenuModel alloc]init];
        if ([string isEqualToString:@"A"]) {
            model.select = YES;
        }else{
            model.select = NO;
        }
        model.title = string;
        [array addObject:model];
    }
    self.menu.titleArray = array;
    for (NSString * string in self.contents[0]) {
        WYAChooseMenuSecondLevelModel * model = [[WYAChooseMenuSecondLevelModel alloc]init];
        model.title = string;
        [content addObject:model];
    }
    self.menu.contentArray = content;
    self.menu.wya_delegate = self;
    self.menu.leftTableProportion = 0.5;
    [self.view addSubview:self.menu];
}

#pragma mark --- WYAChooseMenuDelegate
-(void)wya_leftTableDidSelectedRow:(NSIndexPath *)indexPath{
    
    NSMutableArray * content = [NSMutableArray arrayWithCapacity:0];
    for (NSString * string in self.contents[indexPath.row]) {
        WYAChooseMenuSecondLevelModel * model = [[WYAChooseMenuSecondLevelModel alloc]init];
        model.title = string;
        model.enableCell = YES;
        [content addObject:model];
    }
    self.menu.contentArray = content;
    
}

-(NSArray *)titles{
    if (!_titles) {
        _titles = @[@"A",@"B",@"C",@"E",@"F",@"G"];
    }
    return _titles;
}

-(NSArray *)contents{
    if (!_contents) {
        _contents = @[@[@"A",@"B"],
                      @[@"B",@"B"],
                      @[@"C",@"B"],
                      @[@"E",@"B"],
                      @[@"F",@"B"],
                      @[@"G",@"B"]];
    }
    return _contents;
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
