//
//  LeftController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/23.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "LeftController.h"
#import "SectionHeader.h"
@interface LeftController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSArray* dataList;

@end

@implementation LeftController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"LeftList" ofType:@"plist"];
    self.dataList = [NSArray arrayWithContentsOfFile:path];
    
    [self.view addSubview:self.tableView];
    
    
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
}

#pragma mark tableview
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

@end
