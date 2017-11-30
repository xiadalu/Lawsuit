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

static NSString* SectionViewID = @"SectionViewID";

@interface ApplicantMediateController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSMutableArray* listArray;
@property(nonatomic,strong)UIButton* nextBtn;
@property(nonatomic,strong)SectionView* sView;
@property(nonatomic,strong)NSArray* array;

@end

@implementation ApplicantMediateController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"申请调解";

    [self loadData];
    
}
-(void)loadData{

    NSString* path = [[NSBundle mainBundle] pathForResource:@"ApplicantMediate" ofType:@"plist"];
    self.array = [NSArray arrayWithContentsOfFile:path];
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
#pragma mark section的view(复用)
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    SectionView* sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:SectionViewID];
    NSDictionary* dic = self.array[section];
    sectionView.labelStr = dic[@"labelStr"];
    if (section==0) {
        sectionView.btnTitle = dic[@"btnStr"];
    }else{
        sectionView.btnImageName = dic[@"btnStr"];
    }
    sectionView.selectBtn.tag = section+1000;
    [sectionView.selectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    return sectionView;
    
}
-(void)selectBtnClick:(UIButton*)btn{
    NSInteger tagIndex = btn.tag-1000;
    if (tagIndex==0) {
        [self showSelectContent:btn];
    }
    if (tagIndex==1) {
        
    }
    if (tagIndex==2) {
        
    }
    if (tagIndex==3) {
        
    }
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
-(void)showSelectContent:(UIButton*)btn{
    
    JXPopoverView* popoverView = [JXPopoverView popoverView];
    popoverView.showShade = YES;
    
    JXPopoverAction* action0 = [JXPopoverAction actionWithTitle:@"婚姻家庭>" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"婚姻家庭>" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action1 = [JXPopoverAction actionWithTitle:@"债权债务>" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"债权债务>" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action2 = [JXPopoverAction actionWithTitle:@"合同纠纷>" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"合同纠纷>" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action3 = [JXPopoverAction actionWithTitle:@"劳务纠纷>" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"劳务纠纷>" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action4 = [JXPopoverAction actionWithTitle:@"恶意伤害>" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"恶意伤害>" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action5 = [JXPopoverAction actionWithTitle:@"房产纠纷>" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"房产纠纷>" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action6 = [JXPopoverAction actionWithTitle:@"交通事故>" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"交通事故>" forState:UIControlStateNormal];
    }];
    JXPopoverAction* action7 = [JXPopoverAction actionWithTitle:@"其它>" handler:^(JXPopoverAction *action) {
        [btn setTitle:@"其它>" forState:UIControlStateNormal];
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
        UIImageView* imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"process"]];
        imgView.bounds = CGRectMake(0, 0, kScreenWidth, 40);
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        _tableView.tableHeaderView = imgView;
        //注册header
        [_tableView registerClass:[SectionView class] forHeaderFooterViewReuseIdentifier:SectionViewID];
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
