//
//  MainController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/23.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "MainController.h"
#import "XLSlideMenu.h"
#import "AppDelegate.h"
#import "LeftController.h"
#import "RightController.h"
#import "NotHaveCase.h"
#import "ListCaseCell.h"
#import "MyCaseController.h"
#import "MyMediationController.h"
#import "ApplicantMediateController.h"
#import "RelevanceCodeController.h"

@interface MainController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSMutableArray* listArray;

@property(nonatomic,strong)LeftController* leftVC;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self loadData];
    
}

-(void)setNavigation{
    [super setNavigation];
    [self.myNav.leftBtn setImage:[UIImage imageNamed:@"Shape"] forState:UIControlStateNormal];
    [self.myNav.rightBtn setImage:[UIImage imageNamed:@"Shape"] forState:UIControlStateNormal];
    [self.myNav.rightBtn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)loadData{
    for (int i = 0 ; i < 10; i++) {
        NSDictionary* dic = @{@"title":@"张三与李四的交通事故纠纷",
                              @"state":[NSString stringWithFormat:@"homep1_order_ste%d",i%5],
                              @"time":@"2016-04-12 10:20",
                              };
        ListCaseModel* model = [ListCaseModel yy_modelWithJSON:dic];
        NSLog(@"[%@]",model);
        [self.listArray addObject:model];
    }
}
-(void)setUI{
    
    UIButton* mediation = [UIButton buttonWithType:UIButtonTypeCustom];
    mediation.frame = CGRectMake(0, kStatusHeight+44, kScreenWidth/2, 100);
    [mediation setTitle:@"申请调解" forState:UIControlStateNormal];
    [mediation addTarget:self action:@selector(applyMediation) forControlEvents:UIControlEventTouchUpInside];
    [mediation setImage:[UIImage imageNamed:@"me_setting"] forState:UIControlStateNormal];
    mediation.backgroundColor = MainColor;
    [mediation verticalCenterImageAndTitle];
    [self.view addSubview:mediation];
    
    UIButton* mask = [UIButton buttonWithType:UIButtonTypeCustom];
    mask.frame = CGRectMake(kScreenWidth/2, kStatusHeight+44, kScreenWidth/2, 100);
    [mask setTitle:@"输入关联码" forState:UIControlStateNormal];
    mask.backgroundColor = MainColor;
    [mask setImage:[UIImage imageNamed:@"me_setting"] forState:UIControlStateNormal];
    [mask addTarget:self action:@selector(applyMask) forControlEvents:UIControlEventTouchUpInside];
    [mask verticalCenterImageAndTitle];
    [self.view addSubview:mask];
    
    
//    NotHaveCase* nothave = [[NotHaveCase alloc] initWithFrame:CGRectMake(0, 250, kScreenWidth,150)];
//    [self.view addSubview:nothave];
    
    [self.view addSubview:self.tableView];
    
}


#pragma mark -------------------------btnClick--------------------------
#pragma mark 申请调解
-(void)applyMediation{
    ApplicantMediateController* applicantVC = [[ApplicantMediateController alloc] init];
    [self.navigationController pushViewController:applicantVC animated:YES];
}
#pragma mark 输入关联码
-(void)applyMask{
    RelevanceCodeController* releCodeVC = [[RelevanceCodeController alloc] init];
    [self.navigationController pushViewController:releCodeVC animated:YES];
}
#pragma mark 进入我的案件
-(void)sectionClick{
    MyCaseController* myCaseVC = [[MyCaseController alloc] init];
    [self.navigationController pushViewController:myCaseVC animated:YES];
}

#pragma mark ----------------delegate/dataSource------------------
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* iden = @"iden";
    ListCaseCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
    
    if (!cell) {
        cell = [[ListCaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        
    }
    ListCaseModel* model = self.listArray[indexPath.row];
    cell.model = model;
    
    return cell;
   
}
#pragma mark section头
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewCell* cellView = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
    cellView.textLabel.text = @"我的案件";
    cellView.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionClick)];
    [cellView addGestureRecognizer:tap];
    return cellView;
}
#pragma mark cell数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}
#pragma mark cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 140.0f;
}
#pragma mark section头高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60.0f;
}
#pragma mark section 脚高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}
#pragma mark section 脚
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView* view = [[UIView alloc] init];
    return view;
}
#pragma mark 选中cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyMediationController* mymedictionVC = [[MyMediationController alloc] init];
    [self.navigationController pushViewController:mymedictionVC animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

-(void)popAction{
    [self.xl_sldeMenu showLeftViewControllerAnimated:YES];
}

-(void)rightClick:(UIButton*)btn{
    RightController* rightVC = [[RightController alloc] init];
    [self.navigationController pushViewController:rightVC animated:YES];
}

#pragma mark --------------------懒加载-----------------------
#pragma mark 懒加载tableView
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kStatusHeight+144, kScreenWidth, kScreenHeight-kStatusHeight-144) style:UITableViewStyleGrouped];
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
