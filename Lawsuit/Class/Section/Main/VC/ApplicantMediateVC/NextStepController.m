//
//  NextStepController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/30.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "NextStepController.h"
#import "DashesTextField.h"

#import "NextStepModel.h"
#import "NextStepCell.h"
#import "InsideNextStepCell.h"
#import "InsideNextStepModel.h"
#import "NextStepHeader.h"

#define SectionID    @"NextStepCell"


@interface NextStepController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSMutableArray* allArray;


@end

@implementation NextStepController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"申请调解";
    [self loadData];
}
-(void)loadData{
    
    NSString* plistPath=[[NSBundle mainBundle] pathForResource:@"XuLie" ofType:@"plist"];
    NSArray* array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    //分2组
    for (int i =0; i<array.count; i++) {
        NSArray* subArray = array[i];
        NSMutableArray* dataArray = [[NSMutableArray alloc] init];
        //每一组有一个数组
        for (int j = 0 ; j< subArray.count; j++) {
            NSDictionary* dic = subArray[j];
            NSString* title = dic[@"title"];
            BOOL state = [dic[@"state"] boolValue];
            NextStepModel* nextModel = [[NextStepModel alloc] init];
            nextModel.title = title;
            nextModel.state = state;
            NSArray* subArr = dic[@"content"];
            for (NSUInteger k = 0; k < subArr.count; k++) {
                InsideNextStepModel* model = [[InsideNextStepModel alloc] init];
                model.comment = subArr[k];
                [nextModel.commentModels addObject:model];
            }
            [dataArray addObject:nextModel];
        }
        [self.allArray addObject:dataArray];
    }
}
-(void)setUI{
    [self.view addSubview:self.tableView];
}

#pragma mark ----------------delegate/datasource----------------
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* iden = @"iden";
    NextStepCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[NextStepCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    NextStepModel* model = self.allArray[indexPath.section][indexPath.row];
    
    [cell configCellWithModel:model indexPath:indexPath];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.allArray objectAtIndex:section] count];
}
#pragma mark section数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.allArray.count;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NextStepHeader* sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:SectionID];
    if (section==0) {
        sectionView.titleLabel.text = @"原告基本信息";
    }else{
        sectionView.titleLabel.text = @"被告基本信息";
    }
    
    sectionView.addBtn.tag = 2000+section;
    [sectionView.addBtn addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
    return sectionView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}

-(void)addClick:(UIButton*)btn{
    NSInteger indexTag = btn.tag - 2000;
    NSMutableArray* mArr = self.allArray[indexTag];
    NextStepModel* nextModel = [[NextStepModel alloc] init];
    nextModel.title = @"序列号3";
    nextModel.state = NO;
    NSArray* subArr = @[@"姓名",@"当事人类型",@"性别",@"身份证号码",@"联系电话",@"长居住地",@"工作单位"];
    for (NSUInteger k = 0; k < subArr.count; k++) {
        InsideNextStepModel* model = [[InsideNextStepModel alloc] init];
        model.comment = subArr[k];
        [nextModel.commentModels addObject:model];
        
    }
    [mArr addObject:nextModel];
    [self.tableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NextStepModel* nextModel = self.allArray[indexPath.section][indexPath.row];
    
    CGFloat h = [NextStepCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
        NextStepCell* cell = (NextStepCell*)sourceCell;
        [cell configCellWithModel:nextModel indexPath:indexPath];
    }];
    NSLog(@"%f",h);
    return h;
    
}

#pragma mark ---TestCellDelegate
-(void)reloadCellHeightForModel:(NextStepModel *)model atIndexPath:(NSIndexPath *)indexPath{
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark --------------------懒加载-----------------------
#pragma mark 懒加载tableView
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kStatusHeight+44, kScreenWidth, kScreenHeight-kStatusHeight-44) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[NextStepHeader class] forHeaderFooterViewReuseIdentifier:SectionID];
    }
    return _tableView;
}

-(NSMutableArray*)allArray{
    if (!_allArray) {
        _allArray = [[NSMutableArray alloc] init];
    }
    return _allArray;
}
@end
