//
//  NextStepCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/4.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "NextStepCell.h"
#import "InsideNextStepCell.h"
#import "InsideNextStepModel.h"
#import "InsideNextStepHeader.h"
#import "NextStepModel.h"

#define SectionID       @"SectionID"

@interface  NextStepCell ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NextStepModel* nextModel;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property(nonatomic,strong)NSArray* leftArray;

@end

@implementation NextStepCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.leftArray = @[@"姓名",@"当事人类型",@"性别",@"身份证号码",@"联系电话",@"长居住地",@"工作单位"];
        [self.contentView addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.contentView);
        }];
        self.hyb_lastViewInCell = self.tableView;
        self.hyb_bottomOffsetToCell = 10;
    }
    return self;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* iden = @"cellIden";
    InsideNextStepCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[InsideNextStepCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textField.labelStr = self.leftArray[indexPath.row];
    }
    
    InsideNextStepModel* model = self.nextModel.commentModels[indexPath.row];
    [cell configCellWithModel:model];
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    InsideNextStepHeader* sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:SectionID];
    sectionView.titleLabel.text = self.nextModel.title;
    sectionView.unfoldBtn.tag = 1000+section;
    [sectionView.unfoldBtn addTarget:self action:@selector(unfoldBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [sectionView.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    return sectionView;
}
#pragma mark header高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
#pragma mark 折叠
-(void)unfoldBtnClick:(UIButton*)btn{
    BOOL b = self.nextModel.state;
    if (b) {
        self.nextModel.state = NO;
    }else{
        self.nextModel.state = YES;
    }
    [self configCellWithModel:self.nextModel indexPath:self.indexPath];
    
    if ([self.delegate respondsToSelector:@selector(reloadCellHeightForModel:atIndexPath:)]) {
        [self.delegate reloadCellHeightForModel:self.nextModel atIndexPath:self.indexPath];
    }
}

#pragma mark 点击删除
-(void)deleteBtnClick:(UIButton*)btn{
    if ([self.delegate respondsToSelector:@selector(deleteCellHeightForModel:atIndexPath:)]) {
        [self.delegate deleteCellHeightForModel:self.nextModel atIndexPath:self.indexPath];
    }
}


#pragma mark cell数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    BOOL b = self.nextModel.state;
    if (b) {
        return self.nextModel.commentModels.count;
    }
    return 0;
}
#pragma mark cell高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BOOL b = self.nextModel.state;
    if (b) {
        InsideNextStepModel* model = self.nextModel.commentModels[indexPath.row];
        CGFloat h = [InsideNextStepCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
            InsideNextStepCell* cell = (InsideNextStepCell*)sourceCell;
            [cell configCellWithModel:model];
        }];
        return h;
    }
    return 0;
    
}

-(void)configCellWithModel:(NextStepModel *)model indexPath:(NSIndexPath *)indexPath{
    
    self.indexPath = indexPath;
    
    self.nextModel = model;
    BOOL b = self.nextModel.state;
    CGFloat tableViewHeight = 0;
    if (b) {
        for (InsideNextStepModel* commentModel in model.commentModels) {
            CGFloat cellHeight = [InsideNextStepCell hyb_heightForTableView:self.tableView config:^(UITableViewCell *sourceCell) {
                InsideNextStepCell* cell = (InsideNextStepCell*)sourceCell;
                [cell configCellWithModel:commentModel];
            }];
            tableViewHeight += cellHeight;
        }
    }
    
    tableViewHeight += 30;//section的高度
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(tableViewHeight);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];
}


-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.scrollEnabled = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[InsideNextStepHeader class] forHeaderFooterViewReuseIdentifier:SectionID];
    }
    return _tableView;
}


@end
