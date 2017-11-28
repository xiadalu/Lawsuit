//
//  BaseSubCaseController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/27.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "BaseSubCaseController.h"
#import "BaseSubCaseModel.h"
#import "BaseSubCaseCell.h"

@interface BaseSubCaseController ()

@end

@implementation BaseSubCaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self.view addSubview:self.tableView];
}
-(void)loadData{
    for (int i = 0 ; i < 10; i++) {
        NSDictionary* dic = @{@"title":@"张三与李四的交通事故纠纷",
                              @"state":@"01",
                              @"time":@"2016-04-12 10:20",
                              };
        BaseSubCaseModel* model = [BaseSubCaseModel yy_modelWithJSON:dic];
        NSLog(@"[%@]",model);
        [self.listArray addObject:model];
    }
}
#pragma mark ----------------delegate/dataSource------------------
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* iden = @"iden";
    BaseSubCaseCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
    
    if (!cell) {
        cell = [[BaseSubCaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        
    }
    BaseSubCaseModel* model = self.listArray[indexPath.row];
    cell.model = model;
    
    return cell;
    
}

#pragma mark cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 140.0f;
}
#pragma mark cell数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark --------------------懒加载-----------------------
#pragma mark 懒加载tableView
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kStatusHeight-44-44) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
-(NSMutableArray*)listArray{
    if (!_listArray) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}

@end
