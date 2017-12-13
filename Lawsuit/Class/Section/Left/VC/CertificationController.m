//
//  CertificationController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/11.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "CertificationController.h"

#import "CertificateUploadController.h"

#import "IdentityCell.h"
#import "EmailCell.h"
#import "RealNameCell.h"

@interface CertificationController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView* tableView;

@end

@implementation CertificationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"实名认证";
    
    
}

-(void)setNavigation{
    [super setNavigation];
    [self.myNav.rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    [self.myNav.rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)setUI{
    [self.view addSubview:self.tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 100.0f;
    }
    if (indexPath.row==1) {
        return 200.0f;
    }
    if (indexPath.row==2) {
        return 250.0f;
    }
    return 0;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString* iden = @"IdentityCell";
        IdentityCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
        if (cell==nil) {
            cell = [[IdentityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        }
        return cell;
    }
    
    if (indexPath.row == 1) {
        static NSString* iden = @"EmailCell";
        EmailCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
        if (cell==nil) {
            cell = [[EmailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        }
        return cell;
    }
    
    if (indexPath.row==2) {
        static NSString* iden = @"RealNameCell";
        RealNameCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
        if (cell == nil) {
            cell = [[RealNameCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        }
        return cell;
    }
    return [[UITableViewCell alloc] init];
}

-(void)rightBtnClick:(UIButton*)btn{
    
}

#pragma mark 懒加载tableVeiw
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kStatusHeight+44, kScreenWidth, kScreenHeight-44-kStatusHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        footerView.backgroundColor = [UIColor whiteColor];
        UIButton* btn = [UIButton cz_textButton:@"证件上传" fontSize:17 titleColor:[UIColor whiteColor] backgroundColor:[UIColor cz_colorWithRed:255 green:112 blue:104]];
        btn.frame = CGRectMake(20, 0, kScreenWidth-40, 40);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [footerView addSubview:btn];
        _tableView.tableFooterView = footerView;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 20, 0);
    }
    return _tableView;
}

-(void)btnClick:(UIButton*)btn{
    CertificateUploadController* uploadVC = [[CertificateUploadController alloc] init];
    [self.navigationController pushViewController:uploadVC animated:YES];
}

@end
