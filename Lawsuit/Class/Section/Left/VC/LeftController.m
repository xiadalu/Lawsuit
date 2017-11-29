//
//  LeftController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/23.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "LeftController.h"
#import "SectionHeader.h"
#import "UIViewController+LeftSlide.h"
#import "SettingController.h"
#define kRightWidth     100
@interface LeftController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSArray* dataList;

@end

@implementation LeftController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"LeftList" ofType:@"plist"];
    self.dataList = [NSArray arrayWithContentsOfFile:path];
    
    [self.view addSubview:self.tableView];
    
    
}
-(void)setUI{
    [self initSlideFoundation];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(kScreenWidth-kRightWidth, 0,kRightWidth, kScreenHeight);
    [btn addTarget:self action:@selector(hideLeft) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)hideLeft{
    [self hide];
}
#pragma mark cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:20.0f];
    NSDictionary* dic = self.dataList[indexPath.row];
    cell.textLabel.text = dic[@"text"];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.imageView.image = [UIImage imageNamed:dic[@"icon"]];
    return cell;
}
#pragma mark section高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 120.0f;
}
#pragma mark cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0f;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SectionHeader* header = [[SectionHeader alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 120)];
    header.avatarImage.image = [UIImage imageNamed:@"blankpage_head"];
   
    return header;
}
#pragma cell个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self hide];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SettingController* setVC = [[SettingController alloc] init];
    [DCURLRouter pushViewController:setVC animated:YES];
   
}

#pragma mark tableview
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-kRightWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

@end
