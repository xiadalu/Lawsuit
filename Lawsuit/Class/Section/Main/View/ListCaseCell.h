//
//  ListCaseCell.h
//  Lawsuit
//
//  Created by xiadalu on 2017/11/27.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ListCaseModel.h"

@interface ListCaseCell : UITableViewCell

@property(nonatomic,strong)UIView* backView;

@property(nonatomic,strong)UILabel* titleLabel;

@property(nonatomic,strong)UIImageView* processImage;

@property(nonatomic,strong)UILabel* timeLabel;

@property(nonatomic,strong)UIButton* enterBtn;

@property(nonatomic,strong)ListCaseModel* model;

@end
