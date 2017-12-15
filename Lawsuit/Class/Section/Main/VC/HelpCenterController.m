//
//  HelpCenterController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/13.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "HelpCenterController.h"
#import "HelpDetailController.h"

@interface HelpCenterController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSArray* listArray;
@end

@implementation HelpCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"帮助中心";
    
}
-(void)setUI{
    
    self.listArray = @[@"平台介绍",@"申请调解",@"调解进展",@"关联案件",@"质证调解"];
    [self.view addSubview:self.tableView];
}
#pragma mark cell数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}
#pragma mark cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* iden = @"iden";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:iden];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSString* str = self.listArray[indexPath.row];
    cell.textLabel.text = str;
    cell.detailTextLabel.text = @"10-09 14:15";
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* str = self.listArray[indexPath.row];
    HelpDetailController* helpDetailVC = [[HelpDetailController alloc] init];
    helpDetailVC.title = str;
    [self.navigationController pushViewController:helpDetailVC animated:YES];
}

#pragma mark 懒加载 tableView
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kStatusHeight+44, kScreenWidth, kScreenHeight-kStatusHeight-44) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

@end
