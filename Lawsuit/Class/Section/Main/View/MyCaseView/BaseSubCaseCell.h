//
//  BaseSubCaseCell.h
//  Lawsuit
//
//  Created by xiadalu on 2017/11/27.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseSubCaseModel.h"

#define Margin  10


@interface BaseSubCaseCell : UITableViewCell

//背景
@property(nonatomic,strong)UIView* backView;
//题目
@property(nonatomic,strong)UILabel* titleLabel;
//案件进度
@property(nonatomic,strong)UIImageView* processImage;
//案件状态（待审核）
@property(nonatomic,strong)UILabel* stateLabel;
//时间
@property(nonatomic,strong)UILabel* timeLabel;
//撤销调解
@property(nonatomic,strong)UIButton* rescindBtn;
//再次编辑（待审核） / 进入调解（调解中）
@property(nonatomic,strong)UIButton* reeditBtn;

@property(nonatomic,strong)BaseSubCaseModel* model;


-(void)setUI;
-(void)autoLayout;

@end
