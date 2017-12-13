//
//  RightController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/8.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "RightController.h"
#import "RightCell.h"
#import "RightModel.h"

@interface RightController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;


@property(nonatomic,strong)NSMutableArray* listArray;
@end

@implementation RightController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    [self loadData];
}
-(void)loadData{
    for (int i = 0; i<10; i++) {
        NSDictionary* dic = @{@"title":@"李明和萧红的交通事故纠纷案",@"intro":@"但是想要达到你设计的那样比较费事",@"time":@"14: 15"};
        RightModel* model = [RightModel yy_modelWithJSON:dic];
        [self.listArray addObject:model];
    }
    
   
}
-(void)setUI{
    [self.view addSubview:self.tableView];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* iden = @"iden";
    RightCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell==nil) {
        cell = [[RightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    RightModel* model = self.listArray[indexPath.row];
    cell.model = model;
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
#pragma mark tableview
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kStatusHeight+44, kScreenWidth, kScreenHeight-kStatusHeight-44) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
       
    }
    return _tableView;
}

-(NSMutableArray*)listArray{
    if (!_listArray) {
        _listArray = [[NSMutableArray alloc] init];
    }
    return _listArray;
}

@end
