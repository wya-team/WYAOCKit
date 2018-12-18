//
//  WYAChooseMenuViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/20.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAChooseMenuViewController.h"

@interface WYAChooseMenuViewController ()<WYAChooseMenuDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray <WYAChooseMenuModel *>* titles;
@property (nonatomic, strong) WYAChooseMenu * menu;
@property (nonatomic, strong) WYAChooseMenu * otherMenu;
@end

@implementation WYAChooseMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navTitle = @"WYAChooseMenu";
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource  -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = randomColor;
    return cell;
}

#pragma mark - UITableViewDelegate  -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10*SizeAdapter, 0, view.cmam_width-20*SizeAdapter, 44)];
    if (section == 0) {
        label.text = @"双table菜单";
    }else{
        label.text = @"table和Collection结合菜单";
    }
    label.textColor = random(51, 51, 51, 1);
    label.font = FONT(15);

    [view addSubview:label];
    return view;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc]init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        self.menu = [[WYAChooseMenu alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, (ScreenHeight-WYATopHeight)/2-5*SizeAdapter) ChooseMenuStyle:WYAChooseMenuStyleTable];
        self.menu.titleArray = self.titles;
        self.menu.wya_delegate = self;
        self.menu.leftTableProportion = 0.5;
        WYAAlertController * alertController = [WYAAlertController wya_AlertWithCustomView:self.menu AlertStyle:WYAAlertStyleCustomAlert];
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        self.otherMenu = [[WYAChooseMenu alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, (ScreenHeight-WYATopHeight)/2-5*SizeAdapter) ChooseMenuStyle:WYAChooseMenuStyleTableAndCollection];
        self.otherMenu.titleArray = self.titles;
        self.otherMenu.wya_delegate = self;
        self.otherMenu.leftTableProportion = 0.5;
        WYAAlertController * alertController = [WYAAlertController wya_AlertWithCustomView:self.otherMenu AlertStyle:WYAAlertStyleCustomAlert];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark --- WYAChooseMenuDelegate
-(void)wya_leftTableDidSelectedRow:(NSIndexPath *)indexPath{
    
}

- (void)wya_rightViewDidSelectedItem:(NSIndexPath *)indexPath{
    NSLog(@"section==%d,item==%d",indexPath.section,indexPath.row);
}

-(NSArray <WYAChooseMenuModel *>*)titles{
    if (!_titles) {
        WYAChooseMenuSecondLevelModel * item1 = [[WYAChooseMenuSecondLevelModel alloc]init];
        item1.title = @"All Foods";
        item1.enableCell = NO;
        item1.select = YES;
        
        WYAChooseMenuSecondLevelModel * item2 = [[WYAChooseMenuSecondLevelModel alloc]init];
        item2.title = @"Chinese Foods";
        item2.enableCell = NO;
        item2.select = NO;
        
        WYAChooseMenuSecondLevelModel * item3 = [[WYAChooseMenuSecondLevelModel alloc]init];
        item3.title = @"Hot Pot";
        item3.enableCell = NO;
        item3.select = NO;
        
        WYAChooseMenuSecondLevelModel * item4 = [[WYAChooseMenuSecondLevelModel alloc]init];
        item4.title = @"Buffet";
        item4.enableCell = NO;
        item4.select = NO;
        
        WYAChooseMenuSecondLevelModel * item5 = [[WYAChooseMenuSecondLevelModel alloc]init];
        item5.title = @"Fast Food";
        item5.enableCell = NO;
        item5.select = NO;
        
        WYAChooseMenuModel * model1 = [[WYAChooseMenuModel alloc]init];
        model1.select = YES;
        model1.title = @"Food";
        model1.secondLevelModels = @[item1, item2, item3, item4, item5];
        
        WYAChooseMenuSecondLevelModel * item6 = [[WYAChooseMenuSecondLevelModel alloc]init];
        item6.title = @"All SuperMarket";
        item6.enableCell = NO;
        item6.select = YES;
        
        WYAChooseMenuModel * model2 = [[WYAChooseMenuModel alloc]init];
        model2.select = NO;
        model2.title = @"SuperMarket";
        model2.secondLevelModels = @[item6];
        
        _titles = @[model1, model2];
    }
    return _titles;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (UITableView *)tableView{
    if(!_tableView){
        _tableView = ({
            UITableView * object = [[UITableView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight-WYATopHeight-WYABottomHeight) style:UITableViewStyleGrouped];
            object.delegate = self;
            object.dataSource = self;
            [object registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
            object;
       });
    }
    return _tableView;
}
@end
