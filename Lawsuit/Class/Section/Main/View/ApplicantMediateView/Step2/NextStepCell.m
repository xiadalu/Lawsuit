//
//  NextStepCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/30.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "NextStepCell.h"
#import "NextStepNestCell.h"
#import "NestSectionHeader.h"
#define NestSectionID    @"NestSectionID"

@interface NextStepCell ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSMutableArray* listArray;;

@end

@implementation NextStepCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self loadData];
        [self createUI];
    }
    return self;
}
-(void)loadData{
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"fankui" ofType:@"plist"];
    self.listArray = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
}
-(void)createUI{
    [self.contentView addSubview:self.tableView];
}

#pragma mark --------------------------delegate/datasource--------------------------
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* iden2 = @"iden2";
    NextStepNestCell* cell = [tableView dequeueReusableCellWithIdentifier:iden2];
    if (!cell) {
        cell = [[NextStepNestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden2];
       
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell%ld",indexPath.row];
    return cell;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NestSectionHeader* sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NestSectionID];
    sectionView.textLabel.text = [NSString stringWithFormat:@"Section%ld",section];
    
    return sectionView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.0f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
#pragma mark 懒加载tableView
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, kScreenWidth, 300) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[NestSectionHeader class] forHeaderFooterViewReuseIdentifier:NestSectionID];
    }
    return _tableView;
}




@end
