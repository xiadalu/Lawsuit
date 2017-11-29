//
//  ApplicantMediateController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/28.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "ApplicantMediateController.h"
#import "JXPopoverView.h"

#import "SectionView.h"
#import "ApplicantTextViewCell.h"

#define NextBtnH   50

@interface ApplicantMediateController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSMutableArray* listArray;
@property(nonatomic,strong)UIButton* nextBtn;

@end

@implementation ApplicantMediateController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"申请调解";

    [self loadData];
    
}
-(void)loadData{
    for (int i = 0; i<2; i++) {
        [self.listArray addObject:@"我们都是好孩子"];
    }
}
-(void)setUI{

    
//    SectionView* sView = [[SectionView alloc] initWithFrame:CGRectMake(0, 200, kScreenWidth, 50) labelText:@"描述纠纷" buttonText:@"请选择"];
//    [self.view addSubview:sView];

    
    [self.view addSubview:self.tableView];

    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextBtn.frame = CGRectMake(0, kScreenHeight-NextBtnH, kScreenWidth, NextBtnH);
    self.nextBtn.backgroundColor = [UIColor lightGrayColor];
    [self.nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.nextBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextBtn];
    
   
}
#pragma mark ------------------delegate/dataSource--------------------
#pragma mark cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==3) {
        static NSString* iden = @"iden2";
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        }
        cell.textLabel.text = self.listArray[indexPath.row];
        return cell;
    }
    
    static NSString* iden = @"iden";
    ApplicantTextViewCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[ApplicantTextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    NSString* str = self.listArray[indexPath.row];
    cell.textView.text = str;
    return cell;
    
    
   
}
#pragma mark cell数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    if (section==1) {
        return 1;
    }
    if (section==2) {
        return 1;
    }
    if (section==3) {
        return self.listArray.count;
    }
    return 0;
}
#pragma mark section数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
#pragma mark section的view
#pragma mark 需要优化，多次加载SectionView
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        SectionView* sView = [[SectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60) labelText:@"描述纠纷" buttonText:@"请选择>"];
        return sView;
    }
    if (section==1) {
        SectionView* sView = [[SectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60) labelText:@"诉讼请求" buttonText:@"请选择>"];
        return sView;
    }
    if (section==2) {
        SectionView* sView = [[SectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60) labelText:@"事实与理由" buttonText:@"请选择>"];
        return sView;
    }
    if (section==3) {
        SectionView* sView = [[SectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60) labelText:@"提交证据" buttonText:@"请选择>"];
        return sView;
    }
    return [[UIView alloc] init];
    
}
#pragma mark   section header 高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60.0f;
}
#pragma mark cell高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 0;
    }
    if (indexPath.section==1||indexPath.section==2) {
        return 150;
    }
    if (indexPath.section==3) {
        return 44;
    }
    return 44.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10.0f;
}
#pragma mark cell选中
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)btnClick:(UIButton*)btn{
    
    JXPopoverView* popoverView = [JXPopoverView popoverView];
    popoverView.showShade = YES;
    
    JXPopoverAction* action0 = [JXPopoverAction actionWithTitle:@"婚姻家庭" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"婚姻家庭" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action1 = [JXPopoverAction actionWithTitle:@"债权债务" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"债权债务" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action2 = [JXPopoverAction actionWithTitle:@"合同纠纷" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"合同纠纷" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action3 = [JXPopoverAction actionWithTitle:@"劳务纠纷" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"劳务纠纷" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action4 = [JXPopoverAction actionWithTitle:@"恶意伤害" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"恶意伤害" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action5 = [JXPopoverAction actionWithTitle:@"房产纠纷" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"房产纠纷" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action6 = [JXPopoverAction actionWithTitle:@"交通事故" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"交通事故" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action7 = [JXPopoverAction actionWithTitle:@"其它" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"其它" forState:UIControlStateNormal];
    }];
    [popoverView showToView:btn withActions:@[action0,action1,action2,action3,action4,action5,action6,action7]];
}

#pragma mark --------------------懒加载-----------------------
#pragma mark 懒加载tableView
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kStatusHeight+44, kScreenWidth, kScreenHeight-(kStatusHeight+44+NextBtnH)) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //tableHeaderView
        UIView* view = [[UIView alloc] init];
        view.bounds = CGRectMake(0, 0, kScreenWidth, 40);
        view.backgroundColor = [UIColor redColor];
        _tableView.tableHeaderView = view;
    }
    return _tableView;
}
-(NSMutableArray*)listArray{
    if (!_listArray) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
