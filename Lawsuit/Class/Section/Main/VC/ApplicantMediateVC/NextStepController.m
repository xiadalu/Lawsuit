//
//  NextStepController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/30.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "NextStepController.h"
#import "DashesTextField.h"
#import "NextStepCell.h"
@interface NextStepController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;


@end

@implementation NextStepController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"申请调解";
}

-(void)setUI{
    [self.view addSubview:self.tableView];
}

-(NextStepCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* iden = @"iden";
    NextStepCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[NextStepCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200.0f;
}
#pragma mark --------------------懒加载-----------------------
#pragma mark 懒加载tableView
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kStatusHeight+44, kScreenWidth, kScreenHeight-kStatusHeight-44) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
